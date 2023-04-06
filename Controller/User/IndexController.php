<?php 
namespace BDS\Controller\User;

use BDS\Controller\User\BaseController;
use BDS\Model\RealEstate;
use BDS\Model\Banner;

class IndexController extends BaseController
{
	public function index()
	{
		$this->setDefaultData();

		$banner_slide = Banner::selectAll([
			'where' => [
				'banner_group_key' => 'BANNER_GROUP_KEY_1680752334'
			]
		]);

		$realestate = RealEstate::selectAll([]);
		$news = RealEstate::selectAll([]);

		$this->set('real_estate', $realestate);
		$this->set('news', $news);
		$this->set('banner_slide', $banner_slide);
	}
}