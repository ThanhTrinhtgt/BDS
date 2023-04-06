<?php 
namespace BDS\Controller\Admin;

use BDS\Controller\Admin\BaseController as BaseController;
use BDS\Model\Banner;
use BDS\Model\BannerGroup;
use BDS\Core\App;

class BannerGroupController extends BaseController
{
	public function index()
	{
		$this->title = 'Danh sách';

		$data = BannerGroup::select([], true);

		$this->set('data', $data);
	}

	public function detail($id = 0)
	{
		$this->templateName = 'detail';
		$this->title = 'Thêm mới';

		if (!empty($id) && $id > 0) {
			$this->title = 'Tuỳ chỉnh';			
		} 

		$banner = new BannerGroup($id);

		$this->set('data', $banner);
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
			$banner = new BannerGroup(!empty($form['id']) ? $form['id'] : 0);
			$fields = ['id', 'name', 'desc'];

			if (empty($form['id'])) {
				$fields[] = 'banner_group_key';

				$banner->banner_group_key = 'BANNER_GROUP_KEY_'.time();
			}

			$banner->name = $form['name'];
			$banner->desc = $form['desc'];

			if ($banner->save($fields, $error)) {
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

		return true;
	}
}