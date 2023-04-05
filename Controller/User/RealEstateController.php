<?php 
namespace BDS\Controller\User;

use BDS\Controller\User\BaseController;
use BDS\Core\App;
use BDS\Model\RealEstate;
use BDS\Model\Contact;

class RealEstateController extends BaseController
{
	public function index()
	{
		$this->templateName = 'index';
		$this->setDefaultData();

		$realestate = RealEstate::select([], true);

		$this->set('data', $realestate);
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

		/** @var RealEstate $realestate */
		$realestate = RealEstate::select([
			'where' => ['seo_name' => $seo_name]
		]);

		$list_hot = RealEstate::selectAll([
			'where' => ['id_not_in' => [$realestate->id], 'feature' => RealEstate::FEATURE_HOT],
			'limit' => 5
		]);

		$contact = new Contact($realestate['contact_id']);

		$this->set('data', $realestate);
		$this->set('contact', $contact);
		$this->set('list_hot', $list_hot);
	}
}