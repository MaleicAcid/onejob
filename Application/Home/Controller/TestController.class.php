<?php
namespace Home\Controller;
use Think\Controller;
use \Common\Service\AreaCategory;
use Home\Logic\UserLogic;
class TestController extends Controller {
    public function aaa()
    {
        $a =  filesize();
        echo $a;
    }
    public function is_complete()
    {
        $uid = I('uid');
        $logic = new UserLogic();
        $res = $logic->is_complete($uid);
        var_dump($res);
    }
    public function xun()
    {
        require_once ("/ThinkPHP/Library/Vendor/xun/lib/XS.php");
        $xs = new \XS('xuntest');
    }
    public function man()
    {
        $res_category = AreaCategory::getInstance();
        $res_category = $res_category->mCategory;
        var_dump($res_category);
    }
    public function send()
    {
//        $my = '17321084831';
//        $bli = '15585290185';
//        $ret = send_code_mess($my,C('DAYU_KEY'),C('DAYU_SECRET'),C('CODE_TPL'));
//        var_dump($ret);
        echo pinyin('（香港）','all','');
    }
    public function save_city() {
        $city = $this->excel();
        $mod =M('area_category');
        foreach ($city as $key=>$val) {
            $phonetic_key = str_replace(' ','',pinyin($key));
            $keymap = array(
                'pid' => 0,
                'path' => '0',
                'name' => $key,
                'phonetic_name' => $phonetic_key,
            );
            $aid = $mod->add($keymap);
            foreach ($val as $v) {
                $path = '0'.'_'.$aid;
                $phonetic_v = str_replace(' ','',pinyin($v));
                $valmap = array(
                    'pid' => $aid,
                    'path' => $path,
                    'name' => $v,
                    'phonetic_name' => $phonetic_v,
                );
                $ret = $mod->add($valmap);
            }

        }
        var_dump('sql write ok!');
    }

    public function saveSchool()
    {
        $data = $this->getSchool();
        $amod =M('area_category');
        $smod =M('school');
        foreach ($data as $val){
            $map = array(
                'name' => $val['area_id'],
            );

            $ret = $amod->where($map)->find();

            if (!$ret){
                $val['area_id'] = 999;
            }else{
                $val['area_id'] = $ret['aid'];
            }
            $smod->add($val);
        }

        var_dump('all area can find');
    }
    public function getSchool()
    {
        import('vendor.PHPExcel.PHPExcel');
        //要导入的xls文件，位于根目录下的Public文件夹
        $filename="school.xls";
        //创建PHPExcel对象，注意，不能少了\
        $PHPExcel=new \PHPExcel();
        //如果excel文件后缀名为.xls，导入这个类
        import("Org.Util.PHPExcel.Reader.Excel5");
        //如果excel文件后缀名为.xlsx，导入这下类
        //import("Org.Util.PHPExcel.Reader.Excel2007");
        //$PHPReader=new \PHPExcel_Reader_Excel2007();

        $PHPReader=new \PHPExcel_Reader_Excel5();
        //载入文件
        $PHPExcel=$PHPReader->load($filename);
        //获取表中的第一个工作表，如果要获取第二个，把0改为1，依次类推
        $currentSheet=$PHPExcel->getSheet(0);
        //获取总列数
        $allColumn=$currentSheet->getHighestColumn();
        //获取总行数
        $allRow=$currentSheet->getHighestRow();

        $i=0;
        $shenzhixia = false;
        $nowA = '';
        $arr = [];
        //循环获取表中的数据，$currentRow表示当前行，从哪行开始读取数据，索引值从0开始
        for($currentRow=1;$currentRow<=$allRow;$currentRow++){
            //从哪列开始，A表示第一列
            //for($currentColumn='A';$currentColumn<=$allColumn;$currentColumn++){
            //数据坐标
            //$address=$currentColumn.$currentRow;
            //读取到的数据，保存到数组$arr中
            //$arr[$currentRow][$currentColumn]=$currentSheet->getCell($address)->getValue();
            //$str = $currentSheet->getCell($address)->getValue();

            //}

            $strA = $currentSheet->getCell('A'.$currentRow)->getValue();

            if (is_numeric($strA)){
                $sName = $currentSheet->getCell('B'.$currentRow)->getValue();
                $sArea = $currentSheet->getCell('D'.$currentRow)->getValue();
                $sLevel = $currentSheet->getCell('E'.$currentRow)->getValue();
                if($sLevel == '本科') {
                    $sLevel =1;
                }else{
                    $sLevel =2;
                }
                $phoneticName = str_replace(' ','',pinyin($sName,'all',''));
                $t = array(
                    'name' => $sName,
                    'area_id' => $sArea,
                    'level' => $sLevel,
                    'phonetic_name' =>$phoneticName,
                );
                Array_push($arr,$t);
            }



        }
        return $arr;
    }

    public function excel()
    {
        import('vendor.PHPExcel.PHPExcel');
        //要导入的xls文件，位于根目录下的Public文件夹
        $filename="city2.xls";
        //创建PHPExcel对象，注意，不能少了\
        $PHPExcel=new \PHPExcel();
        //如果excel文件后缀名为.xls，导入这个类
        import("Org.Util.PHPExcel.Reader.Excel5");
        //如果excel文件后缀名为.xlsx，导入这下类
        //import("Org.Util.PHPExcel.Reader.Excel2007");
        //$PHPReader=new \PHPExcel_Reader_Excel2007();

        $PHPReader=new \PHPExcel_Reader_Excel5();
        //载入文件
        $PHPExcel=$PHPReader->load($filename);
        //获取表中的第一个工作表，如果要获取第二个，把0改为1，依次类推
        $currentSheet=$PHPExcel->getSheet(0);
        //获取总列数
        $allColumn=$currentSheet->getHighestColumn();
        //获取总行数
        $allRow=$currentSheet->getHighestRow();

        $i=0;
        $shenzhixia = false;
        $nowA = '';
        $arr = [];
        //循环获取表中的数据，$currentRow表示当前行，从哪行开始读取数据，索引值从0开始
        for($currentRow=1;$currentRow<=$allRow;$currentRow++){
            //从哪列开始，A表示第一列
            //for($currentColumn='A';$currentColumn<=$allColumn;$currentColumn++){
            //数据坐标
            //$address=$currentColumn.$currentRow;
            //读取到的数据，保存到数组$arr中
            //$arr[$currentRow][$currentColumn]=$currentSheet->getCell($address)->getValue();
            //$str = $currentSheet->getCell($address)->getValue();

            //}

            $strA = $currentSheet->getCell('A'.$currentRow)->getValue();
            $strB = $currentSheet->getCell('B'.$currentRow)->getValue();
            $strC = $currentSheet->getCell('C'.$currentRow)->getValue();
            $strC = trim($strC);

            if ($shenzhixia && empty($strB)) {
                //$arr[$nowA] = $strC;
                Array_push($arr[$nowA],$strC);
                continue;
            }else if ($shenzhixia && !empty($strB)){
                $shenzhixia = false;
                //$arr[$nowA] = $strB;
                Array_push($arr[$nowA],$strC);
            }


            if (!empty($strA) && !empty($strB)) {
                $nowA = $strA;
                if ($strB == '省直辖行政单位'){
                    $shenzhixia = true;
                    $arr[$nowA] = [];
                    Array_push($arr[$nowA],$strC);
                    continue;
                }else{
                    $arr[$nowA] = [];
                    Array_push($arr[$nowA],$strB);
                }
            }elseif (empty($strA) && !empty($strB)) {
                if ($strB == '省直辖行政单位'){
                    $shenzhixia = true;
                    //$arr[$nowA] = $strC;
                    Array_push($arr[$nowA],$strC);
                    continue;
                }else{
                    Array_push($arr[$nowA],$strB);

                }
            }
        }
        return $arr;
    }
}