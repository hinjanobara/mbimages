<?php

class BusinessController extends ControllerBase
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

    public function add_photo_coverAction($id = null) {
    	$business = Business::findFirstById($id);
    	if (!$business) {
    		return $this->request->redirect('business/view/'. $id);
    	}
    	$this->view->setVar('business', $business);

    	if ($this->request->isPost() && $this->request->hasFiles() == true) {
    		 $userSession = $this->session->get("userSession");

    		 	$imgCovers = new BusinessBackgroundCovers();

    		 	if (!$imgCovers->delete()) {
    		 		$this->view->disable();
    		 		print_r($e->getMessages());
    		 	}
                //ini_set('upload_max_filesize', '64M');
                set_time_limit(1200);
                $uploads = $this->request->getUploadedFiles();

                $isUploaded = false;
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
                    //error_log("File Extension :".$fileExt, 0);
                    $fileType = '';
                    $filePath = '';
                    $path = '';
                    //$path = ''.$newFileName;
                    if(in_array($fileExt, $fileImageExt)){
                        $path = 'img/cover/'.$newFileName;
                        $filePath = 'img/cover/';
                        //$fileType = 'Image';
                    }
                    #move the file and simultaneously check if everything was ok
                    ($upload->moveTo($path)) ? $isUploaded = true : $isUploaded = false;
                }

                #if any file couldn't be moved, then throw an message
                if($isUploaded) {
                    $businessImages = new BusinessBackgroundCovers();
                    $businessImages->created = date('Y-m-d H:i:s'); 
                    $businessImages->modified = date('Y-m-d H:i:s'); 
                    $businessImages->member_id =  $userSession['id'];
                    $businessImages->business_id =  $id;
                    $businessImages->file_path =  $filePath;
                    $businessImages->filename =  $newFileName;
                    //$businessImages->caption = $this->request->getPost('caption');
                    $businessImages->primary_pic = 'Yes';
                    if($businessImages->create()){
                        return $this->response->redirect('business/view/'.$id);
                    } else {
                    	$this->view->disable();
                    	print_r($businessImages->getMessages());
                    }
                }
    	} 
    } 

    public function add_photoAction($id = null)
    {
        $business = Business::findFirstById($id);
        if(!$business) {
            return $this->response->redirect('review/search_business');
        }
        $this->view->setVar('business', $business);
        if($this->request->isPost() && $this->request->hasFiles() == true){
            $userSession = $this->session->get("userSession");
                //ini_set('upload_max_filesize', '64M');
                set_time_limit(1200);
                $uploads = $this->request->getUploadedFiles();

                $isUploaded = false;
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
                    //error_log("File Extension :".$fileExt, 0);
                    $fileType = '';
                    $filePath = '';
                    $path = '';
                    //$path = ''.$newFileName;
                    if(in_array($fileExt, $fileImageExt)){
                        $path = 'img/business/'.$newFileName;
                        $filePath = 'img/business/';
                        //$fileType = 'Image';
                    }
                    #move the file and simultaneously check if everything was ok
                    ($upload->moveTo($path)) ? $isUploaded = true : $isUploaded = false;
                }

                #if any file couldn't be moved, then throw an message
                if($isUploaded) {
                    $businessImages = new BusinessImages();
                    $businessImages->created = date('Y-m-d H:i:s'); 
                    $businessImages->modified = date('Y-m-d H:i:s'); 
                    $businessImages->member_id =  $userSession['id'];
                    $businessImages->business_id =  $id;
                    $businessImages->file_path =  $filePath;
                    $businessImages->filename =  $newFileName;
                    $businessImages->caption = $this->request->getPost('caption');
                    $businessImages->primary_pic = 'No';
                    if($businessImages->create()){
                        return $this->response->redirect('business/view/'.$id);
                    } else {
                    	$this->view->disable();
                    	print_r($businessImages->getMessages());
                    }
                }
        }    

    }

    public function viewAction($id = null)
    {
    	$business = Business::findFirst($id);
        if(!$business) {
            return $this->response->redirect('review/search_business');
        }
        $averageRate = $business->average_rate;
        $businessCategoryLists = BusinessCategoryLists::find('business_id = "'.$id.'"');
        $businessUpdates = BusinessUpdates::findFirst(array('business_id="'.$id.'"', "order" => "id DESC"));
        if($businessUpdates){
            $business = $businessUpdates;
            //$businessCategoryLists = BusinessCategoryListUpdates::find('business_update_id = "'.$businessUpdates->id.'"');
            $business->id = $id;
            $business->average_rate = $averageRate;
        }
        $this->view->setVar('business', $business);
        
        $this->view->setVar('businessCategoryLists', $businessCategoryLists);
        $query = $this->modelsManager->createQuery("SELECT * from BusinessImages where business_id=$id and primary_pic='yes'");
		//$businessLastImg = $query->execute();
        $businessLastImg = BusinessImages::findFirst(array('business_id="'.$id.'" and primary_pic="Yes"'));
        $businessImgCover = BusinessBackgroundCovers::findFirst(array('business_id="'.$id.'" and primary_pic="Yes"'));
        //$businessLastImg = BusinessImages::findFirst(array('business_id = "'.$id.'"', "order" => "id DESC"));
        $this->view->setVar('businessLastImg', $businessLastImg);
        $businessImages = BusinessImages::find(array('business_id = "'.$id.'"', "order" => "id DESC", "limit" => 7));
        $this->view->setVar('businessImages', $businessImages);
        $reviews = Reviews::find(array('business_id = "'.$id.'"', "order" => "id DESC"));
        $this->view->setVar('reviews', $reviews);
        $this->view->setVar('businessImgCover', $businessImgCover);
        //error_log("WWWWWW ".print_r($businessCategoryLists));
        // $this->view->setVar('businessCategoryLists', $businessCategoryLists);
        // $reviews = Reviews::find('business_id = "'.$id.'"');
        // $this->view->setVar('reviews', $reviews);
    }

     public function photosAction($id = null)
    {
        $business = array();
        if(isset($_GET["page"])){
            $currentPage = (int) $_GET["page"];
        } else {
            $currentPage = 1;
        }
        $business = Business::findFirstById($id);
        $businessImages = BusinessImages::find(array('business_id = "'.$id.'"', "order" => "id DESC"));
        if(!$business) {
            return $this->response->redirect('review/search_business');
        }
        $this->view->setVar('business', $business);
        $paginator = new \Phalcon\Paginator\Adapter\Model(
                array(
                    "data" => $businessImages,
                    "limit"=> 10,
                    "page" => $currentPage
                )
            );
        $page = $paginator->getPaginate();
        $this->view->setVar('businessImages', $page);
        $businessFirstImg = BusinessImages::findFirst(array('business_id = "'.$id.'"', "order" => "id DESC"));
        $this->view->setVar('businessFirstImg', $businessFirstImg);
        // $businessLastImg = BusinessImages::findFirst(array('business_id = "'.$id.'"', "order" => "id DESC"));
        // $this->view->setVar('businessLastImg', $businessLastImg);
    }

    public function suggested_changesAction($id = null)
    {
        $business = Business::findFirstById($id);
        if(!$business) {
            return $this->response->redirect('review/search_business');
        }

        $businessUpdates = BusinessUpdates::find(array('business_id = "'.$id.'"', "order" => "id DESC"));
         // Create a Model paginator, show 10 rows by page starting from $currentPage
        $paginator = new \Phalcon\Paginator\Adapter\Model(
            array(
                "data" => $businessUpdates,
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
    
    
    
    public function admin_indexAction(){
        $this->view->setTemplateAfter('admin_default');
    	 $business = Business::find();
    	 $this->view->setVar('business', $business);
    }

    public function admin_viewAction($id = null){
        $this->view->setTemplateAfter('admin_default');
        $business = Business::findFirst($id);
        if(!$business) {
            return $this->response->redirect('admin/business');
        }
        $this->view->setVar('business', $business);

        $businessUpdates = BusinessUpdates::find(array('business_id="'.$id.'"', "order" => "id DESC"));
        //$businessCategoryLists = BusinessCategoryListUpdates::find('business_update_id = "'.$businessUpdates->id.'"');
        $this->view->setVar('businessUpdates', $businessUpdates);
        //$this->view->setVar('businessCategoryLists', $businessCategoryLists);
    }

    public function admin_pendingAction(){
        $this->view->setTemplateAfter('admin_default');
        $business = Business::find('status="Pending"');
        $this->view->setVar('business', $business);
    }

    public function approveAction($id = null){
        $this->view->disable();
        $business = Business::findFirst($id);
        if(!$business) {
            return $this->response->redirect('admin/business');
        }
        $business->status = 'Approved';
        $business->update();
        return $this->response->redirect('admin/business/view/'.$business->id);
    }

    public function admin_claim_businessAction() {
        echo "admin claim business";
    }

    public function set_primary_photoAction($id = null, $business_id = null) {
        $this->view->disable();
        $photos = BusinessImages::findFirst($id);
        $userSession = $this->session->get('userSession');
        if(!$photos) {
            // if(!$photos || $userSession['id'] != $photos->member_id) {
            return $this->response->redirect('business/photos/'.$business_id);
        } else { 
            $currentPhotos = BusinessImages::find('business_id = "'.$business_id.'"');
            foreach ($currentPhotos as $key => $currentPhoto) {
                $currentPhoto->primary_pic = 'No';
                $currentPhoto->update();             
            }

            $photos->modified = date('Y-m-d H:i:s');
            $photos->primary_pic = 'Yes';
            if($photos->update()) {
                $userSession['primary_pic'] = $photos->file_path.$photos->filename;
                $this->session->set('userSession', $userSession);
                $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>Photo has been set as primary.');
                return $this->response->redirect('business/view/'.$business_id);
            } else {
                $this->view->disable();
                echo "failed to modified data. ";
            }
        }
    }

    public function change_bground_coverAction($id ) {
    	// change background cover .

    }

    public function admin_approve_biz_claimAction($id = null) {
        // $this->view->disable();
        // echo $id;
        $request = ClaimRequests::findFirst($id);

        $request->status = 'approved';

        if ($request->save()) {
            return $this->response->redirect('index/admin_index/');
        } else {
            $this->view->disable();
            echo "failed to update data";
        }
    }

    public function reject_biz_claimRequest($id = null) {
        $request = ClaimRequests::findFirst($id);

        $request->status = 'rejected';

        if ($request->save()) {
            return $this->response->redirect('index/admin_index/');
        } else {
            $this->view->disable();
            echo "failed to update data";
        }
    }

    public function cancel_biz_claim($id = null) {
        $request = ClaimRequests::findFirst($id);

        $request->status = 'pending';

        if ($request->save()) {
            return $this->response->redirect('index/admin_index/');
        } else {
            $this->view->disable();
            echo "failed to update data";
        }
    }

}

