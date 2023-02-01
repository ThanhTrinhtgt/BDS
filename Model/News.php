<?php 
namespace BDS\Model;

class News extends BaseModel
{
	public static $table = 'news';
	public static $fields = [
		'id', 'name', 'desc'
	];
}