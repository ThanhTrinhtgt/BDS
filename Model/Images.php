<?php 
namespace BDS\Model;

class Images extends BaseModel
{
	public static $table = 'images';
	public static $fields = [
		'id', 
		'id_object',
		'module',
		'img_url',
		'sort'
	];
	public static $specialField = ['module'];
	public static $fieldImage = '';
	
}