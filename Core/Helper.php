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

	public static function removeSpecialChar($str = '')
	{
		$str = preg_replace('/\s/i', '_', $str);

		$str = preg_replace('/(À|Ả|Ã|Á|Ă|Ằ|Ẳ|Ẵ|Ắ|Ặ|Â|Ầ|Ẩ|Ẫ|Ấ|Ậ)/i', "A", $str);
		$str = preg_replace('/(à|ả|ã|á|ạ|ă|ằ|ẳ|ẵ|ắ|ặ|â|ầ|ẩ|ẫ|ấ|ậ)/i', "a", $str);
		$str = preg_replace('/(đ)/i', "d", $str);
		$str = preg_replace('/(Đ)/i', "D", $str);
		$str = preg_replace('/(È|Ẻ|Ẽ|É|Ẹ|Ê|Ề|Ể|Ễ|Ế|Ệ)/i', "E", $str);
		$str = preg_replace('/(è|ẻ|ẽ|é|ẹ|ê|ề|ể|ễ|ế|ệ)/i', "e", $str);
		$str = preg_replace('/(Ì|Ỉ|Ĩ|Í|Ị)/i', "I", $str);
		$str = preg_replace('/(ì|ỉ|ĩ|í|ị)/i', "i", $str);
		$str = preg_replace('/(Ò|Ỏ|Õ|Ó|Ọ|Ô|Ồ|Ổ|Ỗ|Ố|Ộ|Ơ|Ờ|Ở|Ỡ|Ớ|Ợ)/i', "O", $str);
		$str = preg_replace('/(ò|ỏ|õ|ó|ọ|ô|ồ|ổ|ỗ|ố|ộ|ơ|ờ|ở|ỡ|ớ|ợ)/i', "o", $str);
		$str = preg_replace('/(Ù|Ủ|Ũ|Ú|Ụ|Ư|Ừ|Ử|Ữ|Ứ|Ự)/i', "U", $str);
		$str = preg_replace('/(ù|ủ|ũ|ú|ụ|ư|ừ|ử|ữ|ứ|ự)/i', "u", $str);
		$str = preg_replace('/(Ỳ|Ỷ|Ỹ|Ý|Ỵ)/i', "Y", $str);
		$str = preg_replace('/(ỳ|ỷ|ỹ|ý|ỵ)/i', "y", $str);

		$str = preg_replace('/[~!@#$%^&*_+=|\\{}\[\]\'\";:<>?\/,]/i', "", $str);

		return $str;
	}
}