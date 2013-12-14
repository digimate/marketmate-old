<?php
	class ProductType extends AppModel{
	  var $name = 'ProductType';

	  public $hasMany = "Product";
	}
?>
