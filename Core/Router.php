<?php

namespace BDS\Core;

use Twig\Environment;
use Twig\TwigFunction;;
use Twig\Loader\FilesystemLoader;
use BDS\Core\Helper;

class Router 
{
	const MENU_TIN_RAO = 'tin-rao';
	const MENU_TIN_TUC = 'tin-tuc';
	const MENU_LIEN_HE = 'lien-he';

	const MENU_ADMIN = [
		[
			'url' => 'real-estate',
			'name' => 'Tin rao',
		],
		[
			'url' => 'news',
			'name' => 'Tin tức',
		],
		[
			'url' => '',
			'name' => 'Quản lý banner',
			'child' => [
				'banner-group' => ['name' => 'Nhóm'],
				'banner' => ['name' => 'Banner'],
			]
		],
		[
			'url' => 'contact',
			'name' => 'Liên hệ',
		],
		[
			'url' => '',
			'name' => 'Quản lý tỉnh thành',
			'child' => [
				'province' => ['name' => 'Tỉnh/TP'],
				'district' => ['name' => 'Quận huyện'],
				'ward' => ['name' => 'Phường xã'],
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
		self::MENU_LIEN_HE => 'other'
	];

	public $action_rewrite = [
		self::MENU_LIEN_HE => 'contact'
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

	public static function reRewriteRouter($path = '')
	{
		$menu_rewrite = (new Router)->menu_rewrite;
		$menu_rewrite = array_flip($menu_rewrite);

		if (!empty($path) && !empty($menu_rewrite[$path])) {
			return $menu_rewrite[$path];
		}

		return $path;
	}

	public static function rewriteRouter($path = '')
	{
		$menu_rewrite = (new Router)->menu_rewrite;

		if (!empty($path) && !empty($menu_rewrite[$path])) {
			return $menu_rewrite[$path];
		}

		return $path;
	}

	public function render()
	{
		$this->detectModule();

		if (substr($this->action, -4, 4) == 'Json') {
			$this->renderJson();
		} else {
			$loader = new FilesystemLoader('View');
			$app    = App::getInstance();
			$twig   = new \Twig\Environment($loader, ['cache' => false]);

			$protocol = 'https://';
			$realPath = $protocol . $_SERVER['SERVER_NAME']. '/View';

			$data   = array_merge([
				'title' => $this->title, 
				'realPath' => $realPath,
				'domain' => $app->domain,
			], $this->data_render);

			$twig->addFunction(new TwigFunction('l', function () {
				$argList = func_get_args();
				$text = array_shift($argList);

				return sprintf(l($text), ...$argList);
			}));

			$html = $twig->render($this->getTemplateName(), $data);

			echo $html;
		}
	}

	public function renderJson()
	{
		$json = array_merge(['code' => 404, 'message' => 'Undefined!'], $this->data_render);
		
		echo json_encode($json);
		exit;
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

			switch($this->arr_route[1]) {
				case 'edit':
				case 'add':
					$this->arr_route[1] = 'detail';
					break;
			}

			foreach ($this->arr_route as $k => $v) {
				if ($k > 1) {
					$this->args[] = $v;
				}
			}
		} else {
			if (empty($this->arr_route) || empty($this->arr_route[0]) || !is_array($this->arr_route)) {
				$this->arr_route = ['index', 'index'];
			}

			if (empty($this->arr_route[1])) {
				$this->arr_route[1] = 'index';
			} else {
				$this->args[0] = $this->arr_route[1];
				$this->arr_route[1] = 'detail';
			}

			if (isset($this->menu_rewrite[$this->arr_route[0]])) {
				$realRoute1 = $this->arr_route[0];

				$this->arr_route[0] = $this->menu_rewrite[$this->arr_route[0]];

				if (isset($this->action_rewrite[$realRoute1])) {
					$this->arr_route[1] = $this->action_rewrite[$realRoute1];
				}
			}
		}

		$this->renderPath = $this->arr_route[0];
		$this->controller = Helper::covertToCameCase($this->arr_route[0]);
		$this->action     = Helper::covertToCameCase($this->arr_route[1], true);
	}
}