<?php
class ProvincesController extends AppController{
	function get_list_province(){
		$this->layout="ajax";
		$result = array();
		//set language
      	if(isset($_POST['lang'])){
        	$lang = $_POST['lang'];
        	$this->Session->write('Config.language', $lang);
      	}

      	$provinces = $this->Province->find('all');
      	if(count($provinces)>0){
      		$result['provinces'] = $provinces;
      		$result['error_code'] = 200;
      		$result['error_message'] = __('error_200');
      	}
      	else{
      		$result['error_code'] = 400;
      		$result['error_message'] = __('error_400');
      	}
      	//print_r($result);
      	echo json_encode($result);
	}
}
?>