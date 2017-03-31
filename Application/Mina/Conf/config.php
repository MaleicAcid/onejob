<?php
return array(
    'LOAD_EXT_FILE' =>'api_function,common',

    // 添加数据库配置信
//    'SHOW_PAGE_TRACE' =>true,
//    'DB_TYPE'  => 'mysql', // 数据库类型
//    'DB_HOST'  => '123.56.73.180', // 服务器地址
//    'DB_NAME'  => 'onejob', // 数据库名
//    'DB_USER'  => 'maleic', // 用户名
//    'DB_PWD'  => 'XXXXmm1000', // 密码
//    'DB_PORT'  => 3306, // 端口
//    'DB_PREFIX' => 'oj_', // 数据库表前缀缀
//    'SESSION_OPTIONS'=>array(
//        'type'=> 'Redis',//session采用数据库保存
//        'expire'=>1440,//session过期时间，如果不设就是php.ini中设置的默认值
//    ),
//    'SESSION_TABLE'=>'oj_session', //必须设置成这样，如果不加前缀就找不到数据表，这个需要注意

    //'SESSION_TYPE' => 'Redis',
    'DATA_CACHE_TYPE'=>'Redis',
    //session保存类型
//    'SESSION_PREFIX' => '', //session前缀
    'REDIS_HOST' => '127.0.0.1', //REDIS服务器地址
    'REDIS_PORT' => 6379, //REDIS连接端口号
    //'SESSION_EXPIRE' => 3600, //SESSION过期时间

);