<?php
class CommentsController extends AppController{

	var $components = array('Session');
	
	function index(){
		$this->layout="ajax";
		$comment = $this->Comment->find('all');
		echo  json_encode($comment);
	}
	/*
	* post comment of user for product
	*/
	function post_comment(){
		$this->layout='ajax';
		$this->loadModel('Token');
		$this->loadModel('Comment');
		$result = array();
		//set language
      	if(isset($_POST['lang'])){
        	$lang = $_POST['lang'];
        	$this->Session->write('Config.language', $lang);
      	}

		if(isset($_POST['token']) && isset($_POST['comment'])){
			$token 		= $_POST['token'];
			$product_id = $_POST['product_id'];
			$comment 	= $_POST['comment'];
			$token = $this->Token->find('all', array("conditions"=>array("token like"=>$token)));
			$data = array("Comment"=>array("user_id"=>$token[0]['Token']['user_id'], "product_id"=>$product_id, "rate"=>$comment));
			if($this->Comment->save($data)){
				$result['error_code'] = 200;
				$result['error_message'] = __('comment_success',true);
			}
			else{
				$result['error_code'] = 400;
				$result['error_message'] = __('comment_failed',true);
			}
		}
		else{
			$result['error_code'] = 428;
			$result['error_message'] = __('error_428',true);
		}
	}
}
?>