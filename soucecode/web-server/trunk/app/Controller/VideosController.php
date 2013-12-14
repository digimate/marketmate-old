<?php
class VideosController extends AppController{

	var $components = array('Session');

	function index(){
		$this->layout='ajax';
		$video = $this->Video->find('all');
		$result = array();
		//$this->P28n->change('vie');
		$this->Session->write('Config.language', 'vie');
		echo json_encode($video);
		echo "\n";
		$result['error_message'] = __('error_200');
		echo json_encode($result);
		$abc = json_decode(json_encode($result));
		print_r($abc);
	}
}
?>