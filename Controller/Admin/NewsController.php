<?php 
namespace BDS\Controller\Admin;

use BDS\Controller\Admin\BaseController as BaseController;
use BDS\Model\News;

class NewsController extends BaseController
{
	public function index()
	{
		$this->title = 'Danh sách tin tức';
	}

	public function detail()
	{
		$this->templateName = 'detail';
		$this->title = 'Chi tiết tin tức';
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
			$news = new News(!empty($form['id']) ? $form['id'] : 0);

			$news->name 		= $form['name'];
			$news->seo_name 	= $form['seo_name'];
			$news->short_desc 	= !empty($form['short_desc']) ? $form['short_desc'] : '';
			$news->desc 		= !empty($form['desc']) ? $form['desc'] : '';
			$news->sort 		= !empty($form['sort']) ? $form['sort'] : 1;
			$news->type 		= !empty($form['type']) ? $form['type'] : 0;

			if ($news->save()) {
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