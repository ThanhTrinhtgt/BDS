<?php 
namespace BDS\Controller\Admin;

use BDS\Controller\Admin\BaseController as BaseController;
use BDS\Model\Province;
use BDS\Model\District;
use BDS\Model\Ward;
use BDS\Core\App;

class WardController extends BaseController
{
	public function index()
	{
		$this->title = 'Danh sách';

		$ward = Ward::selectAll(['limit' => 70]);

		$this->set('ward', $ward);
	}

	public function parseToFileJson()
	{
		$this->isRequest('POST');
		$respone = [
			'code' => 400,
			'message' => 'failed'
		];

		
		$this->renderJson($respone);
	}
}