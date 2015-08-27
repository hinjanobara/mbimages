<?php

use Facebook\FacebookSession;
use Facebook\FacebookRequest;
use Google\Client;
use Google\Service\Plus;
use Google\Http\Request;
use Google\IO\Curl;
use \Phalcon\Tag;

class MemberController extends ControllerBase
{

	public function initialize()
	{
		parent::initialize();
	}

    public function pageAction($id = null)
    {
    	$member = Members::findFirstById($id);
    	$this->view->setVar('member', $member);

    	$reviews = Reviews::find(array('member_id = "'.$id.'"', 'order' => 'id DESC'));
    	$this->view->setVar('reviews', $reviews);

    	$claimRequests = ClaimRequests::find(array('member_id = "'.$id.'"', 'order' => 'id DESC'));
    }
    
    // temporary
    public function biz_pageAction() {
    	$member = Members::findFirstById($id);
    	$this->view->setVar('member', $member);

    	$reviews = Reviews::find(array('member_id = "'.$id.'"', 'order' => 'id DESC'));
    	$this->view->setVar('reviews', $reviews);

    	$claimRequests = ClaimRequests::find(array('member_id = "'.$id.'"', 'order' => 'id DESC'));
    }
    
    public function aboutAction($id = null)
    {
    	$member = Members::findFirst($id);
    	$this->view->setVar('member', $member);

    }

    public function update_photo_captionAction($id = null)
    {
    	$photo = MemberPhotos::findFirst($id);
    	$userSession = $this->session->get('userSession');
    	if(!$photo || $userSession['id'] != $photo->member_id) {
    		return $this->response->redirect('member/add_photo/'.$userSession['id']);
    	} 
    	$this->view->setVar('photo', $photo);
    	if($this->request->isPost()){
    		$photo->modified = date('Y-m-d H:i:s');
    		$photo->caption = $this->request->getPost('caption');
    		if($photo->update()) {
    			$userSession['primary_pic'] = $photo->file_path.$photo->filename;
				$this->session->set('userSession', $userSession);
    			$this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>Photo caption has been updated.');
				return $this->response->redirect('member/update_photo_caption/'.$id);
			}
    	}
    	$photos = MemberPhotos::find(array('member_id = "'.$photo->member_id.'"', 'order' => 'id DESC'));
    	$this->view->setVar('photos', $photos);
    	$member = Members::findFirst($photo->member_id);
    	$this->view->setVar('member', $member);
    }

    public function set_primary_photoAction($id = null)
    {
    	$this->view->disable();
    	$photos = MemberPhotos::findFirst($id);
    	$userSession = $this->session->get('userSession');
    	if(!$photos || $userSession['id'] != $photos->member_id) {
    		return $this->response->redirect('member/add_photo/'.$userSession['id']);
    	} else { 
    		$currentPhotos = MemberPhotos::find('member_id = "'.$userSession['id'].'"');
    		foreach ($currentPhotos as $key => $currentPhoto) {
    			$currentPhoto->primary_pic = 'No';
    			$currentPhoto->update();
    		}

    		$photos->modified = date('Y-m-d H:i:s');
    		$photos->primary_pic = 'Yes';
    		if($photos->update()) {
    			$userSession['primary_pic'] = $photos->file_path.$photos->filename;
				$this->session->set('userSession', $userSession);
    			$this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>Photo has been set as primary.');
				return $this->response->redirect('member/add_photo/'.$userSession['id']);
			}
    	}

    }

    public function delete_photoAction($id = null)
    {
    	$this->view->disable();
    	$photos = MemberPhotos::findFirst($id);
    	$userSession = $this->session->get('userSession');
    	if(!$photos || $userSession['id'] != $photos->member_id) {
    		return $this->response->redirect('member/add_photo/'.$userSession['id']);
    	} else {
    		if(unlink($photos->file_path.$photos->filename)) {
    			$photos->delete();
    			$this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>Photo has been deleted.');
				return $this->response->redirect('member/add_photo/'.$userSession['id']);
			}
    	}

    }

    public function add_photoAction($id = null)
    {	
    	$userSession = $this->session->get('userSession');
    	$id = $userSession['id'];
    	$member = Members::findFirst($id);
    	
    	if(!$member) {
    		$this->response->redirect('member/add_photo/'.$userSession['id']);
    	}
    	$this->view->setVar('member', $member);
	    // $photos = MemberPhotos::find(array('columns'    => '*', 
     //                                 'conditions' => 'member_id LIKE :member_id: AND primary_pic LIKE :primary_pic: ',
     //                                 'order' => 'id DESC', 
     //                                 'bind' => array('member_id' => $id, 'primary_pic' => 'yes' )
     //                                    ));
    	$photos = MemberPhotos::find(array('member_id = "'.$id.'"', 'order' => 'id DESC'));
	    $this->view->setVar('photos', $photos);
    	
	    if($this->request->isPost() && $this->request->hasFiles() == true){
            //ini_set('upload_max_filesize', '64M');
            set_time_limit(1200);
            $uploads = $this->request->getUploadedFiles();

            $isUploaded = false;
            #do a loop to handle each file individually
            foreach($uploads as $upload){
                #define a “unique” name and a path to where our file must go
                $fileName = $upload->getname();
                $fileInfo = new SplFileInfo($fileName);
                $fileExt = $fileInfo->getExtension();
                $fileExt = strtolower($fileExt);
                $newFileName = substr(md5(uniqid(rand(), true)), 0, 10).date('ymdhis').'.'.$fileExt;
                //$fileExt = $upload->getExtension();
                $fileImageExt = array('jpeg', 'jpg', 'png');
                //error_log("File Extension :".$fileExt, 0);
                $fileType = '';
                $filePath = '';
                $path = '';
                //$path = ''.$newFileName;
                if(in_array($fileExt, $fileImageExt)){
                    $path = 'img/member/'.$newFileName;
                    $filePath = 'img/member/';
                    //$fileType = 'Image';
                }
                #move the file and simultaneously check if everything was ok
                ($upload->moveTo($path)) ? $isUploaded = true : $isUploaded = false;
            }

            #if any file couldn't be moved, then throw an message
            if($isUploaded) {
                $memberPhotos = new MemberPhotos();
                $memberPhotos->created = date('Y-m-d H:i:s'); 
                $memberPhotos->modified = date('Y-m-d H:i:s'); 
                $memberPhotos->member_id =  $userSession['id'];
                $memberPhotos->file_path =  $filePath;
                $memberPhotos->filename =  $newFileName;
                $memberPhotos->caption = $this->request->getPost('caption');
                if(count($photos) > 0) {
                	$memberPhotos->primary_pic = 'No';
                } else {
                	$memberPhotos->primary_pic = 'Yes';
                	$userSession['primary_pic'] = $filePath.$newFileName;
					$this->session->set('userSession', $userSession);
                }
                
                if($memberPhotos->create()){
                    return $this->response->redirect('member/add_photo/'.$id);
                }
            }
        }

        
    }

    public function updateAction($id = null)
    {
    	$member = Members::findFirstById($id);
	    
    	$userSession = $this->session->get('userSession');
    	if(!$member || $userSession['id'] != $member->id) {
    		$this->response->redirect('member/upload_photo/'.$userSession['id']);
    	}
    	$oldEmail = $member->email;
    	$this->view->setVar('member', $member);
    	if ($this->request->isPost()) {
    		$member = Members::findFirstById($this->request->getPost('id'));
			$member->modified = date('Y-m-d H:i:s');
			$member->first_name = $this->request->getPost('first_name');
			$member->last_name = $this->request->getPost('last_name');
			$member->street = $this->request->getPost('street');
			$member->city = $this->request->getPost('city');
			$member->country_id = $this->request->getPost('country_id');
			$member->email = $this->request->getPost('email');
			$member->mobile = $this->request->getPost('mobile');
			//email cookie	
			if(!empty($this->request->getPost('email'))){
				$cookie_name = "e";
				$cookie_value = $this->request->getPost('email');
				setcookie($cookie_name, $this->encrypt($cookie_value), $date_of_expiry, "/");
			}
			if($member->update()){
				if($oldEmail != $this->request->getPost('email')){
					$activationToken = substr(str_shuffle( 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789' ), 0, 50);
					$emailConfimation = new EmailConfirmations();
					$emailConfimation->created = date('Y-m-d H:i:s');
					$emailConfimation->modified = date('Y-m-d H:i:s');
					$emailConfimation->user_id = $member->id;
					$emailConfimation->email = $this->request->getPost('email');
					$emailConfimation->token = $activationToken;
					$emailConfimation->confirmed = 'N';
					if($emailConfimation->save()){
						$this->getDI()->getMail()->send(
			                    array($this->request->getPost('email') => $member->first_name.' '.$member->last_name),
			                    'Please confirm your email',
			                    'email_update_confirmation',
			                    array( 'confirmUrl' => 'member/emailConfimation/'. $member->id .'/'. $this->request->getPost('email') .'/'. $activationToken)
			                );
					}
				}
				$this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>You profile has been updated.');
				return $this->response->redirect('member/page/'.$this->request->getPost('id'));
			}
		} 

		
	    $countries = Countries::find();
	    $this->view->setVar('countries', $countries);
    }

    public function signupAction()
    {
    	if ($this->request->isPost()) {
			$error = 0;
			// if($this->security->checkToken() == false){
			// 	$error = 1;
			// 	$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>Invalid CSRF Token');
			// 	return $this->response->redirect('signup');
			// }
			$firstName = $this->request->getPost('first_name');
			$lastName = $this->request->getPost('last_name');
			$email = $this->request->getPost('email'); 
			$password = $this->request->getPost('password');
			$confirmPassword = $this->request->getPost('confirm_password');
			
			if(empty($firstName) || empty($lastName)  || empty($email)  || empty($password)  || empty($confirmPassword)){ 
				$this->flash->warning('<button type="button" class="close" data-dismiss="alert">×</button>All fields required');
				return $this->response->redirect(); 
			}

			if($password != $confirmPassword){ 
				$errorMsg = "Confirm password does not match"; 
				$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>'.$errorMsg);
				return $this->response->redirect();
			}


			if(!empty($email) && Members::findFirstByEmail($email)){
				$errorMsg = "Email is already in use. Please try again.";
				$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>'.$errorMsg);
				return $this->response->redirect();
			}

			$member = new Members();
			$member->created = date('Y-m-d H:i:s');
			$member->modified = date('Y-m-d H:i:s');
			$member->first_name = $firstName;
			$member->last_name = $lastName;
			$member->email = $email;
			$member->type = 'Member';
			$member->password = $this->security->hash($password);
			
			if($member->create()){
				$activationToken = substr(str_shuffle( 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789' ), 0, 50);
				$emailConfimation = new EmailConfirmations();
				$emailConfimation->created = date('Y-m-d H:i:s');
				$emailConfimation->modified = date('Y-m-d H:i:s');
				$emailConfimation->user_id = $member->id;
				$emailConfimation->email = $email;
				$emailConfimation->token = $activationToken;
				$emailConfimation->confirmed = 'N';
				if($emailConfimation->save()){
					$this->getDI()->getMail()->send(
		                    array($email => $firstName.' '.$lastName),
		                    'Please confirm your email',
		                    'confirmation',
		                    array( 'confirmUrl' => 'member/emailConfimation/'. $member->id .'/'. $email .'/'. $activationToken)
		                );
				}
			
				$this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>You\'ve successfully created a MyBarangay account. We sent a confirmation email to '.$email.'.');
				
			} else {
				//print_r($user->getMessages());
				$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>Registration failed. Please try again.');
				
			}
			return $this->response->redirect();
		}	

    }
    
    /**
     * Login user
     * @return \Phalcon\Http\ResponseInterface
     */
    public function loginAction()
    {
        if ($this->request->isPost()) {

			// if($this->security->checkToken() == false){
			// 	$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>Invalid CSRF Token');
			// 	return $this->response->redirect('login');
			// }
			$this->view->disable();
			$email = $this->request->getPost('email'); // $_POST
			$password = $this->request->getPost('password');

			if(empty($email) || empty($password)){ 
				$this->flash->warning('<button type="button" class="close" data-dismiss="alert">×</button>All fields required');
				return $this->response->redirect(''); 
			}

			$member = Members::findFirstByEmail($email);
			
			if ($member == true && $this->security->checkHash($password, $member->password)) {

				$emaiConfirmed = EmailConfirmations::findFirst(array('columns'    => '*', 
    														 'conditions' => 'user_id = ?1 AND email=?2 AND confirmed = ?3', 
    														 'bind' => array(1 => $member->id, 2 => $email, 3 => 'Y')));

				if(!$emaiConfirmed) {
					$this->flash->warning('<button type="button" class="close" data-dismiss="alert">×</button>You\'re email is not yet confirmed.');
					return $this->response->redirect('');
				}

				$userSession = get_object_vars($member);
				$userSession['type'] = 'Member';
				$profilePic = MemberPhotos::findFirst(array('member_id="'.$userSession['id'].'"', 'primary_pic="Yes"'));
				error_log('WWWTTTTFFFF : '.$profilePic->file_path.$profilePic->filename );
				$userSession['primary_pic'] = $profilePic->file_path.$profilePic->filename;
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
				$member->modified = date('Y-m-d H:i:s');
				$member->cookie_token = $this->security->hash($cookie_token);
				if($member->update()){
					$this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>You are now logged in.');
					$this->response->redirect('member/page/'.$userSession['id']);
				}

			} else {
				$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>Incorrect username or password.');
				$this->response->redirect('');
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

    /**
     * Login with Facebook account
     */
    public function loginWithFacebookAction()
    {
    	$this->view->disable();
    	$helper = $this->fbRedirectLoginHelper;
    	$scope = array('public_profile', 'email', 'user_friends');
    	return $this->response->redirect($helper->getLoginUrl(), true);
    }
    
    public function fbAuthAction()
    {
    	$this->view->disable();
    	$params = array(
		    'client_id' => FacebookSession::_getTargetAppId($this->config->facebook->appId),
		    'redirect_uri' => $this->config->facebook->redirect,
		    'client_secret' =>
		      FacebookSession::_getTargetAppSecret($this->config->facebook->secret),
		    'code' => isset($_GET['code']) ? $_GET['code'] : null
      	);
      
		$response = (new FacebookRequest(
			FacebookSession::newAppSession($this->config->facebook->appId, $this->config->facebook->secret),
			'GET',
			'/oauth/access_token',
			$params
		))->execute()->getResponse();
		if (isset($response['access_token'])) {
			$session = new FacebookSession($response['access_token']);
		}

		if( isset($session) ){
			$userSession['access_token'] = $response['access_token'];
			$request = new FacebookRequest( $session, 'GET', '/me' );
			$response = $request->execute();
			// get response
			$graphObject = $response->getGraphObject();
			$email = $graphObject->getProperty('email');
			
			$fbId = $graphObject->getProperty('id');
			$verified = $graphObject->getProperty('verified');
			$firstName = $graphObject->getProperty('first_name');
			$lastName = $graphObject->getProperty('last_name');
			$fullName = $graphObject->getProperty('name');
			$gender = $graphObject->getProperty('gender');
			$profileLink = $graphObject->getProperty('link');
			$bday = $graphObject->getProperty('birthday');
			$email = $graphObject->getProperty('email');
			$city = $graphObject->getProperty('location')->getProperty('name');
			if(!isset($email)) {
				$email = $fbId.'@facebook.com';
			}
			if(isset($bday)) {
				$bday = date('Y-m-d', strtotime($bday));
			}
			$socialData = array(
								'social_network' 	=>	'Facebook',
								'social_id'			=>	$fbId,
								'first_name'		=>	$firstName,
								'last_name'			=>	$lastName,
								'full_name'			=>	$fullName,
								'gender'			=>	$gender,
								'profile_link'		=>	$profileLink,
								'birthday'			=> 	$bday,
								'email'				=> 	$email,
								'city'				=>	$city,
								'access_token'		=>  $userSession['access_token']
							);
			if( $member = Members::findFirstByEmail($email) ) {
				$userSession = get_object_vars($member);
				if(!$socialProfile = SocialProfiles::findFirstByEmail($email) ) {
					$socialData['member_id'] = $member->id;
					$this->newSocialProfile($socialData);	
				}
			} else {
				
				$memberId = $this->newMember($socialData);
				$socialData['id'] = $memberId;
				$userSession = $socialData;
				$socialData['member_id'] = $memberId;
				$this->newSocialProfile($socialData);
			}
			
			//print_r($graphObject);
			$this->session->set('userSession', $userSession);
		}
		
		return $this->response->redirect();
    	
    }

    /**
     * Login with Google account
     */

    public function loginWithGoogleAction()
    {
	    if ($this->request->isPost()) {
	    	$this->view->disable();
	    	$code = $this->request->getPost('code');
	    	$token = $this->request->getPost('access_token');
			$client = $this->googleClient;	
		    $client->authenticate($code);
		    $gPlusService = new Google_Service_Plus($client);
		    $me = $gPlusService->people->get("me");
		    //print_r($me);
			// Exchange the OAuth 2.0 authorization code for user credentials.
			// Verify the token
			$reqUrl = 'https://www.googleapis.com/oauth2/v1/tokeninfo?access_token=' . $token;
			$req = new Google_Http_Request($reqUrl);

			if($req) {
				$userSession['access_token'] = $token;
				$tokenInfo = $client->getIo()->executeRequest($req);
				$obj = json_decode($tokenInfo[0], false);

				// Make sure the token we got is for the intended user.
				if ($obj->user_id != $me['id']) {
					print_r("Token's user ID doesn't match given user ID");
				}
				// Make sure the token we got is for our app.
				if ($obj->audience != $this->config->google->appId) {
					print_r("Token's client ID does not match app's. 401");
				}
				//print_r($me['modelData']);
				$me['email'] = $me['modelData']['emails'][0]['value'];

				if(isset($me['birthday'])) {
					$me['birthday'] = date('Y-m-d', strtotime($me['birthday']));
				}
				$socialData = array(
									'social_network' 	=>	'Google',
									'social_id'			=>	$me['id'],
									'first_name'		=>	$me['modelData']['name']['givenName'],
									'last_name'			=>	$me['modelData']['name']['familyName'],
									'full_name'			=>	$me['displayName'],
									'gender'			=>	$me['gender'],
									'profile_link'		=>	$me['url'],
									'birthday'			=> 	$me['birthday'],
									'email'				=> 	$me['email'],
									'city'				=>	$me['currentLocation'],
									'access_token'		=>  $token
								);

				if( $member = Members::findFirstByEmail($me['email']) ) {
					$userSession = get_object_vars($member);
					if(!$socialProfile = SocialProfiles::findFirstByEmail($me['email']) ) {
						$socialData['member_id'] = $member->id;
						$this->newSocialProfile($socialData);	
					}
					$this->session->set('userSession', $userSession);
				} else {

					$memberId = $this->newMember($socialData);
					$socialData['id'] = $memberId;
					$userSession = $socialData;
					$socialData['member_id'] = $memberId;
					$this->newSocialProfile($socialData);
					$this->session->set('userSession', $userSession);
				}
				$result = array('status' => 'OK');	
				//$this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>You are now logged in.');
				
			} else {
				$result = array('status' => 'FAILED');	
			}
			echo json_encode($result);	
			
			//$this->response->redirect();
		}
    }
    
    public function newSocialProfile($socialData = null){
    	$this->view->disable();
    	$socialProfile = new SocialProfiles();
		$socialData['created'] = date('Y-m-d H:i:s');
		$socialData['modified'] = date('Y-m-d H:i:s');		
		if( $socialProfile->save($socialData) ) {	

		}   	
    }
    
    public function newMember($socialData = null){
    	$this->view->disable();
    	$member = new Members();
		$member->created = date('Y-m-d H:i:s');
		$member->modified = date('Y-m-d H:i:s');
		$member->first_name = $socialData['first_name'];
		$member->last_name	= $socialData['last_name'];
		$member->gender	=	$socialData['gender'];
		$member->birthday = $socialData['birthday'];
		$member->city = $socialData['city'];
		$member->email = $socialData['email'];
		$member->type = 'Member';
		if($member->save()){
			return $member->id;
		}   	
    }

    
     
    public function logoutAction() {
    	$this->view->disable();
    	$this->session->destroy();
    	$date_of_expiry = time() - 60 ;
    	setcookie( "mid", "anonymous", $date_of_expiry, "/");
    	setcookie( "e", "anonymous", $date_of_expiry, "/");
    	setcookie( "token", "anonymous", $date_of_expiry, "/");
    	$this->view->setVar('userSession', '');
    	$this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>You are now logged out.');
    	
    	return $this->response->redirect();
    }

    public function emailConfimationAction($userId = null, $email =null, $activationToken = null){
    	$emaiConfirmed = EmailConfirmations::findFirst(array('columns'    => '*', 
    														 'conditions' => 'user_id = ?1 AND email=?2 AND token = ?3 AND confirmed = ?4', 
    														 'bind' => array(1 => $userId, 2 => $email, 3 => $activationToken, 4 => 'N')));
    	if($emaiConfirmed) {
    		$emaiConfirmed->confirmed = 'Y';
    		$emaiConfirmed->update();
    		
    		$this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button><H4>You \'re email has been confirmed.</H4>You\'re now officially part of the <strong>MyBarangay</strong> community. Mabuhay!');
    		return $this->response->redirect();
		} else {
			return $this->response->redirect();
		}
    }

    public function forgotPasswordAction(){
		if ($this->request->isPost()) {
			if($member = Members::findFirstByEmail($this->request->getPost('email'))) {
				$activationToken = substr(str_shuffle( 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789' ), 0, 50);
				$resetPassword = ResetPasswords::findFirstByEmail($this->request->getPost('email'));
				if(!$resetPassword){
					$resetPassword = new ResetPasswords();
					$resetPassword->created = date('Y-m-d H:i:s');
					$resetPassword->user_id = $member->id;
					$resetPassword->email = $member->email;
				}
				$resetPassword->modified = date('Y-m-d H:i:s');
				$resetPassword->token = $activationToken;
				$resetPassword->used = 'N';
				if($resetPassword->save()){	
					$this->getDI()->getMail()->send(
		                    array($member->email => $member->first_name.' '.$member->last_name),
		                    'MyBarangay password assistance',
		                    'reset_password',
		                    array( 'resetUrl' => 'member/resetPassword/'. $member->id .'/'. $member->email .'/'. $activationToken)
		                );
					$this->flash->notice('<button type="button" class="close" data-dismiss="alert">×</button>We send a special reset password link to your inbox.');
				}
				
			} else {
				$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>Email is not registered. Please try again.');
			}
		}
		return $this->response->redirect();
	}

	public function resetPasswordAction($userId = null, $email = null, $activationToken = null, $resetPasswordId = null){
		
		if ($this->request->isPost()) {
			$error = 0;
			if(empty($this->request->getPost('new_password')) || empty($this->request->getPost('confirm_password'))){
				$this->flash->warning('<button type="button" class="close" data-dismiss="alert">×</button>All fields required. Please try again.');
				$error = 1;
			}

			if($this->request->getPost('new_password') != $this->request->getPost('confirm_password')){
				$this->flash->warning('<button type="button" class="close" data-dismiss="alert">×</button>Password fields does not match. Please try again.');
				$error = 1;
			}

			if($error == 0){
				if(isset($resetPasswordId)) {
					
					$member = Members::findFirstById($userId);
					$member->modified = date('Y-m-d H:i:s');
					$member->password = $this->security->hash($this->request->getPost('new_password'));
					if($member->update()){	
						$resetPassword = ResetPasswords::findFirstById($resetPasswordId);
						$resetPassword->modified = date('Y-m-d H:i:s');
						$resetPassword->used = 'Y';
						if($resetPassword->update()){
							$this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>Password has been updated. You can now login');
							return $this->response->redirect();
						}
					}
				}
			}
		} else {
			$tomorrow = new DateTime('tomorrow');
			$resetPassword = ResetPasswords::findFirst(array('columns'    => '*', 
    														 'conditions' => 'user_id = ?1 AND email=?2 AND token = ?3 AND used = ?4 AND modified BETWEEN ?5 AND ?6', 
    														 'bind' => array(1 => $userId, 2 => $email, 3 => $activationToken, 4 => 'N', 5 => date('Y-m-d 00:00:00'), 6 => $tomorrow->format('Y-m-d 00:00:00'))));
			
			if($resetPassword){
				$this->view->setVar('referer', $this->config->application->baseUri.'member/resetPassword/'.$userId.'/'.$email.'/'.$activationToken.'/'.$resetPassword->id);
				//$this->view->setVar('resetPassword', $resetPassword);
			} else {
				$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>Reset password link you use is either incorrect or no longer valid. Please, try again.');
				return $this->response->redirect();
			}

		}

	}

	/**
     * Login user
     * @return \Phalcon\Http\ResponseInterface
     */
    public function advertiser_loginAction()
    {
        if ($this->request->isPost()) {

			// if($this->security->checkToken() == false){
			// 	$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>Invalid CSRF Token');
			// 	return $this->response->redirect('login');
			// }
			$this->view->disable();
			$email = $this->request->getPost('email'); // $_POST
			$password = $this->request->getPost('password');

			if(empty($email) || empty($password)){ 
				$this->flash->warning('<button type="button" class="close" data-dismiss="alert">×</button>All fields required');
				return $this->response->redirect(''); 
			}

			$member = Members::findFirstByEmail($email);
			
			if ($member == true && $member == 'Advertiser' && $this->security->checkHash($password, $member->password)) {

				$emaiConfirmed = EmailConfirmations::findFirst(array('columns'    => '*', 
    														 'conditions' => 'user_id = ?1 AND email=?2 AND confirmed = ?3', 
    														 'bind' => array(1 => $member->id, 2 => $email, 3 => 'Y')));

				if(!$emaiConfirmed) {
					$this->flash->warning('<button type="button" class="close" data-dismiss="alert">×</button>You\'re email is not yet confirmed.');
					return $this->response->redirect('');
				}

				$userSession = get_object_vars($member);
				$profilePic = MemberPhotos::findFirst(array('member_id="'.$userSession['id'].'"', 'primary_pic="Yes"'));
				$userSession['primary_pic'] = $profilePic->file_path.$profilePic->filename;
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
				$member->modified = date('Y-m-d H:i:s');
				$member->cookie_token = $this->security->hash($cookie_token);
				if($member->update()){
					$this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>You are now logged in.');
					$this->response->redirect('member/page/'.$userSession['id']);
				}

			} else {
				$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>Incorrect username or password.');
				$this->response->redirect('');
			}
		}
		
    }

    public function advertiser_signupAction()
    {
    	if ($this->request->isPost()) {
			$error = 0;
			// if($this->security->checkToken() == false){
			// 	$error = 1;
			// 	$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>Invalid CSRF Token');
			// 	return $this->response->redirect('signup');
			// }
			$firstName = $this->request->getPost('first_name');
			$lastName = $this->request->getPost('last_name');
			$email = $this->request->getPost('email'); 
			$password = $this->request->getPost('password');
			$confirmPassword = $this->request->getPost('confirm_password');
			
			if(empty($firstName) || empty($lastName)  || empty($email)  || empty($password)  || empty($confirmPassword)){ 
				$this->flash->warning('<button type="button" class="close" data-dismiss="alert">×</button>All fields required');
				return $this->response->redirect(); 
			}

			if($password != $confirmPassword){ 
				$errorMsg = "Confirm password does not match"; 
				$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>'.$errorMsg);
				return $this->response->redirect();
			}


			if(!empty($email) && Members::findFirstByEmail($email)){
				$errorMsg = "Email is already in use. Please try again.";
				$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>'.$errorMsg);
				return $this->response->redirect();
			}

			$member = new Members();
			$member->created = date('Y-m-d H:i:s');
			$member->modified = date('Y-m-d H:i:s');
			$member->first_name = $firstName;
			$member->last_name = $lastName;
			$member->email = $email;
			$member->type = 'Advertiser';
			$member->password = $this->security->hash($password);
			
			if($member->create()){
				$activationToken = substr(str_shuffle( 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789' ), 0, 50);
				$emailConfimation = new EmailConfirmations();
				$emailConfimation->created = date('Y-m-d H:i:s');
				$emailConfimation->modified = date('Y-m-d H:i:s');
				$emailConfimation->user_id = $member->id;
				$emailConfimation->email = $email;
				$emailConfimation->token = $activationToken;
				$emailConfimation->confirmed = 'N';
				if($emailConfimation->save()){
					$this->getDI()->getMail()->send(
		                    array($email => $firstName.' '.$lastName),
		                    'Please confirm your email',
		                    'confirmation',
		                    array( 'confirmUrl' => 'advertiser/emailConfimation/'. $member->id .'/'. $email .'/'. $activationToken)
		                );
				}
			
				$this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>You\'ve successfully created a MyBarangay account. We sent a confirmation email to '.$email.'.');
				
			} else {
				//print_r($user->getMessages());
				$this->flash->error('<button type="button" class="close" data-dismiss="alert">×</button>Registration failed. Please try again.');
				
			}
			return $this->response->redirect();
		}	

    }

    public function advertiser_emailConfimationAction($userId = null, $email =null, $activationToken = null){
    	$emaiConfirmed = EmailConfirmations::findFirst(array('columns'    => '*', 
    														 'conditions' => 'user_id = ?1 AND email=?2 AND token = ?3 AND confirmed = ?4', 
    														 'bind' => array(1 => $userId, 2 => $email, 3 => $activationToken, 4 => 'N')));
    	
    	if($emaiConfirmed) {
    		$emaiConfirmed->confirmed = 'Y';
    		$emaiConfirmed->update();
    		error_log('PASOK Confirmed');
    		$this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button><H4>You \'re email has been confirmed.</H4>You\'re now officially part of the <strong>MyBarangay</strong> community. Mabuhay!');
    		//return $this->response->redirect();
		} else {
			//return $this->response->redirect();
		}
    }

       

}

