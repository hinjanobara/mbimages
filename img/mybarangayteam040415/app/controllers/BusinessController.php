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
                    if($businessImages->create()){
                        return $this->response->redirect('business/view/'.$id);
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


        $businessLastImg = BusinessImages::findFirst(array('business_id = "'.$id.'"', "order" => "id DESC"));
        $this->view->setVar('businessLastImg', $businessLastImg);
        $businessImages = BusinessImages::find(array('business_id = "'.$id.'"', "order" => "id DESC", "limit" => 7));
        $this->view->setVar('businessImages', $businessImages);
        $reviews = Reviews::find(array('business_id = "'.$id.'"', "order" => "id DESC"));
        $this->view->setVar('reviews', $reviews);
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

}

