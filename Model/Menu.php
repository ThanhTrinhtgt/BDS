<?php 
namespace BDS\Model;

class Menu extends BaseModel
{
	public static $table = 'menu';
	public static $fields = [
		'id', 'name', 'desc', 'key'
	];

	public function getMenu()
	{
		return self::select();
	}
}