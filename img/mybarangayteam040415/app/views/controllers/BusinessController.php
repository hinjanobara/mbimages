<?php

class BusinessController extends ControllerBase
{

    public function indexAction()
    {

    }

    public function addAction()
    {

    }

    public function viewAction($id = null)
    {
    	$business = Business::findFirstById($id);
        if(!$business) {
            return $this->response->redirect('review/search_business');
        }
        $this->view->setVar('business', $business);
        $reviews = Reviews::findByBusinessId($id);
        $this->view->setVar('reviews', $reviews);
    }

    public function reviewer_addAction()
    {

    }

}

