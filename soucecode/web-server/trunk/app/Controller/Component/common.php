<?php
class CommonComponent extends Object{
	//called before Controller::beforeFilter()
    function initialize(&$controller, $settings = array()) {
        // saving the controller reference for later use
        $this->controller =& $controller;
    }

    //called after Controller::beforeFilter()
    function startup(&$controller) {
               }

    //called after Controller::beforeRender()
    function beforeRender(&$controller) {
    }

    //called after Controller::render()
    function shutdown(&$controller) {
    }

    //called before Controller::redirect()
    function beforeRedirect(&$controller, $url, $status=null, $exit=true) {
    }

    function redirectSomewhere($value) {
        // utilizing a controller method
    } 
    /*
    * create Random String 
    */
    function rand_string( $length ) {
		$chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		$size = strlen( $chars );
		for( $i = 0; $i < $length; $i++ ) {
			$str .= $chars[ rand( 0, $size - 1 ) ];
		}
		return $str;
	}
    /*
    * 
    */
}
?>