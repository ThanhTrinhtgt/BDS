<?php 
namespace BDS\Controller;

class BaseController extends \stdClass
{
	public $data = [];

	public function __construct()
	{
		
	}

	public function set($key, $val)
	{
		$this->data[$key] = $val;
	}
}