<?php
/**
 * tpshop
 * ============================================================================
 * 版权所有 2015-2027 深圳搜豹网络科技有限公司，并保留所有权利。
 * 网站地址: http://www.tp-shop.cn
 * ----------------------------------------------------------------------------
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和使用 .
 * 不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 * Author: IT宇宙人
 * Date: 2015-09-09
 */

namespace Admin\Logic;

use Think\Model\RelationModel;
use Think\Upload;

/**
 * 分类逻辑定义
 * Class CatsLogic
 * @package Home\Logic
 */
class LinkLogic extends RelationModel
{

    /**
     * @param $data
     * @return array|mixed 这里状态一般都为1
     * 添加 轮播图
     */
    public function add($data)
    {
        //上传图片处理
        if($_FILES['link_pic']['error']===0){//图片没有错误才处理
            //1) 上传原图图片
            //通过Think/Upload.class.php实现附件上传
            $cfg = array(
                'savePath'      =>  'Admin/Link/', //保存根路径
            );
//            var_dump($cfg);
            $up = new Upload($cfg);
            $z = $up -> uploadOne($_FILES['link_pic']);
            //$z会返回成功上传附件的相关信息
//            dump($z);

            //拼装图片的路径名信息，存储到数据库里边
            $big_path_name = 'Uploads/'.$z['savepath'].$z['savename'];
//            var_dump($big_path_name);
            $data['link_pic'] = $big_path_name;

            //2) 根据原图($big_path_name)制作缩略图
            $im = new \Think\Image();//实例化对象
            $im -> open($big_path_name); //打开原图
            $im -> thumb(60,60); //制作缩略图
            //缩略图名字：“small_原图名字”
            $small_path_name = 'Uploads/'.$z['savepath']."small_".$z['savename'];
            $im -> save($small_path_name);//存储缩略图到服务器
            //保存缩略图到数据库
            $data['small_pic'] = $small_path_name;
            if(M('Link')->add($data)){
                return array('code'=>1,'msg'=>'添加成功');
            }
            return array('code'=>-1,'msg'=>'添加失败');
        }
        return array('code'=>-1,'msg'=>'添加失败');
    }



}

 