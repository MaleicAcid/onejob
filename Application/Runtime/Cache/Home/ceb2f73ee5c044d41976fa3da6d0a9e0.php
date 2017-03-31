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
                <a href="<?php echo U('Home/User/index');?>"><?php echo ($_SESSION['user']['realname']); ?></a>
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

    <div class="main">
        <div class="companiesList-main">
            <div class="companiesList-content">
                <ul>
                    <?php if(is_array($companies)): foreach($companies as $key=>$com): ?><a href="<?php echo U('Home/CompanyShow/index',array('id'=>$com['id']));?>">
                            <li>
                                <div class="basicInformation">
                                    <img src="<?php echo (get_img($com['logo'])); ?>" alt="">
                                    <p>
                                        <span><?php echo ($com['name']); ?></span><br>
                                        <span><i class="icon-menu"></i><?php echo ($com['trade']); ?></span>
                                    </p>
                                    <div class="com-manage">
                                        <span><i class="icon-menu"></i><?php echo ($com['invest']); ?></span>
                                        <span><i class="icon-menu"></i><?php echo ($com['scale']); ?></span>
                                        <span><i class="icon-menu"></i><?php echo ($com['address']); ?></span>
                                    </div>
                                </div>
                                <div class="num">
                                    <p><?php echo ($com['view_num']); ?></p>
                                    <span>阅览量</span>
                                </div>
                            </li>
                        </a><?php endforeach; endif; ?>
                </ul>
                <ul id ="add-content"></ul>
            </div>
            <div class="companiesList-subNav">
                <ul>
                    <li>热门企业</li>
                    <?php if(is_array($hot_com)): foreach($hot_com as $key=>$c): ?><li><?php echo ($c['name']); ?><img src="<?php echo (C("IMG_URL")); ?>albb.png" alt=""></li><?php endforeach; endif; ?>
                </ul>
            </div>
            <div style="clear: both"></div>
        </div>
    </div>
    <script src="<?php echo (C("JS_URL")); ?>jquery-3.1.1.min.js"></script>

    <script type="text/javascript">
        var page = 2;
        var reg ="no-ajax-content"; //匹配<p>标签判断获取的页面是否没有更多了
        var newPage = true;
        function get_remindList(){
            //$('.get_more').show();
            if(newPage){
                $.ajax({
                    type : "get",
                    url: "/index.php/Home/Index/get_company_list/is_ajax/1/p/"+page,
                    dataType:'html',
                    success: function(data)
                    {
                        var tmp = data;
                        if(data){
                            //alert($(data).attr("id") );
                            $("#add-content").append(data);
                            page++;
                            if(tmp.match(reg)){
                                //如果是no-ajax-content则标记为false
                                newPage = false;
                            }
                        }else{
//                           $("#mycomment").append(data);
//                            page++;
                        }
                    }
                });
            }

        }
        function getScrollTop(){
            var scrollTop = 0, bodyScrollTop = 0, documentScrollTop = 0;
            if(document.body){
                bodyScrollTop = document.body.scrollTop;
            }
            if(document.documentElement){
                documentScrollTop = document.documentElement.scrollTop;
            }
            scrollTop = (bodyScrollTop - documentScrollTop > 0) ? bodyScrollTop : documentScrollTop;
            return scrollTop;
        }
        //文档的总高度
        function getScrollHeight(){
            var scrollHeight = 0, bodyScrollHeight = 0, documentScrollHeight = 0;
            if(document.body){
                bodyScrollHeight = document.body.scrollHeight;
            }
            if(document.documentElement){
                documentScrollHeight = document.documentElement.scrollHeight;
            }
            scrollHeight = (bodyScrollHeight - documentScrollHeight > 0) ? bodyScrollHeight : documentScrollHeight;
            return scrollHeight;
        }
        //浏览器视口的高度
        function getWindowHeight(){
            var windowHeight = 0;
            if(document.compatMode == "CSS1Compat"){
                windowHeight = document.documentElement.clientHeight;
            }else{
                windowHeight = document.body.clientHeight;
            }
            return windowHeight;
        }
        window.onscroll = function(){
            if(getScrollTop() + getWindowHeight() == getScrollHeight()){
                get_remindList();
            }
        };
    </script>
    <div class="footer">
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
        var t1 = window.setInterval("get_msg()",1000000);
        //去掉定时器的方法
        //        window.clearInterval(t1);
    </script>