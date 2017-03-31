<?php
namespace Home\Controller;
use Think\Controller;
class UsersController extends Controller {
    public $user_id = 0;
    public $user_type = 0;
    public $user = array();

    public function _initialize() {
        //parent::_initialize();
        if(session('?user'))
        {
            header("Location: ".U('Home/User/index'));
        }else if(session('?company')){
            header("Location: ".U('Home/Company/index'));
        }else{
            $this->login();
            exit;
        }
    }

	//用户登陆界面
	public function login(){
		$this->display();
	}


}