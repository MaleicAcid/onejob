<?php
namespace Mina\Controller;
use Think\Controller;
use Home\Logic\UserLogic;
use Home\Logic\JobLogic;
class UserController extends Controller {
    public $user_id = 0;
    public $user_type = 0;
    public $user = array();

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
//            $this->assign('user',$user); //存储用户信息
//            $this->assign('user_id',$this->user_id);
            }

        }else{
            $nologin = array(
                'login','pop_login','doLogin','logout','verify','finished',
                'verifyHandle','register','logout','doLogin',
                'user_info2','sendMail','add_user','ajaxRet','',''
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

    public function index(){
        $user_info = $this->user;
        $user_info['head_pic'] = get_https_img($user_info['head_pic']);

        $logic = new UserLogic();
        $row = $logic->get_user_rank($this->user_id);
        $user_info['rank'] = $row;
        returnApiSuccess('获取个人中心页信息成功',$user_info);
    }

//array (size=3)
//'session_key' => string 'u5WypvN5TR4TBqpCCYSIbw==' (length=24)
//'expires_in' => int 7200
//'openid' => string 'o-FPs0OkI5aM-QQUr7Wpva7Yzmqo' (length=28)
//{"flag":"Success","msg":"","data":[359255]}

    public function edit_user_info()
    {
        $user_info = $this->user;
        $user_info['head_pic'] = get_https_img($user_info['head_pic']);
        $user_info['realname'] = !empty($user_info['realname']) ? $user_info['realname'] : '未填写';
        $user_info['school'] = !empty($user_info['school']) ? $user_info['school'] : '未填写';
        $user_info['major'] = !empty($user_info['major']) ? $user_info['major'] : '未填写';
        $user_info['entry_year'] = !empty($user_info['entry_year']) ? $user_info['entry_year'] : '未填写';
        $user_info['tel'] = !empty($user_info['tel']) ? $user_info['tel'] : '未填写';
        $user_info['edu'] = C('job_edu')[$user_info['edu']];
        $user_info['sex'] = C('user_sex')[$user_info['sex']];
        returnApiSuccess('获取个人资料页信息成功',$user_info);
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
     * 用户收藏/取消收藏某一件职位
     * @param type $jid
     */
//  http://www.onejob111.com/index.php/Mina/User/collect_job/
    public function collect_job($jid)
    {
        $jid = I('jid');

//        if(!session('?user')) {
//            returnApiError('用户未登录');
//        }
        $userLogic = new UserLogic();
        $res = $userLogic->is_complete($this->user_id);
        if($res['status'] != 1) {
            returnApiError($res['msg']);
        }else{
        $data = $userLogic->collect_job($jid, $this->user_id);

        if ($data['status'] == 1){
            $jobLoc = new JobLogic();
            $jobLoc->add_collect_num($jid);
            returnApiSuccess('职位收藏成功');
        }else{
            returnApiSuccess('职位取消收藏成功');
        }
    }
    }

    /*
 *获取收藏的职位
 */
    public function job_collect(){
        $userLogic = new UserLogic();

        $data = $userLogic->get_job_collect($this->user_id);
        if (!empty($data['result'])){
            returnApiSuccess('获取职位收藏列表成功',$data['result']);
        }else{
            returnApiError('获取不到职位收藏列表了');
        }

    }

//ts212145
    /*
    *获取分享的职位
    */
    public function job_share()
    {
        $userLogic = new UserLogic();
        $data = $userLogic->get_job_share($this->user_id);
        if (!empty($data['result'])){
            returnApiSuccess('获取职位分享列表成功',$data['result']);
        }else{
            returnApiError('获取不到职位分享列表了');
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
        if($res['status'] != 1) {
            returnApiError($res['msg']);
        }else{
            $data = $userLogic->share_job($jid, $this->user_id);

            if ($data['status'] == 1){
                $jobLoc = new JobLogic();
                $jobLoc->add_share_num($jid);
                returnApiSuccess('添加分享记录成功');
            }else{
                returnApiSuccess($data['msg']);
            }
        }
    }

    public function delete_share_job()
    {
        $sid = I('sid');

//        if(!session('?user')) {
//            returnApiError('用户未登录');
//        }
        $userLogic = new UserLogic();
        $res = $userLogic->is_complete($this->user_id);
        if($res['status'] != 1) {
            returnApiError($res['msg']);
        }else{
            $data = $userLogic->delete_share_job($sid);

            if ($data['status'] == 1){
                returnApiSuccess($data['msg']);
            }else{
                returnApiError($data['msg']);
            }
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

        $add['author_id'] = $this->user_id;
        $logic = new UserLogic();
        $res = $logic->is_complete($this->user_id);
        if($res['status'] != 1) {
            returnApiError($res['msg']);
        }else{
        //添加评论
        $row = $logic->add_comment($add);
        if($row['status'] == 1) {
            returnApiSuccess('评论成功');
        }else{
            returnApiError($row['msg']);
        }
    }
    }

    public function update_sex()
    {
        $sex = I('sex');
        $logic = new UserLogic();
        //添加评论
            $row = $logic->update_sex($sex,$this->user_id);
            if($row['status'] == 1) {
                returnApiSuccess($row['msg']);
            }else{
                returnApiError($row['msg']);
            }

    }

    public function update_realname()
    {
        $realname = I('realname');
        $logic = new UserLogic();
        //添加评论
        $row = $logic->update_realname($realname,$this->user_id);
        if($row['status'] == 1) {
            returnApiSuccess($row['msg']);
        }else{
            returnApiError($row['msg']);
        }
    }

    public function update_school()
    {
        $school = I('school');
        $logic = new UserLogic();
        //添加评论
        $row = $logic->update_school($school,$this->user_id);
        if($row['status'] == 1) {
            returnApiSuccess($row['msg']);
        }else{
            returnApiError($row['msg']);
        }
    }

    public function update_major()
    {
        $major = I('major');
        $logic = new UserLogic();
        //添加评论
        $row = $logic->update_major($major,$this->user_id);
        if($row['status'] == 1) {
            returnApiSuccess($row['msg']);
        }else{
            returnApiError($row['msg']);
        }
    }

    public function update_edu()
    {
        $edu = I('edu');
        $logic = new UserLogic();
        //添加评论
        $row = $logic->update_edu($edu,$this->user_id);
        if($row['status'] == 1) {
            returnApiSuccess($row['msg']);
        }else{
            returnApiError($row['msg']);
        }
    }

    public function update_entry_year()
    {
        $entry_year = I('entry_year');
        $logic = new UserLogic();
        //添加评论
        $row = $logic->update_entry_year($entry_year,$this->user_id);
        if($row['status'] == 1) {
            returnApiSuccess($row['msg']);
        }else{
            returnApiError($row['msg']);
        }
    }
    public function update_head_pic()
    {
        if (IS_POST){
            $logic = new UserLogic();
            //添加评论
            $row = $logic->update_head_pic($this->user_id);
            if($row['code'] == 1) {
                returnApiSuccess($row['msg']);
            }else{
                returnApiError($row['msg']);
            }
        }

    }
    public function do_edit_info()
    {
        $data = I();
        if($_FILES['head_pic']){
            $userLog = new UserLogic();
            $pic = $_FILES['head_pic'];
            $userLog->update_head_pic($pic,$this->user_id);
        }

        $where = array(
            'id' => $this->user_id,
        );
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

        M('User')->where($where)->data($data)->save();
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
        $userLogic = new UserLogic();
        $res = $userLogic->mina_verify_tel($code,$this->user_id);
        if($res){
            returnApiSuccess('手机绑定成功');
        }
        returnApiError('输入的验证码不匹配');

    }


    public function is_complete()
    {
        $userLogic = new UserLogic();
        $res = $userLogic->is_complete($this->user_id);
        if($res['status'] != 1) {
            returnApiError($res['msg']);
        }else{
            returnApiSuccess($res['msg']);
        }
    }


}