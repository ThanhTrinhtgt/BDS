<?php 
namespace BDS\Controller\Admin;

use BDS\Controller\Admin\BaseController as BaseController;
use BDS\Model\Province;
use BDS\Model\District;
use BDS\Model\Ward;
use BDS\Core\App;

class DistrictController extends BaseController
{
	public function index()
	{
		$this->title = 'Danh sách';

		$district = District::selectAll(['limit' => 70]);

		$this->set('district', $district);
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

	public function getListByProvinceJson()
	{
		$this->isRequest('POST');
		$json = file_get_contents("php://input");
		$data = json_decode($json, true);
		$repornse = [
			'code' => 400,
			'message' => 'failed'
		];

		if (!empty($data) && !empty($data['province_id'])) {
			$list = District::selectAll(['where' => ['province_id' => $data['province_id']]]);

			$repornse['code'] = 200;
			$repornse['message'] = 'success';
			$repornse['data'] = $list;
		}

		//pr()

		$this->renderJson($repornse);
	}
}