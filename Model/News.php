<?php 
namespace BDS\Model;

class News extends BaseModel
{
	public static $table = 'news';
	public static $fields = [
		'id', 
		'name', 
		'seo_name', 
		'img_url', 
		'short_desc', 
		'desc', 
		'sort', 
		'type',
		'view',
		'date_add'
	];

	const TYPE_NEW = 1;
	const TYPE_HOT = 2;

	public static function getListType()
	{
		return [
			0 => [
				'name' => 'Chọn loại',
				'value' => 0
			],
			self::TYPE_NEW => [
				'name' => 'Tin tức mới',
				'value' => self::TYPE_NEW
			],
			self::TYPE_HOT => [
				'name' => 'Tin tức hot',
				'value' => self::TYPE_HOT
			],
		];
	}

	protected static function bindWhere($field, $value)
	{
		if (in_array($field, static::$fields)) {
			switch ($field) {
				case 'id_not_in':
					$strIds = implode(',', $value);

					return ' id NOT IN (' .$strIds. ')';

				default:
					return "`$field` = '$value'";
			}
		}
		
		return '';
	}
}