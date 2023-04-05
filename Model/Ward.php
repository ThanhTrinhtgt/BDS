<?php 
namespace BDS\Model;

class Ward extends BaseModel
{
	public static $table = 'ward';
	public static $fields = [
		'id', 
		'name', 
		'prefix',
		'province_id',
		'district_id'
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