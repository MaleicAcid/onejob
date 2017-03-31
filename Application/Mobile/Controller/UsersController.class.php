<?php
namespace Mobile\Controller;
use Think\Controller;
class UsersController extends Controller {
    public $user_id = 0;
    public $user_type = 0;
    public $user = array();

    public function _initialize() {
        //parent::_initialize();
        if(session('?user'))
        {
            header("Location: ".U('User/index'));
        }else if(session('?company')){
            header("Location: ".U('Company/index'));
        }else{
//            $this->login();
//            exit;
        }
    }

	//用户登陆界面
	public function login(){

		$this->display();
	}

    //用户登陆界面
    public function company_login(){
        if (is_weixin()){
            $weixin = 1;
        }else{
            $weixin = 0;
        }
        $this->assign('weixin',$weixin);
//        var_dump($weixin);die;
        $this->display();
    }
    //用户登陆界面
    public function user_login(){
        if (is_weixin()){
            $weixin = 1;
        }else{
            $weixin = 0;
        }
//        var_dump($weixin);die;
        $this->assign('weixin',$weixin);

        $this->display();
    }

}