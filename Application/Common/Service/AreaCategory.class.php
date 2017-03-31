<?php
/**
 * 地区分类
 */

namespace Common\Service;

class AreaCategory {

	public $mCategory = null;
	static public $mInstance = null;
	static public $mData = null;
	static public $mKey = 'AREACATEGORY###KEY';

	private function __construct(){}

	static public function getInstance()
	{
		if (!is_object(self::$mInstance)) {
			self::$mInstance = new AreaCategory;
			if (S(self::$mKey)) {
				self::$mInstance->loadFromCache();
			} else {
				self::$mInstance->loadFromDb();
			}
		}
		return self::$mInstance;
	}

	public function loadFromCache()
	{
		self::$mInstance->mCategory = S(self::$mKey);
	}

	public function loadFromDb()
	{
		$category = M('AreaCategory')->select();
		
		$one = array();
		$two = array();
		$three = array();

		foreach($category as $key=>$val) {
			$path_level = count(explode('_', $val['path']));

			$val['child'] = $val['path'].'_'.$val['aid'];

			if ($path_level == 1) {
				$one[$val['aid']] = $val;
			} else if ($path_level == 2) {
				$two[$val['path']][$val['aid']] = $val;
			} else if ($path_level == 3) {
				$three[$val['path']][$val['aid']] = $val;
			}
		}

		foreach ($one as $key=>&$val) {
			foreach ($two[$val['child']] as $k=>&$v) {
				$v['child'] = $three[$v['child']];
			}
			$val['child'] = $two[$val['child']];
		}

		self::$mInstance->mCategory = $one;

		// 设置缓存
		S(self::$mKey, self::$mInstance->mCategory);
	}

	/**
	 * 通过三级名称获取二级父类信息
	 */
	public function getParent($name)
	{
		foreach (self::$mInstance->mCategory as $key => $val) {
			foreach ($val['child'] as $kk => $vv) {
				foreach ($vv['child'] as $k=>$v) {
					if ($v['name'] == $name) {
						return $vv;
					}
				}
			}
		}
	}

	/**
	 * 清除缓存
	 */
	public function clear()
	{
		S(self::$mKey, null);
	}

	/**
	 * 获取分类string
	 */
	public function getClass()
	{
		$sql = "select *,CONCAT(path,'_',aid) as pathid from oj_job_category order by pathid asc";
		$res = M()->query($sql);

		foreach($res as &$val) {

			if ($val['pid'] == 0) {
				$val['rep'] = $val['name'];
				continue;
			} 

			$strl = (count(explode('_', $val['path']))-1)*4;
			$val['rep'] = str_repeat('&nbsp;', $strl) . '└─'.$val['name'];
		}

		return $res;
	}
}