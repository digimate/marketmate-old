<?php
	class Comment extends AppModel{
	  var $name = 'Comment';

	  public $belongsTo = array("Product","User");
	}
?>
