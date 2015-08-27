<?php
use Phalcon\Validation\Validator\PresenceOf,
    Phalcon\Validation\Validator\Email;

class CarAndTruckController extends ControllerBase
{

    public function initialize()
    {
        parent::initialize();
    }

    public function indexAction()
    {
      $searchWords = '';

       if (isset($_GET['page'])) {
        $currentPage = (int) $_GET["page"];
        } else {
        $currentPage = 1;
       }

             if ($this->request->isPost()) {
                $name = $this->request->getPost('name');
                $location = $this->request->getPost('location');
                //$details = $this->request->getPost('details');
                //$price_to   = $this->request->getPost('price');
                $brand = $this->request->getPost('brand');
                $model = $this->request->getPost("model");
                // $yearModel = $this->request->getPost("year_model");
                // $condition = $this->request->getPost("condition");
                // $bodyType = $this->request->getPost('body_type');
                // $transmission = $this->request->getPost('transmission');
                // $mileage = $this->request->getPost('mileage');
                // $fuelType = $this->request->getPost('fuel_type');

                $conditions = '';

                if (!empty($name)) {
                    $conditions = ' OR name LIKE :name:';
                    $bind['name'] = $name;
                }

                if (!empty($location)) {
                    $conditions = ' OR location LIKE :location:';
                    $bind['location'] = $location;
                }

                // if (!empty($details)) {
                //     $conditions = ' OR details LIKE :details:';
                //     $bind['details'] = $details;
                // }

                if (!empty($brand)) {
                    $conditions = ' OR brand LIKE :brand:';
                    $bind['brand'] = $brand;
                }

                if (!empty($model)) {
                    $conditions = ' OR model LIKE :model:';
                    $bind['model'] = $model;
                }


                // if (!empty($yearModel)) {
                //     $conditions = ' OR year_model LIKE :year_model:';
                //     $bind['year_model'] = $yearModel;
                // }

                // if (!empty($condition)) {
                //     $conditions = ' OR condition_id LIKE :condition_id:';
                //     $bind['condition_id'] = $condition_id;
                // }

                // if (!empty($bodyType)) {
                //     $conditions = ' OR body_type LIKE :body_type:';
                //     $bind['body_type'] = $bodyType;
                // }


                // if (!empty($price_from) && !empty($price_to)) {
                //     $conditions = ' price BETWEEN ?1 AND ?2';
                //     $bind[1] = $price_from;
                //     $bind[2] = $price_to;
                // }
                //$this->view->disable();
                $autos = Automotives::find([
                    'columns' => '*',
                    'conditions' => substr($conditions, 3),
                    'bind' => $bind
                ]);

                   $this->view->setVar('autos', $autos);

               // $this->session->set("filter", [$name, $category_id, $price_from, $price_to]);
             } else {
                    $autos = Automotives::find(['order' => 'id DESC']);
                    $this->view->setVar('autos', $autos);
              }

            $paginator = new \Phalcon\Paginator\Adapter\Model([
                "data" => $autos,
                "limit" => 12,
                "page" => $currentPage
            ]);

            $page = $paginator->getPaginate();
            $this->view->setVar('auto_p', $page);
    }

    public function newAction()
    {   

        if ($this->request->isPost()) {
	   
            // validation
	$validation = new Phalcon\Validation();
	$validation->add('name', new PresenceOf(array(
		'message' => 'name field is required'	
	)));
	$validation->add('location', new PresenceOf(array(
		'message' => 'location field is required'	
	)));
	$validation->add('details', new PresenceOf(array(
		'message' => 'details field is required'	
	)));
	$validation->add('price', new PresenceOf(array(
		'message' => 'price field is required'	
	)));
	$validation->add('brand', new PresenceOf(array(
		'message' => 'brand field is required'	
	)));
	$validation->add('model', new PresenceOf(array(
		'message' => 'model field is required'	
	)));
	$validation->add('year_model', new PresenceOf(array(
		'message' => 'year model field is required'	
	)));
	$validation->add('condition', new PresenceOf(array(
		'message' => 'condition field is required'	
	)));
	$validation->add('body_type', new PresenceOf(array(
		'message' => 'body type field is required'	
	)));
	$validation->add('transmission', new PresenceOf(array(
		'message' => 'transmission field is required'	
	)));
	$validation->add('mileage', new PresenceOf(array(
		'message' => 'mileage field is required'	
	)));
	$validation->add('fuel_type', new PresenceOf(array(
		'message' => 'fuel type field is required'	
	)));
	
	$messages = $validation->validate($_POST);
	if (count($messages)) {
		$this->view->disable();
		$errorMsg = '';
		foreach ($messages as $msg) {
		  $errorMsg .= $msg . "<br>";		
		}
		$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>'.$errorMsg);
		return $this->response->redirect('car_and_truck/new/');	
	} else {
		$this->view->disable();
		echo "validation is either failed or passed";
	}
	
	
            $name = $this->request->getPost('name');
            $location = $this->request->getPost("location");
            $details = $this->request->getPost("details");
            $price = $this->request->getPost("price");
            $brand = $this->request->getPost("brand");
            $model = $this->request->getPost("model");
            $yearModel = $this->request->getPost("year_model");
            $condition = $this->request->getPost("condition");
            $bodyType = $this->request->getPost("body_type");
            $transmission = $this->request->getPost("transmission");
            $mileage = $this->request->getPost("mileage");
            $fuelType = $this->request->getPost("fuel_type");
            $image = $this->request->getPost('image');

            $auto = new Automotives();
            $auto->created = date('Y-m-d H:i:s');
            $auto->modified = date('Y-m-d H:i:s');
            $auto->member_id = 1;
            $auto->location = $location;
            $auto->name = $name;
            $auto->details = $details;
            $auto->price = $price;
            $auto->brand = $brand;
            $auto->model = $model;
            $auto->year_model = $yearModel;
            $auto->condition_id = $condition;
            $auto->body_type = $bodyType;
            $auto->transmission = $transmission;
            $auto->mileage = $mileage;
            $auto->fuel_type_id = $fuelType;
                  $this->view->disable();
            if ($auto->create()) {
                $id = $auto->id;
                 if($this->request->hasFiles() == true) {
                    $uploads = $this->request->getUploadedFiles();
                        $isUploaded = false;
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
                                $path = 'img/car/'.$newFileName;
                                $filePath = 'img/car/';
                                //$fileType = 'Image';
                            }

                            # move the file and simultaneously check if everything was ok
                            ($upload->moveTo($path)) ? $isUploaded = true : $isUploaded = false;

                            if ($isUploaded) {
                                $thingPhotos = new AutomotivePhotos();
                                $thingPhotos->created = date('Y-m-d H:i:s');
                                $thingPhotos->modified = date('Y-m-d H:i:s');
                                $thingPhotos->member_id = 1;
                                $thingPhotos->automotive_id = $id;
                                $thingPhotos->file_path = $filePath;
                                $thingPhotos->filename = $newFileName;
                                $thingPhotos->caption = $this->request->getPost('caption');
                                $ctr++;
                                if ($thingPhotos->create()) {
                                    echo "success";
                                } else {
                                    print_r($thingPhotos->getMessages());
                                }
                            }
                        }

                 }
            } else {
               print_r($auto->getMessages());
                
            }

        }

      $this->view->setVars([
        'carConditions' => AutomotiveConditions::find(),
        'carFuels' => AutomotiveFuels::find()
      ]);
    }

    public function viewAction($id = null)
    {
      $auto = Automotives::findFirst($id);

      if (!$auto) {
        return $this->response->redirect('car_and_truck/index');
      }

      $this->view->setVar('auto', $auto);
    }

    public function updateAction($id = null)
    {   
        if ($this->request->isPost()) {
            $imageCheckpoint = array();
            $userSession = $this->session->get("userSession");
            $id = $this->request->getPost('id');
            
            $auto = Automotives::findFirst($id);
            $auto->name = $this->request->getPost("name");
            $auto->location = $this->request->getPost("location");
            $auto->details = $this->request->getPost("details");
            $auto->price = str_replace(',', '', $this->request->getPost('price'));
            $auto->brand = $this->request->getPost("brand");
            $auto->model = $this->request->getPost("model");
            $auto->year_model = $this->request->getPost("year_model");
            $auto->condition_id = $this->request->getPost("condition");
            $auto->body_type = $this->request->getPost("body_type");
            $auto->transmission = $this->request->getPost("transmission");
            $auto->mileage = $this->request->getPost("mileage");
            $auto->fuel_type_id = $this->request->getPost("fuel_type");

            if($auto->update()){
                $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>New property has been updated');
                
                for ($i=1; $i <= 7; $i++) {
                    $fileId = $this->request->getPost('fileId'.$i);
                    if(!empty($fileId)){
                        $autoPhotos = AutomotivePhotos::findFirst($fileId);
                        $autoPhotos->created = date('Y-m-d H:i:s'); 
                        $autoPhotos->modified = date('Y-m-d H:i:s');
                        $autoPhotos->member_id = $userSession['id'];
                        $autoPhotos->caption = $this->request->getPost('caption'.$i);
                        $autoPhotos->update();
                        
                    } 
                    $imageCheckpoint[] = $fileId;
                }

                $params = implode("','", $imageCheckpoint);
                    $robots = AutomotivePhotos::query()
                        ->where("id NOT IN (:params:)")
                        ->bind(array("params" => $params))
                        ->execute();

                foreach ($robots as $toBeDeletedImg) {
                    $trashImg = 'img/realty/'.$toBeDeletedImg->filename;
                    unlink($trashImg);

                    $d = AutomotivePhotos::findFirst($toBeDeletedImg->id);
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
                                $path = 'img/car/'.$newFileName;
                                $recentPhotos[] = 'img/car/'.$newFileName;
                                $filePath = 'img/car/';
                                //$fileType = 'Image';
                            }
                            #move the file and simultaneously check if everything was ok
                            ($upload->moveTo($path)) ? $isUploaded = true : $isUploaded = false;
                            
                            if($isUploaded) {
                                if(!empty($fileId)){
                                    $realtyPhotos = AutomotivePhotos::findFirst($fileId);
                                    $realtyPhotos->modified = date('Y-m-d H:i:s'); 
                                    $realtyPhotos->member_id =  $userSession['id'];
                                    $realtyPhotos->file_path =  $filePath;
                                    $realtyPhotos->filename =  $newFileName;
                                    $realtyPhotos->update();
                                } else {
                                    $realtyPhotos = new AutomotivePhotos();
                                    $realtyPhotos->created = date('Y-m-d H:i:s'); 
                                    $realtyPhotos->modified = date('Y-m-d H:i:s'); 
                                    $realtyPhotos->member_id =  $userSession['id'];
                                    $realtyPhotos->automotive_id =  $id;
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
                return $this->response->redirect('car_and_truck/view/'.$id);
            } else {
                $this->view->disable();
                print_r($auto->getMessages());
            }
        }
        //$this->view->disable();
      $auto = Automotives::findFirst($id);

      if (!$auto) {
        return $this->response->redirect('car_and_truck/index');
      }

      $this->view->setVar('auto', $auto);

      $autoPhotos = AutomotivePhotos::find("automotive_id = $id");
      $this->view->setVar('autoPhotos', $autoPhotos);
    }

    public function add_photoAction($id = null)
    {
      
    }

    public function update_photo_captionAction($id = null, $photoId = null)
    {
      
    }
   
   

}

