<?php 
namespace BDS\Controller\Admin;

use BDS\Controller\Admin\BaseController as BaseController;
use BDS\Model\RealEstate;
use BDS\Model\Contact;
use BDS\Model\Province;
use BDS\Model\District;
use BDS\Model\Ward;
use BDS\Model\Project;
use BDS\Core\App;

class RealEstateController extends BaseController
{
	public function index()
	{
		$this->title = 'Danh sách tin rao';

		$data = RealEstate::selectAll([
			'select' => ['id', 'name', 'img_url', 'type', 'feature']
		]);

		foreach ($data as $k => $v) {
			$data[$k]['type_name'] = RealEstate::getType($v['type'])['name'];
			$data[$k]['feature_name'] = RealEstate::getFeature($v['feature'])['name'];
		}

		$this->set('data', $data);
	}

	public function detail($id = 0)
	{
		$this->templateName = 'detail';
		$this->title = 'Thêm mới';

		$list_district = [];
		$list_ward = [];

		if (!empty($id) && $id > 0) {
			$this->title = 'Tuỳ chỉnh';			
		} 

		$obj = new RealEstate($id);

		if (!empty($obj->id)) {
			if (!empty($obj->province_id)) {
				$list_district = District::selectAll(['where' => ['province_id' => $obj->province_id]]);
			}
			
			if (!empty($obj->district_id)) {
				$list_ward = Ward::selectAll(['where' => ['district_id' => $obj->district_id]]);
			}
		}

		$list_type    = RealEstate::getListType();
		$list_feature = RealEstate::getListFeature();
		$list_contact = Contact::selectAll();

		$this->set('data', $obj);
		$this->set('list_type', $list_type);
		$this->set('list_feature', $list_feature);
		$this->set('list_contact', $list_contact);
		$this->set('list_province', Province::selectAll());
		$this->set('list_district', $list_district);
		$this->set('list_project', Project::selectAll(['select' => ['id', 'name']]));
		$this->set('list_ward', $list_ward);
	}

	public function saveJson()
	{
		$this->isRequest('POST');
		$respone = [
			'code' => 400,
			'message' => 'failed'
		];

		$form = SafeData($_POST);
		$app = App::getInstance();

		if ($this->validateForm($form, $error)) {
			$obj = new RealEstate(!empty($form['id']) ? $form['id'] : 0);
			$fields = ['id', 'name', 'seo_name', 'short_desc', 'desc', 'price', 'unit', 
				'unit_area', 'legally', 'area', 'num_bedroom', 'num_toilet', 'num_floor', 
				'sort', 'type', 'feature', 'contact_id', 'province_id', '', 'district_id', 
				'ward_id', 'address_no', 'address', 'project_id'
			];

			$obj->name 		 = $form['name'];
			$obj->seo_name 	 = $form['seo_name'];
			$obj->short_desc = !empty($form['short_desc']) ? $form['short_desc'] : '';
			$obj->desc 		 = !empty($form['desc']) ? $form['desc'] : '';
			$obj->contact_id = !empty($form['contact_id']) ? $form['contact_id'] : 0;
			
			$obj->price 	  = !empty($form['price']) ? str_replace(',', '', $form['price']) : 0;
			$obj->unit 		  = !empty($form['unit']) ? $form['unit'] : '';
			$obj->unit_area   = !empty($form['unit_area']) ? $form['unit_area'] : '';
			$obj->area 		  = !empty($form['area']) ? $form['area'] : 0;
			$obj->legally	  = !empty($form['legally']) ? $form['legally'] : '';
			$obj->num_bedroom = !empty($form['num_bedroom']) ? $form['num_bedroom'] : 0;
			$obj->num_toilet  = !empty($form['num_toilet']) ? $form['num_toilet'] : 0;
			$obj->num_floor   = !empty($form['num_floor']) ? $form['num_floor'] : 0;

			$obj->project_id    = !empty($form['project_id']) ? $form['project_id'] : 0;
			$obj->province_id 	= $form['province_id'];
			$obj->district_id  	= $form['district_id'];
			$obj->ward_id  		= $form['ward_id'];
			$obj->address_no  	= $form['address_no'];
			$obj->address  	 	= $obj->buildAddressRealEstate();
			
			$obj->sort 		 = !empty($form['sort']) ? $form['sort'] : 1;
			$obj->type 		 = !empty($form['type']) ? $form['type'] : RealEstate::TYPE_SELL;
			$obj->feature 	 = !empty($form['feature']) ? $form['feature'] : 0;
			
			if ($obj->save($fields, $error)) {
				$respone = [
					'code' => 200,
					'message' => 'success'
				];
			} else {
				$respone['message'] = $error;
			}
		} else {
			$respone['message'] = $error;
		}

		$this->renderJson($respone);
	}

	public function validateForm($form, &$error = '')
	{
		if (empty($form)) {
			$error = 'Không có dữ liệu';
			return false;
		}

		if (empty($form['name'])) {
			$error = 'Không thể để trống chủ đề';
			return false;
		}

		if (empty($form['seo_name'])) {
			$error = 'Không thể để trống đường dẫn';
			return false;
		} else {

		}

		if (empty($form['province_id'])) {
			$error = 'Không thể để trống thành phố';
			return false;
		}

		if (empty($form['district_id'])) {
			$error = 'Không thể để trống quận huyện';
			return false;
		}

		if (empty($form['ward_id'])) {
			$error = 'Không thể để trống phường xã';
			return false;
		}

		return true;
	}
}