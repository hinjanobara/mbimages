<?php

class IndexController extends ControllerBase
{

    public function indexAction()
    {
		if ($this->session->has("userSession")) {

            //Retrieve its value
           $userSession = $this->session->get("userSession");
            $this->view->setVar("firstName", $userSession['first_name']);
        }
         //$this->view->setVar("username",'Sherwin Robles');
        
    }

}

