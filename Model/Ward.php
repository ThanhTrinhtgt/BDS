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
}