<?php
namespace Mina\Controller;
use Think\Controller;
use Think\Cache\Driver\Redis;
class UsersController extends Controller {
    public $user_id = 0;
    public $user_type = 0;
    public $user = array();

    public function _initialize() {
        //parent::_initialize();
//        if(session('?user'))
//        {
//            header("Location: ".U('Home/User/index'));
//        }else if(session('?company')){
//            header("Location: ".U('Home/Company/index'));
//        }else{
//            $this->login();
//            exit;
//        }
    }

	//用户登陆界面
	public function login(){
//        get_contents();
		$this->display();
	}
//    https://www.zhaopinzd.com/index.php/Mina/Users/mina_login/code/001sFuUT0D5YNV1GgvUT0iGFUT0sFuU6
	//获取code session持久化openid并返回third_session
    public function mina_login() {
        $code = I('code');
        $encryptedData = I('encryptedData');
        $iv = I('iv');


        //var_dump($res);

        if (empty($code) || empty($encryptedData) || empty($iv)) {
            returnApiError('code,encryptedData,iv至少有一个是空的');
        }

        //        //var_dump($js_code);
//        https://api.weixin.qq.com/sns/jscode2session?appid=APPID&secret=SECRET&js_code=JSCODE&grant_type=authorization_code
        $url = 'https://api.weixin.qq.com/sns/jscode2session?appid='.C('MINA_APPID').'&secret='.C('MINA_APPSECRET').'&js_code='.$code.'&grant_type=authorization_code';
        $res = get_contents($url);
        $res = json_decode($res,true);
        if (empty($res['session_key'])) {
            returnApiError('该code不能获得openid',-1);
        }

        $info = $this->get_wx_info($encryptedData,$iv,$res['session_key']);
        if (is_numeric($info['unionid']) || empty($info['unionid'])) {
            returnApiError('该code不能获得unionid');
        }else{
            $third_session = $this->get_third_session();
            $info['oauth'] = 'weixin';
            $this->save_session_in_redis($third_session,$info);
            returnApiSuccess('用户信息获取成功！',$third_session);
        }

//        returnApiError($third_session,1);
    }


    public function is_login()
    {
        $third_session = I('third_session');
        $data = check_third_session($third_session);
        if ($data) {
            returnApiSuccess('用户已登录', $data);
        }else{
            returnApiError('用户未登录',-1);
        }
    }

    function get_third_session()
    {
        $arr = array();
        $key = microtime() + mt_rand(10000,999999);
        $arr[$key] = 1;

        return 'ts'.(string)array_keys($arr)[0];

    }

    public function save_session_in_redis($third_session,$res)
    {
        S($third_session,$res,7200);
    }

    public function get_wx_info($encryptedData,$iv,$session_key)
    {
        Vendor('minaaes.wxBizDataCrypt');
        $pc = new \wxBizDataCrypt(C('MINA_APPID'), $session_key);
        $data = '';
        $errCode = $pc->decryptData($encryptedData,$iv,$data);
        if ($errCode == 0) {
            $tmp = json_decode($data,true);
            $tmp['unionid'] = $tmp['unionId'];//此处两个i,I不一样,数据库内的字段是小写i
            unset($tmp['unionId']);
            return $tmp;
        } else {
            return $errCode;
        }
    }
    public function se1()
    {
        $a = array(
            'id' => 123,
        );
        $k ='ts593817';
        $redis = new Redis();
        $redis->set($k,$a);
        var_dump($redis->get($k));
    }


    public function se2()
    {
        $redis = new Redis();
        $k ='ts593817';
        var_dump($redis->get($k));
    }

//    $res = array(
//    'session_key' =>'Vlu1jMZUd5v1MYYbBRCzTw==',
//    'expires_in' => 7200,
//    'openid' => 'o-FPs0OkI5aM-QQUr7Wpva7Yzmqo',
//    );
}