<?php
/**
 * 用户逻辑
 */

namespace Home\Logic;

use Think\Model\RelationModel;
use Think\Page;
use Think\Upload;
//include '/usr/local/xunsearch/sdk/php/lib/XS.php';
/**
 * 分类逻辑定义
 * Class CatsLogic
 * @package Home\Logic
 */
class CompanyLogic extends RelationModel
{

    public function get_company_info($com_id)
    {
        if (empty($com_id)) {
            return array('code'=>-1,'msg'=>'获取公司信息失败','data'=> '');
        }

        //搜索职位信息
        $comObj=M('Company');
        $where = array(
            'id' => $com_id,
            'state' => 1,
        );

        $field = array('id','name','trade','invest','scale','address','one_desc','desc','logo');
        $res_com=$comObj->field($field)->where($where)->find();
        if (empty($res_com)) {
            return array('code'=>-1,'msg'=>'获取公司信息失败','data'=> '');
        }else{
            $res_com['invest'] = C('company_invest')[$res_com['invest']];
            $res_com['logo'] = get_https_img($res_com['logo']);
            $res_com['scale'] = C('company_scale')[$res_com['scale']];
            return array('code'=>1,'msg'=>'获取公司信息成功','data'=>$res_com);
        }

    }
    /*
     * 第三方登录
     */
    public function thirdLogin($data=array()){
//        array(
//            "openid"=>"oNVBYwYsRzYOVzKvey6KuWcGrD50",
//            "unionid" => "on93psu59lHrPVcB9jb1WGGdsDXE" ,
//            "oauth" => "weixin",
//            "nickname" =>  "微信用户"
//        );
        $unionid = isset($data['unionid']) ? $data['unionid'] : ''; //第三方返回唯一标识
        $openid = $data['openid']; //第三方返回唯一标识
        $oauth = $data['oauth']; //来源
        if((!$oauth && !$openid) || !$oauth)
            return array('status'=>-1,'msg'=>'参数有误','result'=>'');
        //获取用户信息
        if(!empty($unionid)){
            $com = get_company_info($unionid,4,$oauth);
        }else{
            $com = get_company_info($openid,3,$oauth);
        }

        if(!$com){
            //账户不存在 注册一个
            $map['password'] = '';
            $map['short_name'] = isset($data['short_name']) ? $data['short_name'] : '第三方用户';
            $map['unionid'] = isset($unionid) ? $unionid : '';
            $map['openid'] = isset($openid) ? $openid : '';
            $map['addtime'] = time();
            $map['oauth'] = $oauth;
            $map['logo'] = isset($data['avatarUrl']) ? $data['avatarUrl'] :  C('COMPANY_DEFAULT_LOGO');
            //$map['sex'] = $data['sex'];
            $map['token'] = md5(time().mt_rand(1,99999));

            $row = M('company')->add($map);
            if (!empty($unionid)){
                $com = get_company_info($unionid,4,$oauth);
            }else{
                $com = get_company_info($openid,3,$oauth);
            }
        }else if($com['status'] == 0){
            return array('status'=>-1,'msg'=>'账户状态异常','result'=>'');
        }else{
            $com['token'] = md5(time().mt_rand(1,999999999));
            M('Company')->where("id = '{$com['id']}'")->save(array('token'=>$com['token']));
        }
        return array('status'=>1,'msg'=>'登陆成功','result'=>$com);
    }

    public function applyAuth($data,$cid)
    {
        //上传图片处理
        if($_FILES['licence']['error']===0){//图片没有错误才处理
            //1) 上传原图图片
            //通过Think/Upload.class.php实现附件上传
            $cfg = array(
                'savePath'      =>  'Admin/Auth/', //保存根路径
            );
//            var_dump($cfg);
            $up = new Upload($cfg);
            $z = $up -> uploadOne($_FILES['licence']);
            //$z会返回成功上传附件的相关信息
//            dump($z);

            //拼装图片的路径名信息，存储到数据库里边
            $big_path_name = 'Uploads/'.$z['savepath'].$z['savename'];
//            var_dump($big_path_name);
            $data['licence'] = $big_path_name;
            $data['state'] = 3;
            $data['updatetime'] = time();
            if ($data['licence_type'] !=  2) {
                $data['licence_type'] = 1;
            }
            $where =array(
                'id' => $cid
            );
            unset($data['id']);
            $z = M('Company')->where($where)->data($data)->save();
            if($z !== false){
                return array('code'=>1,'msg'=>'添加成功');
            }
            return array('code'=>-1,'msg'=>'save error');
        }
        return array('code'=>-1,'msg'=>'pic null');
    }

    public function get_company_job($com_id,$type=1)
    {
        if ($type == 2){
            //如果企业类型是学校
            $map = array(
                'pid' =>$com_id,
                'status' => 1,//未被禁用
            );
            $field = array('id');
            $childCom = M('Company')->field($field)->where($map)->select();
            $child_com_id = array();
            foreach ($childCom as $val) {
                array_push($child_com_id,$val['id']);
            }
            $where = array(
                'company_id' =>  array('in',$child_com_id),
                'status' => 1,//未被禁用
            );
//            var_dump($childCom);die;
        }else{
            $where = array(
                'company_id' =>$com_id,
                'status' => 1,//未被禁用
            );
        }
        $jobObj = D('Job');

        $jobnum = $jobObj->where($where)->count();
        $page = new \Think\Page($jobnum, 10);

        $filed = array('jid','company_id','name','edu','work_year','need_people','state','view_num','share_num','collect_num');
        $job = $jobObj->limit($page->firstRow, $page->listRows)->field($filed)->where($where)->select();
//        $sendObj = D('Send');
        foreach ($job as &$val) {
            $val['edu'] = C('job_edu')[$val['edu']];
            $val['work_year'] = C('work_year')[$val['work_year']];
        }

        $data['job'] = $job;
        $data['jobnum'] = $jobnum;
        return $data;
    }

    public function hide_job($jid,$cid)
    {
        $map = array(
            'jid' => $jid,
        );
        $field = array('jid','company_id','state');
        $z = M('Job')->field($field)->where($map)->find();
        $pid = getCompanyPid($z['company_id']);
        if(($z['company_id'] == $cid) or ($pid == $cid)){
            $xs = new \XS('onejob'); // 建立 XS 对象，项目名称为：demo
            $index = $xs->index;
            $index->del($jid);

            if($z['state'] == 0) {
                $data['msg'] = '职位已隐藏';
                $data['status'] = 1;
                return $data;
            }else{
                $data = array(
                    'state' => 0,
                );
                $res = M('job')->where($map)->data($data)->save();
                $data['msg'] = '职位已隐藏';
                $data['status'] = 1;
                return $data;
            }

        }else{
            $data['msg'] = '职位参数不正确';
            $data['status'] = -1;
            return $data;
        }
    }

    public function show_job($jid,$cid)
    {
        $map = array(
            'jid' => $jid,
        );
        $field = array('jid','company_id','state');

        $z = M('job')->field($field)->where($map)->find();
        $pid = getCompanyPid($z['company_id']);
        if(($z['company_id'] == $cid) or ($pid == $cid)){
            $xs_field = array('jid','name','text','end_time','is_top','is_hot','view_num','edu','need_people','work_year','company_id','salary_low','salary_high','address','cate_id' );
            $data = M('Job')->field($xs_field)->where($map)->find();
//            $data['edu'] = C('job_edu')[$data['edu']];
//            $data['work_year'] = C('work_year')[$data['work_year']];
            // 创建文档对象
            $xs = new \XS('onejob'); // 建立 XS 对象，项目名称为：demo
            $index = $xs->index;
            $doc = new \XSDocument;
            $doc->setFields($data);
            // 更新到索引数据库中
            $index->update($doc);
            if($z['state'] == 1) {
                $data['msg'] = '职位已发布';
                $data['status'] = 1;
                return $data;
            }else{
                $data = array(
                    'state' => 1,
                );
                $res = M('job')->where($map)->data($data)->save();
                $data['msg'] = '职位已发布';
                $data['status'] = 1;
                return $data;
            }


        }else{
            $data['msg'] = '职位参数不正确';
            $data['status'] = -1;
            return $data;
        }
    }


    public function delete_job($jid,$cid)
    {
        $map = array(
            'jid' => $jid,
        );
        $field = array('jid','company_id','state');

        $z = M('Job')->field($field)->where($map)->find();
        $pid = getCompanyPid($z['company_id']);
        if(($z['company_id'] == $cid) or ($pid == $cid)){
            $xs = new \XS('onejob'); // 建立 XS 对象，项目名称为：demo
            $index = $xs->index;
            $index->del($jid);
                $res = M('job')->where($map)->delete();
                if($res){
                    $data['msg'] = '职位删除成功';
                    $data['status'] = 1;
                    return $data;
                }else{
                    $data['msg'] = '服务器繁忙,请稍候再试!';
                    $data['status'] = -1;
                    return $data;
                }


        }else{
            $data['msg'] = '职位参数不正确';
            $data['status'] = -1;
            return $data;
        }
    }

    public function add_view_num($id)
    {
        $where = array(
            'id' => $id,
        );
        M("Company")->where($where)->setInc('view_num',1);
    }

    public function createCompany($createInfo)
    {
        $createInfo['type'] = 3;
        $createInfo['addtime'] = time();
        $a = M('Company')->add($createInfo);
        if ($a){
            return $a;
        }else{
            return $a;
        }
    }

    public function verify_tel($code,$uid)
    {
        $data = session('code');
        if($code == $data['code'] && !empty($data['tel'])){
            $where = array(
                'id' => $uid,
            );
            $map = array(
                'tel' => $data['tel'],
                'id' => $uid,
            );
            $z= M('Company')->where($where)->save($map);
            if($z){
                return true;
            }else{
                return false;
            }
        }
        return false;
    }

    public function update_desc($desc,$cid)
    {
//        $desc = I('desc');
        if(!empty($desc)){
            $where = array(
                'id' => $cid,
            );
            $map = array(
                'desc' => $desc,
                'id' => $cid,
                'updatetime' => time(),
            );
            $z= M('Company')->where($where)->save($map);
            if($z){
                return array('status'=>1,'msg'=>'公司介绍更新成功');
            }else{
                return array('status'=>-1,'msg'=>'服务器繁忙,请稍后再试');
            }
        }
        return array('status'=>-1,'msg'=>'公司介绍不能为空');
    }

    public function get_auth_state($cid)
    {
        if(!empty($cid)){
            $where = array(
                'id' => $cid,
            );
            $field =array('state','licence','uncheck_title','uncheck_content');
            $z= M('Company')->field($field)->where($where)->find();
            if(isset($z['state'])){
                $z['licence'] = get_https_img($z['licence']);
                if($z['state'] != 4){
                    unset($z['uncheck_title']);
                    unset($z['uncheck_content']);
                }
                return array('status'=>1,'msg'=>'获取认证状态成功','data'=>$z);
            }else{
                return array('status'=>-1,'msg'=>'获取认证状态失败');
            }
        }
        return array('status'=>-1,'msg'=>'获取认证状态失败');
    }

    public function is_complete($cid)
    {
        $flag = 1;//信息完善
        if(empty($cid)){
            return array('status'=>-1,'msg'=>'缺少企业参数');
        }
        $where = array(
            'id' => $cid,
        );
        $field = array('name','scale','address','desc','invest','trade','tel');
        $info = M('Company')->field($field)->where($where)->find();
        if(!$info){
            return array('status'=>-1,'msg'=>'企业用户不存在');
        }
        foreach ($info as $k=>$val){
            if (empty($val)){
                $msg = array_search($k, C('company_complete_info'));
                $flag = 0;//信息不完善
                break;
            }
        }
        if($flag == 1){
            return array('status'=>1,'msg'=>'企业资料已完善');
        }else{
            return array('status'=>-1,'msg'=>$msg);
        }
    }

    public function mina_verify_tel($code,$uid)
    {
        $data = S('code');
        if($code == $data['code'] && !empty($data['tel'])){
            $where = array(
                'id' => $uid,
            );
            $map = array(
                'tel' => $data['tel'],
            );
            $a = M('Company')->where($where)->data($map)->save();
            if ($a){
                return true;
            }else{
                return false;
            }

        }
        return false;
    }


    public function update_name($name,$cid)
    {
        if (empty($name)) {
            return array('status'=>-1,'msg'=>'姓名参数错误');
        }
        $where = array(
            'id' => $cid,
        );
        $map = array(
            'name' => $name,
        );
        $z = M('Company')->where($where)->data($map)->save();
        if ($z){
            return array('status'=>1,'msg'=>'修改公司名成功');
        }
        return array('status'=>-1,'msg'=>'修改公司名失败,请检查名称是否过长');
    }

    public function update_short_name($short_name,$cid)
    {
        if (empty($short_name)) {
            return array('status'=>-1,'msg'=>'联系人参数错误');
        }
        $where = array(
            'id' => $cid,
        );
        $map = array(
            'short_name' => $short_name,
        );
        $z = M('Company')->where($where)->data($map)->save();
        if ($z){
            return array('status'=>1,'msg'=>'修改联系人成功');
        }
        return array('status'=>-1,'msg'=>'修改联系人失败,请检查输入是否过长');
    }

    public function update_position($position,$cid)
    {
        if (empty($position)) {
            return array('status'=>-1,'msg'=>'联系人参数错误');
        }
        $where = array(
            'id' => $cid,
        );
        $map = array(
            'position' => $position,
        );
        $z = M('Company')->where($where)->data($map)->save();
        if ($z){
            return array('status'=>1,'msg'=>'修改职位名成功');
        }
        return array('status'=>-1,'msg'=>'修改职位名失败,请检查输入是否过长');
    }

    public function update_email($email,$cid)
    {
        if (!check_email($email)) {
            return array('status'=>-1,'msg'=>'邮箱格式有误');
        }
        $where = array(
            'id' => $cid,
        );
        $map = array(
            'email' => $email,
        );
        $z = M('Company')->where($where)->data($map)->save();
        if ($z){
            return array('status'=>1,'msg'=>'修改邮箱成功');
        }
        return array('status'=>-1,'msg'=>'修改邮箱失败,请检查输入是否过长');
    }

    public function update_logo($cid)
    {
        //上传图片处理
        if($_FILES['logo']['error']===0){//图片没有错误才处理
            //1) 上传原图图片
            //通过Think/Upload.class.php实现附件上传
            $cfg = array(
                'savePath'      =>  'Company/Logo/', //保存根路径
            );
//            var_dump($cfg);
            $up = new Upload($cfg);
            $z = $up -> uploadOne($_FILES['logo']);
            //$z会返回成功上传附件的相关信息
//            dump($z);

            //拼装图片的路径名信息，存储到数据库里边
            $big_path_name = 'Uploads/'.$z['savepath'].$z['savename'];
            //2) 根据原图($big_path_name)制作缩略图
            $im = new \Think\Image();//实例化对象
            $im -> open($big_path_name); //打开原图
            $im -> thumb(180,112); //制作缩略图
            //缩略图名字：“small_原图名字”
            $small_path_name = 'Uploads/'.$z['savepath']."small_".$z['savename'];
            $im -> save($small_path_name);//存储缩略图到服务器
            //保存缩略图到数据库
            $data['logo'] = $small_path_name;

            $where =array(
                'id' => $cid
            );

            $z = M('Company')->where($where)->data($data)->save();
            if($z !== false){
                return array('code'=>1,'msg'=>'添加成功');
            }
            return array('code'=>-1,'msg'=>'save error');
        }
        return array('code'=>-1,'msg'=>'pic null');
    }

    public function get_company_rank($cid)
    {
        $where = array(
            'id' => $cid,
        );
        $field = array('point');
        $info = M('Company')->field($field)->where($where)->find();

        $count_where = array(
            'point' => array('GT',$info['point']),
        );

        $count = M('Company')->where($count_where)->count();

        return $count;
    }

    public function is_tel($cid)
    {
        $where = array(
            'id' => $cid,
        );
        $field = array('tel');
        $info = M('Company')->field($field)->where($where)->find();
        if(true == check_mobile($info['tel'])){
            return 1;
        }
        return 0;
    }

}