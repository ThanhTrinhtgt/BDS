<?php 
namespace BDS\Controller\User;

use BDS\Controller\BaseController as BaseController;
use BDS\Model\RealEstate;

class IndexController extends BaseController
{
	public function index()
	{
		$this->setDefaultData();

		$realestate = RealEstate::selectAll([]);

		$this->set('real_estate', $realestate);
	}
}