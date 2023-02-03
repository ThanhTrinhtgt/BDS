<?php 
namespace BDS\Controller\Admin;

use BDS\Controller\Admin\BaseController as BaseController;

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
		//vd($_POST);

		$this->renderJson();
	}
}