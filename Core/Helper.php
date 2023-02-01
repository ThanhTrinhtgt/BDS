<?php 
namespace BDS\Core;

class Helper extends \stdClass
{
	public static function covertToCameCase($str, $lcf = false)
	{
		$str = ucwords($str, '-');

		if ($lcf) {
			$str = lcfirst($str);
		}

		$str = str_replace('-', '', $str);

		return $str;
	}
}