<?php
/**
 * 职位分类
 */

namespace Common\Service;

class ShortNotice {

	public $short_notice = null;
	static public $mInstance = null;
	static public $mData = null;
	static public $mKey = 'SHORTNOTICE###KEY';

	private function __construct(){}

	static public function getInstance()
	{
		if (!is_object(self::$mInstance)) {
			self::$mInstance = new ShortNotice;
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
		self::$mInstance->short_notice = S(self::$mKey);
	}

    public function loadFromDb()
    {
        $comMod = M('ShortNotice');
        $map = array(
            'is_show' => 1,
        );
        $res = $comMod->where($map)->select();

        self::$mInstance->short_notice = $res;

        // 设置缓存
        S(self::$mKey, self::$mInstance->short_notice);
    }


	/**
	 * 清除缓存
	 */
	public function clear()
	{
		S(self::$mKey, null);
	}

}