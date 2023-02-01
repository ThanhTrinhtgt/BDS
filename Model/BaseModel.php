<?php 
namespace BDS\Model;

use BDS\App;

class BaseModel extends \stdClass
{
	const MENU_TIN_RAO = 'tin-rao';
	const MENU_TIN_TUC = 'tin-tuc';

	public static $table;
	public static $fields;
	public static $menu = [
		self::MENU_TIN_RAO => 'real-estate',
		self::MENU_TIN_TUC => 'news',
	];
	
	public function __construct()
	{
		// code...
	}

	public static function select($query = [])
	{
		$app    = App::getInstance();
		$data   = [];
		$select = '*';
		$where  = '';

		if (!empty($query)) {
			if (!empty($query['select'])) {
				$select = '';

				foreach ($query['select'] as $field) {
					if (in_array($field, static::$fields)) {
						$select .= !empty($select) ? ",`$field`" : "`$field`";
					}

					if (empty($select)) $select = '*';
				}
			}

			if (!empty($query['where'])) {
				foreach ($query['where'] as $search => $val) {
					if (in_array($search, static::$fields)) {
						$where .= !empty($where) ? " AND `$search` = '$val'" : " `$search` = '$val'";
					}

					if (empty($where)) $where = '1';
				}
			}
		}

		$q = mysqli_query($app->db, "SELECT $select FROM `".static::$table."` WHERE $where");
		
		if ($q) {
			while($row = mysqli_fetch_assoc($q)) {
				$item = [];
				
				foreach (static::$fields as $field) {
					if (isset($row[$field])) {
						$item[$field] = $row[$field];
					}
				}

				$data[] = $item;
			}
		}

		return $data;
	}
}