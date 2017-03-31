<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width , initial-scale=1 , minimum-scale=1.0 , maximum-scale=1.0 , user-scalable=no"/>
	<title>Document</title>
	<link rel="stylesheet" href="<?php echo (C("MB_CSS_URL")); ?>reset.css"/>
	<link rel="stylesheet" type="text/css" href="<?php echo (C("MB_CSS_URL")); ?>index.css">
	<script type="text/javascript" src="<?php echo (C("MB_JS_URL")); ?>global.js"></script>
</head>
<body>
	<div class="main">
		<div class="header">
			<!--<a href="javascript:history.go(-1)"><img src="<?php echo (C("MB_IMG_URL")); ?>icon/Left.png" alt=""></a>-->
			就业直达号
		</div>
		<div class="container">
			<div class="banner">
				<input type="text" placeholder="搜索您想要的">
				<img src="<?php echo (C("MB_IMG_URL")); ?>icon/search.png">
			</div>
			<div class="news">
				<ul>
					<?php if(is_array($index_jobs)): foreach($index_jobs as $key=>$job): ?><a href="<?php echo U('Mobile/JobShow/index',array('jid'=>$job['jid']));?>">
							<div class="newList">
								<div>
									<span class="jobName"><?php echo ($job['name']); ?></span>
									<span class="price"><?php echo ($job['salary_low']); ?>k~<?php echo ($job['salary_high']); ?>k</span>
								</div>
								<span class="conName"><?php echo ($job['c_name']); ?></span>

								<div class="require">
									<div>
										<img src="<?php echo (C("MB_IMG_URL")); ?>icon/study.png" alt="">
										本科
									</div>
									<div>
										<img src="<?php echo (C("MB_IMG_URL")); ?>icon/time.png" alt="">
										3 ~ 5年
									</div>
									<div>
										<img src="<?php echo (C("MB_IMG_URL")); ?>icon/person (2).png">
										3人
									</div>
								</div>
							</div>
						</a><?php endforeach; endif; ?>
				</ul>

				<ul id = "add-content"></ul>
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
			<div class="home">
				<img src="<?php echo (C("MB_IMG_URL")); ?>icon/home (1).png">
				<a href="<?php echo U('Index/index');?>">主页</a>
			</div>
			<div class="mine">
				<img src="<?php echo (C("MB_IMG_URL")); ?>icon/person (3).png">
				<?php if($_SESSION['user']!= null): ?><a href="<?php echo U('User/index');?>">个人中心</a>
				<?php elseif($_SESSION['company']!= null): ?>
					<a href="<?php echo U('Company/index');?>">企业中心</a>
					<?php else: ?>
					<a href="<?php echo U('Users/login');?>">快速登录</a><?php endif; ?>
			</div>
			<script type="text/javascript">
                function user_open_qq() {
                    window.location.href = "<?php echo U('Home/LoginApi/login',array('oauth'=>'qq','is_mobile'=>1));?>";
                }
			</script>
		</div>
	</div>
</body>
</html>