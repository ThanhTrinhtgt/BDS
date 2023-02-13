<?php 
namespace BDS\Model;

class Banner extends BaseModel
{
	public static $table = 'banner';
	public static $fields = [
		'id', 'name', 'seo_name', 'img_url', 'short_desc', 'desc', 'sort'
	];

}