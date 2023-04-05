<?php 
namespace BDS\Controller\Admin;

use BDS\Controller\Admin\BaseController as BaseController;
use BDS\Model\RealEstate;
use BDS\Model\Contact;
use BDS\Core\App;

class RealEstateController extends BaseController
{
	public function index()
	{
		$this->title = 'Danh sách tin rao';

		$data = RealEstate::select([], true);

		$this->set('data', $data);
	}

	public function detail($id = 0)
	{
		$this->templateName = 'detail';
		$this->title = 'Thêm mới';

		if (!empty($id) && $id > 0) {
			$this->title = 'Tuỳ chỉnh';			
		} 

		$news = new RealEstate($id);

		$list_type    = RealEstate::getListType();
		$list_feature = RealEstate::getListFeature();
		$list_contact = Contact::selectAll();

		$this->set('data', $news);
		$this->set('list_type', $list_type);
		$this->set('list_feature', $list_feature);
		$this->set('list_contact', $list_contact);
	}

	public function saveJson()
	{
		$this->isRequest('POST');
		$respone = [
			'code' => 400,
			'message' => 'failed'
		];

		$form = SafeData($_POST);
		SafeImage($_FILES);
		$app = App::getInstance();

		if ($this->validateForm($form, $error)) {
			$obj = new RealEstate(!empty($form['id']) ? $form['id'] : 0);
			$fields = ['id', 'name', 'seo_name', 'short_desc', 'desc', 'price', 'unit', 'unit_area', 'legally', 'area', 'num_bedroom', 'num_toilet', 'num_floor', 'sort', 'type', 'feature', 'contact_id'];

			$obj->name 		 = $form['name'];
			$obj->seo_name 	 = $form['seo_name'];
			$obj->short_desc = !empty($form['short_desc']) ? $form['short_desc'] : '';
			$obj->desc 		 = !empty($form['desc']) ? $form['desc'] : '';
			
			$obj->price 	  = !empty($form['price']) ? str_replace(',', '', $form['price']) : 0;
			$obj->unit 		  = !empty($form['unit']) ? $form['unit'] : '';
			$obj->unit_area   = !empty($form['unit_area']) ? $form['unit_area'] : '';
			$obj->area 		  = !empty($form['area']) ? $form['area'] : 0;
			$obj->legally	  = !empty($form['legally']) ? $form['legally'] : 0;
			$obj->num_bedroom = !empty($form['num_bedroom']) ? $form['num_bedroom'] : 0;
			$obj->num_toilet  = !empty($form['num_toilet']) ? $form['num_toilet'] : 0;
			$obj->num_floor   = !empty($form['num_floor']) ? $form['num_floor'] : 0;
			$obj->contact_id  = !empty($form['contact_id']) ? $form['contact_id'] : 0;
			
			$obj->sort 		 = !empty($form['sort']) ? $form['sort'] : 1;
			$obj->type 		 = !empty($form['type']) ? $form['type'] : RealEstate::TYPE_SELL;
			$obj->feature 	 = !empty($form['feature']) ? $form['feature'] : 0;

			if ($obj->upLoadFile('img_url')) {
				$fields[] = 'img_url';
			}

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
		}

		return true;
	}
}