<?php
namespace Mobile\Controller;
use Think\Controller;
use \Home\Service\Category;
use \Common\Service\HotCompanies;
use Home\Logic\JobLogic;
class IndexController extends Controller {
    public function index() {
        $index_jobs = $this->get_index_jobs();

        $this->assign('index_jobs',$index_jobs);
        $this->display();

    }

    public function get_index_jobs() {
        $is_ajax = I('is_ajax');

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
            'jid','company_id','salary_high','salary_low','name','create_time','work_year','edu','need_people',
        );
        $index_jobs = $jobObj->limit($page->firstRow, $page->listRows)->where($top_hot)->order('create_time desc')->field($field_map)->select();
        foreach ($index_jobs as &$val) {
            $val['c_name'] = getCompanyName($val['company_id']);
            $val['edu'] = C('job_edu')[$val['edu']];
        }
        if($is_ajax == 1){
            $this->assign('index_jobs',$index_jobs);
            $this->display('m_ajax_index_jobs');
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
            'id','name','short_name','logo','city','scale','invest'
        );
        $companies = $comObj->limit($page->firstRow, $page->listRows)->where($state_map)->order('is_top')->field($field_map)->select();

        foreach ($companies as &$val) {
            $job_num_map =array(
                'company_id' => $val['id'],
                'statue' => 1,
                'state' => 1,
            );
//            $res2 = $tagModel->getList($val['id']);//获取标签
            $res3 = $jobObj->where($job_num_map)->count();
//            $val['tag'] = $res2;
            $val['job_num'] = $res3;
        }
        if($is_ajax == 1){
            $this->assign('companies',$companies);
            $this->display('ajax_companies');
        }
        return $companies;

    }

    // 公司列表页
    public function companylist_old()
    {
        $jobObj = D('Job');
//        $tagModel = D('Tag');//获取标签
        $comObj = D('Company');
        $total = $comObj->count();
        $page = new \Think\Page($total, 15);
        $page->setConfig('first', '首页');
        $page->setConfig('prev', '上一页');
        $page->setConfig('next', '下一页');
        $page->setConfig('last', '尾页');
        $res = $comObj->limit($page->firstRow, $page->listRows)->select();



//        $tradeObj = D('Trade');
//        $trade = $tradeObj->select();

        $this->assign('page', $page->show());
//        $this->assign('trade', $trade);
        $this->assign('company', $res);
        $this->display();
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
        
        $comTagObj = D('CompanyTag');
        $tagObj = D('Tag');
        $res = $comTagObj->where($data)->select();
        $str = '';
        if ($res) {
            foreach($res as $val) {
                $str .= $val['tag_id'].',';
            }
            $str = rtrim($str, ',');
            $where['id'] = array('in', $str);
            $tag = $tagObj->where($where)->select();
            $this->assign('tag', $tag);
        }
        $result1 = $tagObj->where('type > 0')->limit(12)->select();
        $result2 = $tagObj->where('type > 0')->limit('12,10')->select();

        $productObj = D('Product');
        $product = $productObj->where($data)->select();

        $teamObj = D('Team');
        $team = $teamObj->where($data)->select();

        $jobObj = D('Job');
        $job = $jobObj->where($data)->select();
        $jobnum = $jobObj->where($data)->count();

        $this->assign('company', $company);
        $this->assign('allTag1', $result1);
        $this->assign('allTag2', $result2);
        $this->assign('product', $product);
        $this->assign('team', $team);
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
