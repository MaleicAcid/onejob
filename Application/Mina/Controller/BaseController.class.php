<?php
namespace Mina\Controller;
use Think\Controller;
use Home\Logic\UserLogic;
class BaseController extends Controller {
    public $user_id = 0;
    public $user_type = 0;
    public $user = array();
	public function __construct(){
		parent::__construct();
        $third_session = I('third_session');
        $data = check_third_session($third_session);
        if($data)
        {
            $where = array(
                'unionid' => $data['unionid'],
                'oauth' =>  'weixin',
            );
            $user = M('User')->where($where)->find();
            if (empty($user)) {
                $logic = new UserLogic();
                $data = $logic->thirdLogin($data);
                if($data['status'] != 1) {
                    returnApiError($data['msg']);
                }
                $this->user = $data['result'];
                $this->user_id = $data['result']['id'];
                $this->user_type = $data['result']['type'];
//                session('user',$data['result']);
//                setcookie('user_id',$data['result']['id'],null,'/');
//                $nickname = empty($data['result']['nickname']) ? '第三方用户' : $data['result']['nickname'];
//                setcookie('uname',urlencode($nickname),null,'/');
//                setcookie('cn',0,time()-3600,'/');
            }else{
                $this->user = $user;
                $this->user_id = $user['id'];
                $this->user_type = $user['type'];
            }
        }

		cookie('state',1);
	}
}