<?php

class JobController extends ControllerBase
{

	public function initialize()
	{
		parent::initialize();
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
    }

    public function newAction()
    {
        if ($this->request->isPost()) {

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
                return $this->response->redirect('job/view/'.$id);
            }
        }
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
                $id = $jobs->id;
                $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>New job has been updated');
                return $this->response->redirect('job/view/'.$id);
            }
        }
        $this->view->setVar('job', Jobs::findFirst($id));
        $countries = Countries::find();
        $this->view->setVar('countries', $countries);
        $jobCategories = JobCategories::find();
        $this->view->setVar('jobCategories', $jobCategories);
    }

}

