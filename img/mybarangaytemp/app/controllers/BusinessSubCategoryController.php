<?php

class BusinessSubCategoryController extends \Phalcon\Mvc\Controller
{

    public function indexAction()
    {

    }

    public function listAction($id = null)
    {
    	$this->view->disable();
    	
    	$businessSubCategories = BusinessSubCategories::findByBusinessCategoryId($id);
    	$data = array();
    	foreach ($businessSubCategories as $key => $businessSubCategory) {
    		$data[] = array(
    							'id'	=> $businessSubCategory->id,
    							'name'	=> $businessSubCategory->name
    						);
    	}
    	echo json_encode($data);
    }

}

