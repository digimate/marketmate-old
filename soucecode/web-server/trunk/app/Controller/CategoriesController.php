<?php
class CategoriesController extends AppController{
	function index(){
		$this->layout = "ajax";
		$categories = $this->Category->find('all');
		print_r($categories[0]['Category']);
	}
  //get all category
  function get_all_category(){
    $this->layout = 'ajax';
    $this->loadModel('Product');
    $result = array();

    //set language
    if(isset($_POST['lang'])){
      $lang = $_POST['lang'];
      $this->Session->write('Config.language', $lang);
    }

    $c = $this->Category->find('all');
    $result['category'] = $c;
    $result['error_code'] = 200;
    $result['error_mesagge'] = __('error_200',true);
    echo json_encode($result);
  }
	//get all products for category
	function get_all_products(){
		$this->layout = 'ajax';
		$this->loadModel('Product');
		$result = array();

		//set language
  	if(isset($_POST['lang'])){
    	$lang = $_POST['lang'];
    	$this->Session->write('Config.language', $lang);
  	}

  	if(isset($_POST['category_id'])){
  		$products = $this->Product->find('all', array('conditions'=>array('category_id like'=>$_POST['category_id'])));
  		$result['products'] = $products[0]['Product'];
  		$result['error_code'] = 200;
  		$result['error_message'] = __('error_200',true);
  	}
  	else{
  		$result['error_code'] = 428;
  		$result['error_message'] = __('error_428',true);
  	}
  	echo json_encode($result);
	}
}
?>