<?php
/**
 * 公告管理
 *
 */
namespace Mina\Controller;
use Think\Controller;
use \Common\Service\ShortNotice;
class NoticeController extends Controller {

	/**
	 * 公告管理
	 */
	public function index()
	{
        $nid = I('nid');
        $name = I('name');

        if(!empty($nid) || is_numeric($nid)) {
            $where = array(
                'nid' => $nid
            );
            $data = $this->companyObj->where($where)->select();
        }else{
            if (isset($name))
                $where['title'] = array('LIKE', $name.'%');
            $this->assign('map', $name);

            $total = M('Notice')->where($where)->count();
            $Page = new \Think\Page($total, 50);
            $data = M('Notice')->where($where)->limit($Page->firstRow, $Page->listRows)->select();
            $this->assign('page', $Page->show());
        }

        $this->assign('data', $data);
        $this->display();
	}

    public function get_short_notice()
    {
        $short_notice_com = ShortNotice::getInstance();
        $short_notice_com = $short_notice_com->short_notice;
        returnApiSuccess('获取消息通知成功',$short_notice_com);
	}

}