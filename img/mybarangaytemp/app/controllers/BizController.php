<?php
use Facebook\FacebookSession;
use Facebook\FacebookRequest;
use Google\Client;
use Google\Service\Plus;
use Google\Http\Request;
use Google\IO\Curl;
use \Phalcon\Tag;


class BizController extends ControllerBase
{

	public function initialize()
	{
		parent::initialize();
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
			$member->type = 'Business';
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
		                    array( 'confirmUrl' => 'biz/emailConfimation/'. $member->id .'/'. $email .'/'. $activationToken)
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
				//$userSession['type'] = 'Member';
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
					$this->response->redirect('biz/page/'.$userSession['id']);
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

    public function pageAction($id = null) {
    	$userSession = $this->session->get('userSession');
    	$member = Members::findFirstById($id);
    	$this->view->setVar('member', $member);

    	$reviews = Reviews::find(array('member_id = "'.$id.'"', 'order' => 'id DESC'));
    	$this->view->setVar('reviews', $reviews);

    	$claimRequests = ClaimRequests::find(array('member_id = "'.$id.'"', 'order' => 'id DESC'));
    	$this->view->setVar('claimrequest', $claimRequests);
    }

    public function business_searchAction() {
    	$searchWords = '';
        $business = array();
        if(isset($_GET["page"])){
            $currentPage = (int) $_GET["page"];
        } else {
            $currentPage = 1;
        }
        if ($this->request->isPost()) {
            $businessName = $this->request->getPost('name');
            $businessAddress = $this->request->getPost('address');
            $businessCategoryId = $this->request->getPost('business_category_id');

            $country = Countries::findFirst(array('columns'    => '*', 
                                             'conditions' => 'country LIKE :country:', 
                                             'bind' => array('country' => $businessAddress)));
          
            $countryId = '';
            if($country) {
                $countryId = $country->id;
            } 

            $businessCategoryLists = BusinessCategoryLists::find(array('columns'    => '*', 
                                             'conditions' => 'business_category_id = :business_category_id:',
                                             'bind' => array('business_category_id' => $businessCategoryId)));
            $conditions = '';
            if(!empty($businessCategoryLists)) {
                foreach ($businessCategoryLists as $key => $businessCategoryList) {
                    $conditions .= ' OR id = :'.$key.':';
                    $bind[$key] = $businessCategoryList->business_id;
                }//$searchWords .= ', '.$businessName;
            }

            if(!empty($businessName)) {
                $conditions .= ' OR name LIKE :name:';
                $bind['name'] = '%'.$businessName.'%';
                $searchWords .= ', '.$businessName;
            }

            if(!empty($businessAddress)) {
                $conditions .= ' OR street LIKE :street: OR city LIKE :city:';
                $bind['street'] = '%'.$businessAddress.'%';
                $bind['city'] = '%'.$businessAddress.'%';
                $searchWords .= ', '.$businessAddress;
            }

            if(!empty($countryId)) {
                $conditions .= ' OR country_id = :country_id:';
                $bind['country_id'] = $countryId;
                $searchWords .= ', '.$country->country;
            }

            $searchWords = substr($searchWords, 2); 
            $business = Business::find(array('columns'    => '*', 
                                     'conditions' => substr($conditions, 3), 
                                     'bind' => $bind
                                        ));

            $this->view->setVar('business', $business);
        } else {
            $business = Business::find(array('order'    => 'id DESC'));
        }

        $paginator = new \Phalcon\Paginator\Adapter\Model(
            array(
                "data" => $business,
                "limit"=> 12,
                "page" => $currentPage
            )
        );
        $page = $paginator->getPaginate();
        $this->view->setVar('business', $page);
        //$this->view->setVar('business', $business);
        $businessCategories = BusinessCategories::find();
        $this->view->setVar('businessCategories', $businessCategories);
    }

    public function claimAction($business_id = null) {

    	$userSession = $this->session->get("userSession");

    	$type = $userSession['type'];
    	$id   = $userSession['id'];
    	$business = $business_id;
	if ($type != 'Business') {
		return $this->response->redirect('biz/signup');
	} else {
	    	$claimRequest = new ClaimRequests();
	    	$claimRequest->created = date('Y-m-d H:i:s');
	    	$claimRequest->modified = date('Y-m-d H:i:s');
	    	$claimRequest->member_id = $userSession['id'];
	    	$claimRequest->business_id = $business_id;
	    	$claimRequest->status = 'pending'; // default status

	    	if ($claimRequest->create()) {
	    		return $this->response->redirect('business/view/'. $business_id);
	    	} else {
	    		$this->view->disable();
	    		print_r($claimRequest->getMessages());
	    	}
	}
    }

    public function respondAction($review_id = null, $business_id = null) {
    	$userSession = $this->session->get("userSession");

    	if ($this->request->isPost()) {
    		$biz_id = $this->request->getPost("business_id");
    		$respond = new ReviewResponds();
    		$respond->created = date('Y-m-d H:i:s');
    		$respond->modified = date('Y-m-d H:i:s');
    		$respond->member_id = $userSession['id'];
    		$respond->review_id = $this->request->getPost("review_id");
    		$respond->business_id = $this->request->getPost("business_id");
    		$respond->content = $this->request->getPost("content");

    		if ($respond->create()) {
    			return $this->response->redirect('business/view/'.$biz_id);
    		} else {
    			$this->view->disable();
    			print_r($respond->getMessages());
    		}
    	}

        $business = Business::findFirstById($business_id);
        if(!$business) {
            return $this->response->redirect('review/search_business');
        }
        $this->view->setVar('business', $business);
        $reviews = Reviews::findById($review_id);
        if (!$reviews) {
        	$this->view->disable();
        	echo "failed";
        }
        $this->view->setVar('reviews', $reviews);


    }
    
    public function update_businessAction($businessId = null)
    {
        $business = Business::findFirst($businessId);
        if(!$business) {
            return $this->response->redirect('biz/business_search');
        }
        if ($this->request->isPost()) {
            $countryId = $this->request->getPost('country_id');
            $country = Countries::findFirst(array('columns'    => '*', 
                                             'conditions' => 'id LIKE :id:', 
                                             'bind' => array('id' => $countryId)));
            $countryName = '';
            if($country) {
                $countryName = $country->country;
            } 

            $address = str_replace(' ', '+', $this->request->getPost('street').'+'.$this->request->getPost('city').'+'.$countryName);
            $userSession = $this->session->get("userSession");
            $content = file_get_contents('https://maps.googleapis.com/maps/api/geocode/json?address='.$address.'&key=AIzaSyAbpLPfBH8sNdVSzMULD_BZN9qrAqbL3V8');
            $json = json_decode($content, true);
            $lat = $json['results'][0]['geometry']['location']['lat'];
            $lng = $json['results'][0]['geometry']['location']['lng'];
            $business->modified = date('Y-m-d H:i:s'); 
            $business->member_id =  $userSession['id'];
            $business->name = $this->request->getPost('name');
            $business->website = $this->request->getPost('website');
            $business->telephone = $this->request->getPost('telephone');
            $business->street = $this->request->getPost('street');
            $business->city = $this->request->getPost('city');
            $business->country_id = $this->request->getPost('country_id');
            $business->lat = $lat;
            $business->lng = $lng;
            $opened = '';
            if(!empty($this->request->getPost('opened'))) { $opened = 'Opened'; };
            if(empty($this->request->getPost('opened'))) { $opened = 'Opening Soon'; };
            $business->opened = $opened;
            if($business->update()){
                if(!empty($this->request->getPost('business_category_ids'))) {
                    $bCtegories = $this->request->getPost('business_category_ids');
                    $bCtegoryIds = explode(',', $bCtegories);
                    BusinessCategoryLists::find('business_id="'.$businessId.'"')->delete();
                    foreach ($bCtegoryIds as $key => $bCtegoryId) {
                        $businessCategoryLists = new BusinessCategoryLists();
                        $businessCategoryLists->created = date('Y-m-d H:i:s');
                        $businessCategoryLists->business_id = $businessId;
                        $businessCategoryLists->business_category_id = $bCtegoryId;
                        $businessCategoryLists->create();
                    }
                }

                $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>Business has been updated');
               
                return $this->response->redirect('business/view/'.$businessId);
            }
        }
        $this->view->setVar('business', $business);
        $countries = Countries::find();
        $this->view->setVar('countries', $countries);
        $businessCategoryLists = BusinessCategoryLists::find('business_id="'.$businessId.'"');
        $this->view->setVar('businessCategoryLists', $businessCategoryLists);
    }

    public function add_photoAction($id = null) {
        $userSession = $this->session->get('userSession');
        $id = $userSession['id'];
        $member = Members::findFirst($id);
        
        if(!$member) {
            $this->response->redirect('biz/add_photo/'.$userSession['id']);
        }

        $photos = MemberPhotos::find(array('member_id = "'.$id.'"', 'order' => 'id DESC'));

        $this->view->setVars([
            'photos' => $photos, 
            'member' => $member
        ]);

        // POST 
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
                    $path = 'img/member/'.$newFileName; // img/business_member ?
                    $filePath = 'img/member/'; // img/business_member ?
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
                    return $this->response->redirect('biz/add_photo/'.$id);
                } else {
                    // if member photos creation is failed. 
                    $this->view->disable();
                    print_r($memberPhotos.getMessages());
                }
            }
        }

    }

    public function delete_photoAction($id = null) {
        
    }

    public function set_primary_photoAction($id = null) {
        $this->view->disable();
        $photos = MemberPhotos::findFirst($id);
        $userSession = $this->session->get('userSession');
        if(!$photos || $userSession['id'] != $photos->member_id) {
            return $this->response->redirect('biz/add_photo/'.$userSession['id']);
        } else { 
            $currentPhotos = MemberPhotos::find('member_id = "'.$userSession['id'].'"');
            foreach ($currentPhotos as $key => $currentPhoto) {
                $currentPhoto->primary_pic = 'No';
                if (!$currentPhoto->update()) {
                    $this->view->disable();
                    echo "failed to update current photo.";
                }
               
            }

            $photos->modified = date('Y-m-d H:i:s');
            $photos->primary_pic = 'Yes';
            if($photos->update()) {
            	$userSession['primary_pic'] = $photos->file_path.$photos->filename;
				$this->session->set('userSession', $userSession);
                $this->flash->success('<button type="button" class="close" data-dismiss="alert">×</button>Photo has been set as primary.');
                return $this->response->redirect('biz/add_photo/'.$userSession['id']);
            } else {
                $this->view->disable();
                echo "failed to modified data. ";
            }
        }
    }

    public function update_photo_captionAction($id = null) {

    }
}
