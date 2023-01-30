<?php 
namespace BDS;

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include_once 'Core/init.php';

$router = new Router();
$app = App::getInstance();
use Twig\Environment;
use Twig\Loader\FilesystemLoader;

$loader = new FilesystemLoader('View');
$twig = new \Twig\Environment($loader, ['cache' => false]);

$html = $twig->render('index.tpl');
echo $html;
mysqli_close($app->db);
?>