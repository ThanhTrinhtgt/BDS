<?php 
namespace BDS\Model;

class Banner extends BaseModel
{
	public static $table = 'banner';
	public static $fields = [
		'id', 
		'name', 
		'banner_key',
		'banner_group_key',
		'seo_name', 
		'img_url', 
		'short_desc', 
		'desc', 
		'sort', 
	];
	public static $isBuildSeoName = false;

}