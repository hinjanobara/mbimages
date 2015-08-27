<?php

class EventsController extends ControllerBase
{

    public function initialize()
    {
        parent::initialize();
    }

    public function indexAction()
    {
        $events = Events::findFirstById($id);
        if(!$events) {
            return $this->response->redirect('events/search_events');
        }
        $this->view->setVar('events', $events);
        $reviews = EventReviews::findByEventId($id);
        $this->view->setVar('reviews', $reviews);
    }


    public function search_eventsAction(){
        if ($this->request->isPost()) {
            $eventName = $this->request->getPost('name');
            $eventAddress = $this->request->getPost('address');

            $country = Countries::findFirst(array('columns'    => '*',
                'conditions' => 'country LIKE :country:',
                'bind' => array('country' => $eventAddress)));

            $countryId = '';
            if($country) {
                $countryId = $country->id;
            }

            if(!empty($eventName) && !empty($eventAddress) && !empty($countryId)) {
                $event = Events::find(array('columns'    => '*',
                    'conditions' => 'name LIKE :name: OR street LIKE :street: OR city LIKE :city: OR country_id = :country_id:',
                    'bind' => array('name' => '%'.$eventName.'%', 'street' => '%'.$eventAddress.'%', 'city' => '%'.$eventAddress.'%', 'country_id' => $countryId)));

            }

            if(!empty($eventName) && empty($eventAddress)) {
                $event = Events::find(array('columns'    => '*',
                    'conditions' => 'name LIKE :name: OR street LIKE :street: OR city LIKE :city:',
                    'bind' => array('name' => '%'.$eventName.'%', 'street' => '%'.$eventName.'%', 'city' => '%'.$eventName.'%')));

            }

            if(empty($eventName) && !empty($eventAddress) && !empty($countryId)) {
                $event = Events::find(array('columns'    => '*',
                    'conditions' => 'name LIKE :name: OR street LIKE :street: OR city LIKE :city: OR country_id = :country_id:',
                    'bind' => array('name' => '%'.$eventAddress.'%', 'street' => '%'.$eventAddress.'%', 'city' => '%'.$eventAddress.'%', 'country_id' => $countryId)));

            }

            if(empty($eventName) && !empty($eventAddress) && empty($countryId)) {
                $event = Events::find(array('columns'    => '*',
                    'conditions' => 'name LIKE :name: OR street LIKE :street: OR city LIKE :city:',
                    'bind' => array('name' => '%'.$eventAddress.'%', 'street' => '%'.$eventAddress.'%', 'city' => '%'.$eventAddress.'%')));

            }
            if(empty($eventName) && empty($eventAddress) && empty($countryId)) {
                $event = Events::find();

            }

            $this->view->setVar('event', $event);
        } else {
            $event = Events::find();
        }
        $this->view->setVar('events', $event);

    }

    public function new_eventAction() {
        if ($this->request->isPost()) {
            $countryId = $this->request->getPost('country_id');
            $country = Countries::findFirst(array('columns'    => '*',
                'conditions' => 'id LIKE :id:',
                'bind' => array('id' => $countryId)));
            $countryName = '';
            if($country) {
                $countryName = $country->country;
            }

            $address = str_replace(' ', '+', $this->request->getPost('street').'+'.$this->request->getPost('city').'+'.$countryName);
            $userSession = $this->session->get("userSession");
            $content = file_get_contents('https://maps.googleapis.com/maps/api/geocode/json?address='.$address.'&key=AIzaSyAbpLPfBH8sNdVSzMULD_BZN9qrAqbL3V8');
            $json = json_decode($content, true);
            $lat = $json['results'][0]['geometry']['location']['lat'];
            $lng = $json['results'][0]['geometry']['location']['lng'];
            //error_log('LAT : '.$lat.' LONG : '.$lng);
            $events = new Events();
            $events->created = date('Y-m-d H:i:s');
            $events->modified = date('Y-m-d H:i:s');
            $events->member_id =  $userSession['id'];
            $events->name = $this->request->getPost('name');
            $events->website = $this->request->getPost('website');
            $events->telephone = $this->request->getPost('telephone');
            $events->street = $this->request->getPost('street');
            $events->city = $this->request->getPost('city');
            $events->country_id = $this->request->getPost('country_id');
            $events->lat = $lat;
            $events->lng = $lng;
            $events->event_date = $this->request->getPost('eventdate');
            $events->event_category_id = $this->request->getPost('event_category_id');
            $events->eventinfo = $this->request->getPost('eventinfo');
            if($events->create()){
                    $id = $events->id;
                    $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>New event has been created');

                    if(!empty($this->request->getPost('review'))) {
                        $review = new Reviews();
                        $review->created = date('Y-m-d H:i:s');
                        $review->modified = date('Y-m-d H:i:s');
                        $review->member_id =  $userSession['id'];
                        $review->event_id = $events->id;
                        $review->content = $this->request->getPost('review');
                        $review->rate = $this->request->getPost('rate');
                        if($review->create()){
                            $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>You\'re review has been submitted.');
                        }
                    }
                    return $this->response->redirect('events/view/'.$id);

                }

        }
        $countries = Countries::find();
        $this->view->setVar('countries', $countries);
        $eventsCategories = EventsCategories::find();
        $this->view->setVar('eventsCategories', $eventsCategories);

    }


    public function viewAction($id = null)
    {
        $events = Events::findFirstById($id);
        if(!$events) {
            return $this->response->redirect('events/search_events');
        }
        $this->view->setVar('events', $events);
        $reviews = EventReviews::findByEventId($id);
        $this->view->setVar('reviews', $reviews);
    }


    public function addAction($id = null){
        $userSession = $this->session->get("userSession");
        if (!$this->request->isPost()) {
            $event = Events::findFirstById($id);
            if(!$event) {
                return $this->response->redirect('events/search_events');
            }

            $this->view->setVar('event', $event);
            $reviews = EventReviews::findByEventId($id);
            $this->view->setVar('reviews', $reviews);
        }

        if ($this->request->isPost()) {
            $content = $this->request->getPost('review');
            $rate = $this->request->getPost('rate');
            $review = new EventReviews();
            $review->created = date('Y-m-d H:i:s');
            $review->modified = date('Y-m-d H:i:s');
            $review->member_id = $userSession['id'];
            $review->event_id = $id;
            $review->content = $content;
            $review->rate = $rate;
            if($review->create()) {
                $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>You\'re review has been submitted.');
                return $this->response->redirect('events/view/'.$id);
            }
            else{
                echo "Hahahaha!";
            }
        }
    }


}//end of class