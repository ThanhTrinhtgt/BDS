<?php 
namespace BDS\Model;

class Configuration extends BaseModel
{
	public static $table = 'configuration';
	public static $fields = [
		'id', 'name', 'value', 'key', 'desc', 'sort'
	];

	const KEY_TYPE_SEARCH = 'KEY_TYPE_SEARCH';
	const KEY_TYPE_MENU = 'KEY_TYPE_MENU';

	public function getList($key = '', $fields = [], $orderby = [])
	{
		$query = [
			'select' => ['id', 'name', 'value', 'key']
		];

		if (!empty($fields)) {
			$query['select'] = $fields;
		}

		if (!empty($key)) {
			$query['where'] = ['key' => $key];
		}

		if (!empty($orderby)) {
			$query['order_by'] = $orderby;
		}

		return self::select($query, true);
	}
}