<?php
/**
 * 公司信息
 *
 *
 */
namespace Mobile\Controller;
use Think\Controller;
use Home\Model;
use Home\Logic\CompanyLogic;

class CompanyController extends Controller {

	public $com_id = 0;
    public $com_type = 0;
    public $company = array();

    public function _initialize() {
        //parent::_initialize();
        if(session('?company'))
        {
            $company = session('company');
            //var_dump($company);die;
            $company = M('Company')->where("id = {$company['id']}")->find();
            session('company',$company);  //覆盖session 中的 company
            $this->company = $company;
            $this->com_id = $company['id'];
            $this->com_type = $company['type'];
            $this->assign('company',$company); //存储用户信息
            $this->assign('com_id',$this->com_id);
        }else{
            $nologin = array(
                'index','login','pop_login','doLogin','logout','verify','add_user','finished',
                'verifyHandle','register','logout','doLogin',
                'edit_info','sendMail','add_user','ajaxRet',
            );
            if(!in_array(ACTION_NAME,$nologin)){
                header("location:".U('Home/Users/login'));
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
		$data['company_id'] = $this->com_id;

		$company = M('Company')->where('id = '.$this->com_id)->find();
		$company['scale'] = C('company_scale')[$company['scale']];
		$company['stage'] = C('company_stage')[$company['stage']];


		$jobObj = D('Job');
		$job = $jobObj->where(array('company_id'=>$this->com_id))->select();
		$jobnum = $jobObj->where(array('company_id'=>$this->com_id))->count();


        $logic = new CompanyLogic();
        $row = $logic->get_company_rank($this->user_id);
        $row = $row+1;
        $this->assign('rank',$row);

		$this->assign('company', $company);
		$this->assign('job', $job);
		$this->assign('jobnum', $jobnum);
		$this->display();
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
		$res = $this->comObj->where(array('id'=>$this->com_id))->find();
		if ($res['email'] == $email) {
			$msg['content']['rows'] = [];
			$msg['message'] = '操作失败';
			$msg['state'] = 302;
			$this->ajaxReturn($msg);
		}

		$save['id'] = $this->uid;
		$save['email'] = $email;
		$this->comObj->save($save);
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
    //公司注册成功跳转
//    public function wait(){
//        $this->display();
//    }

    public function identityAuth()
    {
        if (IS_POST) {
            $data = I();
//			var_dump($data);
//            var_dump($_FILES);die;
            if(!is_numeric($data['id']) || $data['id'] <= 0) {
                $this->ajaxReturn(array('code'=>-1,'msg'=>'添加失败'));
            }else{
                $comLog = new CompanyLogic();
                $msg =  $comLog->applyAuth($data);
                $this->ajaxReturn($msg);
            }
        }
        $this->display();
    }

    public function edit_info()
    {
        $com_info = $this->company;
//        $edu = C('job_edu');
//        $this->assign('edu',$edu);
//        $com_info['edu'] = $edu[$com_info['edu']];
//        $sex = C('user_sex');
//        $this->assign('sex',$sex);
//        $com_info['sex'] = $sex[$com_info['sex']];
        $com_info['logo'] = get_https_img($com_info['logo']);
        $this->assign('com_info',$com_info);
        $this->display();
    }

    public function do_edit_info()
    {
        $data = I();
        if($_FILES['logo']){
            $userLog = new CompanyLogic();
            $userLog->update_logo($this->com_id);
        }

        $where = array(
            'id' => $this->com_id,
        );
        $edu = C('job_edu');
//        foreach ($edu as $val) {
//            if ($val == $data['edu']) {
//                $data['edu'] = array_search($val, $edu);
//                break;
//            }
//        }
//        if (!is_numeric($data['edu'])) {
//            $data['edu'] = 3;
//        }

        $z = M('Company')->where($where)->data($data)->save();
        $this->redirect('edit_info');
    }
}