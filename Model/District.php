<?php 
namespace BDS\Model;

class District extends BaseModel
{
	public static $table = 'district';
	public static $fields = [
		'id', 
		'name', 
		'prefix',
		'province_id'
	];

	public static function getNameById($id = 0)
	{
		if (!empty($id)) {
			$obj = self::select([
				'select' => ['name'],
				'where'  => ['id' => $id]
			]);

			return $obj['name'];
		}

		return '';
	}
}