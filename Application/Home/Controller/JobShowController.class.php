<?php
namespace Home\Controller;
use Think\Controller;
use Think\Page;
use Home\Logic\JobLogic;
use Home\Logic\UserLogic;
class JobShowController extends BaseController {
	//显示indexShow的信息
	public function index(){
        $jid = I('jid');
	    if (isMobile()){
            $this->redirect('Mobile/JobShow/index', array('jid' => $jid));
            exit;
        }

        $jobLoc = new JobLogic();
        $res = $jobLoc->get_job_info($jid);
        if (empty($res['data'])){
            header("Location: ".U('Index/index'));exit;
        }else{
            //以后添加是否投递过简历的判断
            $res = $res['data'];
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

            //輸出到模板
            $this->assign('contact_way',$contact_way);
            $this->assign('msg',$msg);
            $this->assign('res_job',$res);
//            $this->assign('res_company',$res_company);
//            $this->assign('showCol',$showCol);
            $this->display();
        }
    }

    /**
     * 职位评论ajax分页
     */
    public function get_job_comment()
    {
        $com_id = I('id');
        $jid = I('jid');
        $is_mobile = I('is_mobile');
        $jobLoc = new JobLogic();

        $res = $jobLoc->get_job_comment($jid);

        //以后添加是否投递过简历的判断
        $res = $res['data'];

        $where = array(
            'jid' => $jid,

        );
        $company_id = M('Job')->field('company_id')->where($where)->find();
        $company_id = $company_id['company_id'];
        if($company_id == session('company.id')){
            $is_author = 1;
        }else{
            $is_author = 0;
        }
        $this->assign('commentlist', $res);// 职位评论
        $this->assign('is_author', $is_author);
        if ($is_mobile == 1){
            $this->display('Mobile@JobShow:get_job_comment');
        }else{
            $this->display();
        }

    }

	//收藏按钮的点击
	public function collection(){
		if(!session('?user.id')){
			$this->redirect('User/login');
		}else{
			$user_col=M('user_col');
			$res_user_col=$user_col->where($_GET)->find();
			if($res_user_col){
				$user_col->where($_GET)->delete();
				$this->redirect('JobShow/index',array('jid'=>$_GET['job_id']));
			}else{
				$user_col->add($_GET);
				$this->redirect('JobShow/index',array('jid'=>$_GET['job_id']));
			}
		}
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