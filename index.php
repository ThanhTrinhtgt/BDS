<?php 
namespace BDS;

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include_once 'Core/init.php';

use BDS\Core\Router;
use BDS\Core\App;
use BDS\Core\View;

$router = new Router();
$view   = new View();
$app    = App::getInstance();

$router->detectModule();

$app->router = $router;

$view->render($router->title, $router->data_render);

mysqli_close($app->db);
?>