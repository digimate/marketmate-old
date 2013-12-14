<?php
	class Product extends AppModel{
	  var $name = 'Product';

	  public $belongsTo = array("User","Province","Ward");
	  public $hasMany = array("Video","Image","Comment","Rate");
	}
?>
