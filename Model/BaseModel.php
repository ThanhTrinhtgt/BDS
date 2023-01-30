<?php 
namespace BDS\Model;

use BDS\App;

class BaseModel extends \stdClass
{
	public static $table;
	public static $fields;
	
	public function __construct()
	{
		// code...
	}

	public static function select()
	{
		$app = App::getInstance();
		$data = [];

		$q = mysqli_query($app->db, "SELECT * FROM `".static::$table."`");
		
		while($row = mysqli_fetch_assoc($q)) {
			$item = [];
			
			foreach (static::$fields as $field) {
				if (isset($row[$field])) {
					$item[$field] = $row[$field];
				}
			}

			$data[] = $item;
		}

		return $data;
	}
}