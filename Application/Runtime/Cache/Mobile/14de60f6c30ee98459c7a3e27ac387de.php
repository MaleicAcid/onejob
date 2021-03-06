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
		.main-content .login-icon{width: 110px;display: block;margin:10% auto;height: 50px;border-radius: 25px;line-height: 50px;border:1px solid #2EACFD;color: #2EACFD}
		.main-content .light{background-color:#2EACFD;color: #fff;}
		footer{position: fixed;bottom: 0;left:0;right: 0;}
	</style>
</head>
<body>
<header>
	<a href="javascript:history.go(-1)"><img src="<?php echo (C("MB_IMG_URL")); ?>icon/Left.png" width="16px" height="16px"></img></a><span>登录</span>
</header>
<div class="main-content">
	<span class="login-icon light" href="<?php echo U('Users/company_login');?>">企业入口</span>
	<span class="login-icon" href="<?php echo U('Users/user_login');?>">学生入口</span>
</div>
<footer>
	<img src="<?php echo (C("MB_IMG_URL")); ?>icon/login.png" width="100%">
</footer>
<script type="text/javascript">
	var com = document.getElementsByClassName('login-icon')[0];
	var stu = document.getElementsByClassName('login-icon')[1];
	var comHrefs = com.attributes['href'].value;
	var stuHrefs = stu.attributes['href'].value;
	com.addEventListener('click',function(){
		com.setAttribute("class","login-icon light");
		stu.setAttribute("class","login-icon");
		window.location.href = comHrefs;
	},false);
	stu.addEventListener('click',function(){
		stu.setAttribute("class","login-icon light");
		com.setAttribute("class","login-icon");
		window.location.href = stuHrefs;
	},false);
</script>
</body>
</html>