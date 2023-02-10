<?php 
namespace BDS\Controller;

class BaseController extends \stdClass
{
	public $data = [];
	public $templateName = 'index';
	public $title = 'Thanh BDS';

	public function __construct()
	{
	}

	public function set($key, $val)
	{
		$this->data[$key] = $val;
	}

	public function setDefaultData()
	{
		
	}

	public function renderJson($response = [])
	{
		if (!empty($response) && is_array($response)) {
				echo json_encode($response);
			exit;
		} 

		echo json_encode(['code' => 404, 'message' => 'Undefined!']);
		exit;
	}

	public function isRequest($method = 'GET')
	{
		if (empty($method) || !$method || $method != $_SERVER['REQUEST_METHOD']) {
			return false;
		}

		return true;
	}
}