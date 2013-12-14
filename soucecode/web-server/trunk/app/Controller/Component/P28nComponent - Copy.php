<?php
class P28nComponent extends Object {
	var $components = array('Session', 'Cookie');
	//called before Controller::beforeFilter()
    function initialize(&$controller, $settings = array()) {
        // saving the controller reference for later use
        $this->controller =& $controller;
    }

    //called after Controller::beforeFilter()
    /*function startup(&$controller) {
               }*/

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
	function startup() {
		if (!$this->Session->check('Config.language')) {
			$this->change(($this->Cookie->read('lang') ? $this->Cookie->read('lang') : DEFAULT_LANGUAGE));
		}
	}
	function change($lang = null) {
		if (!empty($lang)) {
			$this->Session->write('Config.language', $lang);
			$this->Cookie->write('lang', $lang, null, '+350 day');
		}
	}
}
?>