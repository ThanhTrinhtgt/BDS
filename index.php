<?php 
namespace BDS;

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include_once 'Core/init.php';

$router = new Router();
$app = App::getInstance();

$router->render();
mysqli_close($app->db);
?>