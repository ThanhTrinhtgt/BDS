<?php
include_once dirname(__DIR__) . '/Config/constant.php';
include_once 'autoLoad.php';
include_once dirname(__DIR__) . '/vendor/autoload.php';
include_once 'App.php';
include_once 'Router.php';

use BDS\Router;
use BDS\App;
use BDS\Model\Menu;

$app = App::getInstance();
$app->initDB();

function vd($value = '', $cont = false)
{
	var_dump($value);
	if (!$cont) exit();
}

function pr($value = '', $cont = false)
{
	echo '<pre>';
	echo print_r($value);
	echo '</pre>';
	if (!$cont) exit();
}