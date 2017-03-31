<?php
/**
 * 公司信息
 *
 *
 */
namespace Mina\Controller;
use Think\Controller;
use Home\Model;
use Home\Logic\CompanyLogic;


class CompanyController extends Controller {

	public $com_id = 0;
    public $com_type = 0;
    public $company = array();
//ts191601
    public function _initialize() {
        //parent::_initialize();
        $third_session = I('third_session');
        $data = check_third_session($third_session);
        if($data)
        {
            $where = array(
                'unionid' => $data['unionid'],
                'oauth' =>  'weixin',
            );
            $com = M('Company')->where($where)->find();
            if (empty($com)) {
                $logic = new CompanyLogic();
                $data = $logic->thirdLogin($where);
                if($data['status'] != 1) {
                    returnApiError($data['msg']);
                }
                $this->company = $data['result'];
                $this->com_id = $data['result']['id'];
                $this->com_type = $data['result']['type'];
//                session('user',$data['result']);
//                setcookie('user_id',$data['result']['id'],null,'/');
//                $nickname = empty($data['result']['nickname']) ? '第三方用户' : $data['result']['nickname'];
//                setcookie('uname',urlencode($nickname),null,'/');
//                setcookie('cn',0,time()-3600,'/');
            }else{
                $this->company = $com;
                $this->com_id = $com['id'];
                $this->com_type = $com['type'];
//            $this->assign('user',$user); //存储用户信息
//            $this->assign('user_id',$this->user_id);
            }

        }else{
            $nologin = array(
                'login','pop_login','doLogin','logout','verify','add_user','finished',
                'verifyHandle','register','logout','doLogin',
                'login','sendMail','add_user','ajaxRet',
            );
            if(!in_array(ACTION_NAME,$nologin)){
                //$this->redirect(U('Home/Users/login'));
                returnApiError('该third_session已过期',-1);
                exit;
            }
        }
        //用户中心面包屑导航
//        $navigate_user = navigate_user();
//        $this->assign('navigate_user',$navigate_user);
    }

	
	// 公司主页
	public function index()
	{

        $com_info = $this->company;
        $com_info['point'] = $com_info['view_num'];
        $com_info['logo'] = get_https_img($com_info['logo']);
        $com_info['scale'] = C('company_scale')[$com_info['scale']];
        $com_info['stage'] = C('company_stage')[$com_info['stage']];

        $jobObj = D('Job');
//        $job = $jobObj->where(array('company_id'=>$this->com_id))->select();
        $where = array(
            'company_id' => $this->com_id,
            'state' => 1,
            'status' =>1,
        );
        $jobnum = $jobObj->where($where)->count();
        $com_info['job_num'] = $jobnum;

        returnApiSuccess('获取企业中心页信息成功',$com_info);
	}


	// 公司账号设置-密码重置
	public function updatePwd()
	{
		$this->display();

	// 	{"requestId":null,"code":0,"success":false,"msg":"当前密码错误，请重新输入",
		// "resubmitToken":null,"content":null}
	// 	{"requestId":null,"code":0,"success":true,"msg":"密码修改成功","resubmitToken":null,
		// "content":null}
	}

	// 密码重置操作
	public function dosettingPwd()
	{
		$data = I();
		$oldPassword = md5(trim($data['oldPassword']));
		$comObj = D('Company');
		$res = $comObj->where(array('id'=>$this->com_id))->find();
		if ($res['password'] != $oldPassword) {
			$msg['requestId'] = null;
			$msg['code'] = 0;
			$msg['success'] = false;
			$msg['msg'] = '当前密码错误,请重新输入';
			$msg['resubmitToken'] = null;
			$msg['content'] = null;

		} else {
			$save['id'] = $this->uid;
			$save['password'] = md5(trim($data['newPassword']));
            $comObj->save($save);
			session('company', null);
			cookie('state', null);
			$msg['requestId'] = null;
			$msg['code'] = 0;
			$msg['success'] = true;
			$msg['msg'] = '密码修改成功';
			$msg['resubmitToken'] = null;
			$msg['content'] = null;
			$msg['url'] = U('Home/Company/login');

		}
			$this->ajaxReturn($msg);
	}

    public function do_identity_auth()
    {
        if (IS_POST) {
            $data = I();
//			var_dump($data);
//            var_dump($_FILES);die;
//            if(!is_numeric($data['id']) || $data['id'] <= 0) {
//                $this->ajaxReturn(array('code'=>-1,'msg'=>'添加失败'));
//            }else{
            $comLog = new CompanyLogic();
            $msg =  $comLog->applyAuth($data,$this->com_id);
            if($msg['code'] == 1){
                returnApiSuccess($msg['msg']);
            }else{
                returnApiError($msg['msg']);
            }

        }
    }
	// 修改接收邮箱操作
	public function doSettingEmail()
	{
		$data = I();
		if (empty($data['receiveEmail'])) {
			$msg['content']['rows'] = [];
			$msg['message'] = '操作失败';
			$msg['state'] = 301;
			$this->ajaxReturn($msg);
		}
		$email = $data['receiveEmail'];
		$res = M('Company')->where(array('id'=>$this->com_id))->find();
		if ($res['email'] == $email) {
			$msg['content']['rows'] = [];
			$msg['message'] = '操作失败';
			$msg['state'] = 302;
			$this->ajaxReturn($msg);
		}

		$save['id'] = $this->uid;
		$save['email'] = $email;
		M('Company')->save($save);
		$msg['content']['rows'] = [];
		$msg['message'] = '操作成功';
		$msg['state'] = 1;

		$this->ajaxReturn($msg);
	}

    //公司登陆界面
    public function login(){
        if($this->com_id > 0){
            header("Location: ".U('Home/Company/Index'));
        }
        $referurl = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : U("Home/Company/index");
        $this->assign('referurl',$referurl);
        $this->display();
    }
    //公司登录验证
    public function doLogin(){

        $username=$_POST['email'];
        $password=md5($_POST['password']);

        $referl_url = I('referurl');

        $msg['code'] = 0;
        $msg['msg'] = '登录失败';

        $companyMod=M('company');
        $result=$companyMod->where("account_name='$username'")->find();
        if($result['password'] == $password){

            $login['login_time']=time();
            $login['login_ip'] = $_SERVER['REMOTE_ADDR'];
            $companyMod->where("account_name='$username'")->save($login);
            $company=array('id'=>$result['id'],'account_name'=>$result['account_name'],'state' => $result['state'],'step' => $result['step']);
            session('company',$company);
            cookie('state', 1);

            $msg['code'] = 1;
            $msg['msg'] = '登录成功';
            $msg['redirect_url'] = deal_referurl($referl_url);
        }else{
            //$this->redirect('Company/login');

        }
        $this->ajaxReturn($msg);
    }
    //公司退出功能
    public function logout(){
        session('company',null);
        cookie('state',null);
        $this->redirect('Home/Index/index');
    }
    public function edit_company_info()
    {
        $com_info = $this->company;
        $com_info['logo'] = get_https_img($com_info['logo']);
        $com_info['scale'] = C('company_scale')[$com_info['scale']];
        $com_info['stage'] = C('company_stage')[$com_info['stage']];

        returnApiSuccess('获取企业资料页信息成功',$com_info);
    }
    // 职位列表
    public function get_company_job()
    {
        $comLoc = new CompanyLogic();
        $data = $comLoc->get_company_job($this->com_id,$this->com_type);
        returnApiSuccess('获取公司发布的职位成功',$data);
    }

    public function hide_job()
    {
        $jid = I('jid');
        $comLoc = new CompanyLogic();
        $data = $comLoc->hide_job($jid,$this->com_id);
        if ($data['status'] == -1) {
            returnApiError($data['msg']);
        }else {
            returnApiSuccess('隐藏职位成功');
        }
    }
    public function show_job()
    {
        $jid = I('jid');
        $comLoc = new CompanyLogic();
        $data = $comLoc->show_job($jid,$this->com_id);
        if ($data['status'] == -1) {
            returnApiError($data['msg']);
        }else {
            returnApiSuccess('发布职位成功');
        }
    }

    public function get_auth_state()
    {
        $comLoc = new CompanyLogic();
        $data = $comLoc->get_auth_state($this->com_id);
        if ($data['status'] == 1) {
            returnApiSuccess('获取认证状态成功',$data['data']);
        }else {
            returnApiError($data['msg']);
        }
    }

    //公司注册成功跳转
//    public function wait(){
//        $this->display();
//    }

    public function update_name()
    {
        $name = I('name');
        $logic = new CompanyLogic();
        //添加评论
        $row = $logic->update_name($name,$this->com_id);
        if($row['status'] == 1) {
            returnApiSuccess($row['msg']);
        }else{
            returnApiError($row['msg']);
        }
    }

    public function update_short_name()
    {
        $short_name = I('short_name');
        $logic = new CompanyLogic();
        //添加评论
        $row = $logic->update_short_name($short_name,$this->com_id);
        if($row['status'] == 1) {
            returnApiSuccess($row['msg']);
        }else{
            returnApiError($row['msg']);
        }
    }
    public function update_position()
    {
        $position = I('position');
        $logic = new CompanyLogic();
        //添加评论
        $row = $logic->update_position($position,$this->com_id);
        if($row['status'] == 1) {
            returnApiSuccess($row['msg']);
        }else{
            returnApiError($row['msg']);
        }
    }

    public function update_email()
    {
        $email = I('email');
        $logic = new CompanyLogic();
        //添加评论
        $row = $logic->update_email($email,$this->com_id);
        if($row['status'] == 1) {
            returnApiSuccess($row['msg']);
        }else{
            returnApiError($row['msg']);
        }
    }

    public function update_logo()
    {
        if (IS_POST){
            $logic = new CompanyLogic();
            //添加评论
            $row = $logic->update_logo($this->com_id);
            if($row['code'] == 1) {
                returnApiSuccess($row['msg']);
            }else{
                returnApiError($row['msg']);
            }
        }

    }

    public function send_tel_verify()
    {
        $mobile = I('tel');
        if(!check_mobile($mobile))
            returnApiError('手机号码格式有误');

        if(time()-S('code')['time']<90)
            returnApiError('您已发送过验证短信,请耐心等待送达或90s后重试');

        $code = rand(100000, 999999);
        $content = '您的验证码为:' . $code . ',请尽快验证【就业直达号】';
        $send = zhutong_semd_sms($content, $mobile);
//        var_dump($send);
        if($send == false)
            returnApiError('发送失败,请稍后再试');
        $data['code'] = $code;
        $data['time'] = time();
        $data['tel'] = $mobile;
        S('code',$data);
        returnApiSuccess('验证码已发送,请注意查收');
    }

    public function check_tel_verify()
    {
        $code = I('code');
        $logic = new CompanyLogic();
        $res = $logic->mina_verify_tel($code,$this->com_id);
        if($res){
            returnApiSuccess('手机绑定成功');
        }
        returnApiError('输入的验证码不匹配');

    }

}