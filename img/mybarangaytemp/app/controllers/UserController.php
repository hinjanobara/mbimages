<?php


class UserController extends ControllerBase
{

	public function initialize()
	{
		parent::initialize();
		$this->view->setTemplateAfter('admin_default');
	}


	/**
     * Login user
     * @return \Phalcon\Http\ResponseInterface
     */
    public function admin_loginAction()
    {
     	$this->view->setTemplateAfter('admin_login');
     	if ($this->session->has("userSession")) {
     		return $this->response->redirect('admin/business');
     	}
        if ($this->request->isPost()) {

			$this->view->disable();
			$email = $this->request->getPost('email'); // $_POST
			$password = $this->request->getPost('password');

			if(empty($email) || empty($password)){ 
				$this->flash->warning('<button type="button" class="close" data-dismiss="alert">×</button>All fields required');
				return $this->response->redirect('admin/login'); 
			}

			$user = Users::findFirstByEmail($email);
			
			if ($user == true && $this->security->checkHash($password, $user->password)) {

				// $emaiConfirmed = EmailConfirmations::findFirst(array('columns'    => '*', 
    // 														 'conditions' => 'user_id = ?1 AND email=?2 AND confirmed = ?3', 
    // 														 'bind' => array(1 => $user->id, 2 => $user, 3 => 'Y')));

				// if(!$emaiConfirmed) {
				// 	$this->flash->warning('<button type="button" class="close" data-dismiss="alert">×</button>You\'re email is not yet confirmed.');
				// 	return $this->response->redirect('');
				// }

				$userSession = get_object_vars($user);
				$userSession['type'] = 'User';
				//$profilePic = UserPhotos::findFirst(array('user_id="'.$userSession['id'].'"', 'primary_pic="Yes"'));
				//$userSession['primary_pic'] = $profilePic->file_path.$profilePic->filename;
				$this->session->set('userSession', $userSession);
				//member id
				$cookie_name = "mid";
				$cookie_value = $userSession['id'];
				$date_of_expiry = time() + 60 * 60 * 24 * 90;
				setcookie($cookie_name, $this->encrypt($cookie_value), $date_of_expiry, "/");
				//email	
				$cookie_name = "e";
				$cookie_value = $userSession['email'];
				setcookie($cookie_name, $this->encrypt($cookie_value), $date_of_expiry, "/");
				//cookie token
				$cookie_name = "token";
				$cookie_token = substr(md5(uniqid(rand(), true)), 0, 20);
				setcookie($cookie_name, $this->encrypt($cookie_token), $date_of_expiry, "/");	
				$user->modified = date('Y-m-d H:i:s');
				$user->cookie_token = $this->security->hash($cookie_token);
				if($user->update()){
					$this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>You are now logged in.');
					$this->response->redirect('member/page/'.$userSession['id']);
				}

			} else {
				$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>Incorrect username or password.');
				$this->response->redirect('admin/login');
			}
		}
    }

    public function admin_logoutAction() {
    	$this->view->disable();
    	$this->session->destroy();
    	$date_of_expiry = time() - 60 ;
    	setcookie( "mid", "anonymous", $date_of_expiry, "/");
    	setcookie( "e", "anonymous", $date_of_expiry, "/");
    	setcookie( "token", "anonymous", $date_of_expiry, "/");
    	$this->view->setVar('userSession', '');
    	$this->session->start();
    	$this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>You are now logged out.');
    	
    	return $this->response->redirect('admin/login');
    }

    public function admin_addAction()
    {
    	if ($this->request->isPost()) {
			$error = 0;
			// if($this->security->checkToken() == false){
			// 	$error = 1;
			// 	$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>Invalid CSRF Token');
			// 	return $this->response->redirect('signup');
			// }

			$firstName = $this->request->getPost('first_name');
			$middleName = $this->request->getPost('middle_name');
			$lastName = $this->request->getPost('last_name');
			$street = $this->request->getPost('street');
			$city = $this->request->getPost('city');
			$country_id = $this->request->getPost('country_id');
			$mobile = $this->request->getPost('mobile');
			$email = $this->request->getPost('email'); 
			$password = $this->request->getPost('password');
			
			if(empty($firstName) || empty($lastName)  || empty($email)  || empty($password)){ 
				$this->flash->warning('<button type="button" class="close" data-dismiss="alert">×</button>All fields required');
				return $this->response->redirect(); 
			}

			if(!empty($email) && Users::findFirstByEmail($email)){
				$errorMsg = "Email is already in use. Please try again.";
				$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>'.$errorMsg);
				return $this->response->redirect();
			}

			$user = new Users();
			$user->created = date('Y-m-d H:i:s');
			$user->modified = date('Y-m-d H:i:s');
			$user->first_name = $firstName;
			$user->middle_name = $middleName;
			$user->last_name = $lastName;
			$user->mobile = $mobile;
			$user->street = $street;
			$user->city = $city;
			$user->country_id = $country_id;
			$user->email = $email;
			$user->password = $this->security->hash($password);
			
			if($user->create()){
				$activationToken = substr(str_shuffle( 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789' ), 0, 50);
				$emailConfimation = new EmailConfirmations();
				$emailConfimation->created = date('Y-m-d H:i:s');
				$emailConfimation->modified = date('Y-m-d H:i:s');
				$emailConfimation->user_id = $user->id;
				$emailConfimation->email = $email;
				$emailConfimation->token = $activationToken;
				$emailConfimation->confirmed = 'N';
				if($emailConfimation->save()){
					$this->getDI()->getMail()->send(
		                    array($email => $firstName.' '.$lastName),
		                    'Please confirm your email',
		                    'confirmation',
		                    array( 'confirmUrl' => 'admin/user/emailConfimation/'. $user->id .'/'. $email .'/'. $activationToken)
		                );
				}
			
				$this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>You\'ve successfully created a MyBarangay account. We sent a confirmation email to '.$email.'.');
				
			} else {
				//print_r($user->getMessages());
				$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>Registration failed. Please try again.');
				
			}
			return $this->response->redirect();
		}

		$countries = Countries::find();
	    $this->view->setVar('countries', $countries);	

    }


}