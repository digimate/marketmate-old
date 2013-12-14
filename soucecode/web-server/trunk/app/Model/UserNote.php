<?php
	class UserNote extends AppModel{
	  var $name = 'UserNote';

	  public $belongsTo = "User";
	}
?>
