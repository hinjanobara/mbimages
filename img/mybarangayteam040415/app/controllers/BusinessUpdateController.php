<?php

class BusinessUpdateController extends ControllerBase
{


	public function admin_viewAction($id = null){
        $this->view->setTemplateAfter('admin_default');
        $businessUpdates = BusinessUpdates::findFirst($id);
        if(!$businessUpdates) {
            return $this->response->redirect('admin/business');
        }
        $this->view->setVar('businessUpdates', $businessUpdates);
    }

    public function approveAction($id = null){
        $businessUpdates = BusinessUpdates::findFirst($id);
        if(!$businessUpdates) {
            return $this->response->redirect('admin/business');
        }
        $businessUpdates->status = 'Approved';
        if($businessUpdates->update()){
	        $business = Business::findFirst($businessUpdates->business_id);
	        if(!empty($businessUpdates->name)) {
	        	$business->name = $businessUpdates->name;
	    	}
	    	if(!empty($businessUpdates->street)) {
	        	$business->street = $businessUpdates->street;
	    	}
	    	if(!empty($businessUpdates->city)) {
	        	$business->city = $businessUpdates->city;
	    	}
	    	if(!empty($businessUpdates->country_id)) {
	        	$business->country_id = $businessUpdates->country_id;
	    	}
	    	if(!empty($businessUpdates->telephone)) {
	        	$business->telephone = $businessUpdates->telephone;
	    	}
	    	if(!empty($businessUpdates->email)) {
	        	$business->email = $businessUpdates->email;
	    	}
	    	if(count($businessUpdates->BusinessCategoryListUpdates)) {
	    		//BusinessCategoryLists::find('business_id="'.$business->id.'"')->delete();
	    		foreach ($businessUpdates->BusinessCategoryListUpdates as $key => $businessCategoryListUpdate) {
	    			$businessCategoryList = new BusinessCategoryLists();
	    			$businessCategoryList->created = date('Y-m-d H:i:s');
	    			$businessCategoryList->modified = date('Y-m-d H:i:s');
	    			$businessCategoryList->business_id = $business->id;
	    			$businessCategoryList->business_category_id = $businessCategoryListUpdate->business_category_id;   
	    			$businessCategoryList->create();
	    		}
	        	
	    	}
	    	$business->update();
	    }
	    return $this->response->redirect('admin/business/view/'.$business->id);
    }

    public function denyAction($id = null){
        $businessUpdates = BusinessUpdates::findFirst($id);
        if(!$businessUpdates) {
            return $this->response->redirect('admin/business');
        }
        $this->view->setVar('businessUpdates', $businessUpdates);
    }

}
