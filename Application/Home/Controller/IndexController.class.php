<?php
namespace Home\Controller;
use Think\Controller;
use \Home\Service\Category;
use \Common\Service\HotCompanies;
use \Common\Service\Link;
use Home\Logic\JobLogic;
use \Common\Service\ShortNotice;
class IndexController extends Controller {
    public function index() {
        // 如果是手机跳转到 手机模块
        if(true == isMobile()){
            header("Location: ".U('Mobile/Index/index'));
        }
        $res_category = Category::getInstance();
        $res_category = $res_category->mCategory;

        $link = Link::getInstance();
        $link = $link->link;
        $num = sizeof($link);
        for ($i=1;$i<=$num;$i++) {
            $link_num[$i] = true ;
        }
//        $index_jobs = $this->get_index_jobs();

        $jobLog = new JobLogic();
        $index_jobs = $jobLog->get_index_job();


        $hot_com = HotCompanies::getInstance();
        $hot_com = $hot_com->getHotCompanies(8);

//        var_dump($index_jobs);die;

//        $this->assign('page',$page->show());
        $this->assign('hot_com', $hot_com);
        $this->assign('res_category',$res_category);
        $this->assign('index_jobs',$index_jobs);
        $this->assign('link',$link);
        $this->assign('link_num',$link_num);
//        var_dump($link_num);die;
        $this->display();

    }

    public function get_short_msg()
    {
        $is_ajax = I('is_ajax');
        $short_notic = ShortNotice::getInstance();
        $short_notic = $short_notic->short_notice;
//        var_dump($short_notic);
        if($is_ajax == 1){
            exit(json_encode($short_notic));
        } else{
            die;
            return $short_notic;
        }

    }
    public function get_index_jobs() {
        $is_ajax = I('is_ajax');

        $jobLog = new JobLogic();
        $index_jobs = $jobLog->get_index_job();

        if($is_ajax == 1){
            $this->assign('index_jobs',$index_jobs);
            $this->display('ajax_index_jobs');
        }
        return $index_jobs;

    }
    //首页的显示遍历
	public function index_old(){
		//显示首页用户名
		$user=M('users');
		$id=session('user.id');
        $map = array(
            'id' => $id,
        );
		$res_user=$user->where($map)->find();
		if($res_user){
			$this->data['username']=$res_user['username'];
		}
		//显示首页的职位分类
		$job_category=M('job_category');
//		$res_category=$this->getCates();
        $res_category = Category::getInstance();
        $res_category = $res_category->mCategory;
        //$type = $cate->getParent($job['name']);

		//显示热门职位的分类
		$res_hotjob=$this->showHot();
		//显示最新职位的分类
		$res_newjob=$this->newJob();
        //广告位的显示
        $res_advert=$this->showadvert();
        $res_adverts=$this->showadverts();
        //友情链接
        $friend=$this->friend();
		//输出到模板
		$this->assign('data',$this->data);
		$this->assign('cates',$res_category);
		$this->assign('hotjob',$res_hotjob);
		$this->assign('newjob',$res_newjob);
        $this->assign('advert',$res_advert);
        $this->assign('adverts',$res_adverts);
        $this->assign('friend',$friend);
		$this->display();
		//var_dump($res_category);
	}
    //遍历数组的子分类
    public function getCates($pid=0){
        $cate = M('job_category');
        $cates = $cate->where("pid=".$pid)->select();
        //遍历分类
        $arr = array();
        if($cates){
	        foreach ($cates as $key => $value) {
	            // var_dump($value['id']);
	            $temp['id'] = $value['id'];
	            $temp['name'] = $value['name'];
	            $temp['pid']=$value['pid'];
	            //递归获取子集分类
	            $temp['sub'] = $this->getCates($temp['id']);
	            $arr[] = $temp; 
	        }
	        return $arr;      	
        }
    }
    //遍历显示热门职位
    public function showHot(){
    	$user_col = M('user_col');
    	$job = M('job');
    	$company = M('company');
    	$res_user_col=$user_col->query("select job_id,count(job_id) as times from __PREFIX__user_col GROUP BY job_id order by times desc limit 10");
    	foreach($res_user_col as $key=>$value){
    		$id=$value['job_id'];
    		$arr=$job->where("id={$id}")->find();
    		$cid=$arr['company_id'];
    		$arr['company']=$company->where("id={$cid}")->find();
    		$hot_job[]=$arr;
    	}
    	//var_dump($hot_job);
    	return $hot_job;
    }
    //最新职位的显示
    public function newJob(){
    	$job = M('job');
    	$company = M('company');
    	$res_job=$job->order('id desc')->limit(10)->select();
    	foreach($res_job as $key=>$value){
    		$id=$value['company_id'];
    		$arr=$value;
    		$arr['company']=$company->where("id={$id}")->find();
    		$new_job[]=$arr;    		
    	}
    	return $new_job;
    }

    public function companyList()
    {
        $companies = $this->get_company_list();

        $hot_com = HotCompanies::getInstance();
        $hot_com = $hot_com->getHotCompanies(4);
//        var_dump($hot_com);die;
        $this->assign('hot_com', $hot_com);
        $this->assign('companies', $companies);
        $this->display();
    }

    public function get_company_list() {
        $is_ajax = I('is_ajax');

        $jobObj = D('Job');
        $tagModel = D('Tag');
        $comObj = D('Company');
        $state_map = array(
            'state' => 1,//已认证
            'status' => 1,//启用状态
        );
        $total = $comObj->where($state_map)->count();
        $page = new \Think\Page($total, 15);
        $page->setConfig('first', '首页');
        $page->setConfig('prev', '上一页');
        $page->setConfig('next', '下一页');
        $page->setConfig('last', '尾页');

        $field_map = array(
            'id','name','short_name','logo','city','scale','trade','invest','view_num'
        );
        $companies = $comObj->limit($page->firstRow, $page->listRows)->where($state_map)->order('is_top')->field($field_map)->select();

        foreach ($companies as &$val) {
            $job_num_map =array(
                'company_id' => $val['id'],
                'status' => 1,
                'state' => 1,
            );
//            $res2 = $tagModel->getList($val['id']);//获取标签
            $res3 = $jobObj->where($job_num_map)->count();
//            $val['tag'] = $res2;
            $val['job_num'] = $res3;
            $val['scale'] = C('company_scale')[$val['scale']];
            $val['logo'] = get_https_img($val['logo']);
            $val['invest'] = C('company_invest')[$val['invest']];
        }
        if($is_ajax == 1){
            $this->assign('companies',$companies);
            $this->display('ajax_companies');
        }
        return $companies;

    }


    // 公司展示页
    public function showCompany()
    {
        $id = I('id');
        $map = array(
            'id' => $id
        );
        $comObj = D('Company');
        $data['company_id'] = $id;
        $company = $comObj->where($map)->find();
        $company['scale'] = C('company_scale')[$company['scale']];
        $company['stage'] = C('company_stage')[$company['stage']];


        $jobObj = D('Job');
        $job = $jobObj->where($data)->select();
        $jobnum = $jobObj->where($data)->count();

        $this->assign('company', $company);
        $this->assign('job', $job);
        $this->assign('jobnum', $jobnum);
        $this->display();
    }

    // 公司筛选功能
    public function search()
    {
        $data = I();
        $comObj = D('Company');
        if ($data['city'] == '全国') {
            $where['city'] == '';
        } else {
            $where['city'] = $data['city'];
        }
        $where['stage'] = array_flip(C('company_stage'))[$data['fs']];
        $where['trade'] = array('like', '%'.$data['ifs'].'%');
        $where = array_filter($where);
        $total = $comObj->where($where)->count();
        $page = new \Think\Page($total, 15);
        $page->setConfig('first', '首页');
        $page->setConfig('prev', '上一页');
        $page->setConfig('next', '下一页');
        $page->setConfig('last', '尾页');

        $jobObj = D('Job');
        $tagModel = D('Tag');
        $res = $comObj->where($where)->limit($page->firstRow, $page->listRows)->select();
        foreach ($res as &$val) {
            $res2 = $tagModel->getList($val['id']);
            $res3 = $jobObj->where(array('company_id'=>$val['id']))->limit(4)->select();
            $val['tag'] = $res2;
            $val['job'] = $res3;
        }

        $tradeObj = D('Trade');
        $trade = $tradeObj->select();
        $this->assign('page', $page->show());
        $this->assign('trade', $trade);
        $this->assign('company', $res);
        $this->display();
    }
    //首页广告位
    public function showadvert(){
        $company=M('company');
        $res_company=$company->limit(0,6)->select();
        return $res_company;
    }
    public function showadverts(){
        $company=M('company');
        $res_company=$company->limit(6,6)->select();
        return $res_company;
    }
    //首页友情链接
    public function friend(){
    	$links=M('links');
    	$res_links=$links->select();
    	return $res_links;
    }

}
