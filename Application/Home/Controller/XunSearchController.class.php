<?php
namespace Home\Controller;
use Think\Controller;
include '/usr/local/xunsearch/sdk/php/lib/XS.php';
class XunSearchController extends Controller {
    public function index(){
//        util/Indexer.php --rebuild --source=mysql://maleic:XXXXmm1000@127.0.0.1/onejob --sql="SELECT jid,name,text,create_time,is_top,is_hot,view_num,edu,company_id,salary_low,salary_high,address,city,cate_id FROM oj_job where status = 1 and state = 1" --filter=debug --project=onejob >/usr/local/xunsearch/sdk/php/util/log.txt
        $xs = new \XS('onejob'); // 这里是关键, XS这个类不在Home\Controller空间中,是在公共空间,所以加反斜杠就不会提示class xxx not found 错误了
		$search = $xs->search;
		$search->setCharset('UTF-8');
		$query = 'edu:1 AND java';
		$search->setQuery($query);
		$docs = $search->search();
		var_dump($docs);

	}

    public function clean()
    {
        $xs = new \XS('onejob'); // 建立 XS 对象，项目名称为：demo
        $index = $xs->index; // 获取 索引对象
        $index->clean();
	}
}