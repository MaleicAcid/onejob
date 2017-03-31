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
                <a href="<?php echo U('Company/index');?>"><li onclick="showDetail()"class=""><i class=" icon-user-1"></i>企业资料</li></a>
                <a href="<?php echo U('Company/add_job');?>"><li><i class="icon-window"></i>职位管理</li></a>
                <li><i class="icon-heart-empty"></i>我的收藏</li>
                <a href="<?php echo U('Company/identityAuth');?>"><li class="Enterprise-menu select"><i class="icon-lock-7"></i>企业认证</li></a>
                <li><i class="icon-database-2"></i>积分中心</li>
                <li><i class="icon-wallet"></i>钱包中心</li>
                <li class="click-textarea"><i class="icon-wallet"></i>企业介绍</li>
            </ul>
        </div>
        <!--<div style="clear: both"></div>-->
        <div class="information-content" style="overflow: hidden;height: auto;padding-bottom: 20px;">
            <div class="data">
                <span>认证申请</span>
            </div>
            <div class="C-textarea">
                <textarea placeholder="请输入" style=""></textarea>
                <a href="##" class="animate-ok">确认</a>
            </div>
            <div class="C-certification-box">
                <form  action="">
                    <div class="certification-box">
                        <p>第一步：选择认证材料的类型（2选1）</p>
                        <div class="certification-menu">
                            <ul>
                                <li class="certification-hover">营业执照</li>
                                <li>工牌</li>
                            </ul>
                        </div>
                        <p style="line-height: 20px;">第二步：上传提交证明材料<br />（您选择提交营业执照）</p>
                        <div class="Chorder-menu-date">
                            <input type="text" placeholder="请输入公司名"/>
                            <span>正在审核中...</span>
                        </div>
                        <div class="certification-dete">
                            选择图片
                            <input type="file" name="" id="" value="" accept="<?php echo (C("IMG_URL")); ?>*"/>
                        </div>

                        <div class="certification-dete">
                            上传
                            <input onclick="alert(1)" type="button" name=""  value="上传" accept="<?php echo (C("IMG_URL")); ?>*"/>
                        </div>
                    </div>
                </form>

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

        function edit_or_save() {
            if($(".C-edit a").html()=="编辑"){
                $(".com-manage").find("input").removeAttr("disabled").css("border","#ddd 1px solid");
                $(".C-edit a").html("保存");
            }
        }
        $(".C-edit a").click(function(){

            if($(".C-edit a").html()=="编辑"){
                $(".com-manage").find("input").removeAttr("disabled").css("border","#ddd 1px solid");
                $(".C-edit a").html("保存");
            }else{
//                $(".C-edit a").html("编辑");
//                $(".com-manage").find("input").attr("disabled","disabled").css("border","0");
                var data = new FormData(document.getElementById("identityAuth"));
                var url = "<?php echo U('Company/update_detail');?>";
                $.ajax({
                    type : "get",
                    data : {'data':data},
                    url: url,
                    contentType:false,
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
</body>
</html>