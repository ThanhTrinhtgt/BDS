<?php 
namespace BDS\Controller\Admin;

use BDS\Controller\Admin\BaseController as BaseController;
use BDS\Model\Contact;
use BDS\Core\App;

class ContactController extends BaseController
{
	public function index()
	{
		$this->title = 'Danh sách liên hệ';

		$data = Contact::select([], true);

		$this->set('data', $data);
	}

	public function detail($id = 0)
	{
		$this->templateName = 'detail';
		$this->title = 'Thêm mới';

		if (!empty($id) && $id > 0) {
			$this->title = 'Tuỳ chỉnh';			
		} 

		$news = new Contact($id);

		$this->set('data', $news);
		$this->set('list_level', Contact::getListLevel());
	}

	public function saveJson()
	{
		$this->isRequest('POST');
		$respone = [
			'code' => 400,
			'message' => 'Lưu thông tin thất bại'
		];

		$form = SafeData($_POST);
		$app = App::getInstance();

		if ($this->validateForm($form, $error)) {
			$obj = new Contact(!empty($form['id']) ? $form['id'] : 0);

			$fields = ['id', 'name', 'level', 'phone', 'address'];

			$obj->name 		= $form['name'];
			$obj->level 	= (int)$form['level'];
			$obj->phone 	= $form['phone'];
			$obj->address 	= !empty($form['address']) ? $form['address'] : '';

			if ($obj->upLoadFile('img_url')) {
				$fields[] = 'img_url';
			}

			if ($obj->save($fields, $error)) {
				$respone = [
					'code' => 200,
					'message' => 'Lưu thông tin thành công'
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

		if (empty($form['phone'])) {
			$error = 'Không thể để trống SDT';
			return false;
		}

		return true;
	}
}