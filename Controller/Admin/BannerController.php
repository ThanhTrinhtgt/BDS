<?php 
namespace BDS\Controller\Admin;

use BDS\Controller\Admin\BaseController as BaseController;
use BDS\Model\Banner;
use BDS\Core\App;

class BannerController extends BaseController
{
	public function index()
	{
		$this->title = 'Danh sách';

		$data = Banner::select([], true);

		$this->set('data', $data);
	}

	public function detail($id = 0)
	{
		$this->templateName = 'detail';
		$this->title = 'Thêm mới';

		if (!empty($id) && $id > 0) {
			$this->title = 'Tuỳ chỉnh';			
		} 

		$banner = new Banner($id);

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
			$banner = new Banner(!empty($form['id']) ? $form['id'] : 0);
			$fields = ['id', 'name', 'seo_name', 'short_desc', 'desc', 'sort'];

			$banner->name 		= $form['name'];
			$banner->seo_name 	= $form['seo_name'];
			$banner->short_desc 	= !empty($form['short_desc']) ? $form['short_desc'] : '';
			$banner->desc 		= !empty($form['desc']) ? $form['desc'] : '';
			$banner->sort 		= !empty($form['sort']) ? $form['sort'] : 1;

			if ($banner->upLoadFile('img_url')) {
				$fields[] = 'img_url';
			}

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

		if (empty($form['seo_name'])) {
			$error = 'Không thể để trống đường dẫn';
			return false;
		}

		return true;
	}
}