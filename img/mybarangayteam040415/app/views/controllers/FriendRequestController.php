<?php

use Facebook\FacebookSession;
use Facebook\FacebookRequest;
use Google\Client;
use Google\Service\Plus;
use Google\Http\Request;
use Google\IO\Curl;
use \Phalcon\Tag;

class FriendRequestController extends ControllerBase
{

	public function initialize()
	{
		parent::initialize();
	}

	public function addAction($id = null)
    {	
    	$this->view->disable();
        $userSession = $this->session->get("userSession");
        if ($this->request->isGet() && isset($id)) {
        
            $members = Members::findFirstById($id);
            if(!$members) {
                return $this->response->redirect($this->request->getHTTPReferer());
            }
        }

        if ($this->request->isGet()) {

            $friendRequest = new FriendRequests();
            $friendRequest->created = date('Y-m-d H:i:s');
            $friendRequest->modified = date('Y-m-d H:i:s');
            $friendRequest->member_id = $id;
            $friendRequest->requester_id = $userSession['id'];
            $friendRequest->status = 'Requested'; 
            if($friendRequest->create()) {
            	//error_log('ID :'.$id); 
                 $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>You\'re friend request has been submitted.');
                 return $this->response->redirect($this->request->getHTTPReferer());
            }
        } 
        
    }


}