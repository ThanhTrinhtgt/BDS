<?php 
namespace BDS\Controller\Admin;

use BDS\Controller\BaseController as GlobalBaseController;
use BDS\Core\Router;

class BaseController extends GlobalBaseController
{
	public function __construct()
	{
		$this->setDefaultData();
	}

	public function setDefaultData()
	{
		$this->set('menu', Router::MENU_ADMIN);
	}
}