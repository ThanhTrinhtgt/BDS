<?php 
namespace BDS;

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include_once 'Core/init.php';

use BDS\Core\Router;
use BDS\Core\App;

$router = new Router();
$app    = App::getInstance();

$app->router = $router;

$router->render();

mysqli_close($app->db);
?>