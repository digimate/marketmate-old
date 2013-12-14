<?php
class WardsController extends AppController{
	function get_list_ward_for_province(){
		$this->layout="ajax";
		$result = array();
		//set language
      	if(isset($_POST['lang'])){
        	$lang = $_POST['lang'];
        	$this->Session->write('Config.language', $lang);
      	}

      	if(isset($_POST['province_id'])){
      		$pro_id = $_POST['province_id'];
      		//$pro_id = 1;
      		$wards = $this->Ward->find('all', array('conditions'=>array('province_id like'=>$pro_id)));
      		if(count($wards)>0){
      			$result['wards'] = $wards;
	      		$result['error_code'] = 200;
	      		$result['error_message'] = __('error_200',true);
      		}
      		else{
      			$result['error_code'] = 400;
	      		$result['error_message'] = __('error_400',true);
      		}
      	}
      	else{
  			$result['error_code'] = 428;
      		$result['error_message'] = __('error_428',true);
  		}
  		//print_r($result);
  		echo json_encode($result);
	}
}
?>