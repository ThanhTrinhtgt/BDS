<?php 
namespace BDS\Core;

use Twig\Environment;
use Twig\TwigFunction;;
use Twig\Loader\FilesystemLoader;
use BDS\Core\Helper;
use BDS\Core\App;

class View extends \stdClass
{
	public function __construct()
	{
		// code...
	}

	public function render($title = '', $data = [])
	{
		$app = App::getInstance();
		$router = $app->router;

		$loader = new FilesystemLoader('View');
		$app    = App::getInstance();
		$twig   = new \Twig\Environment($loader, ['cache' => false]);

		$protocol = 'http://';
		$realPath = $protocol . $_SERVER['SERVER_NAME']. '/View';

		$data   = array_merge([
			'title' => $title, 
			'realPath' => $realPath,
			'domain' => $app->domain,
		], $data);

		$twig->addGlobal('_post', $_POST);
		$twig->addGlobal('_get', $_GET);

		$twig->addFunction(new TwigFunction('l', function () {
			$argList = func_get_args();
			$text = array_shift($argList);

			return sprintf(l($text), ...$argList);
		}));

		$html = $twig->render($this->getTemplateName(), $data);

		echo $html;
	}

	public function renderJson($data_render)
	{
		$json = array_merge(['code' => 404, 'message' => 'Undefined!'], $data_render);
		
		echo json_encode($json);
		exit;
	}

	public function getTemplateName()
	{
		$app = App::getInstance();
		$router = $app->router;

		$basicPath = strtolower($router->module) . '/' . strtolower($router->renderPath);

		if (file_exists(dirname(__DIR__) . '/View/' . $basicPath . '/'. $router->templateName . '.tpl')) {
			return $basicPath . '/'. $router->templateName . '.tpl';
		}

		if ($this->module == 'Admin') {
			return 'admin/404.tpl';
		}

		return '404.tpl';
	}
}