<?php 
namespace BDS\Model;

class Configuration extends BaseModel
{
	public static $table = 'configuration';
	public static $fields = [
		'id', 'name', 'key', 'desc'
	];

	const KEY_TYPE_SEARCH = 'KEY_TYPE_SEARCH';

	public function getList($key = '')
	{
		$query = [];

		if (!empty($key)) {
			$query['where'] = [$key];
		}

		return self::select($query);
	}
}