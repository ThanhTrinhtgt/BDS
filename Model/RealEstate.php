<?php 
namespace BDS\Model;

class RealEstate extends BaseModel
{
	public static $table = 'real-estate';
	public static $fields = [
		'id', 'name', 'short_desc', 'desc', 'sort', 'type'
	];
}