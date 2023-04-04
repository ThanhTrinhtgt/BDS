<?php 
namespace BDS\Model;

class Contact extends BaseModel
{
	public static $table = 'contact';
	public static $fields = [
		'id', 
		'name', 
		'img_url',
		'phone', 
		'address', 
		'level', 
	];

	const LEVEL_1 = 1;
	const LEVEL_2 = 2;
	const LEVEL_3 = 3;
	const LEVEL_4 = 4;

	public static function getLevel($level = 0)
	{
		$list = self::getListLevel();

		if (!empty($list[$level])) {
			return $list[$level];
		}

		return ['name' => 'N/A', 'value' => 0];
	}

	public static function getListLevel()
	{
		return [
			[
				'name'  => 'Thành viên mới',
				'value' => self::LEVEL_1
			],
			[
				'name'  => 'Hỗ trợ tích cực',
				'value' => self::LEVEL_2
			],
			[
				'name'  => 'Độ uy tín cao',
				'value' => self::LEVEL_3
			],
			[
				'name'  => 'Best seller',
				'value' => self::LEVEL_4
			],
		];
	}
}