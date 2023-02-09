<?php

namespace BDS\Core;

use Twig\Environment;
use Twig\Loader\FilesystemLoader;
use BDS\Core\Helper;

class Router 
{
	const MENU_TIN_RAO = 'tin-rao';
	const MENU_TIN_TUC = 'tin-tuc';

	const MENU_ADMIN = [
		'real-estate' => [
			'name' => 'Tin rao',
			'child' => [
				'index' => ['name' => 'Danh sách']
			]
		],
		'news' => [
			'name' => 'Tin tức',
			'child' => [
				'index' => ['name' => 'Danh sách']
			]
		],
	];

	protected $route 	    = '';
	protected $arr_route    = [];
	protected $args    		= [];
	protected $module       = 'User'; #User || Admin
	protected $controller   = '';
	protected $action  	    = '';
	protected $data_render  = [];
	protected $templateName = '';
	protected $renderPath   = '';
	protected $title 		= '';

	public $menu_rewrite = [
		self::MENU_TIN_RAO => 'real-estate',
		self::MENU_TIN_TUC => 'news',
	];

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
		$protocol = 'http://';
		$realPath = $protocol . 'bds544.com/View';

		if (isset($_SERVER['HTTPS']) &&
		    ($_SERVER['HTTPS'] == 'on' || $_SERVER['HTTPS'] == 1) ||
		    isset($_SERVER['HTTP_X_FORWARDED_PROTO']) &&
		    $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') {
		  $protocol = 'https://';
		}

		$data   = array_merge([
			'title' => $this->title, 
			'realPath' => $realPath,
			'domain' => $protocol . $_SERVER['SERVER_NAME'],
		], $this->data_render);

		$html = $twig->render($this->getTemplateName(), $data);

		echo $html;
	}

	private function getTemplateName()
	{
		$basicPath = strtolower($this->module) . '/' . strtolower($this->renderPath);

		if (file_exists(dirname(__DIR__) . '/View/' . $basicPath . '/'. $this->templateName . '.tpl')) {
			return $basicPath . '/'. $this->templateName . '.tpl';
		}

		if ($this->module == 'Admin') {
			return 'admin/404.tpl';
		}

		return '404.tpl';
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

		call_user_func_array([$obj, $this->action], $this->args);

		$this->data_render 	= $obj->data;
		$this->title 		= $obj->title;
		$this->templateName = $obj->templateName;
	}

	private function analysModule()
	{
		if (!empty($this->arr_route[0]) && $this->arr_route[0] == 'admin') {
			//check amdin
			$this->module = 'Admin';

			unset($this->arr_route[0]);

			$this->arr_route = array_values($this->arr_route);

			if (empty($this->arr_route[0])) $this->arr_route[0] = 'index';
			if (empty($this->arr_route[1])) $this->arr_route[1] = 'index';
		} else {
			if (empty($this->arr_route) || empty($this->arr_route[0]) || !is_array($this->arr_route)) {
				$this->arr_route = ['index', 'index'];
			}

			if (empty($this->arr_route[1])) {
				$this->arr_route[1] = 'index';
			}

			if (isset($this->menu_rewrite[$this->arr_route[0]])) {
				$this->arr_route[0] = $this->menu_rewrite[$this->arr_route[0]];
			}
		}

		foreach ($this->arr_route as $k => $v) {
			if ($k > 1) {
				$this->args[] = $v;
			}
		}

		$this->renderPath = $this->arr_route[0];
		$this->controller = Helper::covertToCameCase($this->arr_route[0]);
		$this->action     = Helper::covertToCameCase($this->arr_route[1], true);

		switch($this->action) {
			case 'edit':
			case 'add':
				$this->action = 'detail';
				break;
		}
	}
}