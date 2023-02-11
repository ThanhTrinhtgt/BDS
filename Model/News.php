<?php 
namespace BDS\Model;

class News extends BaseModel
{
	public static $table = 'news';
	public static $fields = [
		'id', 'name', 'seo_name', 'img_url', 'short_desc', 'desc', 'sort', 'type'
	];

	const TYPE_NEW = 1;
	const TYPE_HOT = 2;

	public static function getListType()
	{
		return [
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
}