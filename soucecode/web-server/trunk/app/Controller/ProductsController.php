<?php
class ProductsController extends AppController{

	var $components = array('Session');

	function index(){
		$this->layout = "ajax";
		$products = $this->Product->find('all');
		print_r($products);
	}

	function post_product(){
		$this->layout = "ajax";
      	$this->loadModel('Token');
      	$this->loadModel('Image');
      	$resul = array();

      	//set language
      	if(isset($_POST['lang'])){
        	$lang = $_POST['lang'];
        	$this->Session->write('Config.language', $lang);
      	}

		if(isset($_POST['token'])){
			$token 				= $_POST['token'];
			$category_id 		= $_POST['category_id'];
			$order_id 			= $_POST['order_id'];
			$product_type_id 	= $_POST['product_type_id'];
			$name 				= $_POST['name'];
			$create_date 		= $_POST['create_date'];
			$location 			= $_POST['location'];
			$price 				= $_POST['price'];
			$promotion 			= $_POST['promotion'];
			$warranty 			= $_POST['warranty'];
			$description 		= $_POST['description'];
			$images				= $_POST['images'];

			$token = $this->Token->find('all',array('conditions'=>array('token like'=>$token)));
			$data = array("User"=>array(
                                    "category_id"     	=> $category_id,
                                    "user_id"     		=> $token[0]['Token']['user_id'],
                                    "order_id" 			=> $order_id,
                                    "product_type_id"	=> $product_type_id,
                                    "name"     			=> $name,
                                    "create_date" 		=> $create_date,
                                    "location"  		=> $location,
                                    "price"        		=> $price,
                                    "promotion"       	=> $promotion,
                                    "warranty"       	=> $warranty,
                                    "description"       => $description
                                    )
                      );
			if($product = $this->Product->save($data)){
				$product_id = $product['Product']['id'];
				foreach($images as $img){
					//upload image
			        $img = str_replace('data:image/jpeg;base64,', '', $img);
			        $img = str_replace(' ', '+', $img);
			        $data1 = base64_decode($img);
			        $file = 'img/avatar/' . uniqid() . '.jpg';
			        $success = file_put_contents($file, $data1);
			        $url_img = SERVER_WEBROOT_DIR.$file;	
			        $data = array("Image"=>array("product_id"=>$product_id, "url"=>$url_img));
				}
				$result['error_code'] = 200;
				$result['error_message'] = __('post_product_success',true);
			}
		}
		else{
			$result['error_code'] = 400;
          	$result['error_message'] = __('error_400',true);
		}
		echo json_encode($result);
	}
	/*
	* get list category, order, product type for function post new product
	*/
	function get_item(){
		$this->layout = 'ajax';
		$this->loadModel('Category');
		$this->loadModel('Order');
		$this->loadModel('ProductType');
		$result = array();

		//set language
      	if(isset($_POST['lang'])){
        	$lang = $_POST['lang'];
        	$this->Session->write('Config.language', $lang);
      	}

		$category = $this->Category->find('all');
		$order = $this->Order->find('all');
		$product_type = $this->ProductType->find('all');

		$result['error_code'] = 200;
		$result['error_message'] = __('error_200',true);
		$result['category'] = $category;
		$result['order'] = $order;
		$result['product_type'] = $product_type;
		echo json_encode($result);
	}
	/*
	* get product information
	*/
	function get_information(){
		$this->layout="ajax";
		$result = array();
		//set language
      	if(isset($_POST['lang'])){
        	$lang = $_POST['lang'];
        	$this->Session->write('Config.language', $lang);
      	}

		if(isset($_POST['product_id'])){
			$product = $this->Product->find('all', array("conditions"=>array("Product.id ="=>$_POST['product_id'])));
			$result['error_code'] = 200;
			$result['error_message'] = __('error_200',true);
			$result['product'] 	= $product[0]['Product'];
			$result['user']		= $product[0]['User'];
			$result['image']	= $product[0]['Image'];
			$result['video']	= $product[0]['Video'];
			$result['comment']	= $product[0]['Comment'];
			$result['rate']		= $product[0]['Rate'];
			$result['provice']	= $product[0]['Province'];
			$result['ward']		= $product[0]['Ward'];
			//$this->set('data',$result);
		}
		else{
			$result['error_code'] = 400;
			$result['error_message'] = __('error_400',true);
		}
		//print_r($result);
		echo json_encode($result);
	}
	//get top product
	function get_top_product(){
		//$sql = 
	}
}
?>