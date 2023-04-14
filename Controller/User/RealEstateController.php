<?php 
namespace BDS\Controller\User;

use BDS\Controller\User\BaseController;
use BDS\Core\App;
use BDS\Model\RealEstate;
use BDS\Model\Contact;
use BDS\Model\Project;
use BDS\Model\Province;

class RealEstateController extends BaseController
{
	public function index()
	{
		$this->templateName = 'index';
		$this->setDefaultData();

		$realestate = RealEstate::select(['multiImg' => true, 'multiImgLimit' => 3], true);

		$list_hot = RealEstate::selectAll([
			'limit' => 5
		]);

		$this->set('list_hot', $list_hot);
		$this->set('province', Province::selectAll());
		$this->set('data', $realestate);
	}

	public function detail($seo_name = '')
	{
		$this->templateName = 'detail';
		$this->setDefaultData();
		$list_hot = [];
		
		$app = App::getInstance();

		if (empty($seo_name)) {
			header("Location: " . $app->domain);
			die();
		}

		/** @var RealEstate $realestate */
		$realestate = RealEstate::select([
			'where' => ['seo_name' => $seo_name],
			'multiImg' => true,
		]);

		if (!empty($realestate['project_id'])) {
			$project = Project::select([
				'where' => ['id' => $realestate['project_id']],
				'select' => ['name']
			]);

			$realestate['project_name'] = $project['name'];
		}

		if (!empty($realestate['id'])) {
			$list_hot = RealEstate::selectAll([
				'where' => ['id_not_in' => [$realestate['id']],],
				'limit' => 5
			]);
		}
		
		$contact = new Contact($realestate['contact_id']);

		$this->set('data', $realestate);
		$this->set('contact', $contact);
		$this->set('list_hot', $list_hot);
	}
}