<?php
use Phalcon\Validation\Validator\PresenceOf,
    Phalcon\Validation\Validator\Email;
class ThingController extends ControllerBase
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
		$validation->add('details', new PresenceOf(array(
			'message' => 'details field is required'	
		)));
		$validation->add('price', new PresenceOf(array(
			'message' => 'price field is required'	
		)));
		$validation->add('thing_condition_id', new PresenceOf(array(
			'message' => 'condition field is required'	
		)));
		$validation->add('thing_category_id', new PresenceOf(array(
			'message' => 'category field is required'	
		)));

		return $validation->validate($_POST);
	
	}

    public function indexAction()
    {   
      $searchWords = '';
      //$things = [];

      if (isset($_GET['page'])) {
        $currentPage = (int) $_GET["page"];
      } else {
        $currentPage = 1;
      }

      if ($this->request->isPost()) {
        $name = $this->request->getPost('name');
        $category_id = $this->request->getPost('thing_category_id');
        $price_from = $this->request->getPost('price_from');
        $price_to   = $this->request->getPost('price_to');

        $conditions = '';

        if (!empty($name)) {
            $conditions = ' OR name LIKE :name:';
            $bind['name'] = $name;
        }

        if (!empty($category_id)) {
            $conditions = ' OR thing_category_id LIKE :category:';
            $bind['category'] = $category_id;
        }

        // if (!empty($price_from) && !empty($price_to)) {
        //     $conditions = ' price BETWEEN ?1 AND ?2';
        //     $bind[1] = $price_from;
        //     $bind[2] = $price_to;
        // }
        //$this->view->disable();
        $things = Things::find([
            'columns' => '*',
            'conditions' => substr($conditions, 3),
            'bind' => $bind
        ]);

            $this->view->setVars([
                'things' => $things,
                'thing_categories' => ThingCategories::find()
            ]);
       // $this->session->set("filter", [$name, $category_id, $price_from, $price_to]);
      } else {
            $things = Things::find(['order' => 'id DESC']);
            $this->view->setVars([
                'things' => $things,
                'thing_categories' => ThingCategories::find()
            ]);
      }

      $paginator = new \Phalcon\Paginator\Adapter\Model([
        "data" => $things,
        "limit" => 12,
        "page" => $currentPage
      ]);

      $page = $paginator->getPaginate();
      $this->view->setVar('thing_p', $page);
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
			return $this->response->redirect('thing/new/');	
		}
		
            $userSession = $this->session->get("userSession");
            $thing = new Things();
            $thing->created = date('Y-m-d H:i:s');
            $thing->modified = date('Y-m-d H:i:s');
            $thing->member_id = $userSession['id'];
            $thing->name = $this->request->getPost('name');
            $thing->price = str_replace(',', '', $this->request->getPost('price'));
            $thing->thing_category_id = $this->request->getPost('thing_category_id');
            $thing->thing_condition_id = $this->request->getPost('thing_condition_id');
            $thing->details = $this->request->getPost('details');

            if ($thing->create()) {
                $id = $thing->id;
                $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>New item has been posted');
                
                if($this->request->hasFiles() == true)
                {
                        $uploads = $this->request->getUploadedFiles();
                        $isUploaded = false;
                        $ctr = 1;
                        # do a loop to handle each file individually
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
                                $path = 'img/thing/'.$newFileName;
                                $filePath = 'img/thing/';
                                //$fileType = 'Image';
                            }

                            # move the file and simultaneously check if everything was ok
                            ($upload->moveTo($path)) ? $isUploaded = true : $isUploaded = false;

                            if ($isUploaded) {
                                $thingPhotos = new ThingPhotos();
                                $thingPhotos->created = date('Y-m-d H:i:s');
                                $thingPhotos->modified = date('Y-m-d H:i:s');
                                $thingPhotos->member_id = 1;
                                $thingPhotos->thing_id = $id;
                                $thingPhotos->file_path = $filePath;
                                $thingPhotos->filename = $newFileName;
                                $thingPhotos->caption = $this->request->getPost('caption'.$ctr);
                                $ctr++;
                                if ($thingPhotos->create()) {
                                    return $this->response->redirect('thing/view/' . $thing->id);	
                                } else {
                                    print_r($thingPhotos->getMessages());
                                }
                            }
                        }
                }
            }
            $this->view->disable();
            
        }

        # get thing's categories and conditions 
        $this->view->setVars([
            'thingConditions' => ThingConditions::find(),
            'thingCategories' => ThingCategories::find()
        ]);
    }

    public function viewAction($id = null)
    {
      $thing = Things::findFirst($id);

      if (!$thing) {
        return $this->response->redirect('thing/index');
      }

      $this->view->setVar('thing', $thing);
    }

    public function updateAction($id = null)
    {   
        if ($this->request->isPost()) {
            $imageCheckpoint = array();
            $userSession = $this->session->get("userSession");
            $id = $this->request->getPost('id');
            $details = $this->request->getPost('details');
            $price = str_replace(',', '', $this->request->getPost('price'));
            $condition = $this->request->getPost('thing_condition_id');
            $category = $this->request->getPost('thing_category_id');

            $thing = Things::findFirst($id);
            $thing->modified = date('Y-m-d H:i:s'); 
            $thing->member_id = $userSession['id'];
            $thing->name = $this->request->getPost('name');
            $thing->details = $details;
            $thing->thing_category_id = $category;
            $thing->thing_condition_id = $condition;
            //$this->view->disable();
            if ($thing->update()) {
                for ($i=1; $i <= 7; $i++) {
                    $fileId = $this->request->getPost('fileId'.$i);
                    if(!empty($fileId)){
                        $eventPhotos = ThingPhotos::findFirst($fileId);
                        $eventPhotos->created = date('Y-m-d H:i:s'); 
                        $eventPhotos->modified = date('Y-m-d H:i:s');
                        $eventPhotos->member_id = $userSession['id'];
                        $eventPhotos->caption = $this->request->getPost('caption'.$i);
                        $eventPhotos->update();
                    }

                    $imageCheckpoint[] = $fileId;
                }

                $this->view->disable();
                print_r($imageCheckpoint);

                $params = implode("','", $imageCheckpoint);
                    $robots = ThingPhotos::query()
                        ->where("id NOT IN (:params:)")
                        ->bind(array("params" => $params))
                        ->execute();
  
                foreach ($robots as $toBeDeletedImg) {
                    $trashImg = 'img/thing/'.$toBeDeletedImg->filename;
                    unlink($trashImg);

                    $d = ThingPhotos::findFirst($toBeDeletedImg->id);
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
                                $path = 'img/thing/'.$newFileName;
                                $recentPhotos[] = 'img/thing/'.$newFileName;
                                $filePath = 'img/thing/';
                                //$fileType = 'Image';
                            }
                            #move the file and simultaneously check if everything was ok
                            ($upload->moveTo($path)) ? $isUploaded = true : $isUploaded = false;
                            
                            if($isUploaded) {
                                if(!empty($fileId)){
                                    $realtyPhotos = ThingPhotos::findFirst($fileId);
                                    $realtyPhotos->modified = date('Y-m-d H:i:s'); 
                                    $realtyPhotos->member_id =  $userSession['id'];
                                    $realtyPhotos->file_path =  $filePath;
                                    $realtyPhotos->filename =  $newFileName;
                                    $realtyPhotos->update();
                                } else {
                                    $realtyPhotos = new ThingPhotos();
                                    $realtyPhotos->created = date('Y-m-d H:i:s'); 
                                    $realtyPhotos->modified = date('Y-m-d H:i:s'); 
                                    $realtyPhotos->member_id =  $userSession['id'];
                                    $realtyPhotos->thing_id =  $id;
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
                //$this->view->disable();
                return $this->response->redirect('thing/view/'.$id);
            } // thing update
        } // is post
        //$this->view->disable();
                  $thing = Things::findFirst($id);

                  if (!$thing) {
                    return $this->response->redirect('thing/index');
                  }

                  $this->view->setVar('thing', $thing);

                  $thingPhotos = ThingPhotos::find('thing_id =' . $id);
                  $this->view->setVar('thingPhotos', $thingPhotos);
                  $thingConditions = ThingConditions::find();
                  $this->view->setVar('thingConditions', $thingConditions);
                  $thingCategories = ThingCategories::find();
                  $this->view->setVar('thingCategories', $thingCategories);
    }

    public function add_photoAction($id = null)
    {
      
    }

    public function update_photo_captionAction($id = null, $photoId = null)
    {
      
    }
   

}

