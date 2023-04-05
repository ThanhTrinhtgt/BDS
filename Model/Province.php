<?php 
namespace BDS\Model;

class Province extends BaseModel
{
	public static $table = 'province';
	public static $fields = [
		'id', 
		'name', 
		'code'
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