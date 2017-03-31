<?php
/**
 * 轮播图
 */
namespace Admin\Controller;
use Admin\Logic\LinkLogic;
use \Common\Service\Link;
class LinkController extends BaseController {

	protected $linkObj = null;

	public function __construct()
	{
		parent::__construct();
		$this->linkObj = M('Link');
	}

	/**
	 *
	 */
	public function index()
	{
		$data = $this->linkObj->select();

		$this->assign('data', $data);
		$this->display();
	}

	/**
	 * 添加
	 */
	public function add()
	{
		$this->display();
	}

	/**
	 * 执行添加
	 */
	public function doAdd()
	{
		if (IS_POST) {
			$data = I();
			$data['create_time'] = time();
//			var_dump($data);
//            var_dump($_FILES);die;
			$linkLog = new LinkLogic();
            $msg =  $linkLog->add($data);
			$this->ajaxReturn($msg);
		}
	}

	/**
	 * 修改
	 */
	public function edit()
	{
		$id = I('get.id');
		$info = $this->linkObj->where('id='.$id)->find();
		$this->assign('info', $info);
		$this->display();
	}

	/**
	 * 修改
	 */
	public function doEdit()
	{
		if (IS_POST) {
			$data = I();
			$rs = $this->linkObj->data($data)->save();
			$msg['code'] = 1;
			$msg['msg'] = '修改成功';
			$this->ajaxReturn($msg);
		}
	}

	/**
	 * 删除
	 */
	public function delete()
	{
		$id = I('get.id');
		$this->linkObj->where('id='.$id)->delete();
		$msg['code'] = 1;
		$msg['msg'] = '删除成功';
		$this->ajaxReturn($msg);
	}

    public function updateLink()
    {
        $link = Link::getInstance();
        $link->clear();
        $this->ajaxReturn(array('code'=>1,'msg'=>'推送成功'));
	}
}