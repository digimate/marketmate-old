<?php
	class Image extends AppModel{
	  var $name = 'Image';

	  public $belongsTo = "Product";
	}
?>
