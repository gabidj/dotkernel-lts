<?php
/**
* DotBoost Technologies Inc.
* DotKernel v1.0
*
* @category   DotKernel
* @package    Admin
* @copyright  Copyright (c) 2009 DotBoost  Technologies (http://www.dotboost.com)
* @license    http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
* @version    $Id$
*/

/**
* Admin Controller
* @author     DotKernel Team <team@dotkernel.com>
*/

$adminView = new Admin_View($tpl);
$adminModel = new Admin();
// switch based on the action, NO default action here
switch ($requestAction)
{
	case 'login':
		// Show the Login form
		$pageTitle = 'Admin Login User';	
		$adminView->loginForm('login');
	break;	
	case 'logout':
		$adminModel->logout();
		header('location: '.$config->website->params->url.'/' . $requestModule);
		exit;
	break;	
	case 'authorize':	
		// validate the authorization request paramethers 
		$validate = Dot_Authorize::validateLogin($_POST['username'], $_POST['password'], $_POST['send']);
		if(!empty($validate['login']) && empty($validate['error']))
		{
			// login info are VALID, we can see if is a valid user now 
			$user = $adminModel->checkLogin($validate['login']);
			if(!empty($user))
			{
				$session->admin = $user[0];
				header('Location: '.$config->website->params->url.'/' . $requestModule );
				exit;
			}
			else
			{
				unset($session->admin);
				$session->loginUserError = 'Wrong Login Credentials';
				header('Location: '.$config->website->params->url. '/' . $requestModule . '/' . $requestController. '/login');
				exit;				
			}
		}
		else
		{
			// login info are NOT VALID
			$session->loginUserError = $validate['error']['username'] . ' <br> '. $validate['error']['password'];
			header('Location: '.$config->website->params->url. '/' . $requestModule . '/' . $requestController. '/login');
			exit;
		}			
	break;
	case 'account':
		$pageTitle = 'My Admin User Account';
		$data = $adminModel->getUserInfo($session->admin['id']);
		$adminView->details('update',$data);	
	break;
	case 'list':
		$pageTitle = 'List Admin Users';
		$page = (isset($request['page'])) ? $request['page'] : 1;
		$users = $adminModel->getUserList($page);		
		$adminView->listUser('list', $users,$page);	
	break;	
	case 'add':
		$data = array();
		$error = array();
		$pageTitle = 'Add New Admin User';
		if(array_key_exists('send', $_POST) && 'on' == $_POST['send'])
		{						
			$values = array('alpha' => 
								array('username'=>$_POST['username'],
									  'firstName'=>$_POST['firstName'],
									  'lastName'=>$_POST['lastName']
									 ),
							'email' => array('email' => $_POST['email']),
							'password' => array('password' => $_POST['password'],
												'password2' =>  $_POST['password2']
											   )
						  );
			$valid = $adminModel->validateUser($values);
			$data = $valid['data'];
			$error = $valid['error'];
			if(empty($error))
			{
				//add admin user
				$adminModel->addUser($data);
				header('Location: '.$config->website->params->url. '/' . $requestModule . '/' . $requestController. '/list');
				exit;	
				
			}
			elseif(array_key_exists('password', $data))
			{ 
				// do not display password in the add form
				unset($data['password']);
			}
		}
		$adminView->details('add',$data,$error);		
	break;
	case 'update':
		$error = array();
		$pageTitle = 'Update Admin User';
		if(array_key_exists('send', $_POST) && 'on' == $_POST['send'])
		{						
			$values = array('alpha' => 
								array('firstName'=>$_POST['firstName'],
									  'lastName'=>$_POST['lastName']
									 ),
							'email' => array('email' => $_POST['email']),
							'password' => array('password' => $_POST['password'],
												'password2' =>  $_POST['password2']
											   )
						  );
			$valid = $adminModel->validateUser($values);
			$data = $valid['data'];
			$error = $valid['error'];
			if(empty($error))
			{
				$data['id'] = $request['id'];
				//add admin user
				$adminModel->updateUser($data);
				header('Location: '.$config->website->params->url. '/' . $requestModule . '/' . $requestController. '/list');
				exit;				
			}
		}
		$data = $adminModel->getUserInfo($request['id']);
		$adminView->details('update',$data,$error);	
	break;
}

