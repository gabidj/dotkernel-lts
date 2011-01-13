<?php
/**
* DotBoost Technologies Inc.
* DotKernel Application Framework
*
* @category   DotKernel
* @package    Frontend
* @copyright  Copyright (c) 2009-2011 DotBoost Technologies Inc. Canada (http://www.dotboost.com)
* @license    http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
* @version    $Id$
*/

/**
* Page Controller
* @author     DotKernel Team <team@dotkernel.com>
*/

$pageView = new Page_View($tpl);
// all actions MUST set  the variable  $pageTitle
$pageTitle = $option->pageTitle->action->{$registry->route['action']};
switch ($registry->route['action'])
{
	default:
	case 'home';
		// call showPage method to view the home page
		$pageView->showPage('home');
	break;
	case 'about':
		$pageView->showPage($registry->route['action']);
	break;
	case 'who-we-are':
		$pageView->showPage($registry->route['action']);
	break;
	case 'outbound-links':
		$pageView->showPage($registry->route['action']);
	break;
}