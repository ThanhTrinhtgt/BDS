<?php
include_once dirname(__DIR__) . '/Config/constant.php';
include_once 'autoLoad.php';
include_once dirname(__DIR__) . '/vendor/autoload.php';

use BDS\Core\App;

$app = App::getInstance();
$app->initDB();

function SafeData($data, $tp = false)
{
	if (is_array($data)) {
		foreach ($data as $key => $value) {
			$data[$key] = SafeData($value);
		}

		return $data;
	}

	if ((
			preg_match("#\\\'#iu", $data) 
			|| 
			preg_match('#\\\"#iu', $data)
		) 
		&& 
		!preg_match("#\\\u\d#iu", $data)
	) {
		$data = stripcslashes($data);
	}

	if ($tp) {
		$data = stripcslashes($data);
	} else {

	}

	return addslashes($data);
}

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