<?php
class UsersController extends AppController {
  
  var $components = array("Common","Session");
    
  function index(){
  	$users = $this->User->find('all');
  	$this->set('users_view', $users);
  }

    function test(){
      $this->layout = "ajax";
      $result = array();
      $users = $this->User->find('all');
      $result['users'] = $users;
      echo json_encode($users);
      //echo 'dfdfdfdfdf';
    }
    /*
    * check user login
    * @param: user_name, pass_word
    * @return: 
    *         status: yes --> success, no --> fails
    *         user information 
    */
    function login(){
      $this->layout = "ajax";
      $this->loadModel('Token');
      //set language
      if(isset($_POST['lang'])){
        $lang = $_POST['lang'];
        //$lang = 'vie';
        $this->Session->write('Config.language', $lang);
      }

      if(isset($_POST['user_name']) && isset($_POST['pass_word'])){
        $user = $this->User->find('all', array("conditions"=>array("user_name like"=>$_POST['user_name'], "pass_word like"=>md5($_POST['pass_word']))));
        $result = array();
        if(count($user)>0){
          $result['user'] = $user[0]['User'];
          $token = $this->Common->rand_string(30);
          $data = array("Token"=>array("user_id"=>$user[0]['User']['id'], "token"=>$token));
          $this->Token->save($data);
          $result['token'] = $token;
          $result['error_code'] = 200;
          $result['error_message'] = __('login_susccess',true);
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
      $j = json_encode($result);
      //$str = utf8_encode(json_encode($result));
      echo $j;
      //print_r(json_decode($j));
    }

    /*
    * user logout
    * @param: request token form client
    * Delete token
    */
    function logout(){
      $this->layout = "ajax";
      $this->loadModel('Token');
      //set language
      if(isset($_POST['lang'])){
        $lang = $_POST['lang'];
        $this->Session->write('Config.language', $lang);
      }

      if(isset($_POST['token'])){
        $this->Token->deleteAll(array("Token.token"=>$_POST['token']));
        $result = array();
        $result['error_code'] = 200;
        $result['error_message'] = __('logout_success',true);
        echo json_encode($result);
      }
    }

    /*
    * user register
    * @param: user information
    * 
    */
    function register(){
      $this->layout = "ajax";
      $this->loadModel('Token');

      //set language
      if(isset($_POST['lang'])){
        $lang = $_POST['lang'];
        $this->Session->write('Config.language', $lang);
      }
      

      if(isset($_POST['user_name'])){
        $user_name      = $_POST['user_name'];
        $pass_word      = $_POST['pass_word'];
        $email_address  = $_POST['email_address'];
        $first_name     = $_POST['first_name'];
        $last_name      = $_POST['last_name'];
        $date_of_birth  = $_POST['date_of_birth'];
        $number_phone   = $_POST['number_phone'];
        $address        = $_POST['address'];
        $img            = $_POST['avatar'];
        $avatar = "";
        //upload image
        if($img){
          $img = str_replace('data:image/jpeg;base64,', '', $img);
          $img = str_replace(' ', '+', $img);
          $data1 = base64_decode($img);
          $file = 'img/avatar/' . uniqid() . '.jpg';
          $success = file_put_contents($file, $data1);

          $avatar = SERVER_WEBROOT_DIR.$file;
        }
        $data = array("User"=>array(
                                    "social_id"     => 1,
                                    "user_name"     => $user_name,
                                    "pass_word"     => $pass_word,
                                    "email_address" => $email_address,
                                    "first_name"    => $first_name,
                                    "last_name"     => $last_name,
                                    "date_of_birth" => $date_of_birth,
                                    "number_phone"  => $number_phone,
                                    "avatar"        => $avatar,
                                    "address"       => $address
                                    )
                      );
        $result = array();
        if($user = $this->User->save($data)){
          $result['error_code'] = 200;
          $result['error_message'] = __('register_success',true);
          $token = $this->Common->rand_string(30);
          $data = array("Token"=>array("user_id"=>$user['User']['id'], "token"=>$token));
          $this->Token->save($data);
          $result['token'] = $token;
        }
        else{
          $result['error_code'] = 400;
          $result['error_message'] = __('error_400',true);
        }
        echo json_encode($result);

      }
    }
    /*
    * forgot password
    */
    function forgot_password(){
      $this->layout='ajax';
      $result = array();

      //set language
      if(isset($_POST['lang'])){
        $lang = $_POST['lang'];
        $this->Session->write('Config.language', $lang);
      }
      if(isset($_POST['email'])){
        $email = $_POST['email'];
        //$email = "linh.le@digimate.me";
        $new_pass = $this->Common->rand_string(10);
        $user = $this->User->find('all', array('fields'=>array('User.first_name','User.last_name'), 'conditions'=>array('User.email_address like'=>$email)));
        //echo json_encode($user);
        if(count($user[0]['User'])>0){
          //update new pass
          $this->User->updateAll(array('User.pass_word'=>"'".md5($new_pass)."'"), array('User.id ='=>$user[0]['User']['id']));
          //send mail to user
          $header   = "Form marketMate";
          $subject  = "Reset password";
          $message  = "Hi ".$user[0]['User']['first_name'].' '.$user[0]['User']['last_name']."\n";
          $message .= "Your password has been reset in marketMate.\n";
          $message .= "This is your new password: ".$new_pass;
          /*echo mail($email, $subject, $message, $header);*/
          if(mail($email, $subject, $message, $header)){
            $result['error_code'] = 200;
            $result['error_message'] = __('pass_has_been_reset',true);
          }
        }
        else{
          $result['error_code'] = 400;
          $result['error_message'] = __('email_not_exist',true);
        }
      }
      else{
        $result['error_code'] = 428;
        $result['error_message'] = __('error_428',true);
      }
      echo json_encode($result);
    }

    function form_register(){

    }
}
?>
