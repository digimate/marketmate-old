<?php
class OrdersController extends AppController{
	function index(){
		$this->layout = "ajax";
		$order = $this->Order->find('all');
		echo json_encode($order[0]['Order']);
	}
}
?>