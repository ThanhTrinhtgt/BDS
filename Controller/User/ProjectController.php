<?php 
namespace BDS\Controller\User;

use BDS\Controller\User\BaseController;
use BDS\Model\Project;

class ProjectController extends BaseController
{
	public function index()
	{
		$news = Project::selectAll();

		$this->set('news', $news);
	}

	public function detail($seo_name = '')
	{
		$this->templateName = 'detail';

		if (!empty($seo_name)) {
			$data = Project::Wselect([
				'where' => [
					'seo_name' => $seo_name
				]
			]);

			$this->set('data', $data);
		}
	}
}