<?php

class ReviewController extends ControllerBase
{

	public function initialize()
	{
		parent::initialize();
	}

    public function indexAction()
    {

    }

    public function addAction($id = null)
    {
        $userSession = $this->session->get("userSession");
        if (!$this->request->isPost()) {  
            $business = Business::findFirstById($id);
            if(!$business) {
                return $this->response->redirect('review/search_business');
            }
            $this->view->setVar('business', $business);
            $reviews = Reviews::findByBusinessId($id);
            $this->view->setVar('reviews', $reviews);
        }

        if ($this->request->isPost()) {
            $content = $this->request->getPost('review');
            $rate = $this->request->getPost('rate');
            $review = new Reviews();
            $review->created = date('Y-m-d H:i:s');
            $review->modified = date('Y-m-d H:i:s');
            $review->member_id = $userSession['id'];
            $review->business_id = $id;
            $review->content = $content;
            $review->rate = $rate;
            if($review->create()) {
                 $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>You\'re review has been submitted.');
                 return $this->response->redirect('business/view/'.$id);
            }
        } 
        
    }

    public function search_businessAction()
    {
        if ($this->request->isPost()) {
            $businessName = $this->request->getPost('name');
            $businessAddress = $this->request->getPost('address');

            $country = Countries::findFirst(array('columns'    => '*', 
                                             'conditions' => 'country LIKE :country:', 
                                             'bind' => array('country' => $businessAddress)));
          
            $countryId = '';
            if($country) {
                $countryId = $country->id;
            } 

            if(!empty($businessName) && !empty($businessAddress) && !empty($countryId)) {
                $business = Business::find(array('columns'    => '*', 
                                             'conditions' => 'name LIKE :name: OR street LIKE :street: OR city LIKE :city: OR country_id = :country_id:', 
                                             'bind' => array('name' => '%'.$businessName.'%', 'street' => '%'.$businessAddress.'%', 'city' => '%'.$businessAddress.'%', 'country_id' => $countryId)));

            } 

            if(!empty($businessName) && empty($businessAddress)) {
                $business = Business::find(array('columns'    => '*', 
                                             'conditions' => 'name LIKE :name: OR street LIKE :street: OR city LIKE :city:', 
                                             'bind' => array('name' => '%'.$businessName.'%', 'street' => '%'.$businessName.'%', 'city' => '%'.$businessName.'%')));

            } 

            if(empty($businessName) && !empty($businessAddress) && !empty($countryId)) {
                $business = Business::find(array('columns'    => '*', 
                                             'conditions' => 'name LIKE :name: OR street LIKE :street: OR city LIKE :city: OR country_id = :country_id:', 
                                             'bind' => array('name' => '%'.$businessAddress.'%', 'street' => '%'.$businessAddress.'%', 'city' => '%'.$businessAddress.'%', 'country_id' => $countryId)));

            }

            if(empty($businessName) && !empty($businessAddress) && empty($countryId)) {
                $business = Business::find(array('columns'    => '*', 
                                             'conditions' => 'name LIKE :name: OR street LIKE :street: OR city LIKE :city:', 
                                             'bind' => array('name' => '%'.$businessAddress.'%', 'street' => '%'.$businessAddress.'%', 'city' => '%'.$businessAddress.'%')));

            }

            $this->view->setVar('business', $business);
        } else {
            $business = Business::find();
        }
        $this->view->setVar('business', $business);
    }

    public function new_businessAction()
    {
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
            $business = new Business();
            $business->created = date('Y-m-d H:i:s'); 
            $business->modified = date('Y-m-d H:i:s'); 
            $business->member_id =  $userSession['id'];
            $business->name = $this->request->getPost('name');
            $business->website = $this->request->getPost('website');
            $business->telephone = $this->request->getPost('telephone');
            $business->street = $this->request->getPost('street');
            $business->city = $this->request->getPost('city');
            $business->country_id = $this->request->getPost('country_id');
            $business->lat = $lat;
            $business->lng = $lng;
            $business->business_category_id = $this->request->getPost('business_category_id');
            if($business->create()){
                $id = $business->id;
                $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>New business has been created');
                
                if(!empty($this->request->getPost('review'))) {
                    $review = new Reviews();
                    $review->created = date('Y-m-d H:i:s'); 
                    $review->modified = date('Y-m-d H:i:s'); 
                    $review->member_id =  $userSession['id'];
                    $review->business_id = $business->id;
                    $review->content = $this->request->getPost('review');
                    $review->rate = $this->request->getPost('rate');
                    if($review->create()){
                        $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>You\'re review has been submitted.');
                    }
                }
                return $this->response->redirect('business/view/'.$id);
            }
        }
    	$countries = Countries::find();
    	$this->view->setVar('countries', $countries);
    	$businessCategories = BusinessCategories::find();
    	$this->view->setVar('businessCategories', $businessCategories);
    }

}

