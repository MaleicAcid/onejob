<?php
namespace Home\Controller;
use Think\Controller;
use Think\Page;
use \Common\Service\HotCompanies;
use \Common\Service\Category;
class SelectController extends Controller {
    public function index()
    {
        $parm = array();
        $parm['cate_id'] = I('cate_id');

        $is_ajax = I('is_ajax');
        $is_mobile = I('is_mobile');
        if ($is_ajax) {
            $displayName = 'm_ajax_select_jobs';
        }else{
            $displayName = 'index';
        }
        if ($is_mobile) {
            $displayName = 'Mobile@Index:m_ajax_index_jobs';
        }

        // base url
        $arr = $this->getAllChildcateIds($parm['cate_id']);
//        var_dump($arr);
        $field=array('jid','name','text','create_time','is_top','is_hot','view_num','edu','company_id','need_people','work_year','salary_low','salary_high','address','city','cate_id','cate_path');

        $where =array(
            'status' => 1,//未禁用
            'state' => 1,//已发布
            'cate_id' => array('in',$arr)
        );

        $count = M('Job')->where($where)->count();
        $page = new Page($count,15);
//        $show = $page->show();
        $data = M('Job')->field($field)->where($where)->order('is_top','desc')->limit($page->firstRow,$page->listRows)->select();
        foreach ($data as $k=>&$val) {
            $data[$k]['edu'] = C('job_edu')[$data[$k]['edu']];
            $data[$k]['work_year'] = C('work_year')[$data[$k]['work_year']];
        }
        $hot_com = HotCompanies::getInstance();
        $hot_com = $hot_com->getHotCompanies(4);
//        var_dump($hot_com);die;
        $this->assign('hot_com', $hot_com);
        $this->assign('jobs', $data);
        $this->display($displayName);
    }

    function getAllChildcateIds($categoryID)
    {
        //初始化ID数组
        $array[] = $categoryID;
        do
        {
            $ids = '';
            $where['pid'] = array('in',$categoryID);
            $cate = M('JobCategory')->where($where)->select();
            foreach ($cate as $k=>$v)
            {
                $array[] = $v['id'];
                $ids .= ',' . $v['id'];
            }
            $ids = substr($ids, 1, strlen($ids));
            $categoryID = $ids;
        }
        while (!empty($cate));
//        $ids = implode(',', $array);
//        return $ids;    //  返回字符串
        return $array; //返回数组
    }



    public function getChildCateId($cate_id=1)
    {
        $res_category = Category::getInstance();
        $res_category = $res_category->mCategory;

        $tmp = array();
        $res = array();
        $grade = 0;
        foreach ($res_category as $key=>$v) {
            if ($v['id'] == $cate_id) {
                $tmp = $v['child'];
                break;
            }
        }
//        if ($tmp){
//            $grade = 1;
//        }
        if (empty($tmp)){
            foreach ($res_category as $key=>$v) {
                foreach ($v['child'] as $i => $j) {
                    if ($j['id'] == $cate_id) {
                        $tmp = $j['child'];
                        break;
                    }
                }
            }
            foreach ($tmp as $key=>$v) {
                $res[] = $v['id'];

            }

        }else{
            foreach ($tmp as $key=>$v) {
                foreach ($v['child'] as $p=>$q) {
                    $res[] = $q['id'];
                }

            }
        }

        if (empty($res)){
            $res[] = $cate_id;
        }
        return $res;
    }
}