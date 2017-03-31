<?php
/**
 * 首页轮播图
 */

namespace Common\Service;

class Link {

    public $link = null;
	static public $mInstance = null;
	static public $mData = null;
    static public $mKey = 'LINK###KEY';

	private function __construct(){}

	static public function getInstance()
	{
		if (!is_object(self::$mInstance)) {
			self::$mInstance = new Link;
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
		self::$mInstance->link = S(self::$mKey);
	}

	public function loadFromDb()
	{
		$comMod = M('Link');
		$map = array(
		    'is_show' => 1,
        );
        $res = $comMod->where($map)->select();

        self::$mInstance->link = $res;

		// 设置缓存
		S(self::$mKey, self::$mInstance->link);
	}

    /**
     * 清除热门缓存
     */
    public function clear()
    {
        S(self::$mKey, null);
    }

}