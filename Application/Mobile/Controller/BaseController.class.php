<?php
namespace Mobile\Controller;
use Think\Controller;
class BaseController extends Controller {
    public $user_id = 0;
    public $user_type = 0;
    public $user = array();

    public function _initialize() {
        //parent::_initialize();
        if(session('?user'))
        {
            $user = session('user');
            //var_dump($user);die;
            $user = M('user')->where("id = {$user['id']}")->find();
            session('user',$user);  //覆盖session 中的 user
            $this->user = $user;
            $this->user_id = $user['id'];
            $this->user_type = $user['type'];
            $this->assign('user',$user); //存储用户信息
            $this->assign('user_id',$this->user_id);
        }
    }
}