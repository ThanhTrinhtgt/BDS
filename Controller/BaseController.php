<?php 
namespace BDS\Controller;

use BDS\Model\Configuration;

class BaseController extends \stdClass
{
	public $data = [];
	public $templateName = 'index';

	public function __construct()
	{

	}

	public function set($key, $val)
	{
		$this->data[$key] = $val;
	}

	public function setDefaultData()
	{
		$config = new Configuration();

		$listsearch = $config->getList(Configuration::KEY_TYPE_SEARCH);
		
		$this->set('list_search', $listsearch);
	}
}