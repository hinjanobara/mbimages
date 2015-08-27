<?php
use Phalcon\Validation\Validator\PresenceOf,
    Phalcon\Validation\Validator\Email;
class JobController extends ControllerBase
{

	public function initialize()
	{
		parent::initialize();

	}
	public function formValidate() {
		$validation = new Phalcon\Validation();
		$validation->add('position', new PresenceOf(array(
			'message' => 'position field is required'	
		)));
		$validation->add('job_category_id', new PresenceOf(array(
			'message' => 'job category field is required'	
		)));
		$validation->add('job_description', new PresenceOf(array(
			'message' => 'job description field is required'	
		)));
		$validation->add('requirements', new PresenceOf(array(
			'message' => 'requirements field is required'	
		)));
		$validation->add('benefits', new PresenceOf(array(
			'message' => 'benefits field is required'	
		)));
		$validation->add('how_to_apply', new PresenceOf(array(
			'message' => 'how to apply field is required'	
		)));
		$validation->add('logo', new PresenceOf(array(
			'message' => 'logo/image is required'	
		)));
		$validation->add('salary_from', new PresenceOf(array(
			'message' => 'salary from field is required'	
		)));
		$validation->add('salary_to', new PresenceOf(array(
			'message' => 'salary to field is required'	
		)));
		$validation->add('company', new PresenceOf(array(
			'message' => 'company field is required'	
		)));
		$validation->add('website', new PresenceOf(array(
			'message' => 'website field is required'	
		)));
		$validation->add('telephone', new PresenceOf(array(
			'message' => 'telephone field is required'	
		)));
		$validation->add('email', new PresenceOf(array(
			'message' => 'email field is required'	
		)));
		$validation->add('street', new PresenceOf(array(
			'message' => 'street field is required'	
		)));
		$validation->add('city', new PresenceOf(array(
			'message' => 'position field is required'	
		)));
		$validation->add('country_id', new PresenceOf(array(
			'message' => 'position field is required'	
		)));

		return $validation->validate($_POST);
	
	}
    public function indexAction()
    {
        $searchWords = '';
        $jobs = array();
        if(isset($_GET["page"])){
            $currentPage = (int) $_GET["page"];
        } else {
            $currentPage = 1;
        }
        if ($this->request->isPost()) {
            $position = $this->request->getPost('position');
            $company = $this->request->getPost('company');
            $address = $this->request->getPost('address');
            $jobCategoryId = $this->request->getPost('job_category_id');
            $salaryFrom = $this->request->getPost('salary_from');
            $salaryTo = $this->request->getPost('salary_to');
            $this->view->position = $position;
            $jobCategory = JobCategories::findFirst($jobCategoryId);
            $country = Countries::findFirst(array('columns'    => '*', 
                                             'conditions' => 'country LIKE :country:', 
                                             'bind' => array('country' => $address)));
          
            $countryId = '';
            if($country) {
                $countryId = $country->id;
            }
            $conditions = ''; 
            $bind = array();
            if(!empty($position)) {
                $conditions .= ' OR position LIKE :position:';
                $bind['position'] = '%'.$position.'%';
                $searchWords .= ', '.$position;
            }
            if(!empty($company)) {
                $conditions .= ' OR company LIKE :company:';
                $bind['company'] = '%'.$company.'%';
                $searchWords .= ', '.$company;
            }
            if(!empty($address)) {
                $conditions .= ' OR street LIKE :street:';
                $bind['street'] = '%'.$address.'%';
                $conditions .= ' OR city LIKE :city:';
                $bind['city'] = '%'.$address.'%';
                $searchWords .= ', '.$address;
            }
            if(!empty($countryId)) {
                $conditions .= ' OR country_id LIKE :country_id:';
                $bind['country_id'] = $countryId;
                $searchWords .= ', '.$country->country;
            }
            if(!empty($jobCategoryId)) {
                $conditions .= ' OR job_category_id LIKE :job_category_id:';
                $bind['job_category_id'] = $jobCategoryId;
                $searchWords .= ', '.$jobCategory->name;
            }
            if(!empty($salaryFrom)) {
                $conditions .= ' OR salary_from LIKE :salary_from:';
                $bind['salary_from'] = $salaryFrom;
                $searchWords .= ', '.$salaryFrom;
            }
            if(!empty($salaryTo)) {
                $conditions .= ' OR salary_to LIKE :salary_to:';
                $bind['salary_to'] = $salaryTo;
                $searchWords .= ', '.$salaryTo;
            }
            $searchWords = substr($searchWords, 2); 
            $jobs = Jobs::find(array('columns'    => '*', 
                                     'conditions' => substr($conditions, 3), 
                                     'bind' => $bind
                                        ));
            
        } else {
            $jobs = Jobs::find();
        }

        // Create a Model paginator, show 10 rows by page starting from $currentPage
        $paginator = new \Phalcon\Paginator\Adapter\Model(
            array(
                "data" => $jobs,
                "limit"=> 10,
                "page" => $currentPage
            )
        );
        $page = $paginator->getPaginate();

        $this->view->setVar('searchWords', $searchWords);
        $this->view->setVar('jobs', $page);
        $jobCategories = JobCategories::find();
        $this->view->setVar('jobCategories', $jobCategories);
    }

    public function viewAction($id = null)
    {
        $jobs = Jobs::findFirst($id);
        if(!$jobs) {
            return $this->response->redirect('jobs/search_jobs');
        }
        $this->view->setVar('jobs', $jobs);

        $member = Members::findFirst($jobs->member_id);
        $this->view->setVar('member', $member);

        $jobLogo = JobLogos::findFirst('job_id="'.$id.'"');
        if($jobLogo){
            $jobLogo = $jobLogo->file_path.$jobLogo->filename;
        } else {
            $jobLogo = 'http://placehold.it/200x200';
        }
        $this->view->setVar('jobLogo', $jobLogo);
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
			return $this->response->redirect('job/new/');	
		} else {
			$this->view->disable();
			echo "validation is either failed or passed";
		}

            $userSession = $this->session->get("userSession");
            $jobs = new Jobs();
            $jobs->created = date('Y-m-d H:i:s'); 
            $jobs->modified = date('Y-m-d H:i:s'); 
            $jobs->member_id =  $userSession['id'];
            $jobs->position = $this->request->getPost('position');
            $jobs->job_category_id = $this->request->getPost('job_category_id');
            $jobs->job_description = $this->request->getPost('job_description');
            $jobs->requirements = $this->request->getPost('requirements');
            $jobs->benefits = $this->request->getPost('benefits');
            $jobs->salary_from = $this->request->getPost('salary_from');
            $jobs->salary_to = $this->request->getPost('salary_to');
            $jobs->company = $this->request->getPost('company');
            $jobs->website = $this->request->getPost('website');
            $jobs->telephone = $this->request->getPost('telephone');
            $jobs->email = $this->request->getPost('email');
            $jobs->street = $this->request->getPost('street');
            $jobs->city = $this->request->getPost('city');
            $jobs->country_id = $this->request->getPost('country_id');
            $jobs->how_to_apply = $this->request->getPost('how_to_apply');
            if($jobs->create()){
                $id = $jobs->id;
                $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>New job has been created');
                if($this->request->hasFiles() == true){
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
                            $path = 'img/job/'.$newFileName;
                            $filePath = 'img/job/';
                            //$fileType = 'Image';
                        }
                        #move the file and simultaneously check if everything was ok
                        ($upload->moveTo($path)) ? $isUploaded = true : $isUploaded = false;
                    }

                    #if any file couldn't be moved, then throw an message
                    if($isUploaded) {
                        $jobLogos = new JobLogos();
                        $jobLogos->created = date('Y-m-d H:i:s'); 
                        $jobLogos->modified = date('Y-m-d H:i:s'); 
                        $jobLogos->member_id =  $userSession['id'];
                        $jobLogos->job_id =  $id;
                        $jobLogos->file_path =  $filePath;
                        $jobLogos->filename =  $newFileName;
                        if($jobLogos->create()){
                            
                        }
                    }
                }    

                return $this->response->redirect('job/view/'.$id);
            }
        }
        $member = Members::findFirst($userSession['id']);
        $this->view->setVar('member', $member);
    	$countries = Countries::find();
    	$this->view->setVar('countries', $countries);
    	$jobCategories = JobCategories::find();
    	$this->view->setVar('jobCategories', $jobCategories);
    }

    public function updateAction($id = null)
    { 
        if ($this->request->isPost()) {

            $id = $this->request->getPost('id');
            $userSession = $this->session->get("userSession");
            $jobs = Jobs::findFirst($id); 
            $jobs->modified = date('Y-m-d H:i:s'); 
            $jobs->member_id =  $userSession['id'];
            $jobs->position = $this->request->getPost('position');
            $jobs->job_category_id = $this->request->getPost('job_category_id');
            $jobs->job_description = $this->request->getPost('job_description');
            $jobs->requirements = $this->request->getPost('requirements');
            $jobs->benefits = $this->request->getPost('benefits');
            $jobs->salary_from = $this->request->getPost('salary_from');
            $jobs->salary_to = $this->request->getPost('salary_to');
            $jobs->company = $this->request->getPost('company');
            $jobs->website = $this->request->getPost('website');
            $jobs->telephone = $this->request->getPost('telephone');
            $jobs->email = $this->request->getPost('email');
            $jobs->street = $this->request->getPost('street');
            $jobs->city = $this->request->getPost('city');
            $jobs->country_id = $this->request->getPost('country_id');
            $jobs->how_to_apply = $this->request->getPost('how_to_apply');
            if($jobs->update()){
                $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>New job has been updated');
                
                if($this->request->hasFiles() == true){
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
                            $path = 'img/job/'.$newFileName;
                            $filePath = 'img/job/';
                            //$fileType = 'Image';
                        }
                        #move the file and simultaneously check if everything was ok
                        ($upload->moveTo($path)) ? $isUploaded = true : $isUploaded = false;
                    }

                    #if any file couldn't be moved, then throw an message
                    if($isUploaded) {
                        $jobLogo = JobLogos::findFirst('job_id="'.$id.'"');
                        if($jobLogo){
                            //delete previous logo first
                            unlink($jobLogo->file_path.$jobLogo->filename);
                            $jobLogo->created = date('Y-m-d H:i:s'); 
                            $jobLogo->modified = date('Y-m-d H:i:s'); 
                            $jobLogo->member_id =  $userSession['id'];
                            $jobLogo->job_id =  $id;
                            $jobLogo->file_path =  $filePath;
                            $jobLogo->filename =  $newFileName;
                            if($jobLogo->update()){
                                
                            }
                            //before saving the new one
                        } else {
                            $jobLogo = new JobLogos();
                             $jobLogo->created = date('Y-m-d H:i:s'); 
                            $jobLogo->modified = date('Y-m-d H:i:s'); 
                            $jobLogo->member_id =  $userSession['id'];
                            $jobLogo->job_id =  $id;
                            $jobLogo->file_path =  $filePath;
                            $jobLogo->filename =  $newFileName;
                            if($jobLogo->create()){
                                
                            }
                        }
                       
                    }
                }    


                return $this->response->redirect('job/view/'.$id);
            }
        }
        $this->view->setVar('job', Jobs::findFirst($id));
        $countries = Countries::find();
        $this->view->setVar('countries', $countries);
        $jobCategories = JobCategories::find();
        $this->view->setVar('jobCategories', $jobCategories);
        $jobLogo = JobLogos::findFirst('job_id="'.$id.'"');
        if($jobLogo){
            $jobLogo = $jobLogo->file_path.$jobLogo->filename;
        } else {
            $jobLogo = 'http://placehold.it/200x200';
        }
        $this->view->setVar('jobLogo', $jobLogo);
    }

}

