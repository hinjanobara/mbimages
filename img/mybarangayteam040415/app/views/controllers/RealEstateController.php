<?php

class RealEstateController extends ControllerBase
{

    public function indexAction()
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
            $businessCategory = BusinessCategories::findFirst($businessCategoryId);
            $country = Countries::findFirst(array('columns'    => '*', 
                                             'conditions' => 'country LIKE :country:', 
                                             'bind' => array('country' => $businessAddress)));
          
            $countryId = '';
            if($country) {
                $countryId = $country->id;
            } 

            $conditions = ''; 
            $bind = array();
            if(!empty($businessName)) {
                $conditions .= ' OR name LIKE :name:';
                $bind['name'] = '%'.$businessName.'%';
                $searchWords .= ', '.$businessName;
            }
            if(!empty($businessAddress)) {
                $conditions .= ' OR street LIKE :street:';
                $bind['street'] = '%'.$businessAddress.'%';
                $conditions .= ' OR city LIKE :city:';
                $bind['city'] = '%'.$businessAddress.'%';
                $searchWords .= ', '.$businessAddress;
            }
            if(!empty($countryId)) {
                $conditions .= ' OR country_id LIKE :country_id:';
                $bind['country_id'] = $countryId;
                $searchWords .= ', '.$country->country;
            }
            if(!empty($businessCategoryId)) {
                $conditions .= ' OR business_category_id = :business_category_id:';
                $bind['business_category_id'] = $businessCategoryId;
                $searchWords .= ', '.$businessCategory->name;
            }
            

            $business = Business::find(array('columns'    => '*', 
                                            'conditions' => substr($conditions, 3), 
                                            'bind' => $bind
                                            ));

        } else {
            $business = Business::find();
        }
         // Create a Model paginator, show 10 rows by page starting from $currentPage
        $paginator = new \Phalcon\Paginator\Adapter\Model(
            array(
                "data" => $business,
                "limit"=> 10,
                "page" => $currentPage
            )
        );
        $page = $paginator->getPaginate();
        $this->view->setVar('searchWords', $searchWords);
        $this->view->setVar('business', $page);

        $businessCategories = BusinessCategories::find();
        $this->view->setVar('businessCategories', $businessCategories);
    }

    public function newAction()
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
        $realtyConditions = RealtyConditions::find();
        $this->view->setVar('realtyConditions', $realtyConditions);
        $realtyTypes = RealtyTypes::find();
        $this->view->setVar('realtyTypes', $realtyTypes);
        $realtyCategories = RealtyCategories::find();
        $this->view->setVar('realtyCategories', $realtyCategories);
    }

    public function viewAction($id = null)
    {
    	$business = Business::findFirstById($id);
        if(!$business) {
            return $this->response->redirect('review/search_business');
        }
        $this->view->setVar('business', $business);
        $reviews = Reviews::findByBusinessId($id);
        $this->view->setVar('reviews', $reviews);
    }

   

}

