<?php 
namespace BDS\Model;

class RealEstate extends BaseModel
{
	public static $table = 'real-estate';
	public static $fields = [
		'id', 
		'name', 
		'seo_name', 
		'short_desc', 
		'desc', 
		'price', 
		'area', 
		'unit', 
		'legally', 
		'num_bedroom', 
		'num_toilet', 
		'num_floor', 
		'img_url', 
		'sort', 
		'type'
	];
}