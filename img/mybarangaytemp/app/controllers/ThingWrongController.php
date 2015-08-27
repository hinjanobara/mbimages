<?php

class ThingController extends ControllerBase
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
           
            $userSession = $this->session->get("userSession");
            $thing = new Things();
            $thing->created = date('Y-m-d H:i:s'); 
            $thing->modified = date('Y-m-d H:i:s'); 
            $thing->member_id =  $userSession['id'];
            $thing->name = $this->request->getPost('name');
            $thing->details = $this->request->getPost('details');
            $thing->price = $this->request->getPost('price');
            $thing->thing_condition_id = $this->request->getPost('thing_condition_id');
            $thing->thing_category_id = $this->request->getPost('thing_category_id');
            if($thing->create()){
                $id = $thing->id;
                $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>New item has been posted');
                return $this->response->redirect('thing/view/'.$id);
            }
        }
        $thingConditions = ThingConditions::find();
        $this->view->setVar('thingConditions', $thingConditions);
        $thingCategories = ThingCategories::find();
        $this->view->setVar('thingCategories', $thingCategories);
    }

    public function viewAction($id = null)
    {
    	$thing = Things::findFirst($id);
        if(!$thing) {
            return $this->response->redirect('thing/index');
        }
        $this->view->setVar('thing', $thing);
    }

   

}

