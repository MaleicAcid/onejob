<?php
/**
 * 公告管理
 *
 */
namespace Admin\Controller;
use \Common\Service\ShortNotice;
class NoticeController extends BaseController {

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

    public function add()
    {
        $nid = I('nid');
        if (is_numeric($nid) && $nid > 0) {
            $where['nid'] = $nid;
            $res = M('Notice')->where($where)->find();
            if ($res) {
                $this->assign('data',$res);
            }

        }
        $this->display();
    }

    public function doAdd()
    {
        if (IS_POST) {
            $data = I('','');
            $data['content'] = $data['editorValue'];
            unset($data['editorValue']);
            $data['create_time'] = time();
                if ($data['nid'] > 0) {
                    M('Notice')->data($data)->save();
                    $this->ajaxReturn(array('code'=>1,'msg'=>'修改成功'));
                }
            $nid = M('Notice')->add($data);
            $this->ajaxReturn(array('code'=>1,'msg'=>'添加成功','nid'=>$nid));
        }


    }

    public function delete()
    {
        $nid = I('nid');
        $map = array(
            'nid' => $nid
        );
        $z = M('Notice')->where($map)->delete();
        if ($z) {
            $this->ajaxReturn(array('code'=>1,'msg'=>'删除成功'));
        }else{
            $this->ajaxReturn(array('code'=>-1,'msg'=>'删除失败'));
        }
    }

    public function short_notice()
    {
        $id = I('id');
        $name = I('name');

        if(!empty($id) || is_numeric($id)) {
            $where = array(
                'id' => $id
            );
            $data = M('ShortNotice')->where($where)->select();
        }else{
            if (isset($name))
                $where['name'] = array('LIKE', $name.'%');
            $this->assign('map', $name);

            $total = M('ShortNotice')->where($where)->count();
            $Page = new \Think\Page($total, 50);
            $data = M('ShortNotice')->where($where)->limit($Page->firstRow, $Page->listRows)->select();
            $this->assign('page', $Page->show());
        }

        $this->assign('data', $data);
        $this->display();
    }

    public function add_short_notice()
    {
        $id = I('id');
        if (is_numeric($id) && $id > 0) {
            $where['id'] = $id;
            $res = M('ShortNotice')->where($where)->find();
            if ($res) {
                $this->assign('res',$res);
            }

        }
        $this->display();
    }

    public function do_add_short_notice()
    {
        if (IS_POST) {
            $data = I('');
            $data['create_time'] = time();
            if ($data['id'] > 0) {
                M('ShortNotice')->data($data)->save();
                $this->ajaxReturn(array('code'=>1,'msg'=>'修改成功'));
            }
            $id = M('ShortNotice')->add($data);
            $this->ajaxReturn(array('code'=>1,'msg'=>'添加成功','id'=>$id));
        }
    }

    public function update_short_notice()
    {
        $link = ShortNotice::getInstance();
        $link->clear();
        $this->ajaxReturn(array('code'=>1,'msg'=>'推送成功'));
    }


    public function delete_short_notice()
    {
        $id = I('get.id');
        $msg['code'] = 0;
        $msg['msg'] = '删除失败';
        $res = M('ShortNotice')->where('id='.$id)->delete();
        if ($res) {
            $msg['code'] = 1;
            $msg['msg'] = '删除成功';
        }

        $this->ajaxReturn($msg);
    }

}