<?php
	class Rate extends AppModel{
	  var $name = 'Rate';

	  public $belongsTo = array("Product","User");
	}
?>
