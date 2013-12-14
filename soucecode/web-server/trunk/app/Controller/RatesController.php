<?php
class RatesController extends AppController{
	var $components = array('Session');
	function index(){
		$this->layout="ajax";
		$rate = $this->Rate->find('all');
		echo  json_encode($rate);
	}

	/*
	* post rate of user for product
	*/
	function post_rate(){
		$this->layout='ajax';
		$this->loadModel('Token');
		$this->loadModel('Rate');
		$result = array();

		//set language
	    if(isset($_POST['lang'])){
	        $lang = $_POST['lang'];
	        $this->Session->write('Config.language', $lang);
	    }

		if(isset($_POST['token']) && isset($_POST['rate'])){
			$token 		= $_POST['token'];
			$product_id = $_POST['product_id'];
			$rate 		= $_POST['rate'];
			$token = $this->Rate->find('all', array("conditions"=>array("token like"=>$token)));
			$data = array("Rate"=>array("user_id"=>$token[0]['Token']['user_id'], "product_id"=>$product_id, "rate"=>$rate));
			if($this->Rate->save($data)){
				$result['error_code'] = 200;
				$result['error_message'] = __('rate_success',true);
			}
			else{
				$result['error_code'] = 400;
				$result['error_message'] = __('rate_failed',true);
			}
		}
		else{
			$result['error_code'] = 428;
			$result['error_message'] = __('error_428');
		}
	}
}
?>