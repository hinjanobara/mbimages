<?php
use Phalcon\Validation\Validator\PresenceOf,
    Phalcon\Validation\Validator\Email;
class EventController extends 
ControllerBase 
{


    public function initialize()
    {
        parent::initialize();
    }
	
	public function formValidate() {
		$validation = new Phalcon\Validation();
		$validation->add('name', new PresenceOf(array(
			'message' => 'name field is required'	
		)));
		$validation->add('website', new PresenceOf(array(
			'message' => 'website field is required'	
		)));
		$validation->add('telephone', new PresenceOf(array(
			'message' => 'telephone field is required'	
		)));
		$validation->add('event_info', new PresenceOf(array(
			'message' => 'event information field is required'	
		)));
		$validation->add('street', new PresenceOf(array(
			'message' => 'street field is required'	
		)));
		$validation->add('city', new PresenceOf(array(
			'message' => 'city field is required'	
		)));
		$validation->add('country', new PresenceOf(array(
			'message' => 'city field is required'	
		)));
		$validation->add('category', new PresenceOf(array(
			'message' => 'category field is required'	
		)));
		return $validation->validate($_POST);
	
	}

    public function indexAction() {
        $searchWords = '';
        $categories = EventsCategories::find();
        $countries  = Countries::find();

        if (isset($_GET['page'])) {
            $currentPage = (int) $_GET['page'];
        } else {
            $currentPage = 1;
        }

        if ($this->request->isPost()) {
             //$this->view->disable();
            $name = $this->request->getPost('name');
            $street = $this->request->getPost('street');
            $city = $this->request->getPost('city');
            $country = $this->request->getPost('country');
            $category = $this->request->getPost('category');

            $conditions = '';

            if (!empty($name)) {
                $conditions = ' OR name LIKE :name:';
                $bind['name'] = $name;
                $searchWords .= ", " . $name;
            }

            if (!empty($street)) {
                $conditions .= ' OR street LIKE :street:';
                $bind['street'] = $street;
                $searchWords  .= ", " . $street;
            }

            if (!empty($city)) {
                $conditions .= ' OR city LIKE :city:';
                $bind['city'] = $city;
                $searchWords .= ", " . $city;
            }

            if (!empty($country)) {
                $conditions .= ' OR country_id LIKE :country:';
                $bind['country'] = $country;
                $searchWords .= ", country id:" . $country;
            }

            if (!empty($category)) {
                $conditions .= ' OR event_category_id LIKE :category:';
                $bind['category'] = $category;
                $searchWords .= ", category id: " . $category; 
            }

            $events = Events::find([
                'columns' => '*',
                'conditions' => substr($conditions, 3),
                'bind' => $bind
            ]);

            $this->view->setVars([
                'events' => $events,
                'categories' => $categories,
                'countries' => $countries
            ]);

        } else {
            //$this->view->disable();
            $events = Events::find(['order' => 'id DESC']);
            $this->view->setVars([
                'events' => $events,
                'categories' => $categories,
                'countries' => $countries
            ]);
        }

         //$this->view->disable();

        $paginator = new \Phalcon\Paginator\Adapter\Model([
        "data" => $events,
        "limit" => 12,
        "page" => $currentPage
        ]);

          $page = $paginator->getPaginate();
          $this->view->setVar('thing_p', $page);

    }
    public function viewAction($id = null) {
        $event = Events::findFirst($id);

        if (!$event) {
            return $this->response->redirect('event/index');
        }

        $this->view->setVar('event', $event);
    }

    public function newAction() {
        if ($this->request->isPost()) {
		$messages = $this->formValidate();
		if (count($messages)) {
			$this->view->disable();
			$errorMsg = '';
			foreach ($messages as $msg) {
			  $errorMsg .= $msg . "<br>";		
			}
			$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>'.$errorMsg);
			return $this->response->redirect('event/new/');	
		} else {
			$this->view->disable();
			echo "validation is either failed or passed";
		}
            $userSession = $this->session->get("userSession");
            $eventName = $this->request->getPost("name");

            $website   = $this->request->getPost("website");
            $telephone = $this->request->getPost("telephone");
            $street    = $this->request->getPost("street");
            $city      = $this->request->getPost("city");
            $info      = $this->request->getPost("event_info");
            $category  = $this->request->getPost("category");
            $country   = $this->request->getPost("country");
            $raw_address   = $this->request->getPost("address");
            $latitude = $this->request->getPost("lat");
            $longitude = $this->request->getPost("lng");


            $dates = $this->request->getPost("date");
            $fromTimes = $this->request->getPost("fromTime");
            $toTimes = $this->request->getPost("toTime");

            $event = new Events();
            $event->created = date('Y-m-d H:i:s');
            $event->modified = date('Y-m-d H:i:s');
            $event->member_id = $userSession['id'];
            $event->name = $eventName;
            $event->event_date = $this->request->getPost("date");
            $event->website = $website;
            $event->telephone = $telephone;
            $event->street = $street;
            $event->city = $city;
            $event->country_id = $country;
            $event->event_category_id = $category;
            $event->lng = $longitude;
            $event->lat = $latitude;
            $event->eventinfo = $info;

            if ($event->create()) {
                
                $id = $event->id;
                $i = 0;
                foreach ($dates as $date) {
                    $eventDatetime = new EventDatetimes();
                    $eventDatetime->event_id = $id;
                    $eventDatetime->date = $date;
                    $eventDatetime->from_time = $fromTimes[$i];
                    $eventDatetime->to_time = $toTimes[$i];
                    $i++;

                    if (!$eventDatetime->create()) {
                        $this->view->disable();

                        echo "failed to insert event date and time in event_datetimes table. :(";
                    }
                }

                $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>New event has been posted');
                
                if ($this->request->hasFiles() == true) {
                    $uploads = $this->request->getUploadedFiles();
                    $isUploaded =false;
                    $ctr = 1;
                    foreach ($uploads as $upload) {
                        # define a "unique" name and a path to where our file must go
                            $fileName = $upload->getname();
                            $fileInfo = new SplFileInfo($fileName);
                            $fileExt  = $fileInfo->getExtension();
                            $fileExt  = strtolower($fileExt);
                            $newFileName = substr(md5(uniqid(rand(), true)), 0, 10).date('ymdhis').'.'.$fileExt;
                            $fileImageExt = array('jpeg', 'jpg', 'png');

                            $fileType = '';
                            $filePath = '';
                            $path = '';
                            if(in_array($fileExt, $fileImageExt)){
                                $path = 'img/event/'.$newFileName;
                                $filePath = 'img/event/';
                                //$fileType = 'Image';
                            }

                            # move the file and simultaneously check if everything was ok
                            ($upload->moveTo($path)) ? $isUploaded = true : $isUploaded = false;

                            if ($isUploaded) {
                                $eventPhotos = new EventPhotos();
                                $eventPhotos->created = date('Y-m-d H:i:s');
                                $eventPhotos->modified = date('Y-m-d H:i:s');
                                $eventPhotos->member_id = $userSession['id'];
                                $eventPhotos->event_id = $id;
                                $eventPhotos->file_path = $filePath;
                                $eventPhotos->filename = $newFileName;
                                $eventPhotos->caption = $this->request->getPost('caption');
                                //$ctr++;
                                if ($eventPhotos->create()) {
                                    echo "success";
                                } else {
                                    $this->view->disable();
                                    print_r($eventPhotos->getMessages());
                                }
                            }
                    }

                }
            } else {
                $this->view->disable();
                print_r($event->getMessages());
            }

            return $this->response->redirect('event/view/'.$id);
        }

        $events = Events::find();
        $categories = EventsCategories::find();
        $countries = Countries::find();
        $this->view->setVar('events', $events);
        $this->view->setVars([
            'events' => $events,
            'categories' => $categories,
            'countries' => $countries
        ]);
    }

    public function updateAction($id = null) {

        if ($this->request->isPost()) {
            $userSession = $this->session->get("userSession");
            $eventName = $this->request->getPost("name");

            $website   = $this->request->getPost("website");
            $telephone = $this->request->getPost("telephone");
            $street    = $this->request->getPost("street");
            $city      = $this->request->getPost("city");
            $info      = $this->request->getPost("event_info");
            $category  = $this->request->getPost("category");
            $country   = $this->request->getPost("country");
            $raw_address   = $this->request->getPost("address");
            $latitude = $this->request->getPost("lat");
            $longitude = $this->request->getPost("lng");


            $dates = $this->request->getPost("date");
            $fromTimes = $this->request->getPost("fromTime");
            $toTimes = $this->request->getPost("toTime");

            $event = Events::findFirst($id);
            $event->created = date('Y-m-d H:i:s');
            $event->modified = date('Y-m-d H:i:s');
            $event->member_id = $userSession['id'];
            $event->name = $eventName;
            $event->event_date = $this->request->getPost("date");
            $event->website = $website;
            $event->telephone = $telephone;
            $event->street = $street;
            $event->city = $city;
            $event->country_id = $country;
            $event->event_category_id = $category;
            $event->lng = $longitude;
            $event->lat = $latitude;
            $event->eventinfo = $info;

            if ($event->update()) {
                for ($i=1; $i <= 7; $i++) {
                        $fileId = $this->request->getPost('fileId'.$i);
                        if(!empty($fileId)){
                            $eventPhotos = EventPhotos::findFirst($fileId);
                            $eventPhotos->created = date('Y-m-d H:i:s'); 
                            $eventPhotos->modified = date('Y-m-d H:i:s');
                            $eventPhotos->member_id = $userSession['id'];
                            $eventPhotos->caption = $this->request->getPost('caption'.$i);
                            $eventPhotos->update();
                        } else {
                            $this->view->disable();
                            echo "fileID";
                        }
                }

                if ($this->request->hasFiles() == true){
                    set_time_limit(1200);
                    $uploads = $this->request->getUploadedFiles();

                    $isUploaded = false;

                    foreach($uploads as $upload) {
                        $imageName = $upload->getKey(); // $this->request->getPost('image', $ctr);
                        $inputRow = str_replace('image', '', $imageName);

                        $fileId = $this->request->getPost('fileId'.$inputRow);
                        # define a "unique" name and a path to where our file must go
                        $fileName = $upload->getName();
                        $fileInfo = new SplFileInfo($fileName);
                        $fileExt = strtolower($fileExt);
                        $newFileName = substr(md5(uniqid(rand(), true)), 0, 10).date('ymdhis').'.'.$fileExt;
                            //$fileExt = $upload->getExtension();
                        $fileImageExt = array('jpeg', 'jpg', 'png');
                        $fileType = '';
                        $filePath = '';
                        $path = '';
                         if(in_array($fileExt, $fileImageExt)){
                                $path = 'img/event/'.$newFileName;
                                $filePath = 'img/event/';
                                //$fileType = 'Image';
                        }

                        #move the file and simultaneously check if everything was ok
                        ($upload->moveTo($path)) ? $isUploaded = true : $isUploaded = false;

                        if($isUploaded) {
                                if(!empty($fileId)){
                                    $realtyPhotos = EventPhotos::findFirst($fileId);
                                    $realtyPhotos->modified = date('Y-m-d H:i:s'); 
                                    $realtyPhotos->member_id =  $userSession['id'];
                                    $realtyPhotos->file_path =  $filePath;
                                    $realtyPhotos->filename =  $newFileName;
                                    $realtyPhotos->update();
                                } else {
                                    $realtyPhotos = new EventPhotos();
                                    $realtyPhotos->created = date('Y-m-d H:i:s'); 
                                    $realtyPhotos->modified = date('Y-m-d H:i:s'); 
                                    $realtyPhotos->member_id =  $userSession['id'];
                                    $realtyPhotos->realty_id =  $id;
                                    $realtyPhotos->file_path =  $filePath;
                                    $realtyPhotos->filename =  $newFileName;
                                    $realtyPhotos->caption = $this->request->getPost('caption'.$inputRow);
                                    $realtyPhotos->create();
                                }
                            } // isUploaded
                    } // foreach uploads

                } // has files

                return $this->response->redirect('event/view/'.$id);
            } else {
                $this->view->disable();
                print_r($event->getMessages());
            }
        }
        $event = Events::findFirst($id);


        $this->view->setVar('event', $event);
        $eventPhotos = EventPhotos::find("event_id = $id");
        $this->view->setVar('eventPhotos', $eventPhotos);

    }


    public function searchAction() {
        // get latitude and longitude via google maps api service. 
        $request =$this->request;
        $this->view->disable();
        $response = new \Phalcon\Http\Response();

        $res = $_GET["location"]; // $_GET parameter
        $address = urlencode($res);
                    
        $Response = array('success' => $res);
        $url = "https://maps.google.com/maps/api/geocode/json?sensor=true&address=$address&key=AIzaSyBSR4ZUyKhxVcN3eMNzQWnm8YSdP-KE8uM";
        $Res = file_get_contents($url);
        $resp = json_decode($Res, true);
        $lat = $resp['results'][0]['geometry']['location']['lat'];
        $lng = $resp['results'][0]['geometry']['location']['lng'];
        $res = array("lat" => $lat, "lng"=> $lng );
        $response->setContent(json_encode($res));
        $response->setContentType('application/json', 'UTF-8');
        return $response;
    }

}
