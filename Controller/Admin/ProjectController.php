<?php 
namespace BDS\Controller\Admin;

use BDS\Controller\Admin\BaseController as BaseController;
use BDS\Model\Project;
use BDS\Core\App;

class ProjectController extends BaseController
{
	public function index()
	{
		$this->title = 'Danh sách';

		$data = Project::select([], true);

		$this->set('data', $data);
	}

	public function detail($id = 0)
	{
		$this->templateName = 'detail';
		$this->title = 'Thêm mới';

		if (!empty($id) && $id > 0) {
			$this->title = 'Tuỳ chỉnh';			
		} 

		$news = new Project($id);

		$this->set('data', $news);
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
			$news = new Project(!empty($form['id']) ? $form['id'] : 0);

			$fields = ['id', 'name', 'seo_name', 'short_desc', 'desc'];

			$news->name 		= $form['name'];
			$news->seo_name 	= $form['seo_name'];
			$news->short_desc 	= !empty($form['short_desc']) ? $form['short_desc'] : '';
			$news->desc 		= !empty($form['desc']) ? $form['desc'] : '';

			if ($news->upLoadFile('img_url')) {
				$fields[] = 'img_url';
			}

			if ($news->save($fields, $error)) {
				$respone = [
					'code' => 200,
					'message' => 'Lưu thông tin thành công'
				];

				if ($news->upLoadFile('img_url')) {
					$news->save(['img_url']);
				}
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
			$error = 'Đường dẫn không thể để trống';
			return false;
		}

		return true;
	}
}