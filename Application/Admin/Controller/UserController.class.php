<?php
/**
 * 用户管理
 *
 */
namespace Admin\Controller;

class UserController extends BaseController {

	/**
	 * 用户列表页
	 */
	public function index()
	{
		$map = I();

		if (isset($map['realname']))
			$where['realname'] = array('LIKE', $map['realname'].'%');
        if (isset($map['school']))
            $where['school'] = array('LIKE', $map['school'].'%');
        if (isset($map['major']))
            $where['major'] = array('LIKE', $map['major'].'%');
        if (isset($map['tel']))
            $where['tel'] = array('LIKE', $map['tel'].'%');
        if (is_numeric($map['edu']))
            $where['edu'] = $map['edu'];

        if (is_numeric($map['sex']))
            $where['sex'] = $map['sex'];

        if (is_numeric($map['entry_after']))
            $where['entry_year'] = array('egt', $map['entry_after']);
        if (is_numeric($map['entry_before']))
            $where['entry_year'] = array('elt', $map['entry_before']);

        if (is_numeric($map['entry_after']) && is_numeric($map['entry_before'])){
            $where['entry_year'] = array('between', array($map['entry_after'],$map['entry_before']));
        }
//echo 'aaaaa';
//var_dump($where);

		$where['type'] = 1;

		$total = D('User')->where($where)->count();
		$Page = new \Think\Page($total, 30);
		$data = D('User')->where($where)->limit($Page->firstRow, $Page->listRows)->order('id desc')->select();

        $job_edu = C('job_edu');
        $user_sex = C('user_sex');
        foreach ($data as $k=>&$val){
            $data[$k]['edu'] = $job_edu[$data[$k]['edu']];
            $data[$k]['sex'] = $user_sex[$data[$k]['sex']];
        }

//        $map['sex'] = $user_sex[$map['sex']];
//        $map['edu'] = $job_edu[$map['edu']];
        $job_edu = C('job_edu');
        $user_sex = C('user_sex');
        $this->assign('job_edu', $job_edu);
        $this->assign('user_sex', $user_sex);
		$this->assign('map', $map);
		$this->assign('data', $data);
		$this->assign('page', $Page->show());
		$this->display();
	}

    public function output_to_excel()
    {
        vendor('PHPExcel.PHPExcel','','.class.php');
        vendor('PHPExcel.PHPExcel.IOFactory');
        error_reporting(E_ALL);
        $name = "就业直达号用户数据" . date("Y-m-d");
        $objPHPExcel = new \PHPExcel();
        /*以下是一些设置 ，什么作者  标题啊之类的*/
        $objPHPExcel->getProperties()->setCreator("Admin")
            ->setLastModifiedBy("Admin")
            ->setTitle("就业直达号用户数据")
            ->setSubject("就业直达号用户数据")
            ->setDescription("就业直达号用户数据")
            ->setKeywords("excel")
            ->setCategory("result file");
        /*以下就是对处理Excel里的数据， 横着取数据，主要是这一步，其他基本都不要改*/
        $field = array('realname','edu','sex','school','major','entry_year','tel');
        $data = M('User')->field($field)->select();
//        var_dump($data);
        $objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', '用户姓名')
            ->setCellValue('B1', '学历')
            ->setCellValue('C1', '性别')
            ->setCellValue('D1', '学校')
            ->setCellValue('E1', '专业')
            ->setCellValue('F1', '入学年份')
            ->setCellValue('G1', '手机号');

        $job_edu = C('job_edu');
        $user_sex = C('user_sex');
        foreach($data as $k => $v){
            $num=$k+2;
            $objPHPExcel->setActiveSheetIndex(0)
                //Excel的第A列，uid是你查出数组的键值，下面以此类推
                ->setCellValue('A'.$num, $v['realname'])
                ->setCellValue('B'.$num, $job_edu[$v['edu']])
                ->setCellValue('C'.$num, $user_sex[$v['sex']])
                ->setCellValue('D'.$num, $v['school'])
                ->setCellValue('E'.$num, $v['major'])
                ->setCellValue('F'.$num, $v['entry_year'])
                ->setCellValue('G'.$num, $v['tel']);
            }

        $objPHPExcel->getActiveSheet()->setTitle('User');
        $objPHPExcel->setActiveSheetIndex(0);
        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $dir=dirname(__FILE__);
//        $objWriter->save($dir.$name.".xls");


        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="'.$name.'.xls"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');

//        echo 'dd';die;

        exit;
	}

	public function edit()
	{
		$user_id = I('get.id');	
		$info = M('User')->where('id='.$user_id)->find();

		$this->assign('info', $info);
		$this->display();
	}

	/**
	 * 用户信息修改操作
	 */
	public function doEdit()
	{
		if (IS_AJAX) {
			$data = I();
			$rs = M('User')->save($data);

			if ($rs) {
				$msg['code'] = 1;
				$msg['msg'] = '修改成功';
			} else {
				$msg['code'] = 0;
				$msg['msg'] = '修改失败';
			}
			$this->ajaxReturn($msg);
		}
	}

	/**
	 * 修改密码
	 */
	public function editPwd()
	{
		$this->display('edit_pwd');
	}

	public function doEditPwd()
	{
		if (IS_POST) {
			$data = I();
			$data['password'] = md5(I('post.password'));
			$data['id'] = $this->userId;

			$rs = M('Admin')->data($data)->save();

			if ($rs) {
				$msg['code'] = 1;
				$msg['msg'] = '修改成功，下次登录即生效';
			} else {
				$msg['code'] = 0;
				$msg['msg'] = '修改失败';
			}
			$this->ajaxReturn($msg);
		}
	}



    /**
     * 删除用户
     */
    public function delete()
    {
        $user_id = I('get.id');
        $info = M('User')->where('id='.$user_id)->find();

        if ($info['state'] != -1) {
            $msg['code'] = 0;
            $msg['msg'] = '删除失败,请先禁用该用户';
        } else {
            $res = M('User')->where('id='.$user_id)->delete();
            if ($res){
                $msg['code'] = 1;
                $msg['msg'] = '删除成功';
            }else{
                $msg['code'] = 0;
                $msg['msg'] = '删除失败';
            }
        }
        $this->ajaxReturn($msg);
    }

	/**
	 * 禁用用户
	 */
	public function deny()
	{
		$data['id'] = I('get.id');
		$data['state'] = -1;
		$rs = M('User')->save($data);

		if ($rs) {
			$msg['code'] = 1;
			$msg['msg'] = '禁用成功';
		} else {
			$msg['code'] = 0;
			$msg['msg'] = '禁用失败';
		}
		$this->ajaxReturn($msg);
	}
}