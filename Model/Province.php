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
}