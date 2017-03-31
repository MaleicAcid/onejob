<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>就业直达号</title>
    <link rel="stylesheet" href="<?php echo (C("CSS_URL")); ?>animation.css">
    <link rel="stylesheet" href="<?php echo (C("CSS_URL")); ?>fontello.css">
    <link rel="stylesheet" href="<?php echo (C("CSS_URL")); ?>reset.css">
    <link rel="stylesheet" href="<?php echo (C("CSS_URL")); ?>index.css">
    <!--新建-->
    <link rel="stylesheet" type="text/css" href="<?php echo (C("CSS_URL")); ?>Chord.css"/>
    <link rel="stylesheet" href="<?php echo (C("CSS_URL")); ?>job_list.css" />

</head>
<body>
<div id="app">
    <div class="header">
        <div class="user">
            <?php if($_SESSION['user']!= null): ?><div id="msgCenter">
                    <a href="#" >消息中心</a><i></i>
                    <div id="msgInfo">
                        <ul>
                            <li>ssss</li>
                        </ul>
                    </div>
                </div>
                <a href="#"><?php echo ($_SESSION['user']['username']); ?></a>
                <a href="<?php echo U('Home/User/logout');?>">退出登录</a>
            <?php elseif($_SESSION['company']!= null): ?>
                <div id="msgCenter">
                    <a href="#" >消息中心</a><i></i>
                    <div id="msgInfo">
                        <ul>
                            <li>ssss</li>
                        </ul>
                    </div>
                </div>
                <a href="<?php echo U('Home/Company/index');?>">企业中心</a>
                <a href="#"><?php echo ($_SESSION['company']['name']); ?></a>
                <a href="<?php echo U('Home/Company/logout');?>">退出登录</a>
                <?php else: ?>
                <div id="msgCenter">
                    <a href="#" >消息中心</a><i></i>
                    <div id="msgInfo">
                        <ul>
                            <li>ssss</li>
                        </ul>
                    </div>
                </div>
                <!--<a href="javascript:alert_msg()">消息中心</a>-->
                <a href="<?php echo U('Home/Users/login');?>">快速登录</a><?php endif; ?>
        </div>
    </div>
    <div class="navBg">
        <div class="nav">
            <ul>
                <li>
                    <a href="<?php echo U('Home/Index/index');?>">首页</a>
                </li>
                <li>
                    <a href="<?php echo U('Home/Index/companyList');?>">企业</a>
                </li>
                <li>
                    <a href="#">互联网</a>
                </li>
                <li>
                    <a href="#">航海</a>
                </li>
                <li>
                    <a href="#">金融</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="main" style="width: 100%">
        <div class="login">
            <div class="logon">
                <div class="logon-c" id="role">
                    <p>选择您的角色</p>
                    <div>
                        <img src="<?php echo (C("IMG_URL")); ?>qiye.png" alt="" id="qiye">
                        <img src="<?php echo (C("IMG_URL")); ?>geren.png" alt="" id="geren">
                    </div>
                </div>
                <div class="logon-c" id="way">
                    <p>第三方一键登录</p>
                    <div>
                        <a href="javascript:company_open_qq()"><img src="<?php echo (C("IMG_URL")); ?>qq.png" alt="" id="qq"></a>
                        <a href="javascript:company_open_weixin()"><img src="<?php echo (C("IMG_URL")); ?>wei.png" alt="" id="wei-1"></a>
                    </div>
                </div>
                <div class="logon-c" id="way-1" style="display: none">
                    <p>第三方一键登录</p>
                    <div>
                        <a href="javascript:user_open_qq()"><img src="<?php echo (C("IMG_URL")); ?>qq.png" alt="" id="qq-1"></a>
                        <a href="javascript:user_open_weixin()"><img src="<?php echo (C("IMG_URL")); ?>wei.png" alt="" id="wei-1"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer" style="position: absolute;bottom: 0">
        <div class="pro">
            <div class="pro-content">
                <img src="<?php echo (C("IMG_URL")); ?>erweima.jpg" alt="">
                <span>扫一扫微信小程序</span>
                <p>电话咨询:<span>400-123-4564</span></p>
            </div>
        </div>
        <div class="manage">
            <p>Copyright © 2017 jyzd.com XXXXXXX有限公司 沪ICP备134679852号-1</p>
            <p>联系地址：上海市XX区XX街道XX大楼XX号 联系电话：010-82585200</p>
        </div>
    </div>
</div>
<script src="<?php echo (C("JS_URL")); ?>jquery-3.1.0.js"></script>

<script type="text/javascript">
function user_open_qq() {
    window.open("<?php echo U('LoginApi/login',array('oauth'=>'qq'));?>");
}
function company_open_qq() {
    window.open("<?php echo U('LoginApi/login',array('oauth'=>'qq','identity'=>'company'));?>");
}
function user_open_weixin() {
    window.open("<?php echo U('LoginApi/login',array('oauth'=>'weixin'));?>");
}
function company_open_weixin() {
    window.open("<?php echo U('LoginApi/login',array('oauth'=>'weixin','identity'=>'company'));?>");
}
</script>
<script>
    $(function () {
        $('#qiye').click(function () {
            $('#role').hide();
            $('#way').show();
        })
        $('#geren').click(function () {
            $('#role').hide();
            $('#way-1').show();
        })
    })
</script>
</body>
</html>
    <script type="text/javascript">
        $(function () {
            //消息中心显示
            $('#msgCenter a').hover(
                function () {
                    $('#msgInfo').fadeIn();
                    $('#msgCenter i').fadeOut();
                },
                function () {
                    $('#msgInfo').fadeOut();
                }
            );


        });
    </script>
    <script type="text/javascript">


        function get_msg() {
            var url = "<?php echo U('Index/get_short_msg');?>";
            //alert(111)
            $.ajax({
                type : "get",
                data : {is_ajax:1},
                url: url,
                success: function(data)
                {alert(11)
                    if(data){
                        alert(11)
//                        网页加载判断是否有消息 修改
                       // $('#msgCenter i').css({display:'inline-block'});
//                        $.each(data, function(i, n){
//                            $.each(n, function(j, m){
//                                $.each(p, function(k, p){
//                                    alert(11)
//                                    alert(p['id'])
//                                });
//                            });
//
//                        });

                    }else{
                        alert(22)
//                           $("#mycomment").append(data);
                    }
                }
            });
        }
//        get_msg()
        var t1 = window.setInterval("get_msg()",10000);
        //去掉定时器的方法
        //        window.clearInterval(t1);
    </script>