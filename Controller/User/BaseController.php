<?php 
namespace BDS\Controller\User;

use BDS\Controller\BaseController as GlobalBaseController;
use BDS\Core\Router;
use BDS\Model\Configuration;
use BDS\Model\Banner;

class BaseController extends GlobalBaseController
{
	public function __construct()
	{
		parent::__construct();
	}

	public function setDefaultData()
	{
		$config = new Configuration();

		$listsearch = $config->getList(Configuration::KEY_TYPE_SEARCH);
		$listmenu = $config->getList(Configuration::KEY_TYPE_MENU, [], ['sort' => 'ASC']);

		$logo = Banner::select([
			'where' => [
				'banner_key' => 'BANNER_KEY_1680764801'
			]
		]);
		
		$this->set('list_search', $listsearch);
		$this->set('list_menu', $listmenu);
		$this->set('logo', $logo);
	}
}