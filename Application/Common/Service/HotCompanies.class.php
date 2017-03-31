<?php
/**
 * 热门企业
 */

namespace Common\Service;

class HotCompanies {

    public $allHotCompanies = null;
	public $hotCompanies = null;
	static public $mInstance = null;
	static public $mData = null;
	static public $mAllKey = 'HOTCOMPANIES###ALLKEY';
    static public $mKey = 'HOTCOMPANIES###KEY';
    static public $limit = 4;

	private function __construct(){}

	static public function getInstance()
	{
		if (!is_object(self::$mInstance)) {
			self::$mInstance = new HotCompanies;
			if (S(self::$mAllKey)) {
				self::$mInstance->loadFromCache();
			} else {
				self::$mInstance->loadFromDb();
			}
		}
		return self::$mInstance;
	}

	public function loadFromCache()
	{
		self::$mInstance->allHotCompanies = S(self::$mAllKey);
//        self::$mInstance->hotCompanies = S(self::$mKey);
	}

	public function loadFromDb()
	{
		$comMod = M('Company');
		$hot_map = array(
		    'is_hot' => 1,
            'state' => 1,
            'status' => 1,
        );
        $res = $comMod->where($hot_map)->select();
        foreach ($res as $key =>&$val){
            $val['logo'] = get_https_img($val['logo']);
        }
		self::$mInstance->allHotCompanies = $res;
//        self::$mInstance->hotCompanies = $this->getHotCompanies($res);

		// 设置缓存
        S(self::$mAllKey, self::$mInstance->allHotCompanies,7200);
//		S(self::$mKey, self::$mInstance->hotCompanies);
	}


	/**
	 * 清除所有缓存
	 */
	public function allClear()
	{
        S(self::$mAllKey, null);
	}

    /**
     * 清除热门缓存
     */
    public function clear()
    {
        S(self::$mKey, null);
    }

    public function setLimit($num)
    {
        self::$limit = $num;
        self::$mInstance->clear();
	}

	/**
	 * 获取指定数个热门企业
	 */
	public function getHotCompanies($num = 4)
	{
        return arrayExtract(self::$mInstance->allHotCompanies,$num);
	}
}