<?php
namespace Home\Controller;
use Think\Controller;
use Think\Page;
use \Common\Service\HotCompanies;
use \Common\Service\Category;
//include '/usr/local/xunsearch/sdk/php/lib/XS.php';
class SearchController extends Controller {
//util/Indexer.php --rebuild --source=mysql://maleic:XXXXmm1000@127.0.0.1/onejob --sql="SELECT jid,name,text,create_time,is_top,is_hot,view_num,edu,work_year,need_people,company_id,salary_low,salary_high,address,city,cate_id,cate_path FROM oj_job where status = 1 and state = 1" --filter=debug --project=onejob >/usr/local/xunsearch/sdk/php/util/log.txt
    public function index()
    {
        $parm = array();

        $p = I('p');
        $parm['job_edu'] = I('edu');
        $parm['cate_id'] = I('cate_id');
        $job = I('job');
        $query = I('query');
        $is_ajax = I('is_ajax');
        $is_mobile = I('is_mobile');
        if ($is_ajax) {
            $displayName = 'm_ajax_search_jobs';
        }else{
            $displayName = 'index';
        }
        if ($is_mobile) {
            $displayName = 'Mobile@Index:m_ajax_index_jobs';
        }

        if(empty($query)){
            $query = $job;
        }

        // base url

        $hot_com = HotCompanies::getInstance();
        $hot_com = $hot_com->getHotCompanies(4);
//        var_dump($hot_com);die;
        $this->assign('hot_com', $hot_com);
        $this->assign('query', $query);

//        $query = 'java';
        //拿到cate_id后递归查找所有满足的子编号,然后or搜索并排序
        $final_query = '';
        try {
            $xs = new \XS('onejob');
            $search = $xs->search;
            $search->setCharset('UTF-8');

            if (empty($query) && empty($parm)) {
//                echo 'no param';
                // just show hot query
                $p = max(1, intval($p));
                $n = \XSSearch::PAGE_SIZE;
                $search->setLimit($n, ($p - 1) * $n);
                $hot = $search->getHotQuery();
                $data = array();
                foreach ($hot as $k=>&$val) {
                    $data[$k]['jid'] = $val['jid'];
                    $data[$k]['name'] = $val['name'];
                    $data[$k]['company_id'] = $val['company_id'];
                    $data[$k]['need_people'] = $val['need_people'];
                    $data[$k]['edu'] = C('job_edu')[$val['edu']];
                    $data[$k]['work_year'] = C('work_year')[$val['work_year']];
                    $data[$k]['c_name'] = getCompanyName($val['company_id']);
                    $data[$k]['salary_high'] = $val['salary_high'];
                    $data[$k]['salary_low'] = $val['salary_low'];
                }
                $this->assign('jobs',$data);
                $this->display($displayName);
            } else {
//                echo 'have param';
                // fuzzy search
//                $search->setFuzzy($m === 'yes');

                // synonym search
//                $search->setAutoSynonyms($syn === 'yes');

                // set query
                $temp = array_search($parm['job_edu'], C('job_edu'));
                if(!empty($temp)) {
                    $edu_field = '(edu:'.$temp.')';
                }
                if(!empty($parm['cate_id'])) {
                    $str = $this->getCatePath($parm['cate_id']);
//                    var_dump($arr);

                    $cate_path = '(cate_path:'.'"'.$str.'"'.')';
//                    $cate_path = '(cate_path:0_5_34)';
                    $final_query.= $cate_path;
                }

                if (!empty($query)){
                    $final_query.=' '.'('.$query.')';
                }
//                echo $final_query;
//                echo $search->getQuery($final_query);
//                var_dump($final_query);
//                var_dump($search->getQuery($final_query));

        $bu = $_SERVER['SCRIPT_NAME'] . '?query=' . urlencode($final_query);
//                if (!empty($f) && $f != '_all') {
//                    $search->setQuery($f . ':(' . $q . ')');
//                } else {
//                    $search->setQuery($q);
//                }
                $search->setQuery($final_query);
                //设置排序
//                if (($pos = strrpos($s, '_')) !== false) {
//                    $sf = substr($s, 0, $pos);
//                    $st = substr($s, $pos + 1);
//                    $search->setSort($sf, $st === 'ASC');
//                }

                // set offset, limit
                $p = max(1, intval($p));
                $n = \XSSearch::PAGE_SIZE;
                $search->setLimit($n, ($p - 1) * $n);

                // get the result
                // 获取搜索结果
                $search_begin = microtime(true);
                $docs = $search->search();
                $search_cost = microtime(true) - $search_begin;
//                var_dump($docs);
//var_dump($docs);die;
                //获取搜索结果和总数
                $count = $search->getLastCount();
                $total = $search->getDbTotal();
                $data = array();
                foreach ($docs as $k=>&$val) {
                    $data[$k]['jid'] = $val['jid'];
                    $data[$k]['name'] = $val['name'];
                    $data[$k]['need_people'] = $val['need_people'];
                    $data[$k]['edu'] = C('job_edu')[$val['edu']];
                    $data[$k]['work_year'] = C('work_year')[$val['work_year']];
                    $data[$k]['company_id'] = $val['company_id'];
                    $data[$k]['c_name'] = getCompanyName($val['company_id']);
                    $data[$k]['salary_high'] = $val['salary_high'];
                    $data[$k]['salary_low'] = $val['salary_low'];
                }

//                returnApiSuccess('获取职位搜索结果成功',$data);

//                var_dump($docs);
//                if ('xml' !== 'yes') {
//                    // try to corrected, if resul too few
//                    //如果结果太少则尝试修正
//                    if ($count < 1 || $count < ceil(0.001 * $total)) {
//                        $corrected = $search->getCorrectedQuery();
//                    }
//                    //获取相关查询
//                    $related = $search->getRelatedQuery();
//                }

                // gen pager
                // 获取分页
                if ($count > $n) {
                    $pb = max($p - 5, 1);
                    $pe = min($pb + 10, ceil($count / $n) + 1);
                    $pager = '';
                    do {
                        $pager .= ($pb == $p) ? '<li class="disabled"><a>' . $p . '</a></li>' : '<li><a href="' . $bu . '&p=' . $pb . '">' . $pb . '</a></li>';
                    } while (++$pb < $pe);
                }
                $this->assign('page',$pager);
                $this->assign('jobs',$data);
                $this->display($displayName);
            }
        } catch (XSException $e) {
            $error = strval($e);
        }
    }

    public function getCatePath($cate_id=1)
    {
        $where = array(
            'id' => $cate_id,
        );
        $res = M('JobCategory')->where($where)->find();
//        if (!empty($res)){
            $res = $res['path'];
//        }
        return $res;
    }
	public function index_old(){
        echo "<meta http-equiv='Content-Type'' content='text/html; charset=utf-8'>";
        echo '搜索页面暂缺';die;
		//显示首页用户名
		$user=M('user');
		$id=session('user.id');
		$where = array(
		    'id' => $id,
        );
		$res_user=$user->where($where)->find();
		if($res_user){
			$this->data['username']=$res_user['username'];
		}
		//进行薪资搜索判断
		if(!empty($_GET['salary'])){
			switch($_GET['salary']){
				case '2k以下':
					$_SESSION['search']['salary_low']=array(array('egt',0),array('elt',2));
					$_SESSION['search_c']['salary']='2k以下';
					break; 
				case '2k-5k':
					$_SESSION['search']['salary_low']=array(array('egt',2),array('elt',5));
					$_SESSION['search_c']['salary']='2k-5k';
					break;
				case '5k-10k':
					$_SESSION['search']['salary_low']=array(array('egt',5),array('elt',10));
					$_SESSION['search_c']['salary']='5k-10k';
					break;
				case '10k-15k':
					$_SESSION['search']['salary_low']=array(array('egt',10),array('elt',15));
					$_SESSION['search_c']['salary']='10k-15k';
					break;
				case '15k-25k':
					$_SESSION['search']['salary_low']=array(array('egt',15),array('elt',25));
					$_SESSION['search_c']['salary']='15k-25k';
					break;
				case '25k-50k':
					$_SESSION['search']['salary_low']=array(array('egt',25),array('elt',50));
					$_SESSION['search_c']['salary']='25k-50k';
					break;
				case '50k以上':
					$_SESSION['search']['salary_low']=array(array('egt',50));
					$_SESSION['search_c']['salary']='50k以上';
					break;
			}
			$_SESSION['search_c']['salary_show']='';
		}
		//进行工作经验判断
		if(!empty($_GET['workyear'])){
			$_SESSION['search']['work_year']=$_GET['workyear'];
			$_SESSION['search_c']['work_year']=$_GET['workyear'];
			$_SESSION['search_c']['work_year_show']='';
		}		//进行工作地点判断
		if(!empty($_GET['address'])){
			$_SESSION['search']['city']=$_GET['address'];
			$_SESSION['search_c']['city']=$_GET['address'];
			$_SESSION['search_c']['city_show']='';
		}
		//学历搜索条件
		if(!empty($_GET['edu'])){
			$_SESSION['search']['edu']=$_GET['edu'];
			$_SESSION['search_c']['edu']=$_GET['edu'];
			$_SESSION['search_c']['edu_show']='';
		}
		//是否全职
		if(!empty($_GET['nature'])){
			$_SESSION['search']['nature']=$_GET['nature'];
			$_SESSION['search_c']['nature']=$_GET['nature'];
			$_SESSION['search_c']['nature_show']='';
		}
		//职业判断
		if(!empty($_GET['job'])){			
			$_SESSION['search']['name']=array('like',"%{$_GET['job']}%");
			$_SESSION['search_c']['name']=$_GET['job'];
			$_SESSION['search_c']['name_show']='';
		}
		$job = M('job');
		$company = M('company');
		$company_tag = M('company_tag');
		$tag = M('tag');
		//分页
		$_SESSION['search']['state']=1;
		$a = $_SESSION['search'];
		$count = $job->where($a)->count();
		$Page = new \Think\Page($count,10);
		$Page->setConfig('first','首页');
		$Page->setConfig('prev','上一页');
		$Page->setConfig('next','下一页');
		$Page->setConfig('last','尾页');
		$show = $Page->show();
		//搜索结果
		$res_job = $job->where($a)->page(I('get.p',1),10)->select();
		if($res_job){
			foreach($res_job as $key => $value){
				$cid=$value['company_id'];
				$arr=$value;
				$arr['company']=$company->where("id={$cid}")->find();
				$res_company_tag=$company_tag->where("company_id={$cid}")->limit(3)->select();
				foreach($res_company_tag as $v){
					$tid=$v['tag_id'];
					$res_tag=$tag->where("id={$tid}")->select();
					foreach($res_tag as $vs){
						$arr['tag'][]=$vs['name'];
					}
				}
				$result[]=$arr;
			}
		}
		//左侧边栏搜索条件显示
		if($_SESSION['search']['salary_low']=='' and $_SESSION['search']['work_year']=='' and $_SESSION['search']['city']=='' and $_SESSION['search']['edu']=='' and $_SESSION['search']['nature']=='' and $_SESSION['search']['name']==''){
			$_SESSION['search_c']['all']='dn';
		}else{
			$_SESSION['search_c']['all']='';
		}
		//输出到模板
		$this->assign('data',$this->data);
		$this->assign('page',$show);
		$this->assign('result',$result);
		$this->assign('search_c',$_SESSION['search_c']);
		$this->display();
		//var_dump($result);
	}


	public function pages(){
		$job = M('job');
		$count = $job->count();
		$Page = new \Think\Page($count,1);
		$Page->setConfig('first','首页');
		$Page->setConfig('prev','上一页');
		$Page->setConfig('next','下一页');
		$Page->setConfig('last','尾页');
		$show = $Page->show();
		$res_job=$job->select();
		$this->assign('data',$res_job);
		$this->assign('page',$show);
		$this->display();
	}
	//搜索条件的清除
	public function clearCon(){
		switch($_GET['id']){
			case 1:
				unset($_SESSION['search']['salary_low']);unset($_SESSION['search_c']['salary']);$_SESSION['search_c']['salary_show']='dn';break;
			case 2:
				unset($_SESSION['search']['work_year']);unset($_SESSION['search_c']['work_year']);$_SESSION['search_c']['work_year_show']='dn';break;
			case 3:
				unset($_SESSION['search']['city']);unset($_SESSION['search_c']['city']);$_SESSION['search_c']['city_show']='dn';break;
			case 4:
				unset($_SESSION['search']['edu']);unset($_SESSION['search_c']['edu']);$_SESSION['search_c']['edu_show']='dn';break;
			case 5:
				unset($_SESSION['search']['nature']);unset($_SESSION['search_c']['nature']);$_SESSION['search_c']['nature_show']='dn';break;
			case 6:
				unset($_SESSION['search']['name']);unset($_SESSION['search_c']['name']);$_SESSION['search_c']['name_show']='dn';break;
		}
		$this->redirect('Search/index');
	}
}