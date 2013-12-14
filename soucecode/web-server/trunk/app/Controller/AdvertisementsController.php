<?php
class AdvertisementsController extends AppController{  
	var $components = array('Session');

	function get_all_advertisement(){
		$this->layout='ajax';
		//set language
      	if(isset($_POST['lang'])){
        	$lang = $_POST['lang'];
        	$this->Session->write('Config.language', $lang);
      	}
		$ad = $this->Advertisement->find('all', array('order'=>array('Advertisement.id DESC')));
		$result = array();
		if(count($ad)>0){
			$result['error_code'] = 200;
			$result['error'] = __('error_200',true);
			$result['advertisement'] = $ad;
		}
		else{
			$result['error_code'] = 500;
			$result['error'] = __('no_advertisement',true);
		}
		echo json_encode($result);
	}
}
?>