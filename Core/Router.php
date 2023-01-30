<?php

namespace BDS;

class Router 
{
	public $route = '';
	public $get   = array();
	public $post  = array();
	public $module      = '';
	public $controller  = '';
	public $action  	= '';

	public function __construct() {
		if (!empty($_SERVER['PATH_INFO'])) {
			$this->route = $_SERVER['PATH_INFO'];
		} else {
			$this->route = $_SERVER['REQUEST_URI'];
		}
	}
}