<?php
use Phalcon\Validation\Validator\PresenceOf,
    Phalcon\Validation\Validator\Email;

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
        $business = Business::findFirstById($id);
        $mainCategory = $business->BusinessCategories->main_title;
        if(!$business) {
            return $this->response->redirect('review/search_business');
        }
        //$this->view->setVar('business', $business);
        $reviews = Reviews::findByBusinessId($id);
        //$this->view->setVar('reviews', $reviews);
        
        $this->view->setVars([
            'business' => $business,
            'reviews' => $reviews,
            'mainCategory' => $mainCategory
        ]);

        if ($this->request->isPost()) {
	$validation = new Phalcon\Validation();
	$validation->add('review', new PresenceOf(array(
		'message' => 'review content is required'	
	)));
	$validation->add('rate', new PresenceOf(array(
		'message' => 'rate is required'	
	)));
	
	$messages = $validation->validate($_POST);
	if (count($messages)) {
		$this->view->disable();
		$errorMsg = '';
		foreach ($messages as $msg) {
		  $errorMsg .= $msg . "<br>";		
		}
		$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>'.$errorMsg);
		return $this->response->redirect('review/add/'.$id);	
	} else {
		$this->view->disable();
		echo "validation is either failed or passed";
	}
            $content = $this->request->getPost('review');
            $rate = $this->request->getPost('rate');
            $review = new Reviews();
            $review->created = date('Y-m-d H:i:s');
            $review->modified = date('Y-m-d H:i:s');
            $review->member_id = $userSession['id'];
            $review->business_id = $id;
            $review->content = $content;
            $review->rate = $rate;
            $review->status = 'Pending';
		
		
            if($review->create()) {
                $averageRate = Reviews::average(array(
                                                "column" => "rate",
                                                "conditions" => "business_id = '".$id."'"
                                            ));
                $totalReview = Reviews::count(array(
                                                "column" => "id",
                                                "conditions" => "business_id = '".$id."'"
                                            ));
                $business->total_review = $totalReview;
                $business->average_rate = $averageRate;
		$maintTile = $this->request->getPost('mainTitle');
                if($business->update()) {
			if ($mainTitle == 'Restaurants') {
			    $reviewOpt = new OptonRestaReviews();
		            $reviewOpt->created =  date('Y-m-d H:i:s');
		            $reviewOpt->modified = date('Y-m-d H:i:s');
		            $reviewOpt->member_id = $userSession['id'];
		            $reviewOpt->business_id = $id;
		            $reviewOpt->main_title = "Restaurants";
		            $reviewOpt->caters = $this->request->getPost("resta_caters");
		            $reviewOpt->wifi = $this->request->getPost("resta_wifi");
		            $reviewOpt->has_tv = $this->request->getPost("resta_hastv");
		            $reviewOpt->price_range = $this->request->getPost("resta_pricerange");
		            $reviewOpt->accepts_credit_cards = $this->request->getPost("resta_creditcard");
		            $reviewOpt->parking = $this->request->getPost("resta_parking");
		            $reviewOpt->bike_parking = $this->request->getPost("resta_bike_parking");
		            $reviewOpt->attire = $this->request->getPost("resta_attire");
		            $reviewOpt->good_for_groups = $this->request->getPost("resta_groups");
		            $reviewOpt->good_for_kids = $this->request->getPost("resta_kids");
		            $reviewOpt->takes_reservations = $this->request->getPost("resta_reservations");
		            $reviewOpt->delivery = $this->request->getPost("resta_delivery");
		            $reviewOpt->take_away = $this->request->getPost("resta_takeaway");
		            $reviewOpt->waiter_service = $this->request->getPost("resta_waiter");
		            $reviewOpt->outdoor_seating = $this->request->getPost("resta_outdoor");
		            $reviewOpt->good_for = $this->request->getPost("resta_goodfor");
		            $reviewOpt->alcohol = $this->request->getPost("resta_alcohol");
		            $reviewOpt->noise_level = $this->request->getPost("resta_noise");
		            $reviewOpt->ambience = $this->request->getPost("resta_ambience");

		            if (!$reviewOpt->create()) {
		                $this->view->disable();
		                print_r($reviewOpt->getMessages());
		            }
			} else if ($mainTitle == 'Automotive') {
				$reviewOpt = new OptionAutomotiveReviews();
		            	$reviewOpt->created =  date('Y-m-d H:i:s');
		            	$reviewOpt->modified = date('Y-m-d H:i:s');
		            	$reviewOpt->member_id = $userSession['id'];
		            	$reviewOpt->business_id = $id;
				$reviewOpt->wifi = $this->request->getPost('auto_wifi');
				$reviewOpt->accepts_credit_cards = $this->request->getPost('auto_creditcard');
				$reviewOpt->bike_parking = $this->request->getPost('auto_bike_parking');

				 if (!$reviewOpt->create()) {
				     $this->view->disable();
				     print_r($reviewOpt->getMessages());
				 }
			} else if ($mainTitle == 'Active Life') {

				$reviewOpt = new OptionAutomotiveReviews();
		            	$reviewOpt->created =  date('Y-m-d H:i:s');
		            	$reviewOpt->modified = date('Y-m-d H:i:s');
		            	$reviewOpt->member_id = $userSession['id'];
		            	$reviewOpt->business_id = $id;	
				$reviewOpt->price_range = $this->request->getPost('active_pricerange');
				$reviewOpt->good_for_kids = $this->request->getPost('active_kids');
				$reviewOpt->parking = $this->request->getPost('active_parking');
				$reviewOpt->bike_parking = $this->request->getPost('active_bike_parking');
			 	$reviewOpt->accepts_credit_cards = $this->request->getPost('active_creditcard');

				if (!$reviewOpt->create()) {
				     $this->view->disable();
				     print_r($reviewOpt->getMessages());
				 }		
			} else if ($mainTitle = 'Hotels & Travel') {
				$reviewOpt = new OptionHoteltravelReviews();
				$reviewOpt->created = date('Y-m-d H:i:s');
				$reviewOpt->modified = date('Y-m-d H:i:s');
				$reviewOpt->member_id = $userSession['id'];
		            	$reviewOpt->business_id = $id;	
				$reviewOpt->price_range = $this->request->getPost('hotel_pricerange');
				$reviewOpt->wifi = $this->request->getPost('hotel_wifi');
				$reviewOpt->has_tv = $this->request->getPost('hotel_hastv');
				$reviewOpt->accepts_credit_cards = $this->request->getPost('hotel_creditcard');
				$reviewOpt->parking = $this->request->getPost('hotel_parking');
				$reviewOpt->bike_parking = $this->request->getPost('hotel_bike_parking');
				$reviewOpt->good_for_groups = $this->request->getPost('hotel_groups');
				$reviewOpt->good_for_kids = $this->request->getPost('hotel_kids');

				if (!$reviewOpt->create()) {
				     $this->view->disable();
				     print_r($reviewOpt->getMessages());
				 }		
			} else {
				$this->view->disable();
				echo "what happened.";			
			}
                }
                
                $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>You\'re review has been submitted.');
                return $this->response->redirect('business/view/'.$id);
            } else {
                $this->view->disable();

                print_r($review->getMessages());
            }
        } 
        
    }

    public function updateAction($id = null, $reviewId = null)
    {
        $userSession = $this->session->get("userSession");
        $business = Business::findFirst($id);
        if(!$business) {
            return $this->response->redirect('review/search_business');
        }
        $reviewUpdate = Reviews::findFirst($reviewId);
        if(!$reviewUpdate) {
            return $this->response->redirect('review/search_business');
        }
        if($reviewUpdate->member_id != $userSession['id']) {
            return $this->response->redirect('review/search_business');
        }
        $this->view->setVar('reviewUpdate', $reviewUpdate);
        $this->view->setVar('business', $business);
        $reviews = Reviews::findByBusinessId($id);
        $this->view->setVar('reviews', $reviews);

        if ($this->request->isPost()) {
            $content = $this->request->getPost('review');
            $rate = $this->request->getPost('rate');
            $review = Reviews::findFirst($reviewId);
            $review->created = date('Y-m-d H:i:s');
            $review->modified = date('Y-m-d H:i:s');
            $review->member_id = $userSession['id'];
            $review->business_id = $id;
            $review->content = $content;
            $review->rate = $rate;
            if($review->update()) {
                $averageRate = Reviews::average(array(
                                                "column" => "rate",
                                                "conditions" => "business_id = '".$id."'"
                                            ));
                $totalReview = Reviews::count(array(
                                                "column" => "id",
                                                "conditions" => "business_id = '".$id."'"
                                            ));
                $business->total_review = $totalReview;
                $business->average_rate = $averageRate;
                $business->update();
                $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>You\'re review has been submitted.');
                return $this->response->redirect('business/view/'.$id);
            }
        } 
        
    }

    public function search_businessAction()
    {
        $searchWords = '';
        $business = array();
        if(isset($_GET["page"])){
            $currentPage = (int) $_GET["page"];
        } else {
            $currentPage = 1;
        }
        if ($this->request->isPost()) {
            $businessName = $this->request->getPost('name');
            $businessAddress = $this->request->getPost('address');
            $businessCategoryId = $this->request->getPost('business_category_id');

            $country = Countries::findFirst(array('columns'    => '*', 
                                             'conditions' => 'country LIKE :country:', 
                                             'bind' => array('country' => $businessAddress)));
          
            $countryId = '';
            if($country) {
                $countryId = $country->id;
            } 

            $businessCategoryLists = BusinessCategoryLists::find(array('columns'    => '*', 
                                             'conditions' => 'business_category_id = :business_category_id:',
                                             'bind' => array('business_category_id' => $businessCategoryId)));
            $conditions = '';
            if(!empty($businessCategoryLists)) {
                foreach ($businessCategoryLists as $key => $businessCategoryList) {
                    $conditions .= ' OR id = :'.$key.':';
                    $bind[$key] = $businessCategoryList->business_id;
                }//$searchWords .= ', '.$businessName;
            }

            if(!empty($businessName)) {
                $conditions .= ' OR name LIKE :name:';
                $bind['name'] = '%'.$businessName.'%';
                $searchWords .= ', '.$businessName;
            }

            if(!empty($businessAddress)) {
                $conditions .= ' OR street LIKE :street: OR city LIKE :city:';
                $bind['street'] = '%'.$businessAddress.'%';
                $bind['city'] = '%'.$businessAddress.'%';
                $searchWords .= ', '.$businessAddress;
            }

            if(!empty($countryId)) {
                $conditions .= ' OR country_id = :country_id:';
                $bind['country_id'] = $countryId;
                $searchWords .= ', '.$country->country;
            }

            $searchWords = substr($searchWords, 2); 
            $business = Business::find(array('columns'    => '*', 
                                     'conditions' => substr($conditions, 3), 
                                     'bind' => $bind
                                        ));

            $this->view->setVar('business', $business);
        } else {
            $business = Business::find(array('order'    => 'id DESC'));
        }

        $paginator = new \Phalcon\Paginator\Adapter\Model(
            array(
                "data" => $business,
                "limit"=> 12,
                "page" => $currentPage
            )
        );
        $page = $paginator->getPaginate();
        $this->view->setVar('business', $page);
        //$this->view->setVar('business', $business);
        $businessCategories = BusinessCategories::find();
        $this->view->setVar('businessCategories', $businessCategories);
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
            $validation = new Phalcon\Validation();
            $validation->add('name', new PresenceOf(array(
                'message' => 'name field is required is required'   
            )));

 	    $validation->add('street', new PresenceOf(array(
                'message' => 'street field is required' 
            )));
 	    $validation->add('city', new PresenceOf(array(
                'message' => 'city field is required' 
            )));
            $validation->add('country_id', new PresenceOf(array(
                'message' => 'country field is required' 
            )));
	    $validation->add('rate', new PresenceOf(array(
                'message' => 'rate field is required' 
            )));

		$messages = $validation->validate($_POST);
		if (count($messages)) {
			$this->view->disable();
			$errorMsg = '';
			foreach ($messages as $msg) {
			  $errorMsg .= $msg . "<br>";		
			}
			$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>'.$errorMsg);
			return $this->response->redirect('review/new_business/');	
		} else {
			$this->view->disable();
			echo "validation is either failed or passed";
		}
            

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
            $business->average_rate = $this->request->getPost('rate');
            if(!empty($this->request->getPost('review'))) {
                $business->total_review = 1;
            }
            $opened = '';
            if(!empty($this->request->getPost('opened'))) { $opened = 'Opened'; };
            if(empty($this->request->getPost('opened'))) { $opened = 'Opening Soon'; };
            $business->opened = $opened;
            //$business->business_category_id = $this->request->getPost('business_category_id');
            // $business->business_sub_category_id = $this->request->getPost('business_sub_category_id');
            // $business->business_asub_category_id = $this->request->getPost('business_asub_category_id');
            if($business->create()){
                $id = $business->id;
                if(!empty($this->request->getPost('business_category_ids'))) {
                    $bCtegories = $this->request->getPost('business_category_ids');
                    $bCtegoryIds = explode(',', $bCtegories);
                    foreach ($bCtegoryIds as $key => $bCtegoryId) {
                        $businessCategoryLists = new BusinessCategoryLists();
                        $businessCategoryLists->created = date('Y-m-d H:i:s');
                        $businessCategoryLists->business_id = $id;
                        $businessCategoryLists->business_category_id = $bCtegoryId;
                        $businessCategoryLists->create();
                    }
                }

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


    public function update_businessAction($businessId = null)
    {
        $business = Business::findFirst($businessId);
        if(!$business) {
            return $this->response->redirect('review/search_business');
        }
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
            $businessUpdate = new BusinessUpdates();
            $businessUpdate->created = date('Y-m-d H:i:s'); 
            $businessUpdate->modified = date('Y-m-d H:i:s'); 
            $businessUpdate->member_id =  $userSession['id'];
            $businessUpdate->business_id =  $businessId;
            $businessUpdate->name = $this->request->getPost('name');
            $businessUpdate->website = $this->request->getPost('website');
            $businessUpdate->telephone = $this->request->getPost('telephone');
            $businessUpdate->street = $this->request->getPost('street');
            $businessUpdate->city = $this->request->getPost('city');
            $businessUpdate->country_id = $this->request->getPost('country_id');
            $businessUpdate->lat = $lat;
            $businessUpdate->lng = $lng;
            $businessUpdate->status = 'Pending';
            if(!empty($this->request->getPost('review'))) {
                $businessUpdate->total_review = 1;
            }
            $opened = '';
            if(!empty($this->request->getPost('opened'))) { $opened = 'Opened'; };
            if(empty($this->request->getPost('opened'))) { $opened = 'Opening Soon'; };
            $businessUpdate->opened = $opened;
            if($businessUpdate->create()){
                $id = $businessUpdate->id;
                if(!empty($this->request->getPost('business_category_ids'))) {
                    $bCtegories = $this->request->getPost('business_category_ids');
                    $bCtegoryIds = explode(',', $bCtegories);
                    foreach ($bCtegoryIds as $key => $bCtegoryId) {
                        $businessCategoryLists = new BusinessCategoryListUpdates();
                        $businessCategoryLists->created = date('Y-m-d H:i:s');
                        $businessCategoryLists->business_update_id = $id;
                        $businessCategoryLists->business_category_id = $bCtegoryId;
                        $businessCategoryLists->create();
                    }
                }

                $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>Business upates has been submitted');
               
                return $this->response->redirect('business/view/'.$businessId);
            }
        }
        $this->view->setVar('business', $business);
        $countries = Countries::find();
        $this->view->setVar('countries', $countries);
        $businessCategoryLists = BusinessCategoryLists::find('business_id="'.$businessId.'"');
        $this->view->setVar('businessCategoryLists', $businessCategoryLists);
    }



}

