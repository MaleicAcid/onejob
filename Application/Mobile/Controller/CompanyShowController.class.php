<?php
namespace Mobile\Controller;
use Think\Controller;
use Think\AjaxPage;
use Home\Logic\CompanyLogic;
class CompanyShowController extends BaseController {


    public function index()
    {
        $com_id = I('id');
        $to_jid = I('from_jid');
        $jobLoc = new CompanyLogic();
        $res = $jobLoc->get_company_info($com_id);
        if (empty($res['data'])){
            header("Location: ".U('Index/index'));exit;
        }else{
            //以后添加是否投递过简历的判断
            $res = $res['data'];

            //輸出到模板
            $this->assign('to_jid',$to_jid);
            $this->assign('info',$res);
            $this->display();
        }
    }

        //未完成
    public function get_ajax_comment() {
        $is_ajax = I('is_ajax');
        $jid = I('jid');

        $count = M('user_activity')->where(array('user_id'=>$user_id,'status'=>1))->count();
        $page = new AjaxPage($count,8,'show');
        $show = $page->show();
        //获取评论列表
        $sql = "SELECT c.collect_id,c.add_time,c.activity_id,c.is_remind,c.is_comet_remind,g.id,g.title,g.content,g.type,g.startdate,g.enddate FROM __PREFIX__user_activity c ".
            "inner JOIN __PREFIX__activity g ON g.id = c.activity_id ".
            "WHERE  status = 1 and  c.user_id = ".$user_id.
            " ORDER BY c.add_time DESC LIMIT {$page->firstRow},{$page->listRows}";
        $result = M()->query($sql);
        $this->dealStrTime($result);
        $this->is_overDue($result);
        //var_dump($result);die;
        $return['status'] = 3;
        $return['msg'] = '获取成功';
        $return['result'] = $result;

        $return['show'] = $show;
        if($is_ajax == 1){
            $return["content"] = $this->ajaxComment($return['result']);
            $this->ajaxReturn($return);
        }

        return $return;
    }

    function ajaxComment($collect_list) {
        $this->assign('collect_list',$collect_list);
        return $this->fetch('User/ajaxCollect');

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