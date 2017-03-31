<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>personInfo</title>
	<meta name="viewport" content="width=device-width , initial-scale=1 , minimum-scale=1.0 , maximum-scale=1.0 , user-scalable=no"/>
	<link rel="stylesheet" href="<?php echo (C("MB_CSS_URL")); ?>reset.css"/>
	<link rel="stylesheet" type="text/css" href="<?php echo (C("MB_CSS_URL")); ?>common.css">
	<style type="text/css">
		body{background-color: #fff;font-family: 'Microsoft YaHei';}
		.Info{background-color: #fff;}
		.Info a{display: block;background-color: #fff;border-bottom: 1px solid #ddd;padding:4% 3%;color: #000;margin-left: 5%;}
		.Info a:first-child .lf-txt,.rg-icon img:last-child{line-height: 52px;}
		a .lf-txt{float: left;}
		a .rg-icon{float: right;margin-right: 2%;}
		img:last-child{width:.95rem;}
		a:after{content: " ";height: 0;display: block;visibility: hidden;clear: both;overflow: hidden;}
		.headIcon{border-radius: 50%;}

		a,a:link,a:hover,a:active{text-decoration: none;}
		a,button,input{ -webkit-tap-highlight-color:rgba(255,0,0,0); }
		.editPanel{padding:5%;position: fixed;left: 0;right: 0;bottom: 0;z-index: 1002;background-color: #fff;height: 50%;}
		.editPanel a{text-decoration:none;}
		.editPanel .cancel{float: left;}
		.editPanel .ok{float:right;}
		.editPanel div div:after{content: " ";height: 0;display: block;visibility: hidden;clear: both;overflow: hidden;}
		.submit-wrap{
			padding:5%;
			text-align: center;
			overflow: scroll;
		}
		.submit-wrap div{padding: 5%;color:#2196F3; }
		.back{
			position: fixed;
			top: 0%;
			left: 0%;
			width: 100%;
			height: 100%;
			background-color: black;
			z-index:1001;
			-moz-opacity: 0.8;
			opacity:.80;
			filter: alpha(opacity=80);
		}
		.submit-wrap .check{
			background-color: #2196F3;
			color: #fff;
		}
		.submit-form div{
			padding-bottom: 10px;
		}
	</style>
	<script type="text/javascript" src="<?php echo (C("MB_JS_URL")); ?>jquery-3.1.1.min.js"></script>
</head>
<body>
<header class="blue">
	<a href="<?php echo U('User/index');?>"><img src="<?php echo (C("MB_IMG_URL")); ?>icon/Left (1).png" width="16px" height="16px"></a><span>个人信息</span>
</header>
<div class="content">
	<div id="stuInfo" class="Info">
		<a id="head-edit" href="javascript:;">
			<span class="lf-txt">头像</span>
			<span class="rg-icon">
				<img class="headIcon" src="<?php echo ($user['head_pic']); ?>"/>
				<img style="position: relative;top: -15px;" src="<?php echo (C("MB_IMG_URL")); ?>icon/right.png"/>
			</span>
		</a>
		<!--<a id="wx-edit" href="javascript:;">-->
			<!--<span class="lf-txt">微信号</span>-->
			<!--<span class="rg-icon">-->
				<!--<span>wx</span>-->
				<!--<img src="<?php echo (C("MB_IMG_URL")); ?>icon/right.png"/>-->
			<!--</span>-->
		<!--</a>-->
		<a id="nick-edit" href="javascript:;">
			<span class="lf-txt">姓名</span>
			<span class="rg-icon">
				<span><?php echo ($user['realname']); ?></span>
				<img src="<?php echo (C("MB_IMG_URL")); ?>icon/right.png"/>
			</span>
		</a>
		<a id="sex-edit" href="javascript:;">
			<span class="lf-txt">性别</span>
			<span class="rg-icon">
				<span><?php echo ($user['sex']); ?></span>
				<img src="<?php echo (C("MB_IMG_URL")); ?>icon/right.png"/>
			</span>
		</a>
		<a id="school-edit" href="javascript:;">
			<span class="lf-txt">学校</span>
			<span class="rg-icon">
				<span><?php echo ($user['school']); ?></span>
				<img src="<?php echo (C("MB_IMG_URL")); ?>icon/right.png"/>
			</span>
		</a>
		<a id="special-edit" href="javascript:;">
			<span class="lf-txt">专业</span>
			<span class="rg-icon">
				<span><?php echo ($user['major']); ?></span>
				<img src="<?php echo (C("MB_IMG_URL")); ?>icon/right.png"/>
			</span>
		</a>
		<a id="level-edit" href="javascript:;">
			<span class="lf-txt">学历</span>
			<span class="rg-icon">
				<span><?php echo ($use['edu']); ?></span>
				<img src="<?php echo (C("MB_IMG_URL")); ?>icon/right.png"/>
			</span>
		</a>
		<a id="time-edit" href="javascript:;">
			<span class="lf-txt">入学时间</span>
			<span class="rg-icon">
				<span><?php echo ($user['entry_year']); ?></span>
				<img src="<?php echo (C("MB_IMG_URL")); ?>icon/right.png"/>
			</span>
		</a>
		<!--<a id="tel-edit" href="javascript:;">-->
			<!--<span class="lf-txt">手机号绑定（验证）</span>-->
			<!--<span class="rg-icon">-->
				<!--<span>13323469836</span>-->
				<!--<img src="<?php echo (C("MB_IMG_URL")); ?>icon/right.png"/>-->
			<!--</span>-->
		<!--</a>-->
	</div>
	<div id="per-edit" style="display: none;"  class="editPanel">
		<form method="post" enctype="multipart/form-data" action="do_edit_info" class="submit-form">
		<div class="head-edit" style="display: none;">
			<div>
				<a href="javascript:;" class="cancel">取消</a>
				<a href="javascript:;" class="ok">确认</a>
			</div>
			<div class="submit-wrap">
				<input type="file" name="head_pic" placeholder="请选择上传图片">
			</div>
		</div>
		<!--<div class="wx-edit" style="display: none;">-->
			<!--<div>-->
				<!--<a href="javascript:;" class="cancel">取消</a>-->
				<!--<a href="javascript:;" class="ok">确认</a>-->
			<!--</div>-->
			<!--<div class="submit-wrap">-->
				<!--<input type="text" name="" placeholder="微信">-->
			<!--</div>-->
		<!--</div>-->
		<div class="nick-edit" style="display: none;">
			<div>
				<a href="javascript:;" class="cancel">取消</a>
				<a href="javascript:;" class="ok">确认</a>
			</div>
			<div class="submit-wrap">
				<input type="text" name="realname" placeholder="请输入姓名" value="<?php echo ($user['realname']); ?>">
			</div>
		</div>
		<div class="sex-edit" style="display: none;">
			<div>
				<a href="javascript:;" class="cancel">取消</a>
				<a href="javascript:;" class="ok">确认</a>
			</div>
			<div class="submit-wrap">
				<div class="check">男</div>
				<div >女</div>
				<input type="hidden" class="sex" name="sex" value="<?php echo ($user['sex']); ?>"/>
			</div>
		</div>
		<div class="school-edit" style="display: none;">
			<div>
				<a href="javascript:;" class="cancel">取消</a>
				<a href="javascript:;" class="ok">确认</a>
			</div>
			<div class="submit-wrap">
				<input type="text" name="school" placeholder="请输入学校" value="<?php echo ($user['school']); ?>"/>
			</div>
		</div>
		<div class="special-edit" style="display: none;">
			<div>
				<a href="javascript:;" class="cancel">取消</a>
				<a href="javascript:;" class="ok">确认</a>
			</div>
			<div class="submit-wrap">
				<input type="text" name="major" placeholder="请输入专业" value="<?php echo ($user['major']); ?>"/>
			</div>
		</div>
		<div class="level-edit" style="display: none;">
			<div>
				<a href="javascript:;" class="cancel">取消</a>
				<a href="javascript:;" class="ok">确认</a>
			</div>
			<div class="submit-wrap">
				<?php if(is_array($edu)): foreach($edu as $key=>$v): ?><div><?php echo ($v); ?></div><?php endforeach; endif; ?>
				<input type="hidden" name="edu" class="level" value="<?php echo ($user['edu']); ?>" />
			</div>
		</div>
		<div class="time-edit" style="display: none;">
			<div>
				<a href="javascript:;" class="cancel">取消</a>
				<a href="javascript:;" class="ok">确认</a>
			</div>
			<div class="submit-wrap">
				<input type="hidden" name="entry_year" value="<?php echo ($user['entry_year']); ?>" />
			</div>
		</div>
		<div class="tel-edit" style="display: none;">
			<div>
				<a href="javascript:;" class="cancel">取消</a>
				<a href="javascript:;" class="ok">确认</a>
			</div>
			<div class="submit-wrap">
				<input type="hidden" name="tel" value="<?php echo ($user['tel']); ?>" placeholder="手机号">
			</div>
		</div>
		</form>
	</div>
	<div class="back" style="display: none"></div>
</div>
<script type="text/javascript">
	var cancel = document.getElementsByClassName('cancel');
	var submit = document.getElementsByClassName('ok');
	var submitWrap;
	var stuInfo = $("#stuInfo a");
	var now = new Date();

	function cancelValue(){
		for(var i=0;i<cancel.length;i++){
			cancel[i].addEventListener("click",function(e){
				e.stopPropagation();
				this.parentNode.parentNode.style.display = "none";
				//$(this.parentNode.nextElementSibling).find("input").attr("value",'');
				$(".back").css("display","none");
				$(".editPanel").css("display","none");
			},false);
		}
	}
	cancelValue();

	function submitValue(){
		for(var i=0;i<submit.length;i++){
			submit[i].addEventListener("click",function(e){
				e.stopPropagation();
				//submit
				document.querySelector(".submit-form").submit();
				//重定向
				//window.location.href = "<?php echo U('User'/edit_info);?>";
			},false);
		}
	}
	submitValue();

	function setClickEvent(){
		for(var i=0;i<stuInfo.length;i++){
			stuInfo[i].onclick = function(){
				var className = "."+this.getAttribute("id");
				$(".back").css("display","block");
				$(className).css("display","block");
				$(".editPanel").css("display","block");
			}
		}
	}
	setClickEvent();

	function createYearElements(){
		var max = now.getFullYear();
		var min = max - 47;
		for(var i = min;i<max;i++){
			$(".time-edit .submit-wrap").prepend("<div>"+i+"</div>");
		}
		$(".time-edit .submit-wrap").css("height",$(".editPanel").css("height"));
	}
	createYearElements();

	function swicthColorAndValue(){
		submitWrap = $('.submit-wrap div');
		for(var i = 0;i<submitWrap.length;i++){
			submitWrap[i].onclick = function(){
				$(this).attr("class","check");
				$(this).siblings().attr("class","");
				$(this).siblings('input').attr("value",$(this).text());
			};
		}
	}
	swicthColorAndValue();



	
</script>

</body>
</html>