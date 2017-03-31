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
<link rel=stylesheet type=text/css href="<?php echo (C("CSS_URL")); ?>banner.css">
<script type=text/javascript src="<?php echo (C("JS_URL")); ?>banner.js"></script>
<script type=text/javascript src="<?php echo (C("JS_URL")); ?>banner-js.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $(".area").hover(function(){
                $(this).find(".qq1").show(100);}
            ,function(){
                $(this).find(".qq1").hide(100);
            });
    });
</script>
    <div class="main">
        <div>
            <div class="sidebar">
                <div class="mainNavs">
                    <?php foreach ($res_category as $vo): ?>
                    <div class="menu_box">
                        <div class="menu_main job_hopping">
                            <h2>
                                <!--技术-->
                                <?php echo ($vo['name']); ?>
                                <span></span>
                            </h2>
<!--                            <a href="#">Java</a>
                            <a href="#">Java</a>
                            <a href="#">Java</a>
                            <a href="#">Java</a>-->
                        </div>
                        <div class="menu_sub dn" style="top: 0;">
                            <dl>
                                <?php foreach ($vo['child'] as $v): ?>
                                <?php if($v['pid'] == $vo['id']): ?><dt>
                                    <a href="#"><?php echo ($v['name']); ?></a>
                                </dt><?php endif; ?>
                                <dd>
                                    <?php foreach ($v['child'] as $o): ?>
                                    <?php if($o['pid'] == $v['id']): ?><a class="curr" href="<?php echo U('Search/index',array('cate_id'=>$o['id']));?>"><?php echo ($o['name']); ?></a><?php endif; ?>
                                    <?php endforeach ?>
                                </dd>
                                <?php endforeach ?>
                            </dl>

                        </div>
                    </div>
                    <?php endforeach ?>
                </div>
                <div class="banner">
                    <div class="search">
                        <form action="/index.php/Home/Search/index" method="get">
                            <input type="text" name="query" placeholder="搜索">
                            <button type="submit">搜索</button>
                        </form>

                    </div>
                    <div class="banner-img">
                        <!-- <img src="image/banner.png" alt=""> -->
                        <div class="area">

                            <a id=prev class="prevBtn qq1" href="javascript:void(0)"></a>

                            <a id=next class="nextBtn qq1" href="javascript:void(0)"></a>

                            <div id=js class="js">

                                <div class="box01">
                                    <?php foreach ($link as $val): ?>
                                    <img onClick="javascript:;" width="880px" height="378px" src="<?php echo (get_img($val['link_pic'])); ?>">
                                    <?php endforeach ?>
                                </div>

                                <div class="bg"></div>

                                <div id=jsNav class=jsNav>

                                    <?php foreach ($link as $val): ?>
                                    <a class="trigger" href="javascript:void(0)">·</a>
                                    <?php endforeach ?>

                                </div>

                            </div>

                        </div>
                    </div>
                    <div style=" float:left" class="recommended">
                        <h1>推荐企业</h1>
                        <div class="enterprise1">

                            <ul >
                                <?php if(is_array($hot_com)): foreach($hot_com as $key=>$hot): ?><a href="<?php echo U('CompanyShow/index',array('id'=>$hot['id']));?>"><li><img src="<?php echo ($hot['logo']); ?>" alt=""><?php echo ($hot['short_name']); ?></li></a><?php endforeach; endif; ?>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div style="clear: both;"></div>
            <div class="position">
                <div class="position-nav">
                    <ul>
                        <?php if(is_array($res_category)): foreach($res_category as $key=>$i): ?><li><a href="<?php echo U('Home/Search/index',array('cate_id'=>$i['id']));?>"><?php echo ($i['name']); ?></a></li>
                            <!--<li class="select"><a>金融</a></li>--><?php endforeach; endif; ?>
                    </ul>
                </div>


                <div class="position-content">
                    <ul>
                        <?php if(is_array($index_jobs)): foreach($index_jobs as $key=>$job): ?><li>
                            <a href = "<?php echo U('Home/JobShow/index',array('jid'=>$job['jid']));?>" >
                            <div class="left">
                                <h1><?php echo ($job['name']); ?></h1>
                                <div class="requirements">
                                    <span><?php echo ($job['edu']); ?></span>
                                    <span><?php echo ($job['work_year']); ?></span>
                                    <span><?php echo ($job['need_people']); ?>人</span>
                                </div>
                                <div class="time">发布时间：<span><?php echo (date('Y-m-d H:i',$job['create_time'])); ?></span></div>
                            </div>
                            <div class="right">
                                <div class="salary"><?php echo ($job['salary_low']); ?>k~<?php echo ($job['salary_high']); ?>k</div>
                                <div><img src="<?php echo (C("IMG_URL")); ?>a.png" alt=""></div>
                                <div class="name"><?php echo ($job['c_name']); ?></div>
                            </div>
                            </a>
                        </li><?php endforeach; endif; ?>
                    </ul>
                    <ul id = 'add-content'></ul>
                </div>
            </div>
        </div>
    </div>
    <script src="<?php echo (C("JS_URL")); ?>jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
        var page = 2;
        var reg ="no-ajax-content"; //匹配<p>标签判断获取的页面是否没有更多了
        var newPage = true;
        var url = "<?php echo U('Index/get_index_jobs');?>";
        function get_remindList(){
            //$('.get_more').show();
            if(newPage){
                $.ajax({
                    type : "get",
                    data : {'p':page,is_ajax:1},
                    url: url,
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