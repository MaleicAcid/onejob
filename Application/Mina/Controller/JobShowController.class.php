<?php
namespace Mina\Controller;
use Home\Logic\UserLogic;
use Think\Controller;
use Think\Page;
use Home\Logic\JobLogic;
class JobShowController extends BaseController {
	//显示indexShow的信息
	public function index(){
        $jid = I('jid');
        $third_session = I('third_session');
        $data = check_third_session($third_session);
        if(empty($this->user_id)) {
            $is_complete = 0;
        }else{
            $logic = new UserLogic();
            $res = $logic->is_complete($this->user_id);
            if($res['status'] == 1) {
                $is_complete = 1;
            }else{
                $is_complete = 0;
            }
        }
        $jobLoc = new JobLogic();

        $res = $jobLoc->mina_get_job_info($jid,$this->user_id);

        $res['data']['is_complete'] = $is_complete;
        if(!empty($res['data'])) {
            $jobLoc->add_view_num($jid);
            returnApiSuccess('获取职位信息成功',$res['data']);
        }else{
            returnApiError( '获取职位信息失败');
        }

	}

    public function get_job_comment() {
        $com_id = I('id');
        $jid = I('jid');
        $jobLoc = new JobLogic();
        $res = $jobLoc->get_job_comment($jid,$com_id);
        if (empty($res['data'])){
            returnApiError( '获取职位评论信息失败');
        }else{
            //以后添加是否投递过简历的判断
            $res = $res['data'];

            returnApiSuccess('获取职位评论信息成功',$res);
        }
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