<?php 
namespace BDS\Controller\Admin;

use BDS\Controller\Admin\BaseController as BaseController;

class RealEstateController extends BaseController
{
	public function index()
	{
		$this->title = 'Danh sách tin rao';
	}

	public function detail()
	{
		$this->templateName = 'detail';
		$this->title = 'Chi tiết tin rao';
	}
}