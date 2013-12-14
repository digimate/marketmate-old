<?php
	class SubCategory extends AppModel{
	  var $name = 'SubCategory';

	  public $hasMany = "Product";
	}
?>
