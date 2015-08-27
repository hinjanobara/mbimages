<?php

class BusinessCategoryController extends \Phalcon\Mvc\Controller
{

    public function indexAction()
    {

    }

    public function listAction($q = null)
    {
    	$this->view->disable();
    	$q = $_GET['q'];
    	//$businessSubCategories = BusinessSubCategories::findByBusinessCategoryId($id);

    	$businessCategories = BusinessCategories::find(array('columns'    => '*', 
                                             'conditions' => 'main_title LIKE :main_title: OR title LIKE :title: OR sub_title LIKE :sub_title:', 
                                             'bind' => array('main_title' => '%'.$q.'%', 'title' => '%'.$q.'%', 'sub_title' => '%'.$q.'%')));

    	$data = array();
    	foreach ($businessCategories as $key => $businessCategory) {
    		$data[] = array(
    							'id'			=> $businessCategory->id,
    							'main_title'	=> $businessCategory->main_title,
    							'title'			=> $businessCategory->title,
    							'sub_title'		=> $businessCategory->sub_title
    						);
    	}
    	echo json_encode(array('result' => 'OK', 'items' => $data));
    }

}

