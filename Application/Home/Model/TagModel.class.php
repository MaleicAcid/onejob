<?php
/**
 * 多表联查 
 * @author 	wangz
 * @date     2014-11-13
 * @version  1.0
 */
namespace Home\Model;
use Think\Model;

class TagModel extends Model {

	public function getList($comId)
	{
		$sql = "SELECT oj_tag.name,oj_company_tag.* FROM oj_tag RIGHT JOIN oj_company_tag ON oj_tag.id = oj_company_tag.tag_id WHERE company_id = ".$comId." LIMIT 6";
		return $this->query($sql);
	}
}