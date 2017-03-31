<?php
return array(
    'MINA_APPID'=> 'wxaed8d8fb8a10a99a',
    'MINA_APPSECRET' => 'cb3b9decc9a35bcaa5b5bd97351ceaef',

    'MP_APPID'=> 'wx5c0c4def22779391',
    'MP_APPSECRET' => '4cc82f0054ce7b9170f72ca7ffc5dcd7',
    //加载公共函
    'LOAD_EXT_FILE' =>'common',

    'TMPL_PARSE_STRING'  =>array(
        '__STYLE__' => '/Public/Assets',
        '__UPLOAD__' => '/Uploads',
    ),

    //给项目做静态文件访问路由路径的配置
    //后台
    'BK_CSS_URL' => '/Public/Assets/css/',
    'BK_JS_URL' => '/Public/Assets/js/',
    'BK_IMG_URL' => '/Public/Assets/images/',

    //前台
    'CSS_URL' => '/Public/Home/css/',
    'JS_URL' => '/Public/Home/js/',
    'IMG_URL' => '/Public/Home/image/',
    'LIB_URL' => '/Public/Home/lib/',

    //移动
    'MB_CSS_URL' => '/Public/Mobile/css/',
    'MB_JS_URL' => '/Public/Mobile/js/',
    'MB_IMG_URL' => '/Public/Mobile/img/',
    'MB_LIB_URL' => '/Public/Mobile/lib/',

    //Memcache为缓存方式
    //'DATA_CACHE_TYPE'=>'Memcache',
    //短信发送配置
    'DAYU_KEY' => '23634363',
    'DAYU_SECRET' => 'd3b749d9a46f4848ff430a44ec38a3a5',
    'CODE_TPL' => 'SMS_46830137',//验证码的模版:尊敬的${name},您的验证码为:${code},请赶快验证！

    // url
    //'URL_MODEL'             => 2,
	//'配置项'=>'配置值'
	'DB_TYPE'               =>  'mysqli',     // 数据库类型
    'DB_HOST'               =>  '123.56.73.180', // 服务器地址
    'DB_NAME'               =>  'onejob',          // 数据库名
    'DB_USER'               =>  'maleic',      // 用户名
    'DB_PWD'                =>  'XXXXmm1000',          // 密码
    'DB_PORT'               =>  '3306',        // 端口
    'DB_PREFIX'             =>  'oj_',    // 数据库表前缀
    'DB_FIELDTYPE_CHECK'    =>  false,       // 是否进行字段类型检查
    'DB_FIELDS_CACHE'       =>  true,        // 启用字段缓存
    'DB_CHARSET'            =>  'utf8',      // 数据库编码默认采用utf8
	'SHOW_PAGE_TRACE' 		=>	false,				//开启页面trace
	'DOMAIN'                =>  'http://www.zhaopinzd.com',
    'HTTPS_DOMAIN'                =>  'https://www.zhaopinzd.com',
	'WEB_NAME'				=>	'就业直达号',
    
    'DEFAULT_FILTER'        =>  'htmlspecialchars,trim', // 默认参数过滤方法 用于I函数...
    'MODULE_ALLOW_LIST'    =>    array('Home','onejobmanage','Mobile','Mina'),
    'DEFAULT_MODULE'       =>    'Home',
    'URL_MODULE_MAP'    =>    array('onejobmanage'=>'admin'),//模块映射的模块必须小写!不能写Admin
    'DEFAULT_CHARSET' => 'utf8',

    'PLUGIN_URL' =>'/'.APP_PATH.'Plugin/',
    //定义网站的域名地址(可以方便图片的显示)
    'SITE_URL'  => 'http://www.zhaopinzd.com/',
    'HTTPS_SITE_URL' => 'https://www.zhaopinzd.com/',

    //默认头像图片路径
    'USER_DEFAULT_HEAD_PIC' => 'Uploads/Admin/Default/user_default_head_pic.png',
    'COMPANY_DEFAULT_LOGO' => 'Uploads/Admin/Default/company_default_logo.png',
    // email配置
    'email_host' => 'smtp.163.com',
    'email_port' => 25,
    'email_username' => 'CSmahongyuan@163.com',
    'email_pwd' => 'XXXXmm1000sq',
    'email_fromname' => '就业直达号',

    // 公司的配置文件

    //公司投资类型
    'company_invest' => array(
        1 => '国家机关',
        2 => '国有企业',
        3 => '外资企业',
        4 => '教科院所',
        5 => '其他事业单位',
        6 => '民营企业',
        7 => '其他'
    ),
    // 公司的规模
    'company_scale' => array(
        1 => '少于15人',
        2 => '15-50人',
        3 => '50-150人',
        4 => '150-500人',
        5 => '500-2000人',
        6 => '2000人以上',
    ),

    // 公司发展阶段
    'company_stage' => array(
        0 => '天使轮',
        1 => 'A轮',
        2 => 'B轮',
        3 => 'C轮',
        4 => 'D轮及以上',
        5 => '上市公司',
        6 => '不需要融资',
    ),

    // 企业状态
    'company_state' => array(
        -1 => '未验证',
        1 => '已认证',
        2 => '未认证',
        3 => '正在申请认证',
        4 => '认证失败',
    ),
    'job_edu' => array(
        0 => '未填写',
        1 => '博士及以上',
        2 => '硕士',
        3 => '本科',
        4 => '大专',
        5 => '高中及以下',
        6 => '不限',
    ),
    'user_sex' => array(
        0 => '保密',
        1 => '男',
        2 => '女',
    ),
    'user_complete_info' =>array(
        '请完善姓名信息' => 'realname',
        '请完善性别信息' => 'sex',
        '请完善学校信息' => 'school',
        '请完善专业信息' => 'major',
        '请完善学历信息' => 'edu',
        '请完善入学时间信息' => 'entry_year',
        '请绑定手机号信息' => 'tel',
    ),
    'company_complete_info'=>array(
        '请填写公司名' => 'name',
        '请填写公司规模' => 'scale',
        '请填写公司地址' => 'address',
        '请填写公司介绍' => 'desc',
        '请填写投资类型' => 'invest',
        '请填写公司领域' => 'trade',
        '请绑定手机号' => 'tel',
    ),
    'work_year' =>array(
        '0' => '不限',
        '1' => '1~3年',
        '2' => '3~5年',
        '3'=> '5年以上',
        ),
    // 城市系统
    'city' => array(
        'hot'=>array('全国', '北京', '上海', '广州', '深圳', '成都', '杭州', '武汉', '南京'),
        'other'=>array(
            ABCDEF=>array(
                '北京', '长春', '成都', '重庆', '长沙', '常州', '东莞', '大连', '佛山', '福州'
            ),
            GHIJ=>array(
                '贵阳', '广州', '哈尔滨', '合肥', '海口', '杭州', '惠州', '金华', '济南', '嘉兴'
            ),
            KLMN=>array(
                '昆明', '廊坊', '宁波', '南昌', '南京', '南宁', '南通'
            ),
            OPQR=>array(
                '青岛', '泉州'
            ),
            STUV=>array(
                '上海', '石家庄', '绍兴', '沈阳', '深圳', '苏州', '天津', '太原', '台州'
            ),
            WXYZ=>array(
                '武汉', '无锡', '温州', '西安', '厦门', '烟台', '珠海', '中山', '郑州'
            ),
        ),
)
);