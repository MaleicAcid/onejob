<?php
/**
 * 后台的基类
 *
 */
namespace Admin\Controller;
use Think\Controller;

class BaseController extends Controller {

	protected $userId = null;

	public function __construct()
	{
		parent::__construct();

		if (!session('?admin')) {
			$this->redirect('Login/login');
		}
		
		$this->userId = session('admin.id');
	}

}