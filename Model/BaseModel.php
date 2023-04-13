<?php 
namespace BDS\Model;

use BDS\Core\App;
use BDS\Core\Router;
use BDS\Core\Helper;

class BaseModel extends \stdClass
{
	public static $table 			= '';
	public static $fields 			= [];
	public static $isBuildSeoName 	= true;
	public static $fieldImage 		= 'img_url';
	public static $fieldImgageMulti = 'img_multi';
	public static $specialField 	= [];
	public static $isMultileImage 	= false;
	
	public function __construct($id = 0)
	{
		$data = [];
		
		if (!empty($id) && $id > 0) {
			$data = static::select(['where' => ['id' => $id], 'multiImg' => true]);

		}

		$this->mapDataToObject($data);
	}

	public function afterSelect($data = [])
	{
		
	}

	public function upLoadFile($field = 'img_url', $table_name = '')
	{
		if (!empty($_FILES) && !empty($_FILES[$field])) {
			$this->deleteCurrentImage($field, $table_name);

			$app      = App::getInstance();

			$fileName = $_FILES[$field]['name'];
			$tmp_name = $_FILES[$field]['tmp_name'];

			if (is_array($_FILES[$field])) {
				$fileName = $_FILES[$field]['name'][0];
				$tmp_name = $_FILES[$field]['tmp_name'][0];

				unset($_FILES[$field]['name'][0]);
			}

			if (empty($table_name)) {
				$table_name = static::$table;
			}

			$this->$field = time() . '_' . Helper::removeSpecialChar($fileName);

			if (!is_dir($app->pathImage . '/'.static::$table)) {
				mkdir($app->pathImage . '/'.static::$table, 0777, true);
			}

			if (!empty($_FILES[$field]) && !empty($_FILES[$field]['name'])) {
				$sortMulti = 0;

				foreach ($_FILES[$field]['name'] as $key => $img_name) {
					$tmp_name_multi = $_FILES[$field]['tmp_name'][$key];
					$url_multi = time() . '_' . Helper::removeSpecialChar($img_name);

					$imgMultiObj = new Images();

					$imgMultiObj->id_object = $this->id;
					$imgMultiObj->img_url    = $url_multi;
					$imgMultiObj->module    = $table_name;
					$imgMultiObj->sort      = $sortMulti;

					move_uploaded_file($tmp_name_multi, $app->pathImage . '/'. $table_name . '/' . $url_multi);
					$sortMulti++;

					$imgMultiObj->save();
				}
			}

			$url = $app->pathImage . '/'. $table_name . '/' . $this->$field;

			return move_uploaded_file($tmp_name, $url);
		}

		return false;
	}

	public function deleteCurrentImage($field = '', $table_name)
	{
		if (empty($table_name)) {
			$table_name = static::$table;
		}

		$app = App::getInstance();
		$img = $this->$field;
		$img = substr($img, 1);

		if (!empty($img) && file_exists($img)) {
			unlink($img);
		}

		$images = Images::selectAll([
			'where' => [
				'id_object' => $this->id,
				'module'	=> $table_name,
			],
			'select' => ['id', 'module', 'img_url'],
		]);

		foreach ($images as $img) {
			$url = substr($img['img_url'], 1);

			if (file_exists($url)) {
				unlink($url);
			}

			$newObj = new Images();
			$newObj->id = $img['id'];
			$newObj->delete();
		}
	}

	public function mapDataToObject($data = [])
	{

		if (!empty(static::$fields)) {
			foreach (static::$fields as $field) {
				$this->$field = !empty($data) && isset($data[$field]) ? $data[$field] : '';
			}

			if (static::$isMultileImage) {
				$fieldMultiImg = static::$fieldImgageMulti;

				$this->$fieldMultiImg = !empty($data) && !empty($data[static::$fieldImgageMulti]) ? 
				$data[static::$fieldImgageMulti] : [];
			}
		}
	}

	public function save($fields = [], &$error = '')
	{
		$app    = App::getInstance();
		$result = true;
		
		if (empty($fields)) {
			$fields = static::$fields;
		}
		
		$arr_dif = array_diff($fields, static::$fields);
		$fields  = !empty($arr_dif) ? array_diff($fields, $arr_dif) : $fields;
		$fieldImage = static::$fieldImage;

		if (!empty($this->id) && $this->id > 0) {
			$fields['id'] = $this->id;

			if (!empty($fieldImage) && $this->upLoadFile($fieldImage)) {
				$fields[] = $fieldImage;
			}

			return $this->update($fields, [], $error);
		} else {
			$fields    = static::$fields;
			$val_field = '';
			$val_value = '';

			foreach ($fields as $field) {
				if ($field != 'id') {
					if (property_exists($this, $field)) {
						$val_field .= !empty($val_field) ? ",`$field`" : "$field";

						$val_value .= !empty($val_value) ? ",'".$this->$field."'" : "'".$this->$field."'";
					}
				}
			}

			$q = mysqli_query($app->db, "INSERT INTO `".static::$table."`($val_field) VALUES($val_value)");

			if (mysqli_affected_rows($app->db) > 0) {
				$this->id = mysqli_insert_id($app->db);

				if (!empty($fieldImage) && $this->upLoadFile($fieldImage)) {
					return $this->update([$fieldImage], [], $error);
				}

				return $this->id;
			} elseif (!empty(mysqli_error($app->db))) {
				$error = __FILE__ . '(Function `' . __FUNCTION__ . '`): ' . mysqli_error($app->db);
			} else {
				$error = 'Có thể data không thay đổi nên update thất bại';
			}
			

			$result = false;
		}


		return $result;
	}

	public function update($fields, $query = [], &$error)
	{
		$arr_dif = array_diff($fields, static::$fields);
		$fields  = !empty($arr_dif) ? array_diff($fields, $arr_dif) : static::$fields;
		$val     = '';
		$where   = '1';
		$app 	 = App::getInstance();

		foreach ($fields as $field) {
			if ($field != 'id') {
				$val .= !empty($val) ? ',' : '';

				$val .= "`$field`='".$this->$field."'";
			}
		}

		if (in_array('id', $fields)) {
			$where = "`id` = '" . $this->id . "' LIMIT 1";
		} elseif (!empty($query)) {
			$arr_dif_query = array_diff($query, static::$fields);

			if (!empty($arr_dif_query)) {
				$query = array_diff($query, $arr_dif_query);

				foreach ($query as $field) {
					if (property_exists($this, $field)) {
						$where .= " AND `$field` = '" . $this->$field . "'";
					}
				}
			} else {
				return false;
			}
		}

		$q = mysqli_query($app->db, "UPDATE `".static::$table."` SET $val WHERE $where");
		
		if (mysqli_affected_rows($app->db) > 0) {
			return true;
		}

		if (!empty(mysqli_error($app->db))) {
			$error = __FILE__ . '(Function `' . __FUNCTION__ . '`): ' . mysqli_error($app->db);
		} else {
			$error = 'Có thể data không thay đổi nên update thất bại';
		}
		

		return false;
	}

	public static function selectAll($query = []) 
	{
		return self::select($query, true);
	}

	public static function select($query = [], $isMultiple = false)
	{
		$app     = App::getInstance();
		$data    = [];
		$select  = '*';
		$where   = '';
		$orderby = '';
		$limit   = 20;
		$multiImg = isset($query['multiImg']) ? $query['multiImg'] : false;

		if (!empty($query)) {
			if (!empty($query['select'])) {
				$query['select'] = (new self)->checkSpecialFieldSelect($query['select']);
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
					$where .= (!empty($where) ? ' AND ' : '') . static::bindWhere($search, $val);					
				}
			}

			if (empty($where)) $where = '1';

			if (!empty($query['order_by'])) {
				foreach ($query['order_by'] as $k => $v) {
					if (in_array($k, static::$fields) && in_array($v, ['ASC', 'DESC', 'asc', 'desc'])) {
						$orderby .= !empty($orderby) ? ", $k $v" : " $k $v";
					}
				}
			}
		}

		if (!$isMultiple) {
			$limit = 1;
		} elseif (!empty($query['limit']) && $query['limit'] > 0) {
			$limit = $query['limit'];
		}

		if (empty(trim($where))) $where = '1';

		if (!empty($orderby)) {
			$orderby = ' ORDER BY ' . $orderby;
		}

		$q = mysqli_query($app->db, "SELECT $select FROM `".static::$table."` WHERE $where $orderby LIMIT $limit");
		
		if ($q) {
			while($row = mysqli_fetch_assoc($q)) {
				$item = [];
				
				foreach (static::$fields as $field) {
					if (isset($row[$field])) {
						if ($field == 'img_url') {
							if (static::$table == Images::$table) {
								if (!empty($row['module'])) {
									$row[$field] = self::buildImageUrl($row['module'], $row[$field]);
								} 
							} else {
								$row[$field] = self::buildImageUrl(static::$table, $row[$field]);
							}
						}


						$item[$field] = $row[$field];
					}

					if (static::$isBuildSeoName && isset($row['seo_name'])) {
						$item['url'] = '/' . Router::reRewriteRouter(static::$table) . '/'. $row['seo_name'];
					}
				}

				$data[] = $item;
			}


			if ($multiImg && static::$isMultileImage) {
				foreach ($data as $k => $v) {
					$imgs = Images::selectAll([
						'where' => [
							'id_object' => $v['id'],
							'module' => static::$table
						],
						'select' => ['id', 'img_url']
					]);

					$data[$k][static::$fieldImgageMulti] = [];

					foreach ($imgs as $img) {
						$data[$k][static::$fieldImgageMulti][] = [
							'id' => $img['id'],
							'img_url' => self::buildImageUrl(static::$table, $img['img_url']),
						];
					}
				}
			}
		} elseif (!$isMultiple) {
			$data[0] = [];

			foreach (static::$fields as $field) {
				$data[0][$field] = '';
			}
		}

		if (!$isMultiple) {
			if (empty($data) || empty($data[0])) {
				return null;
			}

			return $data[0];
		}

		return $data;
	}

	public function delete()
	{
		$id = $this->id;

		if (!empty($id)) {
			$app   = App::getInstance();

			$q = mysqli_query($app->db, "DELETE FROM `".static::$table."` WHERE `id` = '$id' LIMIT 1");

			if (mysqli_affected_rows($app->db) > 0) {
				return true;
			}
		}

		return false;
	}

	public function checkSpecialFieldSelect($fields = [])
	{
		return array_merge(static::$specialField, $fields);
	}

	protected static function bindWhere($field, $value)
	{
		if (in_array($field, static::$fields)) {
			switch ($field) {
				case 'id_not_in':
					$strIds = implode(',', $value);

					return ' id NOT IN (' .$strIds. ')';

				default:
					return "`$field` = '$value'";
			}
		}
		
		return '';
	}

	protected static function buildImageUrl($module, $name)
	{
		$app = App::getInstance();

		return $app->realpathImage . '/' . $module . '/' . $name;
	}
}