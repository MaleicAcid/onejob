<?php
namespace Mobile\Controller;
use Think\Controller;
//include '/usr/local/xunsearch/sdk/php/lib/XS.php';
class SearchController extends Controller {
    //        util/Indexer.php --rebuild --source=mysql://maleic:XXXXmm1000@127.0.0.1/onejob --sql="SELECT jid,name,text,create_time,is_top,is_hot,view_num,edu,company_id,salary_low,salary_high,address,city,cate_id FROM oj_job where status = 1 and state = 1" --filter=debug --project=onejob >/usr/local/xunsearch/sdk/php/util/log.txt
    public function index()
    {
        $parm = array();
//        $parm['salary'] = I('salary');
//        $parm['work_year'] = I('work_year');
//        $parm['city'] = I('city');
        $parm['job_edu'] = I('edu');
        $query = I('query');
        $p = I('p');
        $job = I('job');
        $query = I('query');
        $this->assign('query',$query);
        $is_ajax = I('is_ajax');

        if ($is_ajax) {
            $displayName = 'm_ajax_search_jobs';
        }else{
            $displayName = 'index';
        }

        if(empty($query)){
            $query = $job;
        }
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

}