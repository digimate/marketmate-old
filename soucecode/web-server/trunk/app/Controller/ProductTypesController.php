<?php
class ProductTypesController extends AppController{
	function index(){
		$this->layout="ajax";
		//$product_type = $this->ProductType->find('all');
		$product_type = $this->ProductType->find('all');
		echo json_encode($product_type);
	}
}
?>