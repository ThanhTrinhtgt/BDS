<?php 
namespace BDS\Core;

class App
{
	public $db = null;
	public $pathImage 	  = 'View/dist/image';
	public $realpathImage = '/View/dist/image';
	public $domain = '';

	public function initDB()
	{
		$this->db = mysqli_connect(SERVER_NAME, SQL_USERNAME, SQL_PASSWORD, SQL_DATABASE);

		// Check connection
		if (!$this->db) {
		  die("Connection failed: " . mysqli_connect_error());exit;
		}
	}

	public static function getInstance()
	{
			static $instance = null;

			if (null === $instance) {
				$instance = new static();
			}

		return $instance;
	}
}