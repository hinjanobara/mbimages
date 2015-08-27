<?php

class RealtyCategoryController extends \Phalcon\Mvc\Controller
{

    public function indexAction()
    {

    }

    public function listAction($id = null)
    {
    	$this->view->disable();
    	
    	$realtyCategories = RealtyCategories::findByRealtyTypeId($id);
    	$data = array();
    	foreach ($realtyCategories as $key => $realtyCategory) {
    		$data[] = array(
    							'id'	=> $realtyCategory->id,
    							'name'	=> $realtyCategory->name
    						);
    	}
    	echo json_encode($data);
    }

}

