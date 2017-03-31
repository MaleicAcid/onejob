<?php



function zhutong_semd_sms($conetnt,$mobile){
    vendor('zhutongsms.sendAPI');
    $url 		= "http://www.ztsms.cn/sendNSms.do";//提交地址
    $username 	= 'system';//用户名
    $password 	= 'System2016';//原密码
    $sendAPI = new \sendAPI($url, $username, $password);
    $data = array(
        'content' 	=> $conetnt,//短信内容
        'mobile' 	=> $mobile,//手机号码
        'productid' => '676767',//产品id
        'xh'		=> ''//小号
    );
    $sendAPI->data = $data;//初始化数据包
    $return = $sendAPI->sendSMS('POST');//GET or POST
    if(!is_numeric($return)) {
        $tmp = explode(',',$return);
        if ($tmp[0] == 1){
            return true;
        }
    }
    return false;
}

//function get_unionid($openid) {
//    $url = $url
//    return get_request()
//}

function get_request($url){
    $ch = curl_init();
    $timeout = 5;
    curl_setopt ($ch, CURLOPT_URL, $url);
    curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    $file_contents = curl_exec($ch);
    curl_close($ch);
    return $file_contents;
}
/**
 * 获取用户信息
 * @param $user_id_or_name  用户id 邮箱 手机 第三方id
 * @param int $type  类型 0 id查找 1 邮箱查找 2 手机查找 3 第三方唯一标识查找 4 第三方unionid查找
 * @param string $oauth  第三方来源
 * @return mixed
 */
function get_user_info($user_id_or_name,$type = 0,$oauth=''){
    $map = array();
    if($type == 0)
        $map['id'] = $user_id_or_name;
    if($type == 1)
        $map['email'] = $user_id_or_name;
    if($type == 2)
        $map['mobile'] = $user_id_or_name;
    if($type == 3){
        $map['openid'] = $user_id_or_name;
        $map['oauth'] = $oauth;
    }
    if($type == 4){
        $map['unionid'] = $user_id_or_name;
        $map['oauth'] = $oauth;
    }
    $user = M('user')->where($map)->find();
    return $user;
}

/**
 * 获取用户信息
 * @param $com_id_or_name  用户id 邮箱 手机 第三方id
 * @param int $type  类型 0 id查找 1 邮箱查找 2 手机查找 3 第三方openid查找  4 第三方unionid查找
 * @param string $oauth  第三方来源
 * @return mixed
 */
function get_company_info($com_id_or_name,$type = 0,$oauth=''){
    $map = array();
    if($type == 0)
        $map['id'] = $com_id_or_name;
    if($type == 1)
        $map['email'] = $com_id_or_name;
    if($type == 2)
        $map['mobile'] = $com_id_or_name;
    if($type == 3){
        $map['openid'] = $com_id_or_name;
        $map['oauth'] = $oauth;
    }
    if($type == 4){
        $map['unionid'] = $com_id_or_name;
        $map['oauth'] = $oauth;
    }
    $com = M('Company')->where($map)->find();
    return $com;
}