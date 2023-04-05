<?php 
namespace BDS\Controller\Admin;

use BDS\Controller\Admin\BaseController as BaseController;
use BDS\Model\Province;
use BDS\Model\District;
use BDS\Model\Ward;
use BDS\Core\App;

class ProvinceController extends BaseController
{
	public function index()
	{
		$this->title = 'Danh sách';

		$province = Province::selectAll(['limit' => 70]);

		$this->set('province', $province);
	}

	public function detail($id = 0)
	{
		$this->templateName = 'detail';
		$this->title = 'Thêm mới';

		if (!empty($id) && $id > 0) {
			$this->title = 'Tuỳ chỉnh';			
		} 
	}

	public function exportAddressJson()
	{
		$this->isRequest('POST');

		$respone = [
			'code' => 200,
			'message' => 'success'
		];


		$this->renderJson($respone);
	}
}