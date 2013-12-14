<?php
class UserNotesController extends AppController{

	var $components = array('Session');
	
	function index(){
		$this->layout='ajax';
		$note = $this->UserNote->find('all');
		echo json_encode($note);
	}
	/*
	* post user's note
	*/
	function post_note(){
		$this->layout='ajax';
		$this->loadModel('Token');
		$result = array();

		//set language
	    $lang = $_POST['lang'];
	    $this->Session->write('Config.language', $lang);
		if(isset($_POST['token'])){
			$token = $_POST['token'];
			$category_id = $_POST['category_id'];
			$token = $this->Token->find('all',array('conditions'=>array('Token.token like'=>$token)));
			$data = array('UserNote'=>array('user_id'=>$token[0]['Token']['user_id'], 'category_id'=>$category_id));
			if($this->UserNote->save($data)){
				$result['error_code'] = 200;
				$result['error_message'] = __('has_been_save_note',true);
			}
			else{
				$result['error_code'] = 400;
				$result['error_message'] = __('has_not_been_save_note',true);
			}
		}
		else{
			$result['error_code'] = 428;
			$result['error_message'] = __('error_428',true);
		}
		echo json_encode($result);
	}
}
?>