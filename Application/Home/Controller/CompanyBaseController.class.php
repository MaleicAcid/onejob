<?php
/**
 * 公司登录验证
 *
 * @author 	wangz
 * @date     2014-10-30
 * @version  1.0
 *
 */
namespace Home\Controller;
use Think\Controller;

class CompanyBaseController extends Controller {
	
	public $cid = null;
	public $comObj = null;

	public function __construct()
	{
		parent::__construct();

		if (!session('?company')) {
			$this->redirect('Home/Users/login');
		}

		cookie('state', 2);
//		$this->cid = session('company.id');
//
//		$this->comObj = D('company');
//		$data['id'] = $this->cid;
//		$result = $this->comObj->where($data)->find();
        $result = session('company');

		// 如果用户未注册企业用户 或者 注册企业用户后未进行邮箱验证 或者 未填写公司基本信息 
		if ($result['state'] == -1 || $result['step'] == 4) {
			$this->redirect('Home/CompanyReg/step');
		}
	}
}