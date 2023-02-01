<?php
include_once dirname(__DIR__) . '/Config/constant.php';
include_once 'autoLoad.php';
include_once dirname(__DIR__) . '/vendor/autoload.php';

use BDS\Core\App;

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