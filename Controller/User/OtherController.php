<?php 
namespace BDS\Controller\User;

use BDS\Controller\User\BaseController;
use BDS\Model\Banner;

class OtherController extends BaseController
{
	public function index()
	{
		$this->setDefaultData();
	}

	public function contact()
	{
		$this->templateName = 'contact';
		$this->setDefaultData();

		$banners = Banner::select([], true);
		$this->set('banner', $banners);
	}
}