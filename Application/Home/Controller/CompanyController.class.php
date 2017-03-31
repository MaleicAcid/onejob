<?php
/**
 * 公司信息
 *
 *
 */
namespace Home\Controller;
use Home\Logic\JobLogic;
use Think\Controller;
use \Home\Service\Category;
use Home\Model;
use Home\Logic\CompanyLogic;
use Home\Logic\UserLogic;
//include '/usr/local/xunsearch/sdk/php/lib/XS.php';
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
                'logout','login','pop_login','doLogin','logout','verify','add_user','finished',
                'verifyHandle','register','logout','doLogin',
                'add_job','edit_job','','sendMail','add_user','ajaxRet',
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

		$where = array(
		    'id' => $this->com_id,
        );
		$company = M('Company')->where($where)->find();
        $company['logo'] = get_https_img($company['logo']);
		$company['scale'] = C('company_scale')[$company['scale']];

		$company['stage'] = C('company_stage')[$company['stage']];
        $company['invest'] = C('company_invest')[$company['invest']];
		$jobObj = D('Job');
//		$job = $jobObj->where(array('company_id'=>$this->com_id))->select();
		$jobnum = $jobObj->where(array('company_id'=>$this->com_id))->count();

        $logic = new CompanyLogic();
        $is_tel = $logic->is_tel($this->com_id);
        $this->assign('is_tel',$is_tel);


        $invest = C('company_invest');
        $scale = C('company_scale');
        $this->assign('invest', $invest);
        $this->assign('scale', $scale);
		$this->assign('company', $company);

		$this->assign('jobnum', $jobnum);
		$this->display();
	}

    public function is_complete_or_identity()
    {
        $logic = new CompanyLogic();
        $res1 = $logic->is_complete($this->com_id);
        if ($res1['status'] != 1){
            $res['complete_code'] = 0;
            $res['complete_msg'] = $res1['msg'];
        }else{
            $res['complete_code'] = 1;
            $res['complete_msg'] = '信息已完善';
        }

        $where = array(
            'id' =>$this->com_id,
        );
        $res2 = M('Company')->field('state')->where($where)->find();
        if ($res2['state'] != 1){
            $res['identity_code'] = 0;
            if($res2['state'] == 2){
                $res['identity_msg'] = '点击进入认证';
            }else if($res2['state'] == 3){
                $res['identity_msg'] = '认证审核中,请耐心等待。';
            }else if($res2['state'] == 4){
                $res['identity_msg'] = '认证失败,请尝试重新认证。';
            }else{
                $res['identity_msg'] = '点击进入企业认证';
            }
        }else{
            $res['identity_code'] = 1;
            $res['identity_msg'] = '认证成功';
        }
        $this->ajaxReturn($res);

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

    public function update_detail()
    {
        $arr = I();

        $logic = new CompanyLogic();
        //添加评论
        $row = $logic->update_logo($this->com_id);
//        if($row['code'] == 1) {
//            returnApiSuccess($row['msg']);
//        }else{
//            returnApiError($row['msg']);
//        }
        $where = array(
            'id' =>$this->com_id,
        );
        foreach ($arr as $k=>$val){
            if(empty($val)){
                continue;
            }
            $data[$k]= $val;
        }
        if(!check_email($data['email'])){
            $msg['msg'] = '请填写正确的邮箱格式';
            $msg['status'] = -1;
            $this->ajaxReturn($msg);
        }
        unset($data['tel']);
        $data['invest'] = array_search($data['invest'],C('company_invest'));
        $data['scale'] = array_search($data['scale'],C('company_scale'));
        $data['updatetime'] = time();

        $z = M('Company')->where($where)->data($data)->save();
        $msg['msg'] = '保存失败，请稍后再试';
        $msg['status'] = 1;
        if ($z){
            $msg['msg'] = '保存成功';
            $msg['status'] = 1;
            $this->ajaxReturn($msg);
        }
        $this->ajaxReturn($msg);
	}
	// 修改接收简历邮箱页面
	public function updateEmail()
	{
		$res = M('Company')->where(array('id'=>$this->com_id))->find();
		$this->assign('email', $res['email']);
		$this->display();

		// {"content":{"data":{"record":790},"rows":[]},"message":"操作成功","state":1}
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

    public function show_identity()
    {
        $comLoc = new CompanyLogic();
        $data = $comLoc->get_auth_state($this->com_id);

        $data = $data['data'];
        if($data['state'] == 2){
            $this->redirect('Company/identityAuth');exit;
        }
        $this->assign('data',$data);

        $this->display();

    }
    public function identityAuth()
    {
        $state = getCompanyState($this->com_id);
        if($state == 1){
            $this->redirect('Company/show_identity');exit;
        }

//        }else if ($state == 2){
//            $this->display();
//        }else if ($state == 3){
//            $this->Success('申请审核中,请耐心等候',U('index'),5);
//        }else{
//            $this->display();
//        }
         $this->display();
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
                $this->ajaxReturn($msg);

        }
    }

    public function get_company_job()
    {
        $comLoc = new CompanyLogic();
        $jobs = $comLoc->get_company_job($this->com_id,$this->com_type);
        $this->assign('jobs',$jobs['job']);
        $this->display('ajax_get_job');
    }

    public function add_job()
    {
        $comLoc = new CompanyLogic();
        $res = $comLoc->is_complete($this->com_id);
        if ($res['status'] != 1){
            $this->redirect('Company/index');
            exit;
        }
        $state = $comLoc->get_auth_state($this->com_id);
        if ($state['data']['state'] == 1){
            if ($this->com_type == 2){
                $this->redirect('Company/school_add_job');
                exit;
            }
            $res_category = Category::getInstance();
            $res_category = $res_category->mCategory;
            $this->assign('res_category',$res_category);
            $data['company_id'] = $this->com_id;

            $company = M('Company')->where('id = '.$this->com_id)->find();
            $company['logo'] = get_https_img($company['logo']);
            $company['scale'] = C('company_scale')[$company['scale']];
            $company['stage'] = C('company_stage')[$company['stage']];
            $company['invest'] = C('company_invest')[$company['invest']];

            $this->assign('company', $company);
            $job_edu = C('job_edu');
            unset($job_edu[0]);

            $work_year = C('work_year');
            $this->assign('work_year',$work_year);
            $this->assign('edu',$job_edu);
            $this->display();
        }else{
            $this->redirect('Company/identityAuth');
        }

    }
    public function do_add_job()
    {
        if (IS_POST) {
            $data = I('','','');
            $data['text'] = $data['editorValue'];
            unset($data['editorValue']);
            $data['end_time'] = strtotime($data['end_time']);
            $data['edu'] = array_search($data['edu'],C('job_edu'));
            $data['work_year'] = array_search($data['work_year'],C('work_year'));
            $data['create_time'] = time();


            if ($data['jid'] > 0) {
                M('Job')->data($data)->save();
                $this->ajaxReturn(array('code'=>1,'msg'=>'修改成功！'));
            }

            $where = array(
                'id' => $this->com_id,
            );
            M("Company")->where($where)->setInc('point',5);

            $data['state'] = 0;//0暂且不发布
            $data['company_id'] = $this->com_id;
            $jid = M('Job')->add($data);
            $this->ajaxReturn(array('code'=>1,'msg'=>'添加成功！','jid'=>$jid));
        }
    }

    public function edit_job()
    {
        $jid = I('jid');
        if ($this->com_type == 2){
            $this->redirect('Company/school_edit_job',array('jid'=>$jid));
            exit;
        }

        $jobLoc = new JobLogic();
        $job = $jobLoc->edit_job_info($jid);
        $data['company_id'] = $this->com_id;

        $company = M('Company')->where('id = '.$this->com_id)->find();
        $company['logo'] = get_https_img($company['logo']);
        $company['scale'] = C('company_scale')[$company['scale']];
        $company['stage'] = C('company_stage')[$company['stage']];
        $company['invest'] = C('company_invest')[$company['invest']];

        $job_edu = C('job_edu');
        unset($job_edu[0]);

        $work_year = C('work_year');
        $this->assign('work_year',$work_year);
        $this->assign('edu',$job_edu);

        $this->assign('company', $company);
        $this->assign('job', $job['data']);
        $this->display();
    }

    public function school_edit_job()
    {
        $jid = I('jid');
        $jobLoc = new JobLogic();
        $job = $jobLoc->school_edit_job_info($jid);
        $company = $job['data']['company'];
        unset($job['data']['company']);
        $company['logo'] = get_https_img($company['logo']);
        $company['scale'] = C('company_scale')[$company['scale']];
        $company['stage'] = C('company_stage')[$company['stage']];
        $company['invest'] = C('company_invest')[$company['invest']];

        $invest = C('company_invest');
        $scale = C('company_scale');
        $this->assign('invest', $invest);
        $this->assign('scale', $scale);
        $job_edu = C('job_edu');
        unset($job_edu[0]);

        $work_year = C('work_year');
        $this->assign('work_year',$work_year);
        $this->assign('edu',$job_edu);

        $this->assign('company', $company);
        $this->assign('job', $job['data']);
        $this->display();
    }

    public function do_school_edit_job()
    {
        if (IS_POST) {

            $data = I('','');
//            var_dump($_FILES['logo']);
            $data['create_time'] = time();
            $data['invest'] = array_search($data['invest'],C('company_invest'));
            $data['scale'] = array_search($data['scale'],C('company_scale'));
            $data['end_time'] = strtotime($data['end_time']);
            $data['edu'] = array_search($data['edu'],C('job_edu'));
            $data['work_year'] = array_search($data['work_year'],C('work_year'));
            $data['updatetime'] = time();
            $job =array();
            $job['jid'] = $data['jid'];
            unset($data['jid']);
            $job['name'] = $data['name'];
//            unset($data['name']);
            $data['name'] = $data['c_name'];
            unset($data['c_name']);
            $job['edu'] = $data['edu'];
            unset($data['edu']);
            $job['work_year'] = $data['work_year'];
            unset($data['work_year']);
            $job['need_people'] = $data['need_people'];
            unset($data['need_people']);
            $job['salary_low'] = $data['salary_low'];
            unset($data['salary_low']);
            $job['salary_high'] = $data['salary_high'];
            unset($data['salary_high']);
            $job['text'] = $data['text'];
            unset($data['text']);


            if ($job['jid'] > 0) {
                $where = array(
                    'jid' => $job['jid'],
                );
                unset($job['jid']);
                $job['modify_time'] = time();
                $z = M('Job')->where($where)->save($job);

                $xs_field = array('jid','name','text','end_time','is_top','is_hot','view_num','edu','need_people','work_year','company_id','salary_low','salary_high','address','cate_id' );
                $info = M('Job')->field($xs_field)->where($where)->find();
                $xs = new \XS('onejob'); // 建立 XS 对象，项目名称为：demo
                $index = $xs->index;
                $doc = new \XSDocument;
                $doc->setFields($info);

                $field = array('company_id');
                $id = M('Job')->field($field)->where($where)->find();
                $map = array(
                    'id' => $id['company_id'],
                );
                $res = M('Company')->where($map)->data($data)->save();
                $comLoc = new CompanyLogic();
                $row = $comLoc->update_logo($id['company_id']);
                $this->ajaxReturn(array('code'=>1,'msg'=>'修改成功！'));
            }
//            $data['state'] = 0;
//            $data['company_id'] = $this->com_id;
//            $jid = M('Job')->add($data);
            $this->ajaxReturn(array('code'=>1,'msg'=>'保存失败！','jid'=>$jid));
        }
    }

    public function do_edit_job()
    {
        if (IS_POST) {
            $data = I('','');
            $data['create_time'] = time();
//            $data['end_time'] = strtotime($data['end_time']);
            $data['edu'] = array_search($data['edu'],C('job_edu'));
            $data['work_year'] = array_search($data['work_year'],C('work_year'));

            if ($data['jid'] > 0) {
                M('Job')->data($data)->save();
                $xs_field = array('jid','name','text','end_time','is_top','is_hot','view_num','edu','need_people','work_year','company_id','salary_low','salary_high','address','cate_id' );
                $where = array(
                    'jid' => $data['jid'],
                );
                $info = M('Job')->field($xs_field)->where($where)->find();
                $xs = new \XS('onejob'); // 建立 XS 对象，项目名称为：demo
                $index = $xs->index;
                $doc = new \XSDocument;
                $doc->setFields($info);
                $this->ajaxReturn(array('code'=>1,'msg'=>'修改成功！'));
            }
            $data['state'] = 0;
            $data['company_id'] = $this->com_id;
            $jid = M('Job')->add($data);
            $this->ajaxReturn(array('code'=>1,'msg'=>'添加成功！','jid'=>$jid));
        }
    }

    public function school_add_job()
    {

        $comLoc = new CompanyLogic();
        $state = $comLoc->get_auth_state($this->com_id);
        if ($state['data']['state'] == 1){
            $data['company_id'] = $this->com_id;

            $res_category = Category::getInstance();
            $res_category = $res_category->mCategory;
            $this->assign('res_category',$res_category);

            $company = M('Company')->where('id = '.$this->com_id)->find();
            $company['logo'] = get_https_img($company['logo']);
            $company['scale'] = C('company_scale')[$company['scale']];
            $company['stage'] = C('company_stage')[$company['stage']];
            $company['invest'] = C('company_invest')[$company['invest']];

            $this->assign('company', $company);
            $job_edu = C('job_edu');
            unset($job_edu[0]);

            $invest = C('company_invest');
            $this->assign('invest',$invest);
            $scale = C('company_scale');
            $this->assign('scale',$scale);
            $work_year = C('work_year');
            $this->assign('work_year',$work_year);
            $this->assign('edu',$job_edu);
            $this->display();
        }else{
            $this->redirect(U('Company/identityAuth'));
        }

    }

    //未完成 先添加附属公司而后将其id给发布的职位
    public function do_school_add_job()
    {
        if (IS_POST) {
            $data = I('','');

            $data['end_time'] = strtotime($data['end_time']);
            $data['edu'] = array_search($data['edu'],C('job_edu'));
            $data['work_year'] = array_search($data['work_year'],C('work_year'));
            $comLoc = new CompanyLogic();

            $createInfo['pid'] = $this->com_id;
            $createInfo['name'] = $data['c_name'];
            unset($data['c_name']);
            $createInfo['short_name'] = $data['short_name'];
            unset($data['short_name']);
            $createInfo['email'] = $data['email'];
            unset($data['email']);
            $createInfo['trade'] = $data['trade'];
            unset($data['trade']);
            $createInfo['invest'] = array_search($data['invest'],C('company_invest'));
            unset($data['invest']);
            $createInfo['scale'] = array_search($data['scale'],C('company_scale'));
            unset($data['scale']);
            $createInfo['address'] = $data['address'];
            unset($data['address']);
            $createInfo['tel'] = $data['tel'];
            unset($data['tel']);
            $createInfo['desc'] = $data['desc'];
            unset($data['desc']);






            if ($data['jid'] > 0) {
                M('Job')->data($data)->save();
                $cid = getCompanyIdByJid($data['jid']);
                $createInfo['logo'] = getCompanyHalfLogo($this->com_id);

                $where = array(
                    'id' => $cid
                );
                M('Company')->where($where)->data($createInfo)->save();
                $this->ajaxReturn(array('code'=>1,'msg'=>'修改成功'));
            }

            $cid = getCompanyIdByJid($data['jid']);
            $createInfo['logo'] = getCompanyHalfLogo($this->com_id);

            $where = array(
                'id' => $this->com_id,
            );
            M("Company")->where($where)->setInc('point',5);

            $id = $comLoc->createCompany($createInfo);
//            var_dump($id);die;
            $data['create_time'] = time();
            $data['company_id'] = $id;

            $data['state'] = 0;
            $jid = M('Job')->add($data);
            $this->ajaxReturn(array('code'=>1,'msg'=>'添加成功','jid'=>$jid));
        }
    }

    public function manage_job()
    {
        $this->display();
    }
    public function hide_job()
    {
        $jid = I('jid');
        $comLoc = new CompanyLogic();
        $data = $comLoc->hide_job($jid,$this->com_id);
        if ($data['status'] == -1) {
            $this->ajaxReturn($data);
        }else{
            $this->ajaxReturn($data);
        }
    }
    public function show_job()
    {
        $jid = I('jid');
        $comLoc = new CompanyLogic();
        $data = $comLoc->show_job($jid,$this->com_id);
        if ($data['status'] == -1) {
            $this->ajaxReturn($data);
        }else{
            $this->ajaxReturn($data);
        }
    }

    public function delete_job()
    {
        $jid = I('jid');
        $comLoc = new CompanyLogic();
        $data = $comLoc->delete_job($jid,$this->com_id);
        if ($data['status'] == -1) {
            $this->ajaxReturn($data);
        }else{
            $this->ajaxReturn($data);
        }
    }

    public function send_tel_verify()
    {

        $mobile = I('mobile');
        if(!check_mobile($mobile))
            $this->ajaxReturn(array('status'=>-1,'msg'=>'手机号码格式有误'));
        if(time()-session('code')['time']<70)
            $this->ajaxReturn(array('status'=>-2,'msg'=>'您已发送过验证短信,请70s后再尝试发送'));

        $code = rand(100000, 999999);
        $content = '您的验证码为:' . $code . ',请尽快验证【就业直达号】';
        $send = zhutong_semd_sms($content, $mobile);
//        var_dump($send);
        if($send == false)
            $this->ajaxReturn(array('status'=>-3,'msg'=>'发送失败,请稍后再试'));
        $data['code'] = $code;
        $data['time'] = time();
        $data['tel'] = $mobile;
        session('code',$data);
        $this->ajaxReturn(array('status'=>1,'msg'=>'验证码已发送,请注意查收'));
    }

    public function check_tel_verify()
    {
        $code = I('code');
        $userLogic = new CompanyLogic();
        $res = $userLogic->verify_tel($code,$this->com_id);
        if($res){
            $this->ajaxReturn(array('status'=>1,'msg'=>'手机绑定成功'));
        }
        $this->ajaxReturn(array('status'=>-1,'msg'=>'输入的验证码不匹配'));

    }

    public function update_desc()
    {
        $desc = I('desc');
        $comLogic = new CompanyLogic();
        $res = $comLogic->update_desc($desc,$this->com_id);
        if($res['status'] == 1){
            $this->ajaxReturn(array('status'=>1,'msg'=>$res['msg']));
        }
        $this->ajaxReturn(array('status'=>-1,'msg'=>$res['msg']));
    }

    public function reply_comment()
    {
        $data['content'] = I('content');
        $data['author_id'] = $this->com_id;
        $data['job_id'] = I('jid');
        $data['pid'] = I('comment_pid');
        $data['is_show'] = 1;
        $data['type'] = 1;
        $data['add_time'] = time();
        M('Comment')->data($data)->add();
        exit(json_encode(array('status'=>1,'msg'=>'回复成功')));
    }
    //公司注册成功跳转
//    public function wait(){
//        $this->display();
//    }
}