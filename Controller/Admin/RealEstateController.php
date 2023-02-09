<?php 
namespace BDS\Controller\Admin;

use BDS\Controller\Admin\BaseController as BaseController;
use BDS\Model\RealEstate;

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

		$this->set('data', $news);
	}

	public function saveJson()
	{
		$this->isRequest('POST');
		$respone = [
			'code' => 400,
			'message' => 'failed'
		];

		$form = SafeData($_POST);

		if ($this->validateForm($form, $error)) {
			$obj = new RealEstate(!empty($form['id']) ? $form['id'] : 0);

			$obj->name 		 = $form['name'];
			$obj->seo_name 	 = $form['seo_name'];
			$obj->short_desc = !empty($form['short_desc']) ? $form['short_desc'] : '';
			$obj->desc 		 = !empty($form['desc']) ? $form['desc'] : '';
			$obj->price 	 = !empty($form['price']) ? $form['price'] : 0;
			$obj->sort 		 = !empty($form['sort']) ? $form['sort'] : 1;
			$obj->type 		 = !empty($form['type']) ? $form['type'] : 0;

			if ($obj->save()) {
				$respone = [
					'code' => 200,
					'message' => 'success'
				];
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