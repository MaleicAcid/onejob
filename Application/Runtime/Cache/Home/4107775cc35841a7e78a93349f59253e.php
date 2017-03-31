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

</head>
<body>
<div id="app">
    <div class="header">
        <div class="user">
            <?php if($_SESSION['user']!= null): ?><a href="<?php echo U('Home/User/index');?>">消息中心</a>
                <a href="#"><?php echo ($_SESSION['user']['username']); ?></a>
                <a href="<?php echo U('Home/User/logout');?>">退出登录</a>
            <?php elseif($_SESSION['company']!= null): ?>
                <a href="<?php echo U('Home/Company/index');?>">企业中心</a>
                <a href="#"><?php echo ($_SESSION['company']['name']); ?></a>
                <a href="<?php echo U('Home/Company/logout');?>">退出登录</a>
                <?php else: ?>
                <a href="<?php echo U('Home/Users/login');?>">消息中心</a>
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
        <div class="information">
            <div class="information-subNav">
                <ul>
                    <a href="<?php echo U('Company/index');?>"><li onclick="showDetail()"class="select"><i class=" icon-user-1"></i>企业资料</li></a>
                    <a href="<?php echo U('Company/add_job');?>"><li><i class="icon-window"></i><a href="Position_management.html">职位管理</a></li>
                    <li><i class="icon-heart-empty"></i>我的收藏</li>
                    <a href="<?php echo U('Company/identityAuth');?>"><li class="Enterprise-menu"><i class="icon-lock-7"></i>企业认证</li></a>
                    <li><i class="icon-database-2"></i>积分中心</li>
                    <li><i class="icon-wallet"></i>钱包中心</li>
                    <li class="click-textarea"><i class="icon-wallet"></i>企业介绍</li>
                </ul>
            </div>
            <!--<div style="clear: both"></div>-->
            <div class="information-content" style="overflow: hidden;height: auto;padding-bottom: 20px;">
                <div class="data">
                    <span>个人资料</span>
                </div>
                <div class="data-content">
                    <div class="basicInformation">
                        <div>
                            <img src="<?php echo (C("IMG_URL")); ?>a.png" alt="" width="70" height="70">
                            <img src="<?php echo (C("IMG_URL")); ?>level.png" alt="" class="level">
                            <p><span>阿里巴巴</span><br></p>
                            <div class="C-edit">
                            	<span class="C-pic">
                            		<img src="<?php echo (C("IMG_URL")); ?>editor.png" alt="" class="editor">
                            	</span>
                                <a>编辑</a>
                            </div>
                        </div>

                        <div class="com-manage">
                            <form id="identityAuth" action="" >
                                <span><i class=" icon-user-7"></i><input type="text" id="short_name" name="short_name" value="<?php echo ($company['short_name']); ?>" disabled="disabled"/></span>
                                <span><i class="  icon-mail"></i><input type="text" id="email" name="email" value="<?php echo ($company['email']); ?>" disabled="disabled"/></span>
                                <span><i class=" icon-address-1"></i><input type="text" id="trade" name="trade" value="<?php echo ($company['trade']); ?>" disabled="disabled"/></span>
                                <span><i class=" icon-doc-text-2"></i><input type="text" id="invest" name="invest" value="<?php echo ($company['invest']); ?>" disabled="disabled"/></span>
                                <span><i class="icon-users-outline"></i><input type="text" id="scale" name="scale" value="<?php echo ($company['scale']); ?>" disabled="disabled"/></span>
                                <span><i class="icon-location-outline"></i><input type="text" id="address" name="address" value="<?php echo ($company['address']); ?>" disabled="disabled"/></span>
                            </form>

                            <span style="width: 25%;"><i class=" icon-phone-outline"><input type="text" value="<?php echo ($company['tel']); ?>" disabled="disabled"/></i></span>
                            <div class="Chorder-yanzhengma">
                                <input type="text" name="code" id="code"/>
                                <a href="javascript:send_sms()">获取验证码</a>

                            </div>
                            <a href="javascript:send_code()">绑定</a>
                        </div>
                    </div>
                    <div class="open-position">
                        <ul>
                            <li>
                                <p class="n">5</p>
                                <p>已发布职位</p>
                                <p class="new">一键发布</p>
                            </li>
                            <li>
                                <p class="n"><?php echo ((isset($company['view_num']) && ($company['view_num'] !== ""))?($company['view_num']):'...'); ?></p>
                                <p>浏览人数</p>
                            </li>
                            <li>
                                <p class="n">...</p>
                                <p>浏览高校</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="C-list">
                    <ul id="add-content">
                        <!--<li>-->
                            <!--<a href="Position_management.html">-->
                                <!--<p>体验店课程——上海店</p>-->
                                <!--<div class="C-listBox">-->
                                    <!--<div class="C-classify">-->
                                        <!--<i class=" icon-address-1"></i>-->
                                        <!--<span>0</span>-->
                                    <!--</div>-->
                                    <!--<div class="C-classify">-->
                                        <!--<i class=" icon-address-1"></i>-->
                                        <!--<span>1</span>-->
                                    <!--</div>-->
                                    <!--<div class="C-classify">-->
                                        <!--<i class=" icon-address-1"></i>-->
                                        <!--<span>0</span>-->
                                    <!--</div>-->
                                <!--</div>-->
                            <!--</a>-->
                            <!--<div class="C-offon">-->
                                <!--<span></span>-->
                            <!--</div>-->
                        <!--</li>-->
                    </ul>
                </div>
                <div class="C-textarea">
                    <textarea placeholder="请输入" style=""></textarea>
                    <a href="##" class="animate-ok">确认</a>
                </div>


            </div>
        </div>
    </div>
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
<script src="<?php echo (C("JS_URL")); ?>jquery-3.1.0.js"></script>
<script>

    function send_code() {
        var code = $("#code").val();
        var url = "<?php echo U('Company/check_tel_verify');?>"
        $.ajax({
            type : "get",
            data : {'code':code},
            url: url,
            success: function(data)
            {
                var tmp = data;
                if(data){
                    alert(data.msg);

                }else{
//                           $("#mycomment").append(data);
//                            page++;
                }
            }
        });
    }
    function send_sms() {
        var mobile = $("#mobile").val();
        var url = "<?php echo U('Company/send_tel_verify');?>"
        $.ajax({
            type : "get",
            data : {'mobile':mobile},
            url: url,
            success: function(data)
            {
                var tmp = data;
                if(data){
                    alert(data.msg);

                }else{
//                           $("#mycomment").append(data);
//                            page++;
                }
            }
        });
    }

    function hide_or_show(obj) {
        if(!$(obj).hasClass("C-off_hover")){
            if(confirm("确定打开嘛？")){
                do_show($(obj).attr('data-jid'),obj)
            }
        }else{
            if(confirm("确定关闭嘛？")){
                do_hide($(obj).attr('data-jid'),obj)
            }
        }
    }

    function do_show(jid,obj) {
        var url = "<?php echo U('Company/show_job');?>";
        $.ajax({
            type : "get",
            data : {'jid':jid},
            url: url,
            success: function(data)
            {
                if(data.status == 1){
                    $(obj).addClass("C-off_hover");
                }else{
//                           $("#mycomment").append(data);
//                            page++;
                }
            }
        });
    }
    $(function () {
        $('.information-subNav li').click(function () {
            $('.information-subNav li').removeClass('select');
            $(this).addClass('select');
        })

        $(".click-textarea").click(function(){
            $(".open-position").hide();
            $(".C-list").hide();
            $(".C-certification-box").hide();
            $(".C-textarea").show();
            $(".C-textarea").find("textarea").show();
            $(".C-textarea").find("a").show();
        });
        $(".animate-ok").click(function(){
            $(".open-position").show();
            $(".C-list").show();
            $(".C-textarea").find("textarea").hide();
            $(".C-textarea").find("a").hide();
        });

        $(".C-edit a").click(function(){

            if($(".C-edit a").html()=="编辑"){
                $(".com-manage").find("input").removeAttr("disabled").css("border","#ddd 1px solid");
                $(".C-edit a").html("保存");
            }else{
//                $(".C-edit a").html("编辑");
//                $(".com-manage").find("input").attr("disabled","disabled").css("border","0");
                var short_name = $('#short_name').val()
                var email = $('#email').val()
                var trade = $('#trade').val()
                var invest = $('#invest').val()
                var scale = $('#scale').val()
                var address = $('#address').val()
                var url = "<?php echo U('Home/Company/update_detail');?>";
                $.ajax({
                    type : "post",
                    data : {short_name:short_name,email:email,trade:trade,invest:invest,scale:scale,address:address},
                    url: url,
                    success: function(data)
                    {
                        if(data.status == 1) {
                            window.location.reload;
                        }else{
                            alert(data.msg)
                        }
                    }
                });
            }
        });

        $(".C-offon span").click(function(){
            if(!$(this).hasClass("C-off_hover")){
                if(confirm("确定打开嘛？")){
                    $(this).addClass("C-off_hover");
                }
            }else{
                if(confirm("确定关闭嘛？")){
                    $(this).removeClass("C-off_hover");
                }
            }
        });

//        $(".Enterprise-menu").click(function(){
//            $(".open-position").hide();
//            $(".C-list").hide();
//            $(".C-textarea").hide();
//            $(".C-certification-box").show();
//            $(".C-certification-box form").show();
//        });

        $(".certification-menu ul li").click(function(){
            $(this).addClass("certification-hover").siblings().removeClass("certification-hover");
        });
    })
</script>
    <script type="text/javascript">
        var page = 1;
        var reg ="no-ajax-content"; //匹配<p>标签判断获取的页面是否没有更多了
        var newPage = true;
        var url = "<?php echo U('Company/get_company_job');?>";
        function get_company_job(){
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
        $(document).ready(function(){
            get_company_job()

        });
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
                get_company_job();
            }
        };
    </script>
</body>
</html>