<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login</title>
	<meta name="viewport" content="width=device-width , initial-scale=1 , minimum-scale=1.0 , maximum-scale=1.0 , user-scalable=no"/>
	<link rel="stylesheet" href="<?php echo (C("MB_CSS_URL")); ?>reset.css"/>
	<link rel="stylesheet" type="text/css" href="<?php echo (C("MB_CSS_URL")); ?>common.css">
	<style type="text/css">
		body{background-color: #fff;position: relative;font-family: 'Microsoft YaHei';}
		.main-content .login-icon{width: 100px;display: block;margin:10% auto;}
		footer{position: fixed;bottom: 0;left:0;right: 0;}
	</style>
</head>
<body>
<header>
	<a href="javascript:history.go(-1)"><img src="<?php echo (C("MB_IMG_URL")); ?>icon/Left.png" width="16px" height="16px"></img></a><span>个人登录</span>
</header>
<div class="main-content">
	<img class="login-icon" href="javascript:user_open_qq()" src="<?php echo (C("MB_IMG_URL")); ?>icon/qq.png"/>
	<?php if($weixin == 1): ?><img class="login-icon" href="javascript:user_open_weixinmp()" src="<?php echo (C("MB_IMG_URL")); ?>icon/wechat.png"/>
		<?php else: ?>
		<img class="login-icon" href="javascript:user_open_weixin()" src="<?php echo (C("MB_IMG_URL")); ?>icon/wechat.png"/><?php endif; ?>
</div>
<footer>
	<img src="<?php echo (C("MB_IMG_URL")); ?>icon/login.png" width="100%">
</footer>
<script type="text/javascript">
    function user_open_qq() {
        window.open("<?php echo U('Home/LoginApi/login',array('oauth'=>'qq'));?>");
    }
    function user_open_weixin() {
        window.open("<?php echo U('Home/LoginApi/login',array('oauth'=>'weixin'));?>");
    }
    function user_open_weixinmp() {
        window.open("<?php echo U('Home/LoginApi/login',array('oauth'=>'weixinmp'));?>");
    }
</script>
<script type="text/javascript">
	var qq = document.getElementsByClassName('login-icon')[0];
	var wx = document.getElementsByClassName('login-icon')[1];
	var qqHrefs = qq.attributes['href'].value;
	var wxHrefs = wx.attributes['href'].value;
	qq.addEventListener('click',function(){
		window.location.href = qqHrefs;
	},false);
	wx.addEventListener('click',function(){
		window.location.href = wxHrefs;
	},false);	
</script>
</body>
</html>