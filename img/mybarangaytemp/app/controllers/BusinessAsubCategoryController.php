<?php

class BusinessAsubCategoryController extends \Phalcon\Mvc\Controller
{

    public function indexAction()
    {

    }

    public function listAction($id = null)
    {
    	$this->view->disable();
    	
    	$businessAsubCategories = BusinessAsubCategories::findByBusinessSubCategoryId($id);
    	$data = array();
    	foreach ($businessAsubCategories as $key => $businessAsubCategory) {
    		$data[] = array(
    							'id'	=> $businessAsubCategory->id,
    							'name'	=> $businessAsubCategory->name
    						);
    	}
    	echo json_encode($data);
    }

}

