<?php 
namespace BDS\Model;

class Node extends BaseModel
{
	public static $table = 'node';
	public static $fields = [
		'id', 'url', 'type',
	];
}