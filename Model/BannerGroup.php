<?php 
namespace BDS\Model;

class BannerGroup extends BaseModel
{
	public static $table = 'banner-group';
	public static $fields = [
		'id', 
		'name', 
		'banner_group_key',
		'desc',
	];

	public static $isBuildSeoName = false;
}