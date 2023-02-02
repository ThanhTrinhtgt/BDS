<?php 
namespace BDS\Controller\Admin;

use BDS\Controller\BaseController as BaseController;
use BDS\Core\Router;

class IndexController extends BaseController
{
	public function index()
	{
		$this->setDefaultData();
	}

	public function setDefaultData()
	{
		$this->set('menu', Router::MENU_ADMIN);
	}
}