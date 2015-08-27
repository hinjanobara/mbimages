<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{

	public function initialize()
	{
		$this->view->setTemplateAfter('default');
		$this->session;
		$this->fbSetDefault;

		if ($this->session->has("userSession")) {

            //Retrieve its value
           $userSession = $this->session->get("userSession");
            $this->view->setVar("firstName", $userSession['first_name']);
            $this->view->setVar("userSession", $userSession);
        }
	}
}
