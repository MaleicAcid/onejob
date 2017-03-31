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

    <div class="main">
        <div class="details">
            <div class="details-enterpriseInformation">
                <div class="details-enterpriseInformation-basic">
                    <img src="<?php echo ($val['reply']['logo']); ?>" alt="">
                    <h1><?php echo ($res_job['short_name']); ?></h1>
                    <ul>
                        <li><i class=" icon-user-7"><a href="<?php echo U('CompanyShow/index',array('id'=>$res_job['company_info']['id']));?>"></i><?php echo ($res_job['company_info']['name']); ?></li></a>
                        <li><i class=" icon-phone-outline"></i><?php echo ($res_job['company_info']['tel']); ?></li>
                        <li><i class=" icon-mail"></i><?php echo ($res_job['company_info']['email']); ?></li>
                        <li><i class=" icon-location-outline"></i><?php echo ($res_job['company_info']['address']); ?></li>
                    </ul>
                </div>
                <div class="details-enterpriseInformation-introduce">
                    <p>公司介绍</p>
                    <hr>
                    <span><?php echo ($res_job['company_info']['one_desc']); ?></span>
                </div>
            </div>
            <div class="positionInformation">
                <div class="positionInformation-position">
                    <div class="left">
                        <h1><?php echo ($res_job['name']); ?></h1>
                        <div class="requirements">
                            <span><?php echo ($res_job['edu']); ?></span>
                            <span><?php echo ($res_job['work_year']); ?></span>
                            <span><?php echo ($res_job['need_people']); ?>人</span>
                        </div>
                        <div class="time">发布时间：<span><?php echo ($res_job['create_time']); ?></span></div>
                    </div>
                    <div class="right">
                        <div class="salary"><?php echo ($res_job['salary_low']); ?>k~<?php echo ($res_job['salary_high']); ?>k</div>
                        <?php if(($res_job['showCol'] == 1)): ?><a id="collect" onclick="collect_job(<?php echo ($res_job['jid']); ?>)" class="icon-star" style="color:rgb(255, 192, 203);font-size: 40px;"></a>
                        <?php else: ?>
                            <a id="collect" onclick="collect_job(<?php echo ($res_job['jid']); ?>)" class="icon-star" style="color:#ccc;font-size: 40px;"></a><?php endif; ?>
                    </div>
                </div>
                <div class="positionInformation-introduce">
                    <div class="describe">
                        <p>企业介绍</p>
                    </div>
                    <div class="introduce">
                        <ul>
                            <li><i class=" icon-address-1"></i><?php echo ($res_job['company_info']['trade']); ?></li>
                            <li><i class="  icon-doc-text-2"></i><?php echo ($res_job['company_info']['invest']); ?></li>
                            <li><i class="  icon-users-outline"></i><?php echo ($res_job['company_info']['scale']); ?></li>
                        </ul>
                    </div>
                </div>
                <div class="positionInformation-describe">
                    <div class="describe">
                        <p>职位描述</p>
                    </div>
                    <div class="describe-list">
                        <?php echo ($res_job['text']); ?>
                        <!--<p>岗位职责:</p>-->
                        <!--<ol>-->
                            <!--<li>负责公司产品界面的整体UI、UE规划和设计I及实施；</li>-->
                            <!--<li>负责公司产品界面的整体UI、UE规划和设计I及实施；</li>-->
                            <!--<li>负责公司产品界面的整体UI、UE规划和设计I及实施；</li>-->
                            <!--<li>负责公司产品界面的整体UI、UE规划和设计I及实施；</li>-->
                            <!--<li>负责公司产品界面的整体UI、UE规划和设计I及实施；</li>-->
                            <!--<li>负责公司产品界面的整体UI、UE规划和设计I及实施；</li>-->
                        <!--</ol>-->
                        <!--<p>职位要求:</p>-->
                        <!--<ol>-->
                            <!--<li>负责公司产品界面的整体UI、UE规划和设计I及实施；</li>-->
                            <!--<li>负责公司产品界面的整体UI、UE规划和设计I及实施；</li>-->
                            <!--<li>负责公司产品界面的整体UI、UE规划和设计I及实施；</li>-->
                            <!--<li>负责公司产品界面的整体UI、UE规划和设计I及实施；</li>-->
                            <!--<li>负责公司产品界面的整体UI、UE规划和设计I及实施；</li>-->
                            <!--<li>负责公司产品界面的整体UI、UE规划和设计I及实施；</li>-->
                        <!--</ol>-->
                    </div>
                </div>
                <div class="positionInformation-comment">
                    <div class="describe">
                        <p>评论中心</p>

                        <div onclick="showReply(this)" class="reply">评论</div>
                        <div class="inp">
                            <form action="<?php echo U('Home/User/add_comment');?>">
                                <input type="hidden" name="job_id" value="<?php echo ($res_job['jid']); ?>"/>
                                <input type="text" name="content"/>
                                <button onclick="comment_submit(this)" type="button">发送</button>
                            </form>
                        </div>
                    </div>
                    <div style="display:block" id="ajax_comment_return">
                        <!--ajax 然后分页数据-->
                        <!--<div class="comment-list">-->
                            <!--<div class="userName">-->
                                <!--<div class="userIcon">-->
                                    <!--<img src="image/a.png" alt="">-->
                                    <!--<span>周杰伦</span>-->
                                <!--</div>-->
                                <!--<div class="userTime">-->
                                    <!--<span>2017.02.22</span>-->
                                <!--</div>-->
                            <!--</div>-->
                            <!--<div class="comment-content">-->
                                <!--<p>你好，我自认为能胜任该职位，可否近一步详聊！</p>-->
                                <!--<div class="reply">回复</div>-->
                                <!--<div class="inp">-->
                                    <!--<form action="">-->
                                        <!--<input type="text" name="content">-->
                                        <!--<button type="submit">发送</button>-->
                                    <!--</form>-->
                                <!--</div>-->
                            <!--</div>-->
                        <!--</div>-->
                        <!--<hr>-->

                    </div>
                    <div class="number">
                        <ul>
                            <!--<?php echo ($page); ?>-->
                        </ul>
                    </div>
                </div>
            </div>
            <div style="clear: both"></div>
        </div>
    </div>

    <script src="<?php echo (C("JS_URL")); ?>jquery-3.1.1.min.js"></script>
    <script>
        function comment_submit(t){
            //表单对象
            var form = $(t).parent();
            var data = $(form).serialize();
            $.ajax({
                type : "POST",
                url:"<?php echo U('Home/User/add_comment');?>",
                data :data,// 你的formid 搜索表单 序列化提交
                success: function(data){
                    data = jQuery.parseJSON(data);
                    //console.log(data);
                    if(data.status == 1){
                        //评论成功
                        alert('评论成功');

                    }else if(data.status == -2) {
                        alert(data.msg);
                        window.location.href  = "<?php echo U('Home/Users/login');?>"
                    }else{
                        alert(data.msg);
                    }
                }
            });
        }
    </script>
    <script type="text/javascript">
        function showReply(obj) {
            if ($(obj).next().css('display') == 'none'){
                $(obj).next().css('display','block')
            }else {
                $(obj).next().css('display','none')
            }
        }
    </script>
    <script type="text/javascript">
        // 点击收藏商品
        function collect_job(job_id){
            $.ajax({
                type : "post",
                dataType: "json",
                data : {'jid':job_id},
                url:"<?php echo U('Home/User/collect_job');?>",
                success: function(data){
                    if (data.status == -2) {
                        alert(data.msg)
                        window.location.href  = "<?php echo U('Home/Users/login');?>"
                    }else if (data.status == 1 || data.status == -3){
                        change_color()
                    }else{
                        alert(data.msg)
                    }
                }
            });
        }
        function change_color() {
            console.log($('#collect').css('color'));
            if ($('#collect').css('color') == 'rgb(255, 192, 203)'){
                $('#collect').css('color','#ccc')
            }else {
                $('#collect').css('color','rgb(255, 192, 203)')
            }
        }

    </script>
    <script type="text/javascript">
        $(document).ready(function(){
            ajaxComment();// ajax 加载评价列表
        });

    </script>
    <script type="text/javascript">
        var page = 1;
        var jid = <?php echo ($res_job['jid']); ?>;
        var reg ="no-ajax-content"; //匹配<p>标签判断获取的页面是否没有更多了
        var newPage = true;
        var url = "<?php echo U('Home/JobShow/get_job_comment');?>";
        var com_id = <?php echo ($res_job['company_id']); ?>;
        function ajaxComment(){
            //$('.get_more').show();
            if(newPage){
                $.ajax({
                    type : "get",
                    data : {'p':page,'jid':jid,'id':com_id},
                    url: url,
                    dataType:'html',
                    success: function(data)
                    {
                        var tmp = data;
                        if(data){
                            //alert($(data).attr("id") );
                            $("#ajax_comment_return").append(data);
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
                ajaxComment();
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
        var t1 = window.setInterval("get_msg()",10000);
        //去掉定时器的方法
        //        window.clearInterval(t1);
    </script>