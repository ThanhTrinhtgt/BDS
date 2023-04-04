<?php 
namespace BDS\Controller\User;

use BDS\Controller\User\BaseController;
use BDS\Model\News;

class NewsController extends BaseController
{
	public function index()
	{
		$new_news = News::selectAll(['where' => ['type' => 1]]);
		$ids_new_news = [];

		/** @var News $new */
		foreach ($new_news as $new) {
			$ids_new_news[] = $new['id'];
		}

		$news = News::selectAll(['where' => ['id_not_in' => $ids_new_news]]);

		$this->set('new_news', $new_news);
		$this->set('news', $news);
	}

	public function detail($seo_name = '')
	{
		$this->templateName = 'detail';

		if (!empty($seo_name)) {
			$data = News::select([
				'where' => [
					'seo_name' => $seo_name
				]
			]);

			$this->set('data', $data);
		}
	}
}