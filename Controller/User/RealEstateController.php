<?php 
namespace BDS\Controller\User;

use BDS\Controller\BaseController as BaseController;

class RealEstateController extends BaseController
{
	public function index()
	{
		$this->templateName = 'detail';
		$this->setDefaultData();
	}
}