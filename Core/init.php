<?php
include_once dirname(__DIR__) . '/Config/constant.php';
include_once 'autoLoad.php';
include_once 'App.php';
include_once 'Router.php';

use BDS\Router;
use BDS\App;
use BDS\Model\Menu;

$app = App::getInstance();
$app->initDB();

$menu = new Menu();

vd($menu->getMenu());

function vd($value = '', $cont = false)
{
	var_dump($value);
	if (!$cont) exit();
}

function pr($value = '', $cont = false)
{
	echo '<print>'.print_r($value).'</print>';
	if (!$cont) exit();
}