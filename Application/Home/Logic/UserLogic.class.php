<?php
/**
 * 用户逻辑
 */

namespace Home\Logic;

use Think\Model\RelationModel;
use Think\Page;
use Think\Upload;

/**
 * 分类逻辑定义
 * Class CatsLogic
 * @package Home\Logic
 */
class UserLogic extends RelationModel
{
    /*
     * 登陆
     */
    public function login($username,$password){
    	$result = array();
        if(!$username || !$password)
           $result= array('status'=>0,'msg'=>'请填写账号或密码');
        $user = M('user')->where("mobile='{$username}' OR email='{$username}'")->find();
        if(!$user){
           $result = array('status'=>-1,'msg'=>'账号不存在!');
        }elseif(encrypt($password) != $user['password']){
           $result = array('status'=>-2,'msg'=>'密码错误!');
        }elseif($user['is_lock'] == 1){
           $result = array('status'=>-3,'msg'=>'账号异常已被锁定！！！');
        }else{
            //查询用户信息之后, 查询用户的登记昵称
            $levelId = $user['level'];
            $levelName = M("user_level")->where("level_id = {$levelId}")->getField("level_name"); 
            $user['level_name'] = $levelName;
          
           $result = array('status'=>1,'msg'=>'登陆成功','result'=>$user);
        }
        return $result;
    }

    /*
     * app端登陆
     */
    public function app_login($username,$password){
       
    	$result = array();
        if(!$username || !$password)
           $result= array('status'=>0,'msg'=>'请填写账号或密码');
        $user = M('user')->where("mobile='{$username}' OR email='{$username}'")->find();
        if(!$user){
           $result = array('status'=>-1,'msg'=>'账号不存在!');
        }elseif($password != $user['password']){
           $result = array('status'=>-2,'msg'=>'密码错误!');
        }elseif($user['is_lock'] == 1){
           $result = array('status'=>-3,'msg'=>'账号异常已被锁定！！！');
        }else{
            //查询用户信息之后, 查询用户的登记昵称
            $levelId = $user['level'];
            $levelName = M("user_level")->where("level_id = {$levelId}")->getField("level_name"); 
            $user['level_name'] = $levelName;            
            $user['token'] = md5(time().mt_rand(1,999999999));
            M('user')->where("user_id = {$user['user_id']}")->save(array('token'=>$user['token'],'last_login'=>time()));
            $result = array('status'=>1,'msg'=>'登陆成功','result'=>$user);
        }
        return $result;
    }    
    
    /*
     * 第三方登录
     */
    public function thirdLogin($data=array()){
//        array(
//            "openid"=>"oNVBYwYsRzYOVzKvey6KuWcGrD50",
//            "unionid" => "on93psu59lHrPVcB9jb1WGGdsDXE" ,
//            "oauth" => "weixin",
//            "nickname" =>  "微信用户"
//        );
        $unionid = isset($data['unionid']) ? $data['unionid'] : ''; //第三方返回唯一标识
        $openid = $data['openid']; //第三方返回唯一标识
        $oauth = $data['oauth']; //来源
        if((!$oauth && !$openid) || !$oauth)
            return array('status'=>-1,'msg'=>'参数有误','result'=>'');
        //获取用户信息
        if(!empty($unionid)){
            $user = get_user_info($unionid,4,$oauth);
        }else{
            $user = get_user_info($openid,3,$oauth);
        }
        if(!$user){
            //账户不存在 注册一个
            $map['password'] = '';
            $map['unionid'] = isset($unionid) ? $unionid : '';
            $map['openid'] = isset($openid) ? $openid : '';
            $map['realname'] = isset($data['nickName']) ? $data['nickName'] : '';
            $map['nickname'] = isset($data['nickName']) ? $data['nickName'] : '第三方用户';
            $map['create_time'] = time();
            $map['oauth'] = $oauth;
            $map['head_pic'] = isset($data['avatarUrl']) ? $data['avatarUrl'] : C('USER_DEFAULT_HEAD_PIC');
            //$map['sex'] = $data['sex'];
            $map['token'] = md5(time().mt_rand(1,99999));
            $map['first_leader'] = cookie('first_leader'); // 推荐人id
            if($_GET['first_leader'])
                $map['first_leader'] = $_GET['first_leader']; // 微信授权登录返回时 get 带着参数的


            
            $row = M('user')->add($map);
            if (!empty($unionid)){
                $user = get_user_info($unionid,4,$oauth);
            }else{
                $user = get_user_info($openid,3,$oauth);
            }
        }else if($user['state'] == -1){
            return array('status'=>-1,'msg'=>'账户状态异常','result'=>'');
        }else{
            $user['token'] = md5(time().mt_rand(1,999999999));
            M('user')->where("id = '{$user['id']}'")->save(array('token'=>$user['token'],'login_time'=>time()));
        }
        return array('status'=>1,'msg'=>'登陆成功','result'=>$user);
    }

    /**
     * 注册
     * @param $username  邮箱或手机
     * @param $password  密码
     * @param $password2 确认密码
     * @return array
     */
    public function reg($username,$password,$password2){
    	$is_validated = 0 ;
        if(check_email($username)){
            $is_validated = 1;
            $map['email_validated'] = 1;
            $map['nickname'] = $map['email'] = $username; //邮箱注册
        }

        if(check_mobile($username)){
            $is_validated = 1;
            $map['mobile_validated'] = 1;
            $map['nickname'] = $map['mobile'] = $username; //手机注册
        }

        if($is_validated != 1)
            return array('status'=>-1,'msg'=>'请用手机号或邮箱注册');

        if(!$username || !$password)
            return array('status'=>-1,'msg'=>'请输入用户名或密码');

        //验证两次密码是否匹配
        if($password2 != $password)
            return array('status'=>-1,'msg'=>'两次输入密码不一致');
        //验证是否存在用户名
        if(get_user_info($username,1)||get_user_info($username,2))
            return array('status'=>-1,'msg'=>'账号已存在');

        $map['password'] = encrypt($password);
        $map['reg_time'] = time();
        $map['first_leader'] = cookie('first_leader'); // 推荐人id
        // 如果找到他老爸还要找他爷爷他祖父等
        if($map['first_leader'])
        {
            $first_leader = M('user')->where("user_id = {$map['first_leader']}")->find();
            $map['second_leader'] = $first_leader['first_leader'];
            $map['third_leader'] = $first_leader['second_leader'];
        }else
		{
			$map['first_leader'] = 0;
		}              
        
        // 成为分销商条件  
        $distribut_condition = tpCache('distribut.condition'); 
        if($distribut_condition == 0)  // 直接成为分销商, 每个人都可以做分销        
            $map['is_distribut']  = 1;        
        
        $map['token'] = md5(time().mt_rand(1,99999));
        $user_id = M('user')->add($map);
        if(!$user_id)        
            return array('status'=>-1,'msg'=>'注册失败');      
        $pay_points = tpCache('basic.reg_integral'); // 会员注册赠送积分
        if($pay_points > 0)
            accountLog($user_id, 0,$pay_points, '会员注册赠送积分'); // 记录日志流水
        // 会员注册送优惠券
        $coupon = M('coupon')->where("send_end_time > ".time()." and ((createnum - send_num) > 0 or createnum = 0) and type = 2")->select();
        if(!empty($coupon)){
        	foreach ($coupon as $key => $val)
        	{
        		M('coupon_list')->add(array('cid'=>$val['id'],'type'=>$val['type'],'uid'=>$user_id,'send_time'=>time()));
        		M('Coupon')->where("id = {$val['id']}")->setInc('send_num'); // 优惠券领取数量加一
        	}
        }
        $user = M('user')->where("user_id = {$user_id}")->find();
        return array('status'=>1,'msg'=>'注册成功','result'=>$user);
    }

     /*
      * 获取当前登录用户信息
      */
     public function get_info($user_id){
         if(!$user_id > 0)
             return array('status'=>-1,'msg'=>'缺少参数','result'=>'');
        $user_info = M('user')->where("user_id = {$user_id}")->find();
        if(!$user_info)
            return false;
         
         $user_info['coupon_count'] = M('coupon_list')->where("uid = $user_id and use_time = 0")->count(); //获取优惠券列表         
         $user_info['collect_count'] = M('job_collect')->where(array('user_id'=>$user_id))->count(); //获取收藏数量         
                                    
         $user_info['waitPay']     = M('order')->where("user_id = $user_id ".C('WAITPAY'))->count(); //待付款数量
         $user_info['waitSend']    = M('order')->where("user_id = $user_id ".C('WAITSEND'))->count(); //待发货数量         
         $user_info['waitReceive'] = M('order')->where("user_id = $user_id ".C('WAITRECEIVE'))->count(); //待收货数量                  
         $user_info['order_count'] = $user_info['waitPay'] + $user_info['waitSend'] + $user_info['waitReceive'];
         return array('status'=>1,'msg'=>'获取成功','result'=>$user_info);
     }


    /*
     * 获取订单商品
     */
    public function get_order_job($order_id){
        $sql = "SELECT og.*,g.original_img FROM __PREFIX__order_job og LEFT JOIN __PREFIX__job g ON g.job_id = og.job_id WHERE order_id = ".$order_id;
        $job_list = $this->query($sql);

        $return['status'] = 1;
        $return['msg'] = '';
        $return['result'] = $job_list;
        return $return;
    }

    public function collect_job($jid,$uid)
    {



        $where = array(
            'user_id' => $uid,
            'job_id' => $jid,
        );
        $z= M('user_collect_job')->where($where)->find();
        if ($z) {
            $map = array(
                'collect_id' => $z['collect_id'],
            );
            M('user_collect_job')->where($map)->delete();
            $return['status'] = -3;
            $return['msg'] = '收藏取消成功';
            return $return;
        }else{

            $where['add_time'] = time();
            M('user_collect_job')->add($where);
            $map = array(
                'id' => $uid,
            );
            M('User')->where($map)->setInc('point',1);
            M('User')->where($map)->setInc('collect_times');

            $return['status'] = 1;
            $return['msg'] = '收藏成功';
            return $return;
        }
    }
    /**
     * 获取职位收藏列表
     * @param $user_id  用户id
     */
    public function get_job_collect($user_id){
        $count = M('user_collect_job')->where(array('user_id'=>$user_id))->count();
        $page = new Page($count,10);
        $show = $page->show();
        //获取我的收藏列表
        $sql = "SELECT c.collect_id,c.add_time,g.jid,g.name,g.salary_low,g.salary_high,g.edu,g.need_people,g.work_year,g.create_time,g.company_id FROM __PREFIX__user_collect_job c ".
            "inner JOIN __PREFIX__job g ON g.jid = c.job_id ".
            "WHERE c.user_id = ".$user_id.
            " ORDER BY c.add_time DESC LIMIT {$page->firstRow},{$page->listRows}";
        $result = M()->query($sql);
        foreach ($result as &$v) {
            $v['com_name'] = getCompanyName($v['company_id']);
            $v['add_time'] = friendlyDate($v['add_time']);
            $v['edu'] = C('job_edu')[$v['edu']];
//            $v['com_logo'] = getCompanyLogo($v['company_id']);
        }
        $return['status'] = 3;
        $return['msg'] = '获取成功';
        $return['result'] = $result;
        $return['show'] = $show;        
        return $return;
    }

    public function share_job($jid,$uid)
    {
        $map =array(
            'jid' => $jid
        );
        $z  = M('Job')->where($map)->count();
        if($z <= 0){
            $return['status'] = -1;
            $return['msg'] = '职位参数错误';
            return $return;
        }

        $user_map = array(
            'id' => $uid,
        );
        M('User')->where($user_map)->setInc('share_times');
        M('User')->where($user_map)->setInc('point',2);



        $where = array(
            'user_id' => $uid,
            'job_id' => $jid,
        );
        $z= M('user_share_job')->where($where)->find();

        if ($z) {
            $return['status'] = 1;
            $return['msg'] = '职位已分享';
            return $return;
        }else{
            $where['add_time'] = time();
            M('user_share_job')->add($where);


            $return['status'] = 1;
            $return['msg'] = '添加分享记录成功';
            return $return;
        }
    }

    public function delete_share_job($sid)
    {
        $where = array(
            'share_id' => $sid,
        );
        $z= M('user_share_job')->where($where)->find();
        if (!$z) {
            $return['status'] = 1;
            $return['msg'] = '分享记录不存在';
            return $return;
        }else{
            M('user_share_job')->where($where)->delete();
            $return['status'] = 1;
            $return['msg'] = '删除分享记录成功';
            return $return;
        }
    }

    /**
     * 获取职位分享列表
     * @param $user_id  用户id
     */
    public function get_job_share($user_id)
    {
        $count = M('user_share_job')->where(array('user_id'=>$user_id))->count();

        $page = new Page($count,10);
        $show = $page->show();
        //获取我的收藏列表
        $sql = "SELECT c.share_id,c.add_time,g.jid,g.name,g.salary_low,g.salary_high,g.edu,g.need_people,g.work_year,g.create_time,g.company_id FROM __PREFIX__user_share_job c ".
            "inner JOIN __PREFIX__job g ON g.jid = c.job_id ".
            "WHERE c.user_id = ".$user_id.
            " ORDER BY c.add_time DESC LIMIT {$page->firstRow},{$page->listRows}";
        $result = M()->query($sql);
        foreach ($result as &$v) {
            $v['com_name'] = getCompanyName($v['company_id']);
            $v['add_time'] = friendlyDate($v['add_time']);
            $v['edu'] = C('job_edu')[$v['edu']];
//            $v['com_logo'] = getCompanyLogo($v['company_id']);
        }
        $return['status'] = 3;
        $return['msg'] = '获取成功';
        $return['result'] = $result;
        $return['show'] = $show;
        return $return;
    }
    /**
     * 获取评论列表
     * @param $user_id 用户id
     * @param $status  状态 0 未评论 1 已评论
     * @return mixed
     */
    public function get_comment($user_id,$status=2){
        if($status == 1){
            //已评论
            $count2 = M('')->query("select count(*) as count from `__PREFIX__comment`  as c inner join __PREFIX__order_job as g on c.job_id = g.job_id and c.order_id = g.order_id where c.user_id = $user_id");
            $count2 = $count2[0]['count'];
            
            $page = new Page($count2,10);
            $sql = "select c.*,g.*,(select order_sn from  __PREFIX__order where order_id = c.order_id ) as order_sn  from  __PREFIX__comment as c inner join __PREFIX__order_job as g on c.job_id = g.job_id and c.order_id = g.order_id where c.user_id = $user_id order by c.add_time desc LIMIT {$page->firstRow},{$page->listRows}";
        }else{        	
        	$countsql = " select count(1) as comment_count from __PREFIX__order_job as og
        	left join __PREFIX__order as o on o.order_id = og.order_id where o.user_id = $user_id  and og.is_send = 1 ";
        	$where = '';
        	if($status == 0){
        		$countsql .= $where = " and og.is_comment = 0 ";
        	}
        	$comment = M()->query($countsql);
        	$count1 = $comment[0][comment_count]; // 待评价
            $page = new Page($count1,3);
            $sql =" select *  from __PREFIX__order_job as og 
            left join __PREFIX__order as o on o.order_id = og.order_id  where o.user_id = $user_id and og.is_send = 1  
            $where order by o.order_id desc  LIMIT {$page->firstRow},{$page->listRows}";            
        }
        
        $show = $page->show();
        $comment_list = M()->query($sql);
        if($comment_list){
        	$return['result'] = $comment_list;
        	$return['show'] = $show; //分页
        	return $return;
        }else{
        	return array();
        }
    }
    
    /**
     * 添加评论
     * @param $order_id  订单id
     * @param $job_id  商品id
     * @param $user_email用户邮箱地址
     * @param $username  用户名
     * @return bool
     */
    public function add_comment($add){
        if(!$add['author_id'] || !$add['job_id'])
            return array('status'=>-1,'msg'=>'非法操作','result'=>'');

        $add['add_time'] = time();
        $row = M('Comment')->add($add);
        $map = array(
            'id' => $add['author_id'],
        );
        M('User')->where($map)->setInc('point');
        if($row)
        {
            //M('job')->where(array('jid'=>$add['job_id']))->setInc('comment_count',1); // 评论数加一
            return array('status'=>1,'msg'=>'评论成功','result'=>'');
        }
        return array('status'=>-1,'msg'=>'评论失败','result'=>'');
    }

    /**
     * 邮箱或手机绑定
     * @param $email_mobile  邮箱或者手机
     * @param int $type  1 为更新邮箱模式  2 手机
     * @param int $user_id  用户id
     * @return bool
     */
    public function update_email_mobile($email_mobile,$user_id,$type=1){
        //检查是否存在邮件
        if($type == 1)
            $field = 'email';
        if($type == 2)
            $field = 'mobile';
        $condition['user_id'] = array('neq',$user_id);
        $condition[$field] = $email_mobile;

        $is_exist = M('user')->where($condition)->find();
        if($is_exist)
            return false;
        unset($condition[$field]);
        $condition['user_id'] = $user_id;
        $validate = $field.'_validated';
        M('user')->where($condition)->save(array($field=>$email_mobile,$validate=>1));
        return true;
    }

    /**
     * 更新用户信息
     * @param $user_id
     * @param $post  要更新的信息
     * @return bool
     */
    public function update_info($user_id,$post=array()){
        $model = M('user')->where("user_id = ".$user_id);
        $row = $model->setField($post);
        if($row === false)
           return false;
        return true;
    }

    /**
     * 地址添加/编辑
     * @param $user_id 用户id
     * @param $user_id 地址id(编辑时需传入)
     * @return array
     */
    public function add_address($user_id,$address_id=0,$data){
        $post = $data;
        if($address_id == 0)
        {
            $c = M('UserAddress')->where("user_id = $user_id")->count();
            if($c >= 20)
                return array('status'=>-1,'msg'=>'最多只能添加20个收货地址','result'=>'');
        }        
        
        //检查手机格式
        if($post['consignee'] == '')
            return array('status'=>-1,'msg'=>'收货人不能为空','result'=>'');
        if(!$post['province'] || !$post['city'] || !$post['district'])
            return array('status'=>-1,'msg'=>'所在地区不能为空','result'=>'');
        if(!$post['address'])
            return array('status'=>-1,'msg'=>'地址不能为空','result'=>'');
        if(!check_mobile($post['mobile']))
            return array('status'=>-1,'msg'=>'手机号码格式有误','result'=>'');

        //编辑模式
        if($address_id > 0){

            $address = M('user_address')->where(array('address_id'=>$address_id,'user_id'=> $user_id))->find();
            if($post['is_default'] == 1 && $address['is_default'] != 1)
                M('user_address')->where(array('user_id'=>$user_id))->save(array('is_default'=>0));
            $row = M('user_address')->where(array('address_id'=>$address_id,'user_id'=> $user_id))->save($post);
            if(!$row)
                return array('status'=>-1,'msg'=>'操作完成','result'=>'');
            return array('status'=>1,'msg'=>'编辑成功','result'=>'');
        }
        //添加模式
        $post['user_id'] = $user_id;
        
        // 如果目前只有一个收货地址则改为默认收货地址
        $c = M('user_address')->where("user_id = {$post['user_id']}")->count();        
        if($c == 0)  $post['is_default'] = 1;
        
        $address_id = M('user_address')->add($post);
        //如果设为默认地址
        $insert_id = M()->getLastInsID();
        $map['user_id'] = $user_id;
        $map['address_id'] = array('neq',$insert_id);
               
        if($post['is_default'] == 1)
            M('user_address')->where($map)->save(array('is_default'=>0));
        if(!$address_id)
            return array('status'=>-1,'msg'=>'添加失败','result'=>'');
        
        
        return array('status'=>1,'msg'=>'添加成功','result'=>$address_id);
    }

    /**
     * 添加自提点
     * @author dyr
     * @param $user_id
     * @param $post
     * @return array
     */
    public function add_pick_up($user_id, $post)
    {
        //检查用户是否已经有自提点
        $user_pickup_address_id = M('user_address')->where('user_id=' . $user_id . ' AND is_pickup=1')->getField('address_id');
        $pick_up = M('pick_up')->where(array('pickup_id' => $post['pickup_id']))->find();
        $post['address'] = $pick_up['pickup_address'];
        $post['is_pickup'] = 1;
        $post['user_id'] = $user_id;
        if (!empty($user_pickup_address_id)) {
            //更新自提点
            M('user_address')->where(array('address_id' => $user_pickup_address_id))->save($post);
            return array('status' => 1, 'msg' => '更新成功', 'result' => '');
        } else {
            //添加自提点
            $user_address = D('UserAddress');
            $data = $user_address->create($post);
            if (!$data) {
                // 对data数据进行验证
                return array('status' => -1, 'msg' => '添加失败', 'result' => $user_address->getError());
            } else {
                // 验证通过 可以进行其他数据操作
                $user_address->add($data);
                return array('status' => 1, 'msg' => '添加成功', 'result' => '');
            }
        }
    }


    /**
     * 修改密码
     * @param $user_id  用户id
     * @param $old_password  旧密码
     * @param $new_password  新密码
     * @param $confirm_password 确认新 密码
     */
    public function password($user_id,$old_password,$new_password,$confirm_password,$is_update=true){
        $data = $this->get_info($user_id);
        $user = $data['result'];
        if(strlen($new_password) < 6)
            return array('status'=>-1,'msg'=>'密码不能低于6位字符','result'=>'');
        if($new_password != $confirm_password)
            return array('status'=>-1,'msg'=>'两次密码输入不一致','result'=>'');
        //验证原密码
        if($is_update && ($user['password'] != '' && encrypt($old_password) != $user['password']))
            return array('status'=>-1,'msg'=>'密码验证失败','result'=>'');
        $row = M('user')->where("user_id='{$user_id}'")->save(array('password'=>encrypt($new_password)));
        if(!$row)
            return array('status'=>-1,'msg'=>'修改失败','result'=>'');
        return array('status'=>1,'msg'=>'修改成功','result'=>'');
    }


    public function update_head_pic($uid)
    {
        if($_FILES['head_pic']['error']==0){//图片没有错误才处理
            //1) 上传原图图片
            //通过Think/Upload.class.php实现附件上传
            $cfg = array(
                'savePath'      =>  'Admin/UserHeadPic/', //保存根路径
            );
            $up = new Upload($cfg);
            $z = $up -> uploadOne($_FILES['head_pic']);
            //$z会返回成功上传附件的相关信息
//            dump($z);

            //拼装图片的路径名信息，存储到数据库里边
            $big_path_name = 'Uploads/'.$z['savepath'].$z['savename'];
//            var_dump($big_path_name);

            //2) 根据原图($big_path_name)制作缩略图
            $im = new \Think\Image();//实例化对象
            $im -> open($big_path_name); //打开原图
            $im -> thumb(60,60); //制作缩略图
            //缩略图名字：“small_原图名字”
            $small_path_name = 'Uploads/'.$z['savepath']."small_".$z['savename'];
            $im -> save($small_path_name);//存储缩略图到服务器
            //保存缩略图到数据库
            $data['head_pic'] = $small_path_name;

            $where = array(
                'id' => $uid,
            );

            if(M('User')->where($where)->data($data)->save()){
                return array('code'=>1,'msg'=>'添加成功');
            }
            return array('code'=>-1,'msg'=>'添加失败');
        }
        return array('code'=>-1,'msg'=>'添加失败');
    }

    public function verify_tel($code,$uid)
    {
        $data = session('code');
        if($code == $data['code'] && !empty($data['tel'])){
            $where = array(
                'id' => $uid,
            );
            $map = array(
                'tel' => $data['tel'],
            );
            M('User')->where($where)->data($map)->save();
            return true;
        }
        return false;
    }

    public function mina_verify_tel($code,$uid)
    {
        $data = S('code');
        if($code == $data['code'] && !empty($data['tel'])){
            $where = array(
                'id' => $uid,
            );
            $map = array(
                'tel' => $data['tel'],
            );
            M('User')->where($where)->data($map)->save();
            return true;
        }
        return false;
    }

    public function update_sex($sex,$uid)
    {
        if (!is_numeric($sex) or $sex>=3 or $sex<0) {
            return array('status'=>-1,'msg'=>'性别参数错误');
        }
        $where = array(
            'id' => $uid,
        );
        $map = array(
            'sex' => $sex,
        );
        $z = M('User')->where($where)->data($map)->save();
        if ($z){
            return array('status'=>1,'msg'=>'修改性别成功');
        }
        return array('status'=>-1,'msg'=>'修改性别失败');
    }

    public function update_realname($realname,$uid)
    {
        if (empty($realname)) {
            return array('status'=>-1,'msg'=>'姓名参数错误');
        }
        $where = array(
            'id' => $uid,
        );
        $map = array(
            'realname' => $realname,
        );
        $z = M('User')->where($where)->data($map)->save();
        if ($z){
            return array('status'=>1,'msg'=>'修改姓名成功');
        }
        return array('status'=>-1,'msg'=>'修改姓名失败,请检查名称是否过长');
    }

    public function update_school($school,$uid)
    {
        if (empty($school)) {
            return array('status'=>-1,'msg'=>'学校参数错误');
        }
        $where = array(
            'id' => $uid,
        );
        $map = array(
            'school' => $school,
        );
        $z = M('User')->where($where)->data($map)->save();
        if ($z){
            return array('status'=>1,'msg'=>'修改学校成功');
        }
        return array('status'=>-1,'msg'=>'修改学校失败,请检查输入是否过长');
    }

    public function update_major($major,$uid)
    {
        if (empty($major)) {
            return array('status'=>-1,'msg'=>'专业参数错误');
        }
        $where = array(
            'id' => $uid,
        );
        $map = array(
            'major' => $major,
        );
        $z = M('User')->where($where)->data($map)->save();
        if ($z){
            return array('status'=>1,'msg'=>'修改专业成功');
        }
        return array('status'=>-1,'msg'=>'修改专业失败,请检查输入是否过长');
    }

    public function update_edu($edu,$uid)
    {
        if (!is_numeric($edu) or $edu>=7 or $edu<0) {
            return array('status'=>-1,'msg'=>'学历参数错误');
        }
        $where = array(
            'id' => $uid,
        );
        $map = array(
            'edu' => $edu,
        );
        $z = M('User')->where($where)->data($map)->save();
        if ($z){
            return array('status'=>1,'msg'=>'修改学历成功');
        }
        return array('status'=>-1,'msg'=>'修改学历失败,请检查输入是否正确');
    }

    public function update_entry_year($entry_year,$uid)
    {
        if (!is_numeric($entry_year)) {
            return array('status'=>-1,'msg'=>'入学时间参数错误');
        }
        $where = array(
            'id' => $uid,
        );
        $map = array(
            'entry_year' => $entry_year,
        );
        $z = M('User')->where($where)->data($map)->save();
        if ($z){
            return array('status'=>1,'msg'=>'修改入学时间成功');
        }
        return array('status'=>-1,'msg'=>'修改入学时间失败,请检查输入是否正确');
    }

    public function is_complete($uid)
    {
        $flag = 1;//信息完善
        if(empty($uid)){
            return array('status'=>-1,'msg'=>'请先登录');
        }
        $where = array(
            'id' => $uid,
        );
        $field = array('realname','sex','entry_year','major','edu','school','tel');
        $info = M('User')->field($field)->where($where)->find();
        if(!$info){
            return array('status'=>-1,'msg'=>'用户不存在');
        }
        foreach ($info as $k=>$val){
            if (empty($val)){
                $msg = array_search($k, C('user_complete_info'));
                $flag = 0;//信息不完善
                break;
            }

        }
        if($flag == 1){
            return array('status'=>1,'msg'=>'个人资料已完善');
        }else{
            return array('status'=>-1,'msg'=>$msg);
        }
    }

    public function get_user_rank($uid)
    {
        $where = array(
            'id' => $uid,
        );
        $field = array('point');
        $info = M('User')->field($field)->where($where)->find();

        $count_where = array(
            'point' => array('GT',$info['point']),
        );

        $count = M('User')->where($count_where)->count();

        return $count+1 ;
    }

    public function is_tel($uid)
    {
        $where = array(
            'id' => $uid,
        );
        $field = array('tel');
        $info = M('User')->field($field)->where($where)->find();
        if(true == check_mobile($info['tel'])){
            return 1;
        }
        return 0;
    }
}