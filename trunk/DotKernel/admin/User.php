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
* Admin User Model
* Here are all the actions related to the user
* @category   DotKernel
* @package    Admin 
* @author     DotKernel Team <team@dotkernel.com>
*/

class Admin_User
{	
	/**
	 * Constructor
	 * @access public
	 */
	public function __construct()
	{		
		$this->db = Zend_Registry::get('database');
		$this->config = Zend_Registry::get('configuration');
		$this->settings = Zend_Registry::get('settings');
	}
	/**
	 * Check to see if user can login
	 * @access public
	 * @param array $data
	 * @return array
	 */
	public function checkLogin($data)
	{
		$password = md5($data['username'].$this->config->settings->admin->salt.$data['password']);
		$select = $this->db->select()
						   ->from('admins')
						   ->where('active = ?','1')
						   ->where('username = ?', $data['username'])
						   ->where('password = ?', $password);
		$results = $this->db->fetchAll($select);		
		if( 1 == count($results))
		{
			return $results;
		}
		else
		{
			return array();
		}
	}
	/**
	 * Logout admin user. Using Dot_AuthorizeUser class
	 * @access public
	 * @return void
	 */
	public function logout()
	{
		Dot_AuthorizeUser::logout('admin');
	}
	/**
	 * Get user info
	 * @access public
	 * @param int $id
	 * @return array
	 */
	public function getUserInfo($id)
	{
		$select = $this->db->select()
						   ->from('admins')
						   ->where('id = ?', $id);
		return $this->db->fetchRow($select);
	}
	/**
	 * Get user list
	 * @access public 
	 * @param int $page [optional]
	 * @return array(array(), Zend_Paginator_Adapter())
	 */
	public function getUserList($page = 1)
	{
		$select = $this->db->select()->from('admins');
				
 		$paginatorAdapter = new Zend_Paginator_Adapter_DbSelect($select);
		($page == 1) ? 
			$select->limit($this->settings->results_per_page) : 
			$select->limit($this->settings->results_per_page, ($page-1)*$this->settings->results_per_page);
							
		$data = $this->db->fetchAll($select);
		return array('data'=> $data,'paginatorAdapter'=> $paginatorAdapter);
	}
	/**
	 * Add new user
	 * @access public
	 * @param array $data
	 * @return void
	 */
	public function addUser($data)
	{		
		$data['date_created'] = date('Y-m-d H:i:s');
		$data['active'] = 1;
		$data['password'] = md5($data['username'].$this->config->settings->admin->salt.$data['password']);
		$this->db->insert('admins',$data);		
	}	
	/**
	 * Update user
	 * @access public
	 * @param array $data
	 * @return void
	 */
	public function updateUser($data)
	{
		Zend_Debug::dump($data);
		$id = $data['id'];
        unset ($data['id']);
		if(array_key_exists('password', $data))
		{
			$user = $this->getUserInfo($id);
			$data['password'] = md5($user['username'].$this->config->settings->admin->salt.$data['password']);
		}
        $this->db->update('admins', $data, 'id = '.$id);
	}
	/**
	 * Validate user input, add or update form
	 * @access public
	 * @param public 
	 * @return array
	 */
	public function validateUser($values)
	{
		$data = array();
		$error = array();
		//validate the imput data	
		$validatorChain = new Zend_Validate();
		$validatorChain->addValidator(new Zend_Validate_Alpha())
						->addValidator(new Zend_Validate_StringLength(3,20));
		$validAlpha = Dot_Kernel::validate($validatorChain, $values);
		//validate email
		$validatorEmail = new Zend_Validate_EmailAddress();		
		$validEmail = Dot_Kernel::validate($validatorEmail, array('email'=>$_POST['email']));
		$data = array_merge($data, $validAlpha['data'], $validEmail['data']);
		$error = array_merge($error, $validAlpha['error'], $validEmail['error']);
		//validate paswword				
		if($_POST['password'] != '' || $_POST['password2'] != '')
		{			
			if($_POST['password'] == $_POST['password2'])
			{
				$validatorChain = new Zend_Validate();
				$validatorChain->addValidator(new Zend_Validate_Alnum())
								->addValidator(new Zend_Validate_StringLength(3,20));			
				$values = array('password'=>$_POST['password']);
				$validPass = Dot_Kernel::validate($validatorChain, $values);
				$data = array_merge($data, $validPass['data']);
				$error = array_merge($error, $validPass['error']);	
			}
			else
			{
				$error['password'] = "You didn't enter the same password twice. Please re-enter your password";
			}
		}
		return array('data' => $data, 
					'error' => $error);
	}
}