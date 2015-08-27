<?php
use Phalcon\Validation\Validator\PresenceOf,
    Phalcon\Validation\Validator\Email;
class RealEstateController extends ControllerBase
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
		$validation->add('street', new PresenceOf(array(
			'message' => 'street field is required'	
		)));
		$validation->add('city', new PresenceOf(array(
			'message' => 'city field is required'	
		)));
		$validation->add('country_id', new PresenceOf(array(
			'message' => 'country field is required'	
		)));
		$validation->add('details', new PresenceOf(array(
			'message' => 'details field is required'	
		)));
		$validation->add('price', new PresenceOf(array(
			'message' => 'price field is required'	
		)));
		$validation->add('realty_condition_id', new PresenceOf(array(
			'message' => 'condition field is required'	
		)));
		$validation->add('realty_type_id', new PresenceOf(array(
			'message' => 'type field is required'	
		)));
		$validation->add('house_area', new PresenceOf(array(
			'message' => 'house area field is required'	
		)));
		$validation->add('lot_area', new PresenceOf(array(
			'message' => 'lot area field is required'	
		)));
		$validation->add('bedrooms', new PresenceOf(array(
			'message' => 'bedroom field is required'	
		)));
		$validation->add('bathrooms', new PresenceOf(array(
			'message' => 'bathroom field is required'	
		)));
		$validation->add('parking', new PresenceOf(array(
			'message' => 'parking field is required'	
		)));
		$validation->add('pets_allowed', new PresenceOf(array(
			'message' => 'pet allowed field is required'	
		)));

		return $validation->validate($_POST);
	
	}

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
            $realties = Realties::find();
        }
         // Create a Model paginator, show 10 rows by page starting from $currentPage
        $paginator = new \Phalcon\Paginator\Adapter\Model(
            array(
                "data" => $realties,
                "limit"=> 10,
                "page" => $currentPage
            )
        );
        $page = $paginator->getPaginate();
        $this->view->setVar('searchWords', $searchWords);
        $this->view->setVar('realties', $page);

        $realtyCategories = RealtyCategories::find();
        $this->view->setVar('realtyCategories', $realtyCategories);
    }

    public function newAction()
    {
        if ($this->request->isPost()) {
		
		$messages = $this->formValidate();
		if (count($messages)) {
			$this->view->disable();
			$errorMsg = '';
			foreach ($messages as $msg) {
			  $errorMsg .= $msg . "<br>";		
			}
			$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>'.$errorMsg);
			return $this->response->redirect('real_estate/new/');	
		} else {
			$this->view->disable();
			echo "validation is either failed or passed";
		}

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
            $property = new Realties();
            $property->created = date('Y-m-d H:i:s'); 
            $property->modified = date('Y-m-d H:i:s'); 
            $property->member_id =  $userSession['id'];
            $property->name = $this->request->getPost('name');
            $property->details = $this->request->getPost('details');
            $property->price = str_replace(',', '', $this->request->getPost('price'));
            $property->street = $this->request->getPost('street');
            $property->city = $this->request->getPost('city');
            $property->country_id = $this->request->getPost('country_id');
            $property->lat = $lat;
            $property->lng = $lng;
            $property->realty_condition_id = $this->request->getPost('realty_condition_id');
            $property->realty_category_id = $this->request->getPost('realty_category_id');
            $property->realty_type_id = $this->request->getPost('realty_type_id');
            $property->house_area = $this->request->getPost('house_area');
            $property->lot_area = $this->request->getPost('lot_area');
            $property->bedrooms = $this->request->getPost('bedrooms');
            $property->bathrooms = $this->request->getPost('bathrooms');
            $property->parking = $this->request->getPost('parking');
            $property->pets_allowed = $this->request->getPost('pets_allowed');
            if($property->create()){
                $id = $property->id;
                $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>New property has been posted');
                
                 if($this->request->hasFiles() == true){
				        //ini_set('upload_max_filesize', '64M');
				        set_time_limit(1200);
				        $uploads = $this->request->getUploadedFiles();

				        $isUploaded = false;
				        $ctr = 1;
				        #do a loop to handle each file individually
				        foreach($uploads as $upload){
				            #define a “unique” name and a path to where our file must go
				            $fileName = $upload->getname();
				            $fileInfo = new SplFileInfo($fileName);
				            $fileExt = $fileInfo->getExtension();
				            $fileExt = strtolower($fileExt);
				            $newFileName = substr(md5(uniqid(rand(), true)), 0, 10).date('ymdhis').'.'.$fileExt;
				            //$fileExt = $upload->getExtension();
				            $fileImageExt = array('jpeg', 'jpg', 'png');
				            $fileType = '';
				            $filePath = '';
				            $path = '';
				            if(in_array($fileExt, $fileImageExt)){
				                $path = 'img/realty/'.$newFileName;
				                $filePath = 'img/realty/';
				                //$fileType = 'Image';
				            }
				            #move the file and simultaneously check if everything was ok
				            ($upload->moveTo($path)) ? $isUploaded = true : $isUploaded = false;
				            
				            if($isUploaded) {
						        $realtyPhotos = new RealtyPhotos();
						        $realtyPhotos->created = date('Y-m-d H:i:s'); 
						        $realtyPhotos->modified = date('Y-m-d H:i:s'); 
						        $realtyPhotos->member_id =  $userSession['id'];
						        $realtyPhotos->realty_id =  $id;
						        $realtyPhotos->file_path =  $filePath;
						        $realtyPhotos->filename =  $newFileName;
						        $realtyPhotos->caption = $this->request->getPost('caption'.$ctr++);
						        if($realtyPhotos->create()){
						            
						        }
						    }
				        }

				        #if any file couldn't be moved, then throw an message
				        
				}  
                return $this->response->redirect('real_estate/view/'.$id);
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

    public function updateAction($id = null)
    {
        if ($this->request->isPost()) {
            $imageCheckpoint = array();
            $userSession = $this->session->get("userSession");
            $id = $this->request->getPost('id');
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
            $property = Realties::findFirst($id); 
            $property->modified = date('Y-m-d H:i:s'); 
            $property->member_id =  $userSession['id'];
            $property->name = $this->request->getPost('name');
            $property->details = $this->request->getPost('details');
            $property->price = str_replace(',', '', $this->request->getPost('price'));
            $property->street = $this->request->getPost('street');
            $property->city = $this->request->getPost('city');
            $property->country_id = $this->request->getPost('country_id');
            $property->lat = $lat;
            $property->lng = $lng;
            $property->realty_condition_id = $this->request->getPost('realty_condition_id');
            $property->realty_category_id = $this->request->getPost('realty_category_id');
            $property->realty_type_id = $this->request->getPost('realty_type_id');
            $property->house_area = $this->request->getPost('house_area');
            $property->lot_area = $this->request->getPost('lot_area');
            $property->bedrooms = $this->request->getPost('bedrooms');
            $property->bathrooms = $this->request->getPost('bathrooms');
            $property->parking = $this->request->getPost('parking');
            $property->pets_allowed = $this->request->getPost('pets_allowed');
            if($property->update()){
                $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>New property has been updated');
                
                for ($i=1; $i <= 7; $i++) { 
                    $fileId = $this->request->getPost('fileId'.$i);
                    if(!empty($fileId)){
                        $realtyPhotos = RealtyPhotos::findFirst($fileId);
                        $realtyPhotos->created = date('Y-m-d H:i:s'); 
                        $realtyPhotos->modified = date('Y-m-d H:i:s'); 
                        $realtyPhotos->member_id =  $userSession['id'];
                        $realtyPhotos->caption = $this->request->getPost('caption'.$i);
                        $realtyPhotos->update();
                    } 

                    $imageCheckpoint[] = $fileId;
                }
                $params = implode("','", $imageCheckpoint);
                    $robots = RealtyPhotos::query()
                        ->where("id NOT IN (:params:)")
                        ->bind(array("params" => $params))
                        ->execute();

                foreach ($robots as $toBeDeletedImg) {
                    $trashImg = 'img/realty/'.$toBeDeletedImg->filename;
                    unlink($trashImg);

                    $d = RealtyPhotos::findFirst($toBeDeletedImg->id);
                    $d->delete();
                }

                if($this->request->hasFiles() == true){
                        //ini_set('upload_max_filesize', '64M');
                        set_time_limit(1200);
                        $uploads = $this->request->getUploadedFiles();

                        $isUploaded = false;
                        #do a loop to handle each file individually
                        foreach($uploads as $upload){
                            
                            $imageName = $upload->getKey();//$this->request->getPost('image'.$ctr);
                            $inputRow = str_replace('image', '', $imageName);
                            
                            $fileId = $this->request->getPost('fileId'.$inputRow);
                            #define a “unique” name and a path to where our file must go
                            $fileName = $upload->getName();
                            $fileInfo = new SplFileInfo($fileName);
                            $fileExt = $fileInfo->getExtension();
                            $fileExt = strtolower($fileExt);
                            $newFileName = substr(md5(uniqid(rand(), true)), 0, 10).date('ymdhis').'.'.$fileExt;
                            //$fileExt = $upload->getExtension();
                            $fileImageExt = array('jpeg', 'jpg', 'png');
                            $fileType = '';
                            $filePath = '';
                            $path = '';
                            if(in_array($fileExt, $fileImageExt)){
                                $path = 'img/realty/'.$newFileName;
                                $recentPhotos[] = 'img/realty/'.$newFileName;
                                $filePath = 'img/realty/';
                                //$fileType = 'Image';
                            }
                            #move the file and simultaneously check if everything was ok
                            ($upload->moveTo($path)) ? $isUploaded = true : $isUploaded = false;
                            
                            if($isUploaded) {
                                if(!empty($fileId)){
                                    $realtyPhotos = RealtyPhotos::findFirst($fileId);
                                    $realtyPhotos->modified = date('Y-m-d H:i:s'); 
                                    $realtyPhotos->member_id =  $userSession['id'];
                                    $realtyPhotos->file_path =  $filePath;
                                    $realtyPhotos->filename =  $newFileName;
                                    $realtyPhotos->update();
                                } else {
                                    $realtyPhotos = new RealtyPhotos();
                                    $realtyPhotos->created = date('Y-m-d H:i:s'); 
                                    $realtyPhotos->modified = date('Y-m-d H:i:s'); 
                                    $realtyPhotos->member_id =  $userSession['id'];
                                    $realtyPhotos->realty_id =  $id;
                                    $realtyPhotos->file_path =  $filePath;
                                    $realtyPhotos->filename =  $newFileName;
                                    $realtyPhotos->caption = $this->request->getPost('caption'.$inputRow);
                                    $realtyPhotos->create();
                                }
                            }
                        }

                        #if any file couldn't be moved, then throw an message
                        // $realtyPhotos = RealtyPhotos::find('realty_id ="'.$id.'"');
                        // foreach ($realtyPhotos as $photo) {
                        //     if (in_array($photo->filename, $recentPhotos)) {
                        //         $check = "okay";
                        //     } else {
                        //         if (unlink('img/realty/'. $photo->filename)) {
                        //             $check = "okay";
                        //         } else {
                        //             $this->view->disable();
                        //             echo "unable to remove image from img folder.";
                        //         }
                        //     }
                        // }
                }  
                return $this->response->redirect('real_estate/view/'.$id);
            }
        }
        $property = Realties::findFirst($id);
        if(!$property) {
            return $this->response->redirect('real_estate/index');
        }
        $this->view->setVar('property', $property);

        $realtyPhotos = RealtyPhotos::find('realty_id ="'.$id.'"');
        $this->view->setVar('realtyPhotos', $realtyPhotos);
        
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
    	$property = Realties::findFirst($id);
        if(!$property) {
            return $this->response->redirect('real_estate/index');
        }
        $this->view->setVar('property', $property);
    }

   

}

