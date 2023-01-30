<?php

namespace BDS;

class Router 
{
	public $route 		= '';
	public $arr_route   = array();
	public $get   		= array();
	public $post  		= array();
	public $module      = 'User'; #User || Admin
	public $controller  = '';
	public $action  	= '';

	public function __construct() {
		if (!empty($_SERVER['PATH_INFO'])) {
			$this->route = trim($_SERVER['PATH_INFO']);
		} else {
			$this->route = trim($_SERVER['REQUEST_URI']);
		}

		if ($this->route == '/' || $this->route == '/index.php') {
			$this->route = '';
		} else {
			$this->route = trim($this->route, '/');

			$this->arr_route = explode('/', $this->route);

			//vd($this->arr_route);
		}
	}
}