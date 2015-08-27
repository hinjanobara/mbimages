<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{

	public function initialize()
	{
		$this->view->setTemplateAfter('default');
		$this->session;
		$this->fbSetDefault;
		$this->cookie_login();
		$userSession = array();
		if ($this->session->has("userSession")) {
           	//Retrieve its value
        	$userSession = $this->session->get("userSession");
           	//$this->view->setVar("firstName", $userSession['first_name']);
        }
        //error_log($userSession['primary_pic']); 
        $this->view->setVar('userSession', $userSession);

	}

	public function beforeExecuteRoute()
    {
        $userSession['type'] = '';
		if ($this->session->has("userSession")) {
           	//Retrieve its value
        	$userSession = $this->session->get("userSession");
        } 
        $permission = $this->permission($userSession['type']);
        if($permission == false) {
        	$this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>Please login.');
			return $this->response->redirect('index');
		}
    }

	public function permission($type = null) {
		$controller = $this->dispatcher->getControllerName();
		$action = $this->dispatcher->getActionName();
		$permission = false;

		if($controller == 'index' && in_array($action, array('index', 'admin_index'))){
			$permission = true;
		}
		if($controller == 'member' && in_array($action, array('page', 'photos'))){
			$permission = true;
		}
		if($controller == 'job' && in_array($action, array('index', 'view'))){
			$permission = true;
		}
		if($controller == 'real_estate' && in_array($action, array('index', 'view'))){
			$permission = true;
		}
		if($controller == 'thing' && in_array($action, array('index', 'view'))){
			$permission = true;
		}
		if($controller == 'review' && in_array($action, array('search_business'))){
				$permission = true;
		}
		if($controller == 'business' && in_array($action, array('index', 'view', 'photos'))){
				$permission = true;
		}
		if($controller == 'car_and_truck' && in_array($action, array('index', 'view'))){
			$permission = true;
		}

		if($controller == 'events' && in_array($action, array('search_events', 'view', 'new'))){
			$permission = true;
		}


		//USERS
		if($controller == 'business' && in_array($action, array('admin_index', 'admin_view'))){
			$permission = true;
		}
		if($controller == 'business_update' && in_array($action, array('admin_view', 'approve', 'deny'))){
			$permission = true;
		}

		if($type == 'Member') {
			if($controller == 'index' && in_array($action, array('index'))){
				$permission = true;
			}
			if($controller == 'member' && in_array($action, array('update', 'add_photo', 'set_primary_photo', 'delete_photo', 'update_photo_caption'))){
				$permission = true;
			}
			if($controller == 'business' && in_array($action, array('add_photo', 'update'))){
				$permission = true;
			}
			if($controller == 'review' && in_array($action, array('search_business', 'add', 'update', 'new_business', 'update_business'))){
				$permission = true;
			}
			if($controller == 'job' && in_array($action, array('index', 'new', 'update'))){
				$permission = true;
			}
			if($controller == 'real_estate' && in_array($action, array('index', 'new', 'update'))){
				$permission = true;
			}
			if($controller == 'thing' && in_array($action, array('index', 'new', 'update'))){
				$permission = true;
			}
			if($controller == 'car_and_truck' && in_array($action, array('index', 'new', 'update'))){
				$permission = true;
			}
		}

		return $permission;
	}
	
	public function cookie_login(){
		if(isset($_COOKIE['mid']) && isset($_COOKIE['e']) && isset($_COOKIE['token'])) {
			$id = $this->decrypt($_COOKIE['mid']);
			$email = $this->decrypt($_COOKIE['e']);
			$token = $this->decrypt($_COOKIE['token']);
			$member = Members::findFirst(array('id = "'.trim($id).'"', 'email = "'.trim($email).'"'));
			//$member =  Members::findFirst(array('id= "'.$id.'"', 'email="Yes"'));
			if ($member == true && $this->security->checkHash($token, $member->cookie_token)) {
				$userSession = get_object_vars($member);
				$userSession['type'] = 'Member';
				$profilePic = MemberPhotos::findFirst(array('member_id="'.$userSession['id'].'"', 'primary_pic="Yes"'));
				$userSession['primary_pic'] = $profilePic->file_path.$profilePic->filename;
				return $this->session->set('userSession', $userSession);
			}
		}
	}
	

	function encrypt($pure_string) {
		$encryption_key = 'sMeynBiaprpainlgiyhP';
		$iv_size = mcrypt_get_iv_size(MCRYPT_BLOWFISH, MCRYPT_MODE_ECB);
		$iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
		$encrypted_string = mcrypt_encrypt(MCRYPT_BLOWFISH, $encryption_key, utf8_encode($pure_string), MCRYPT_MODE_ECB, $iv);
		return $encrypted_string;
	}

	function decrypt($encrypted_string) {
		$encryption_key = 'sMeynBiaprpainlgiyhP';
		$iv_size = mcrypt_get_iv_size(MCRYPT_BLOWFISH, MCRYPT_MODE_ECB);
		$iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
		$decrypted_string = mcrypt_decrypt(MCRYPT_BLOWFISH, $encryption_key, $encrypted_string, MCRYPT_MODE_ECB, $iv);
		return $decrypted_string;
    }

	
	
}
