<?php 
namespace BDS;

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include_once 'Core/init.php';

$router = new Router();
$app = App::getInstance();

//var_dump(method_exists('BDS\Controller\IndexController', 'index'));

//$index = new IndexController();


mysqli_close($app->db);
?>