<?php 
namespace BDS\Controller\Admin;

use BDS\Controller\BaseController as GlobalBaseController;
use BDS\Core\Router;

class BaseController extends GlobalBaseController
{
	public function __construct()
	{
		parent::__construct();

		$this->setDefaultData();
	}

	public function setDefaultData()
	{
		parent::setDefaultData();

		$this->set('menu', Router::MENU_ADMIN);
	}

	public function index()
	{
		$this->set('data', []);
	}

	public function detail()
	{
		$this->set('data', []);
	}

	public function delete()
	{
		$this->checkPermission();

		$router = new Router();
		
	}

	/**
	 * Kiểm tra có quyền vào trang admin hay không
	 */
	private function checkPermission()
	{


		return true;
	}
}