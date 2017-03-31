<?php
namespace Mobile\Controller;
use Admin\Controller\ManagerController;
use Think\Controller;
use Home\Logic\UserLogic;
use Home\Logic\JobLogic;
class UserController extends Controller {
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
        }else{
            $nologin = array(
                'index','login','pop_login','doLogin','logout','verify','finished',
                'verifyHandle','register','logout','doLogin',
                'edit_info','do_edit_info','sendMail','add_user','ajaxRet','collect_job','add_comment'
            );
            if(!in_array(ACTION_NAME,$nologin)){
                //$this->redirect(U('Home/Users/login'));
                header("location:".U('Users/login'));
                exit;
            }
        }
        //用户中心面包屑导航
//        $navigate_user = navigate_user();
//        $this->assign('navigate_user',$navigate_user);
    }

    public function index(){
        $user_info = $this->user;
        $user_info['head_pic'] = get_https_img($user_info['head_pic']);
        $this->assign('user_info',$user_info);

        $logic = new UserLogic();
        $row = $logic->get_user_rank($this->user_id);
        $this->assign('rank',$row);
        $this->display('index');
    }

    public function register(){
        if($this->user_id > 0){
            header("Location: ".U('Home/User/Index'));
        }
        $this->display('register');
    }
	//用户注册ajax验证模块
	public function ajaxRet(){
		$user=M('users');
		$email=$_POST['email'];
		$res=$user->where("username='$email'")->select();
		if($res){
			$this->ajaxReturn($res);
		}else{
			$this->ajaxReturn(null);
		}
	}
	//用户注册数据录入数据库模块
	public function add_user(){
		$user=M('users');
		$verify = md5($_POST['email'].$_POST['password'].rand(1,10000));
		$date['username']=$_POST['email'];
		$date['type']=$_POST['type'];
		$date['password']=md5($_POST['password']);
		$date['verify']=$verify;
		$date['create_time']=time();
		$date['login_time']=time();
		$date['login_ip']=$_SERVER['REMOTE_ADDR'];
		$result=$user->data($date)->add();
		if($result){
			$to=$date['username'];
			$url = C('DOMAIN').U('User/verify',array('id'=>$result,'verify'=>$verify));
			$content = '欢迎您注册'.C('WEB_NAME').',请点击后面的链接完成注册,<a href="'.$url.'">点击验证</a>,如果链接点击无效,请复制下面的链接到浏览器完成注册 <br>'.$url;
			sendMail($to,$content,C('WEB_NAME').'验证邮件');
			$this->success('',U('User/Index'));
		}else{
			$this->error('注册失败',U('Home/User/add'),3);
		}
	}
	//邮件验证模块
	public function verify(){
 		$user = M('users');
		$userInfo  = $user->where("id=".I('get.id'))->find();
		//用数据库中的验证码 和 用户传递过来的验证码进行比对
		if($userInfo['verify'] != I('get.verify')){
			$this->error('非法请求');
		}else{
			//验证通过修改用户状态
			$data['state'] = 1;
			$data['id'] = I('get.id');
			if($user->save($data)){
				//验证通过一般跳转到首页
				$user=array('id'=>$userInfo['id'],'username'=>$userInfo['username'],'type'=>$userInfo['type']); 
				session('user',$user);
				cookie('state',1);
				$this->success(C('WEB_NAME').'邮箱验证成功',U('Index/index'),3);
			}else{
				$this->error(C('WEB_NAME').'邮箱验证失败',U("User/login"),3);
			}
		}	 
	}
	//邮件发送功能
	public function sendMail($to,$title,$content){
		$mail=new \Org\Util\PHPMailer();
        $mail->CharSet = "utf-8";  //设置采用utf8中文编码
        $mail->IsSMTP();                    //设置采用SMTP方式发送邮件
        $mail->Host = "smtp.163.com";    //设置邮件服务器的地址  smtp.qq.com
        $mail->Port = 25;     //设置邮件服务器的端口，默认为25  gmail  443
        $mail->From = "lamp_testmail@163.com";  //设置发件人的邮箱地址
        $mail->FromName = "我的小站";                       //设置发件人的姓名
        $mail->SMTPAuth = true;                                    // 设置SMTP是否需要密码验证，true表示需要
        $mail->Username = "lamp_testmail@163.com";
        $mail->Password = "abc123456";
        $mail->Subject = $title;   //设置邮件的标题
        $mail->AltBody = "text/html";    // optional, comment out and  test  <a href="">abc</a>
        $mail->Body = $content;//发送的内容
        $mail->IsHTML(true);                                        //设置内容是否为html类型
		//$mail ->WordWrap = 50;                                 //设置每行的字符数
        $mail->AddReplyTo("lamp_testmail@163.com", "我的小站");     //设置回复的收件人的地址
        $mail->AddAddress($to);     //设置收件的地址
        if (!$mail->Send()) {                    //发送邮件
            echo '邮件发送失败:'.$mail->ErrorInfo;
        } else {
            $this->redirect('User/wait');
        }
	}
	//用户登陆界面
	public function login(){
        if($this->user_id > 0){
            header("Location: ".U('Home/User/Index'));
        }
        $referurl = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : U("Home/User/index");
        $this->assign('referurl',$referurl);
		$this->display();
	}
	//用户登录验证
	public function doLogin(){

		$username=$_POST['email'];
		$password=md5($_POST['password']);

		$referl_url = I('referurl');

        $msg['code'] = 0;
        $msg['msg'] = '登录失败';

		$userMod=M('users');
		$result=$userMod->where("username='$username'")->find();
		if($result['password'] == $password){

			$login['login_time']=time();
			$login['login_ip'] = $_SERVER['REMOTE_ADDR'];
            $userMod->where("username='$username'")->save($login);
			$user=array('id'=>$result['id'],'username'=>$result['username'],'type'=>$result['type'],'com_id'=>$result['com_id']);
			session('user',$user);
			cookie('state', 1);

            $msg['code'] = 1;
            $msg['msg'] = '登录成功';
            $msg['redirect_url'] = deal_referurl($referl_url);
		}else{
			//$this->redirect('User/login');

		}
        $this->ajaxReturn($msg);
	}
	//用户退出功能
	public function logout(){
		session('user',null);
		cookie('state',null);
		$this->redirect('Home/Index/index');
	}
	//用户注册成功跳转
	public function wait(){
		$this->display();
	}

    /**
     * 用户收藏某一件职位
     * @param type $jid
     */
    public function collect_job($jid)
    {
        $jid = I('jid');
        if(session('?company')){
            $row =  array('status'=>-4,'msg'=>'请以学生身份登录','result'=>'');
            exit(json_encode($row));
        } else if(!session('?user')) {
            $row =  array('status'=>-2,'msg'=>'请以用户身份登录再收藏','result'=>'');
            exit(json_encode($row));
        }
        $userLogic = new UserLogic();
        $res = $userLogic->is_complete($this->user_id);
        $res = $userLogic->is_complete($this->user_id);
        if($res['status'] != 1) {
            $row =  array('status'=>-4,'msg'=>'请完善信息后再收藏','result'=>'');
            exit(json_encode($row));
        }
        $data = $userLogic->collect_job($jid, $this->user_id);
        exit(json_encode($data));
    }


    /*
 *获取收藏的职位
 */
    public function job_collect(){
        $is_ajax = I('is_ajax');
        $userLogic = new UserLogic();
        $data = $userLogic->get_job_collect($this->user_id);
        $this->assign('page',$data['show']);// 赋值分页输出
        $this->assign('lists',$data['result']);
        $this->assign('active','job_collect');
        if ($is_ajax == 1) {
            $this->display('ajax_job_collect');
        }else{
            $this->display();
        }

    }

    public function cancle_collect()
    {
        $cid = I('cid');

        if ($cid) {
            $map = array(
                'collect_id' => $cid
            );
            $z = M('user_collect_job')->where($map)->delete();
            if ($z) {
                $this->ajaxReturn(array('code'=>1,'msg'=>'删除成功'));
            }else{
                $this->ajaxReturn(array('code'=>-1,'msg'=>'删除失败'));
            }
        }else{
            $this->ajaxReturn(array('code'=>-1,'msg'=>'删除失败'));
        }
    }

    public function job_share()
    {
        $is_ajax = I('is_ajax');
        $userLogic = new UserLogic();
        $data = $userLogic->get_job_share($this->user_id);
        $this->assign('page',$data['show']);// 赋值分页输出
        $this->assign('lists',$data['result']);
        $this->assign('active','job_share');
        if ($is_ajax == 1) {
            $this->display('ajax_job_share');
        }else{
            $this->display();
        }
    }
    public function share_job()
    {
        $jid = I('jid');

//        if(!session('?user')) {
//            returnApiError('用户未登录');
//        }
        $userLogic = new UserLogic();
        $res = $userLogic->is_complete($this->user_id);
        $data['code'] = 1;
        $data['msg'] = '分享成功！已获得积分！';
        if($res['status'] != 1) {
            $data['code'] = 2;
            $data['msg'] = '完善资料后分享可获得积分哦~';
        }

        $res = $userLogic->share_job($jid, $this->user_id,$res['status']);

        if ($res['status'] == 1){
            $jobLoc = new JobLogic();
            $jobLoc->add_share_num($jid);
        }else{
            $data['code'] = -1;
            $data['msg'] = '职位参数错误';
        }

        $this->ajaxReturn($data);
    }
    public function cancle_share()
    {
        $sid = I('sid');

        if ($sid) {
            $map = array(
                'share_id' => $sid
            );
            $z = M('user_share_job')->where($map)->delete();
            if ($z) {
                $this->ajaxReturn(array('code'=>1,'msg'=>'删除成功'));
            }else{
                $this->ajaxReturn(array('code'=>-1,'msg'=>'删除失败'));
            }
        }else{
            $this->ajaxReturn(array('code'=>-1,'msg'=>'删除失败'));
        }
    }

    public function edit_info()
    {
        $user_info = $this->user;
        $edu = C('job_edu');
        $this->assign('edu',$edu);
        $user_info['edu'] = $edu[$user_info['edu']];
        $sex = C('user_sex');
        $this->assign('sex',$sex);
        $user_info['sex'] = $sex[$user_info['sex']];
//        var_dump($user_info);die;
        $user_info['head_pic'] = get_https_img($user_info['head_pic']);
        $this->assign('user_info',$user_info);
        $this->display();
    }

    public function do_edit_info()
    {
        $data = I();
        if($_FILES['head_pic']){
            $userLog = new UserLogic();
            $userLog->update_head_pic($this->user_id);
        }
        $where = array(
            'id' => $this->user_id,
        );
        unset($data['tel']);
        $edu = C('job_edu');
        foreach ($edu as $val) {
            if ($val == $data['edu']) {
                $data['edu'] = array_search($val, $edu);
                break;
            }
        }

        $sex = C('user_sex');
        foreach ($sex as $val) {
            if ($val == $data['sex']) {
                $data['sex'] = array_search($val, $sex);
                break;
            }
        }

        if (!is_numeric($data['edu'])) {
            $data['edu'] = 3;
        }

        $z = M('User')->where($where)->data($data)->save();
        $this->redirect('edit_info');
//        var_dump($z);die;
    }
    /*
 *添加评论
 */
    public function add_comment()
    {
        $add['job_id'] = I('job_id');
        //$add['content'] = htmlspecialchars(I('post.content'));
        $add['content'] = I('content');
        if(session('?company')){
            $row =  array('status'=>-4,'msg'=>'请以用户身份登录','result'=>'');
            exit(json_encode($row));
        } else if(!session('?user')) {
            $row =  array('status'=>-2,'msg'=>'请以用户身份登录再评论','result'=>'');
            exit(json_encode($row));
        }
        $userLogic = new UserLogic();
        $res = $userLogic->is_complete($this->user_id);
        if($res['status'] != 1) {
            $return['status'] = -1;
            $return['msg'] = $res['msg'];
            exit(json_encode($return));
        }
        $add['author_id'] = $this->user_id;
        $logic = new UserLogic();
        //添加评论
        $row = $logic->add_comment($add);
        exit(json_encode($row));
    }

}