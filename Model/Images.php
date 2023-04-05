<?php 
namespace BDS\Model;

class Images extends BaseModel
{
	public static $table = 'images';
	public static $fields = [
		'id', 
		'module',
		'img_url',
		'sort'
	];

	
}