<?php 
namespace BDS\Model;

use BDS\Model\Province;
use BDS\Model\District;
use BDS\Model\Ward;

class RealEstate extends BaseModel
{
	public static $table = 'real-estate';
	public static $fields = [
		'id', 
		'name', 
		'seo_name', 
		'short_desc', 
		'desc', 
		'province_id', 
		'district_id', 
		'ward_id', 
		'address_no', //Số nhà, tên đường
		'address', // ghép lại từ city, district, ward
		'price', 
		'area', 
		'unit', 
		'unit_area',
		'legally', 
		'num_bedroom', 
		'num_toilet', 
		'num_floor', 
		'img_url', 
		'sort', 
		'type',
		'feature',
		'contact_id',
		'date_create',
	];

	const FEATURE_NEW = 1;
	const FEATURE_HOT = 2;
	const FEATURE_SPECIAL = 3;

	const TYPE_SELL = 1;
	const TYPE_RENT = 2;
	const TYPE_PURCHASE = 3;

	public function buildAddressRealEstate()
	{
		$province = Province::getNameById($this->province_id);
		$district = District::getNameById($this->district_id);
		$ward     = Ward::getNameById($this->ward_id);

		return $this->address_no . ', ' . " $ward, $district, $province";
	}

	public static function getListType()
	{
		return [
			self::TYPE_SELL => [
				'name' => 'Bán',
				'value' => self::TYPE_SELL
			],
			self::TYPE_RENT => [
				'name' => 'Thuê',
				'value' => self::TYPE_RENT
			],
			self::TYPE_PURCHASE => [
				'name' => 'Mua',
				'value' => self::TYPE_PURCHASE
			],
		];
	}

	public static function getListFeature()
	{
		return [
			self::FEATURE_NEW => [
				'name' => 'Tin mới',
				'value' => self::FEATURE_NEW
			],
			self::FEATURE_HOT => [
				'name' => 'Tin hot',
				'value' => self::FEATURE_HOT
			],
			self::FEATURE_SPECIAL => [
				'name' => 'Tin đặc biệt',
				'value' => self::FEATURE_SPECIAL
			],
		];
	}

	public function getType()
	{
		$list = static::getListType();

		if (!empty($list[$this->type])) {
			return $list[$this->type];
		}

		return $list[self::TYPE_SELL];
	}

	public function getFeature()
	{
		$list = static::getListFeature();

		if (!empty($list[$this->feature])) {
			return $list[$this->feature];
		}

		return ['name' => 'N/A', 'value' => 0];
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
}