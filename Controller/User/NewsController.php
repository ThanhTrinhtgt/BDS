<?php 
namespace BDS\Controller\User;

use BDS\Controller\User\BaseController;
use BDS\Model\News;

class NewsController extends BaseController
{
	public function index()
	{
		$this->setDefaultData();

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
}