<?php
/**
 * 微信交互类
 */
namespace Home\Controller;
use Home\Logic\UserLogic;
use Home\Logic\CompanyLogic;

class LoginApiController extends BaseController {
    public $config;
    public $oauth;
    public $identity;
    public $class_obj;

    public function __construct(){
        parent::__construct();
        $this->oauth = I('get.oauth');

        $t_identity = I('get.identity');
        if($t_identity != 'company') {
            $t_identity = 'user';
        }
        $this->identity = $t_identity;
        //获取配置
        $data = M('Plugin')->where("code='{$this->oauth}' and  type = 'login' ")->find();
        $this->config = unserialize($data['config_value']); // 配置反序列化
//        var_dump(unserialize($data['config_value']));die;
        if(!$this->oauth)
            $this->error('非法操作1',U('Users/login'));
        include_once  APP_PATH."/Plugin/login/{$this->oauth}/{$this->oauth}.class.php";
        $class = '\\'.$this->oauth; //

        $login = new $class($this->config,$this->identity); //实例化对应的登陆插件
        $this->class_obj = $login;
    }

    public function login(){
        if(!$this->oauth)
            $this->error('非法操作',U('User/login'));
        include_once  "Plugin/login/{$this->oauth}/{$this->oauth}.class.php";
        $this->class_obj->login();
    }

    public function user_callback(){

        $data = $this->class_obj->respon();
        $logic = new UserLogic();
        $data = $logic->thirdLogin($data);
        if($data['status'] != 1)
            $this->error($data['msg'],U('Users/login'));
        session('user',$data['result']);
        setcookie('user_id',$data['result']['id'],null,'/');
        $nickname = empty($data['result']['nickname']) ? '第三方用户' : $data['result']['nickname'];
        setcookie('uname',urlencode($nickname),null,'/');
        setcookie('cn',0,time()-3600,'/');
//        echo "<script>alert(11);window.close();alert(22)</script>";
//        echo "<script>open.window.location.href='/Home/User/index.html'</script>";
        if(isMobile())
            $this->redirect('Mobile/User/index');
        else
            $this->redirect('User/index');
    }

    public function company_callback(){
        $data = $this->class_obj->respon();
        $logic = new CompanyLogic();

        $data = $logic->thirdLogin($data);
        if($data['status'] != 1)
            $this->error($data['msg'],U('Users/login'));
        session('company',$data['result']);
        setcookie('com_id',$data['result']['id'],null,'/');
        $name = empty($data['result']['name']) ? '企业用户' : $data['result']['name'];
        setcookie('uname',urlencode($name),null,'/');
        setcookie('cn',0,time()-3600,'/');

        if(isMobile())
            $this->redirect('Mobile/Company/index');
        else
            $this->redirect('Company/index');
    }
}