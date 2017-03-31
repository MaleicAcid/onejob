<?php
/**
 * 公司列表
 *
 */
namespace Admin\Controller;

class CompanyController extends BaseController {

	protected $companyObj = null;

	public function __construct()
	{
		parent::__construct();
		$this->companyObj = M('Company');
	}

	/**
	 * 公司列表
	 */
	public function index()
	{
		$id = I('id');
        $name = I('name');

        if(!empty($id) || is_numeric($id)) {
            $where = array(
                'id' => $id
            );
            $data = $this->companyObj->where($where)->select();
        }else{
            if (isset($name))
                $where['name'] = array('LIKE', $name.'%');
                $this->assign('map', $name);

            $total = $this->companyObj->where($where)->count();
            $Page = new \Think\Page($total, 50);
            $data = $this->companyObj->where($where)->limit($Page->firstRow, $Page->listRows)->select();
            $company_invest = C('company_invest');
            foreach ($data as $k=>&$val){
                $data[$k]['invest'] = $company_invest[$data[$k]['invest']];
            }

            $this->assign('page', $Page->show());
        }

		$this->assign('data', $data);
		$this->display();
	}

	/**
	 * 公司申请列表
	 */
	public function apply()
	{
		$where['state'] = 3;
		$total = $this->companyObj->where($where)->count();
		$Page = new \Think\Page($total, 100);
		$data = $this->companyObj->where($where)->limit($Page->firstRow, $Page->listRows)->select();

		$this->assign('data', $data);
		$this->assign('page', $Page->show());
		$this->display();
	}

	/**
	 * 审核通过
	 */
	public function check()
	{
		$id = I('get.id');
		$data['id'] = $id;
		$data['state'] = 1;
		$rs = $this->companyObj->save($data);

		$msg['code'] = 1;
		$msg['msg'] = '审核成功';
		$this->ajaxReturn($msg);
	}

    public function check_to_school()
    {
        $id = I('get.id');
        $data['id'] = $id;
        $data['state'] = 1;
        $data['type'] = 2;
        $rs = $this->companyObj->save($data);

        $msg['code'] = 1;
        $msg['msg'] = '审核成功';
        $this->ajaxReturn($msg);
    }
    /**
     * 审核不通过
     */
    public function uncheck()
    {
        $id = I('get.id');
        if(!$id) {
            die;
        }
        $where = array(
            'id' => $id,
        );
        $info = $this->companyObj->where($where)->find();
        $this->assign('info', $info);
        $this->display();
    }

    /**
     * 审核不通过
     */
    public function doUncheck()
    {
        $data = I();
        if(!$data['com_id']) {
            $this->ajaxReturn(array('code'=>-1,'msg'=>'提交失败')) ;
        }
        $data['state'] = 4;//4表示申请认证失败
        $where = array(
            'id' => $data['com_id'],
        );
        unset($data['com_id']);
        $info = M('Company')->where($where)->data($data)->save();
        $this->ajaxReturn(array('code'=>1,'msg'=>'提交成功')) ;
    }



	/**
	 * 禁用公司
	 */
	public function deny()
	{
		$id = I('get.id');
		$data['id'] = $id;
		$data['status'] = 0;
		$rs = $this->companyObj->save($data);

		$msg['code'] = 1;
		$msg['msg'] = '禁用成功';
		$this->ajaxReturn($msg);
	}

	/**
	 * 启用公司
	 */
	public function allow()
	{
		$id = I('get.id');
		$data['id'] = $id;
		$data['status'] = 1;
		$rs = $this->companyObj->save($data);

		$msg['code'] = 1;
		$msg['msg'] = '启用成功';
		$this->ajaxReturn($msg);
	}

    /**
     * 修改公司可发布招聘数
     */
    public function new_job_num_edit()
    {
        $id = I('get.id');
        //var_dump($id);die;
        if(!$id) {
            die;
        }
        $where = array(
            'id' => $id,
        );
        $info = $this->companyObj->where($where)->find();
        $this->assign('info', $info);
        $this->display();
    }

    public function new_job_num_doEdit()
    {
        if (IS_POST) {
            $data['id'] = I('id');
            $data['new_job_num'] = I('num');

            $msg['code'] = 0;
            $msg['msg'] = '修改失败';
            if (is_numeric($data['id']) && is_numeric($data['new_job_num'])) {
                $where = array(
                    'id' => $data['id'],
                );
                $save = array(
                    'new_job_num' => $data['new_job_num']
                );
                $rs = $this->companyObj->where($where)->save($save);

                if($rs) {
                    $msg['code'] = 1;
                    $msg['msg'] = '修改成功';
                }
            }


            return $this->ajaxReturn($msg);
        }

    }

    /**
     * 修改公司置顶顺序 0不置顶 1,2,3,4...按序置顶,若相同则按点击量由高到低
     */
    public function is_top_edit()
    {
        $id = I('get.id');
        //var_dump($id);die;
        if(!$id) {
            die;
        }
        $where = array(
            'id' => $id,
        );
        $info = $this->companyObj->where($where)->find();
        $this->assign('info', $info);
        $this->display();
    }

    public function is_top_doEdit()
    {
        if (IS_POST) {
            $data['id'] = I('id');
            $data['is_top'] = I('num');

            $msg['code'] = 0;
            $msg['msg'] = '修改失败';
            if (is_numeric($data['id']) && is_numeric($data['is_top']) && $data['is_top'] <= 255) {
                $where = array(
                    'id' => $data['id'],
                );
                $save = array(
                    'is_top' => $data['is_top']
                );
                $rs = $this->companyObj->where($where)->save($save);

                if($rs) {
                    $msg['code'] = 1;
                    $msg['msg'] = '修改成功';
                }
            }


            return $this->ajaxReturn($msg);
        }

    }

    /**
     * 修改公司是否热门 0不热门 1热门,热门优先级低于置顶
     */
    public function allow_hot()
    {
        $id = I('get.id');
        $msg['code'] = 0;
        $msg['msg'] = '设置热门失败';

        $data['id'] = $id;
        $data['is_hot'] = 1;
        $rs = $this->companyObj->save($data);
        if($rs ){
            $msg['code'] = 1;
            $msg['msg'] = '设置热门成功';
        }

        $this->ajaxReturn($msg);
    }

    public function deny_hot()
    {
        $id = I('get.id');
        $msg['code'] = 0;
        $msg['msg'] = '取消热门失败';

        $data['id'] = $id;
        $data['is_hot'] = 0;
        $rs = $this->companyObj->save($data);
        if($rs ){
            $msg['code'] = 1;
            $msg['msg'] = '取消热门成功';
        }

        $this->ajaxReturn($msg);

    }

    /**
     * 删除公司
     */
    public function delete()
    {
        $com_id = I('get.id');
        $arr = $this->do_delete($com_id);
        $this->ajaxReturn($arr);
//        $info = $this->companyObj->where('id='.$com_id)->find();
//
//        if ($info['status'] != 0) {
//            $msg['code'] = 0;
//            $msg['msg'] = '删除失败,请先禁用该企业';
//            $this->ajaxReturn($msg);
//        }
//            //如果是学校企业
//        if($info['type'] == 2){
//            $pid_where = array(
//                'pid' => $com_id,
//            );
//            $field = array('id');
//            $child_com = $this->companyObj->field($field)->where($pid_where)->select();
//            foreach ($child_com as $val){
//                $child_and_parents_com[] = $val['id'];
//            }
//            $child_and_parents_com[] = $com_id;
////            var_dump($child_and_parents_com);
//            $del_where = array(
//                'id' => array('in',$child_and_parents_com),
//            );
//            $res1 = $this->companyObj->where($del_where)->delete();
//            $job_del_where = array(
//                'company_id' => array('in',$child_and_parents_com),
//            );
//            $res2 = M('Job')->where($job_del_where)->delete();
//            if (($res1 != false) && ($res2 != false)){
//                $msg['code'] = 1;
//                $msg['msg'] = '删除成功';
//                $this->ajaxReturn($msg);
//            }else{
//                $msg['code'] = 0;
//                $msg['msg'] = '已删除';
//                $this->ajaxReturn($msg);
//            }
//        }
//
//
//        $del_where = array(
//            'id' => $com_id,
//        );
//        $res1 = $this->companyObj->where($del_where)->delete();
//
//        $job_del_where = array(
//            'company_id' => $com_id,
//        );
//        $res2 = M('Job')->where($job_del_where)->delete();
//        if (($res1 != false) && ($res2 != false)){
//            $msg['code'] = 1;
//            $msg['msg'] = '删除成功';
//            $this->ajaxReturn($msg);
//        }else{
//            $msg['code'] = 0;
//            $msg['msg'] = '已删除';
//            $this->ajaxReturn($msg);
//        }
    }

    //批量删除企业
    public function batch_delete()
    {
        $id_arr = I('get.id_arr');
        $code = 1;
        foreach ($id_arr as $key=>$val){
            $res = $this->do_delete($val);
        }

        $msg['code'] = 1;
        $msg['msg'] = '删除成功';
        $this->ajaxReturn($msg);
    }

    private function do_delete($cid)
    {
        if (!is_numeric($cid) && empty($cid)) {
            return array('code'=>-1,'msg'=>'参数错误');
        }
        $id_where = array(
            'id' => $cid,
        );
        $info = $this->companyObj->where($id_where)->find();
        if ($info['status'] != 0) {
            $msg['code'] = 0;
            $msg['msg'] = '删除失败,请先禁用该企业';
            return $msg;
        }

        //如果是学校企业
        if($info['type'] == 2){
            $pid_where = array(
                'pid' => $cid,
            );
            $field = array('id');
            $child_com = $this->companyObj->field($field)->where($pid_where)->select();
            foreach ($child_com as $val){
                $child_and_parents_com[] = $val['id'];
            }
            $child_and_parents_com[] = $cid;
//            var_dump($child_and_parents_com);
            $del_where = array(
                'id' => array('in',$child_and_parents_com),
            );
            $res1 = $this->companyObj->where($del_where)->delete();
            $job_del_where = array(
                'company_id' => array('in',$child_and_parents_com),
            );
            $res2 = M('Job')->where($job_del_where)->delete();
            if (($res1 != false) && ($res2 != false)){
                $msg['code'] = 1;
                $msg['msg'] = '删除成功';
                return $msg;
            }else{
                $msg['code'] = 0;
                $msg['msg'] = '已删除';
                return $msg;
            }
        }

        $del_where = array(
            'id' => $cid,
        );
        $res1 = $this->companyObj->where($del_where)->delete();

        $job_del_where = array(
            'company_id' => $cid,
        );
        $res2 = M('Job')->where($job_del_where)->delete();
        if (($res1 != false) && ($res2 != false)){
            $msg['code'] = 1;
            $msg['msg'] = '删除成功';
            return $msg;
        }else{
            $msg['code'] = 0;
            $msg['msg'] = '已删除';
            return $msg;
        }


    }


}