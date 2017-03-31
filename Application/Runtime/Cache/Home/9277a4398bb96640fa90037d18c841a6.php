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

    <script type="text/javascript">


        function alert_msg() {
            var url = "<?php echo U('Index/get_short_msg');?>";
            $.ajax({
                type : "get",
                data : {is_ajax:1},
                url: url,
                success: function(data)
                {
                    if(data){
                        $.each(data, function(i, n){
                            $.each(n, function(j, m){
                                    alert(n['id'])
                            });

                        });

                    }else{
//                           $("#mycomment").append(data);
                    }
                }
            });
        }
        var t1 = window.setInterval("alert_msg()",100);
        //去掉定时器的方法
//        window.clearInterval(t1);
    </script>
</head>
<body>
<div id="app">
    <div class="header">
        <div class="user">
            <?php if($_SESSION['user']!= null): ?><a href="javascript:alert_msg()">消息中心</a>
                <a href="#"><?php echo ($_SESSION['user']['username']); ?></a>
                <a href="<?php echo U('Home/User/logout');?>">退出登录</a>
            <?php elseif($_SESSION['company']!= null): ?>
                <a href="javascript:alert_msg()">消息中心</a>
                <a href="<?php echo U('Home/Company/index');?>">企业中心</a>
                <a href="#"><?php echo ($_SESSION['company']['name']); ?></a>
                <a href="<?php echo U('Home/Company/logout');?>">退出登录</a>
                <?php else: ?>
                <a href="javascript:alert_msg()">消息中心</a>
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
            <div class="enterprise">
            	<div class="enterprise-logo">
            		<div class="enterprise-logoBox">
            			<img src="<?php echo ($company['logo']); ?>"/>
            			<span><?php echo ($res_com['name']); ?></span>
            		</div>
            	</div>
            	<div class="enterprise-nature">
            		<ul>
            			<li>
            				<div>行业：</div>
            				<p><?php echo ($res_com['trade']); ?></p>
            			</li>
            			<li>
            				<div>类型：</div>
            				<p><?php echo ($res_com['invest']); ?></p>
            			</li>
            			<li>
            				<div>规模：</div>
            				<p><?php echo ($res_com['scale']); ?></p>
            			</li>
            		</ul>
            	</div>
            	<div class="enterprise-nature">
            		<ul>
            			<li>
            				<div>地址：</div>
            				<p><?php echo ($res_com['address']); ?></p>
            			</li>
            		</ul>
            	</div>
            	<div class="enterprise-nature" style="border-bottom: 0;">
            		<ul>
            			<li>
            				<div>公司介绍：</div>
            				<span><?php echo ($res_com['desc']); ?></span>
            			</li>
            		</ul>
            	</div>
            </div>
            <div class="companiesList-subNav">
                <ul>
                    <li>热门企业</li>
                    <?php if(is_array($hot_com)): foreach($hot_com as $key=>$c): ?><li><a href="<?php echo U('CompanyShow/index',array('id'=>$c['id']));?>"><?php echo ($c['name']); ?><img src="<?php echo ($c['logo']); ?>" alt=""></a></li>
						<!--<a href="<?php echo U('CompanyShow/index',array('id'=>$c['id']));?>"><li><?php echo ($c['name']); ?><img src="<?php echo ($c['logo']); ?>" alt=""></li></a>--><?php endforeach; endif; ?>
                </ul>
            </div>
            <div style="clear: both"></div>
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
</body>
</html>