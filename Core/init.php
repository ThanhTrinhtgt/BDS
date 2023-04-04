<?php
include_once dirname(__DIR__) . '/Config/constant.php';
include_once 'autoLoad.php';
include_once dirname(__DIR__) . '/vendor/autoload.php';

use BDS\Core\App;

$app = App::getInstance();
$app->initDB();
$app->pathImage = dirname(__DIR__) . '/' . $app->pathImage;

$protocol = 'http://';
if (isset($_SERVER['HTTPS']) &&
    ($_SERVER['HTTPS'] == 'on' || $_SERVER['HTTPS'] == 1) ||
    isset($_SERVER['HTTP_X_FORWARDED_PROTO']) &&
    $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') {
  $protocol = 'https://';
}
$app->doamin = $protocol . $_SERVER['SERVER_NAME'];

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
		$data = removeXSS($data);
	}

	return addslashes($data);
}

function SafeImage(&$files)
{
	if (!empty($files)) {
		foreach ($files as $k => $file) {
			if (empty($file)) continue;
			if (empty($file['type'])) continue;

			$filetype = explode('/', $file['type']);

			if (!empty($filetype) && trim($filetype[0]) != 'image') {
				unset($files[$k]);
			}
		}
	}
}

function removeXSS($content)
{
	$content = preg_replace("#\<script\s*[^\>]*\>(.*?)\<\/script\>#iu", '', $content);
	$content = preg_replace("#\<iframe\s*[^\>]*\>(.*?)\<\/iframe\>#iu", '', $content);
	$content = preg_replace("#\<frame\s*[^\>]*\>(.*?)\<\/frame\>#iu", '', $content);
	$content = preg_replace('#href\s*=\s*\"\s*javascript\s*:\s*(.*?)\s*\"#iu', '', $content);
	$content = preg_replace('#href\s*=\s*\"\s*tel\s*:\s*(.*?)\s*\"#iu', '', $content);
	$content = preg_replace('#href\s*=\s*\"\s*mailto\s*:\s*(.*?)\s*\"#iu', '', $content);
	$content = preg_replace('#src\s*=\s*\"\s*javascript\s*:\s*(.*?)\s*\"#iu', '', $content);
	
	return $content;
}

function vd($value = '', $cont = false)
{
	echo '<b>' . __FILE__ .'</b><br/>';
	var_dump($value);
	if (!$cont) exit();
}

function pr($value = '', $cont = false)
{
	echo  '<b>' .__FUNCTION__ .'</b><br/>';
	echo '<pre>';
	echo print_r($value);
	echo '</pre>';
	if (!$cont) exit();
}