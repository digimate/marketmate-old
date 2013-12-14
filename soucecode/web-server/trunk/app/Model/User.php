<?php
	class User extends AppModel 
	{
	  var $name = 'User';

	  public $hasMany = array(
                  'Product' => array(
                      'className'   => 'Product',
                      'foreignKey'  => 'user_id',
                      'conditions'  => array(),
                      'order'       => 'Product.create_date DESC',
                      'dependent'   => true
                    )
                );
	}
?>
