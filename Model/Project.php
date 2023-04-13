<?php 
namespace BDS\Model;

class Project extends BaseModel
{
	public static $table = 'project';
	public static $fields = [
		'id', 'name', 'seo_name', 'short_desc', 'desc', 'img_url'
	];
}