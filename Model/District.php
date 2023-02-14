<?php 
namespace BDS\Model;

class District extends BaseModel
{
	public static $table = 'district';
	public static $fields = [
		'id', 
		'name', 
		'prefix',
		'province_id'
	];
}