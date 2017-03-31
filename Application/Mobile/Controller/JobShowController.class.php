<?php
namespace Mobile\Controller;
use Think\Controller;
use Think\AjaxPage;
use Home\Logic\JobLogic;
use Home\Logic\UserLogic;
class JobShowController extends BaseController {
	//显示indexShow的信息
    public function index(){

        $jid = I('jid');
        $from = I('from');
        if (!empty($from)){
            $this->redirect('JobShow/index',array('jid' => $jid));exit;
        }
        $jobLoc = new JobLogic();
        $res = $jobLoc->get_job_info($jid);
        if (empty($res['data'])){
            header("Location: ".U('Index/index'));exit;
        }else{
            //以后添加是否投递过简历的判断
            $res = $res['data'];
            $res['pure_text'] = DeleteHtml($res['text']) ;
//var_dump($res);die;
            if(session('?company')){
                $contact_way = 0;
                $msg = '企业用户不能查看联系信息';
            }else if(empty($this->user_id)){
                $contact_way = 0;
                $msg = '请登录后查看联系方式';
            }else{
                $logic = new UserLogic();
                $z = $logic->is_complete($this->user_id);
                if($z['status'] == 1){
                    $contact_way = 1;
                }else{
                    $contact_way = 0;
                    $msg = $z['msg'];
                }
            }
            $weixin_config = $this->get_weixin_config($jid);
//            var_dump($weixin_config);die;
            //輸出到模板
            $this->assign('contact_way',$contact_way);
            $this->assign('weixin_config',$weixin_config);
            $this->assign('msg',$msg);
            $this->assign('res_job',$res);
//            $this->assign('res_company',$res_company);
//            $this->assign('showCol',$showCol);
            $this->display();
        }
    }

    public function get_weixin_config($jid)
    {
//        https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET
        $access_token = $this->get_access_token();
        $jsapi_ticket = $this->get_jsapi_ticket($access_token);
        $timestamp = time();
        $noncestr = md5($timestamp);
        $url = C('HTTPS_DOMAIN').U('Mobile/JobShow/index',array('jid'=>$jid));

        $str = 'jsapi_ticket='.$jsapi_ticket.'&noncestr='.$noncestr.'&timestamp='.$timestamp.'&url='.$url;
        $signature = sha1($str);
        $weixin_config = array(
            'signature' => $signature,
            'noncestr'=> $noncestr,
            'timestamp' => $timestamp,
            'url' => $url,
            'jsapi_ticket' => $jsapi_ticket,
        );
        return $weixin_config;

    }

    private function get_access_token()
    {
//        https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET
        if(!empty(S('access_token'))){
            return S('access_token');
        }
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.C('MP_APPID').'&secret='.C('MP_APPSECRET');
        $data = get_request($url);
        $data = json_decode($data,true);
        S('access_token',$data['access_token'],7100);
        return S('access_token');

    }

    private function get_jsapi_ticket($access_token)
    {
//        https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi
        if(!empty(S('jsapi_ticket'))){
            return S('jsapi_ticket');
        }
        $url = 'https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token='.$access_token.'&type=jsapi';
        $data = get_request($url);
        $data = json_decode($data,true);
        S('jsapi_ticket',$data['ticket'],7200);
        return S('jsapi_ticket');

    }
	public function index_old(){
	    $jid = I('jid');
		$user=M('user');
		$id=session('user.id');
		$map = array(
		    'id' => $id,
        );
		$res_user=$user->where($map)->find();
		if($res_user){
			$this->data['username']=$res_user['username'];
		}

		//搜索职位信息
		$job=M('Job');
		$jid_map = array(
		    'jid' => $jid,
            'state' => 1,
        );
		$res_job=$job->where($jid_map)->find();
        if (!$res_job) {
            header("Location: ".U('Index/index'));exit;
        }
		//搜索公司信息
		$company=M('company');
        $res_company=$company->where("id={$res_job['company_id']}")->find();
        $res_company['scale'] = C('company_scale')[$res_company['scale']];
        $res_company['invest'] = C('company_invest')[$res_company['invest']];
		//以后添加收藏框的判断
		$user_col=M('user_collect_job');
        $col_map = array(
            'job_id' => $jid,
            'user_id' => $_SESSION['user']['id'],
        );
        $res_user_col=$user_col->where($col_map)->find();
		if($res_user_col){
			$showCol= 1;
		}else{
			$showCol= 0;
		}

		//以后添加是否投递过简历的判断


		//輸出到模板
		$this->assign('data',$this->data);
		$this->assign('res_job',$res_job);
		$this->assign('res_company',$res_company);
		$this->assign('showCol',$showCol);
		$this->display();
	}

    function ajaxComment($collect_list) {
        $this->assign('collect_list',$collect_list);
        return $this->fetch('User/ajaxCollect');

    }

	//简历的投递
	public function resumeSend(){
        if(!session('?user.id')){
            $this->redirect('User/login');
        }else{
            $send=M('send');
            $data['company_id']=$_GET['company_id'];
            $data['job_id']=$_GET['job_id'];
            $data['user_id']=$_GET['uid'];
            $data['state1_time']=time();
            $res_send=$send->add($data);
            if($res_send){
                $this->redirect('JobShow/index', array('jid' => $data['job_id']));
            }else{
                $this->redirect('JobShow/index', array('jid' => $data['job_id']));
            }
        }
	}
}