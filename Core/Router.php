<?php

namespace BDS;

use Twig\Environment;
use Twig\Loader\FilesystemLoader;
use BDS\Helper;

class Router 
{
	protected $route 	    = '';
	protected $arr_route    = [];
	protected $module       = 'User'; #User || Admin
	protected $controller   = '';
	protected $action  	    = '';
	protected $data_render  = [];
	protected $templateName = '';

	public function __construct() {
		if (!empty($_SERVER['PATH_INFO'])) {
			$this->route = trim($_SERVER['PATH_INFO']);
		} else {
			$this->route = trim($_SERVER['REQUEST_URI']);
		}

		if ($this->route == '/' || $this->route == '/index.php') {
			$this->route = '';
			$this->arr_route = ['index'];
		} else {
			$this->route = trim($this->route, '/');

			$this->arr_route = explode('/', $this->route);
		}

		$this->analysModule();
	}

	public function render()
	{
		$this->detectModule();
		
		$loader = new FilesystemLoader('View');
		$twig   = new \Twig\Environment($loader, ['cache' => false]);

		$data   = array_merge(['layout' => 'layout.tpl', 'title' => 'BDS Thanh Trinh'], $this->data_render);

		$html = $twig->render($this->getTemplateName(), $data);

		echo $html;
	}

	private function getTemplateName()
	{
		$basicPath = strtolower($this->module) . '/' . strtolower(Helper::covertToCameCase($this->controller));

		if (file_exists(dirname(__DIR__) . '/View/' . $basicPath . '/'. $this->templateName . '.tpl')) {
			return $basicPath . '/'. $this->templateName . '.tpl';
		}

		return 'index.tpl';
	}

	private function detectModule()
	{
		$class = "BDS\\Controller\\" .$this->module. "\\" .$this->controller. "Controller";

		if (!method_exists($class, $this->action)) {
			$class = 'BDS\Controller\User\IndexController';

			$this->controller = 'Index';
			$this->action = 'index';
		} 

		$obj = new $class;

		call_user_func_array([$obj, $this->action], []);

		$this->data_render = $obj->data;
		$this->templateName = $obj->templateName;
	}

	private function analysModule()
	{
		if (!empty($this->arr_route[0]) && $this->arr_route[0] == 'admin') {
			//check amdin
			$this->module = 'Admin';
		} else {
			if (empty($this->arr_route) || empty($this->arr_route[0]) || !is_array($this->arr_route)) {
				$this->arr_route = ['index', 'index'];
			}

			if (empty($this->arr_route[1])) {
				$this->arr_route[1] = 'index';
			}

			$this->controller = Helper::covertToCameCase($this->arr_route[0]);
			$this->action = Helper::covertToCameCase($this->arr_route[1], true);
		}
	}
}