<?php
/**
 *
 */

namespace Home\Logic;
use Think\Page;
use Think\Model\RelationModel;

/**
 * 分类逻辑定义
 * Class CatsLogic
 * @package Home\Logic
 */
class JobLogic extends RelationModel
{

    public function get_index_job()
    {
        $jobObj = D('Job');

        $is_top =array('GT',0);
        $top_hot = array(
//            'is_hot' => 1,
//            'is_top' => $is_top,
            'state' => 1,
        );
        $total = $jobObj->where($top_hot)->count();
        $page = new \Think\Page($total, 10);
        $page->setConfig('first', '首页');
        $page->setConfig('prev', '上一页');
        $page->setConfig('next', '下一页');
        $page->setConfig('last', '尾页');
        $field_map = array(
            'jid','edu','work_year','need_people','company_id','salary_high','salary_low','name','end_time','create_time'
        );
        $index_jobs = $jobObj->limit($page->firstRow, $page->listRows)->where($top_hot)->order('create_time desc')->field($field_map)->select();
        foreach ($index_jobs as &$val) {
            $val['c_name'] = getCompanyName($val['company_id']);
            $val['c_logo'] = getCompanyLogo($val['company_id']);
            $val['edu'] = C('job_edu')[$val['edu']];
            $val['work_year'] = C('work_year')[$val['work_year']];
            $val['create_time'] = friendlyDate($val['create_time']);
            $val['end_time'] = date('Y-m-d', $val['end_time']);
        }

        return $index_jobs;
    }

    public function mina_get_job_info($jid,$uid)
    {
        //搜索职位信息
        $job=M('Job');
        $jid_map = array(
            'jid' => $jid,
            'state' => 1,
            'status' => 1,
        );
        $res_job=$job->where($jid_map)->find();
        if (!$res_job) {
            return array('code'=>-1,'msg'=>'获取职位信息失败');
        }
        $res_job['edu'] = C('job_edu')[$res_job['edu']];
        $res_job['work_year'] = C('work_year')[$res_job['work_year']];
        $res_job['end_time'] = friendlyDate($res_job['end_time']);
        //搜索公司信息
        $company=M('company');
        $res_company=$company->where("id={$res_job['company_id']}")->find();
        $res_company['scale'] = C('company_scale')[$res_company['scale']];

        $res_company['invest'] = C('company_invest')[$res_company['invest']];

        //以后添加收藏框的判断
        $user_col=M('user_collect_job');
        $col_map = array(
            'job_id' => $jid,
            'user_id' => $uid,
        );
        $res_user_col=$user_col->where($col_map)->find();

        if($res_user_col){
            $showCol= 1; //1显示为pink 0为grey
        }else{
            $showCol= 0;
        }
        $res_job['company_info'] = $res_company;
        $res_job['showCol'] = $showCol;
        return array('code'=>1,'msg'=>'获取职位信息成功','data'=>$res_job);
    }

    public function get_job_info($jid)
    {
        //搜索职位信息
        $job=M('Job');
        $jid_map = array(
            'jid' => $jid,
            'state' => 1,
            'status' => 1,
        );
        $res_job=$job->where($jid_map)->find();
        if (!$res_job) {
            return array('code'=>-1,'msg'=>'获取职位信息失败');
        }
        $res_job['edu'] = C('job_edu')[$res_job['edu']];
        $res_job['work_year'] = C('work_year')[$res_job['work_year']];
        $res_job['end_time'] = date('Y-m-d', $res_job['end_time']);
        $res_job['create_time'] = friendlyDate($res_job['create_time']);
        //搜索公司信息
        $company=M('company');
        $res_company=$company->where("id={$res_job['company_id']}")->find();
        $res_company['scale'] = C('company_scale')[$res_company['scale']];
        $res_company['logo'] = get_https_img($res_company['logo']);
        $res_company['invest'] = C('company_invest')[$res_company['invest']];

        //以后添加收藏框的判断
        $user_col=M('user_collect_job');
        $col_map = array(
            'job_id' => $jid,
            'user_id' => $_SESSION['user']['id'],
        );
        $res_user_col=$user_col->where($col_map)->find();

        if($res_user_col){
            $showCol= 1; //1显示为pink 0为grey
        }else{
            $showCol= 0;
        }
        $res_job['company_info'] = $res_company;
        $res_job['showCol'] = $showCol;
        return array('code'=>1,'msg'=>'获取职位信息成功','data'=>$res_job);
    }

    public function get_job_comment($jid)
    {

        $where = array(
            'is_show' => 1,
            'job_id' => $jid,
            'pid' => 0,
        );

        $count = M('Comment')->where($where)->count();
        $page = new Page($count,5);
        $show = $page->show();
        $list = M('Comment')->where($where)->order("add_time desc")->limit($page->firstRow.','.$page->listRows)->select();
        if (empty($list)) {
            return array('code'=>-1,'msg'=>'获取不到评论信息了');
        }

        foreach ($list as $key=>&$val) {
            $val['name'] = getUserName($val['author_id']);
            $val['add_time'] = friendlyDate($val['add_time']);
            $val['head_pic'] = getUserHeadPic($val['author_id']);

            $map = array(
                'is_show' => 1,
                'job_id' => $jid,
                'pid' => $val['comment_id']
            );
            $reply = M('Comment')->where($map)->find();
            if ($reply) {
                $val['reply'] = $reply;
                $val['reply']['name'] = getCompanyName($val['reply']['author_id']);
                $val['reply']['logo'] = getCompanyLogo($val['reply']['author_id']);
                $val['reply']['add_time'] = friendlyDate($val['reply']['add_time']);
            }
        }
        return array('code'=>1,'msg'=>'获取评论信息成功','data'=>$list);
    }

    public function add_view_num($jid)
    {
        $where = array(
            'jid' => $jid,
        );
        M("Job")->where($where)->setInc('view_num',1);
    }

    public function add_collect_num($jid)
    {
        $where = array(
            'jid' => $jid,
        );
        M("Job")->where($where)->setInc('collect_num',1);
    }
    public function add_share_num($jid)
    {
        $where = array(
            'jid' => $jid,
        );
        M("Job")->where($where)->setInc('share_num',1);
    }

    public function edit_job_info($jid)
    {
        //公司编辑职位信息
        $job=M('Job');
        $jid_map = array(
            'jid' => $jid,
            'status' => 1,
        );
        $res_job=$job->where($jid_map)->find();
        if (!$res_job) {
            return array('code'=>-1,'msg'=>'获取职位信息失败');
        }
        $res_job['work_year'] = C('work_year')[$res_job['work_year']];
        $res_job['edu'] = C('job_edu')[$res_job['edu']];
        $res_job['end_time'] = friendlyDate($res_job['end_time']);

        return array('code'=>1,'msg'=>'获取职位信息成功','data'=>$res_job);
    }

    public function school_edit_job_info($jid)
    {
        //公司编辑职位信息
        $job=M('Job');
        $jid_map = array(
            'jid' => $jid,
            'status' => 1,
        );
        $res_job=$job->where($jid_map)->find();
        if (!$res_job) {
            return array('code'=>-1,'msg'=>'获取职位信息失败');
        }

        $company = M('Company')->where('id = '.$res_job['company_id'])->find();
        $res_job['company'] = $company;
        $res_job['work_year'] = C('work_year')[$res_job['work_year']];
        $res_job['edu'] = C('job_edu')[$res_job['edu']];
        $res_job['create_time'] = friendlyDate($res_job['create_time']);

        return array('code'=>1,'msg'=>'获取职位信息成功','data'=>$res_job);
    }
}

 