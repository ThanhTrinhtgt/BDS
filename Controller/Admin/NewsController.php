<?php 
namespace BDS\Controller\Admin;

use BDS\Controller\Admin\BaseController as BaseController;
use BDS\Model\News;
use BDS\Core\App;

class NewsController extends BaseController
{
	public function index()
	{
		$this->title = 'Danh sách';

		$data = News::select([], true);

		$this->set('data', $data);
	}

	public function detail($id = 0)
	{
		$this->templateName = 'detail';
		$this->title = 'Thêm mới';

		if (!empty($id) && $id > 0) {
			$this->title = 'Tuỳ chỉnh';			
		} 

		$news = new News($id);

		$this->set('data', $news);
		$this->set('list_type', News::getListType());
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
			$news = new News(!empty($form['id']) ? $form['id'] : 0);
			$fields = ['id', 'name', 'seo_name', 'short_desc', 'desc', 'sort', 'type'];

			$news->name 		= $form['name'];
			$news->seo_name 	= $form['seo_name'];
			$news->short_desc 	= !empty($form['short_desc']) ? $form['short_desc'] : '';
			$news->desc 		= !empty($form['desc']) ? $form['desc'] : '';
			$news->sort 		= !empty($form['sort']) ? $form['sort'] : 1;
			$news->type 		= !empty($form['type']) ? $form['type'] : 0;

			if ($news->upLoadFile('img_url')) {
				$fields[] = 'img_url';
			}

			if ($news->save($fields)) {
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