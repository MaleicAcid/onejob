<?php
namespace Home\Controller;
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
                '','login','pop_login','doLogin','logout','verify','finished',
                'verifyHandle','register','logout','doLogin',
                'send_tel_verify','sendMail','add_user','ajaxRet','collect_job','add_comment'
            );
            if(!in_array(ACTION_NAME,$nologin)){
                //$this->redirect(U('Home/Users/login'));
                header("location:".U('Home/Users/login'));
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
        $map['edu'] = $user_info['edu'];
        $map['sex'] = $user_info['sex'];
        $user_info['edu'] = C('job_edu')[$user_info['edu']];
        $user_info['sex'] = C('user_sex')[$user_info['sex']];
        $job_edu = C('job_edu');
        unset($job_edu[6]);
        $logic = new UserLogic();
        $is_tel = $logic->is_tel($this->user_id);
        $sex = C('user_sex');

        $this->assign('map',$map);
        $this->assign('is_tel',$is_tel);
        $this->assign('user_sex',$sex);
        $this->assign('job_edu',$job_edu);
//        var_dump($user_info);die;
        $this->assign('user_info',$user_info);
        $this->display('index');
    }

    public function get_user_rank()
    {
        $logic = new UserLogic();
        $row = $logic->get_user_rank($this->user_id);
        return $row+1;
    }
    public function update_detail()
    {
        $arr = I();

        $logic = new UserLogic();
        //添加评论
//        var_dump($_FILES['head_pic']);die;
        $row = $logic->update_head_pic($this->user_id);
//        if($row['code'] == 1) {
//            returnApiSuccess($row['msg']);
//        }else{
//            returnApiError($row['msg']);
//        }

        foreach ($arr as $k=>$val){
            if(empty($val)){
                continue;
            }
            $data[$k]= $val;
        }
        $data['updatetime'] = time();
//        $data['sex'] = array_search($data['sex'],C('user_sex'));
//        $data['edu'] = array_search($data['edu'],C('job_edu'));
        $data['login_time'] = time();

        $where = array(
            'id' =>$this->user_id,
        );

        $z = M('User')->where($where)->data($data)->save();
        $msg['msg'] = '保存失败，请稍后再试';
        $msg['status'] = 1;
        if ($z){
            $msg['msg'] = '保存成功';
            $msg['status'] = 1;
            $this->ajaxReturn($msg);
        }
        $this->ajaxReturn($msg);
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
        if($res['status'] != 1) {
            $row =  array('status'=>-4,'msg'=>$res['msg'],'result'=>'');
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
            $this->display('ajax_job_collect');
        }
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

        $add['author_id'] = $this->user_id;
        $logic = new UserLogic();
        $data = $logic->is_complete($this->user_id);
        if($data['status'] != 1){
            $row =  array('status'=>-4,'msg'=>$data['msg'],'result'=>'');
            exit(json_encode($row));
        }
        //添加评论
        $row = $logic->add_comment($add);
        exit(json_encode($row));
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
        $userLogic = new UserLogic();
        $res = $userLogic->verify_tel($code,$this->user_id);
        if($res){
            $this->ajaxReturn(array('status'=>1,'msg'=>'手机绑定成功'));
        }
        $this->ajaxReturn(array('status'=>-1,'msg'=>'输入的验证码不匹配'));

    }
}