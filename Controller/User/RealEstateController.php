<?php 
namespace BDS\Controller\User;

use BDS\Controller\User\BaseController;
use BDS\Core\App;
use BDS\Model\RealEstate;

class RealEstateController extends BaseController
{
	public function index()
	{
		$this->templateName = 'index';
		$this->setDefaultData();
	}

	public function detail($seo_name = '')
	{
		$this->templateName = 'detail';
		$this->setDefaultData();
		$app = App::getInstance();

		if (empty($seo_name)) {
			header("Location: " . $app->domain);
			die();
		}

		$realestate = RealEstate::select([
			'query' => ['seo_name' => $seo_name]
		]);

		$this->set('data', $realestate);
	}
}