<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width , initial-scale=1 , minimum-scale=1.0 , maximum-scale=1.0 , user-scalable=no"/>
	<title>Document</title>
	<link rel="stylesheet" href="<?php echo (C("MB_CSS_URL")); ?>reset.css"/>
	<link rel="stylesheet" type="text/css" href="<?php echo (C("MB_CSS_URL")); ?>detail.css">
	<link rel="stylesheet" type="text/css" href="<?php echo (C("MB_CSS_URL")); ?>chord.css"/>
	<link rel="stylesheet" type="text/css" href="<?php echo (C("MB_CSS_URL")); ?>share.css"/>
	<script type="text/javascript" src="<?php echo (C("MB_JS_URL")); ?>global.js"></script></head>
<body>
	<div class="main">
		<div class="header">
			<div class="img">
				<a href="javascript:history.go(-1)"><img src="<?php echo (C("MB_IMG_URL")); ?>icon/Left.png" alt=""></a>
				<!--<img src="<?php echo (C("MB_IMG_URL")); ?>icon/wrong (1).png">-->
			</div>
			<div class="title">
				<span class="show">职位详情</span>
				<a href="<?php echo U('CompanyShow/index',array('id'=>$res_job['company_info']['id'],'from_jid'=>$res_job['jid']));?>"><span>公司详情</span></a>
			</div>
		</div>

		<div class="container">
			<div class="banner"></div>
			<div class="banner1"></div>

			<div class="job">
				<div class="newList">
					<div>
						<span class="jobName"><?php echo ($res_job['name']); ?></span>
						<span class="price"><?php echo ($res_job['salary_low']); ?>K ~ <?php echo ($res_job['salary_high']); ?>K</span>
					</div>
					<span class="conName"><?php echo ($res_job['company_info']['name']); ?></span>
					
					<div class="require">
						<div>
							<img src="<?php echo (C("MB_IMG_URL")); ?>icon/study.png" alt="">
							<?php echo ($res_job['edu']); ?>
						</div>
						<div>
							<img src="<?php echo (C("MB_IMG_URL")); ?>icon/time.png" alt="">
							<?php echo ($res_job['work_year']); ?>
						</div>
						<div>
							<img src="<?php echo (C("MB_IMG_URL")); ?>icon/person (2).png">
							<?php echo ($res_job['need_people']); ?>
						</div>
					</div>
				</div>
			</div>


			<div class="contact">
				<span>
					<img src="<?php echo (C("MB_IMG_URL")); ?>icon/contact.png" alt="">
					<?php echo ($res_job['company_info']['short_name']); ?>
				</span>
				<span>
					<img src="<?php echo (C("MB_IMG_URL")); ?>icon/contact (1).png" alt="">
					<?php echo ($res_job['company_info']['tel']); ?>
				</span>
				<span class="email">
					<img src="<?php echo (C("MB_IMG_URL")); ?>icon/email.png" alt="">
					<?php echo ($res_job['company_info']['email']); ?>
				</span>
			</div>

			<div class="address">
				<img src="<?php echo (C("MB_IMG_URL")); ?>icon/building.png" alt="">
				<?php echo ($res_job['company_info']['address']); ?>
			</div>

			<div class="introduce">
				<!--<h3>职位描述</h3>-->
				<?php echo ($res_job['text']); ?>
				<!--岗位职责：<br>-->
				<!--1、能较好的了客户端看见爱的空间撒爱发货考虑是否考虑到你脑复康你<br>-->
				<!--2、内而温暖人间你哦玩呢付款<br>-->
				<!--3、部分部分可接受的南方大厦大家看法好难得<br>-->
				<!--4、暴风科技说大部分看见的<br>-->
				<!--任职要求：<br>-->
				<!--1、大专以上学历<br>-->
				<!--2、内而温暖人间你哦玩呢付款<br>-->
				<!--3、部分部分可接受的南方大厦大家看法好难得<br>-->
				<!--4、暴风科技说大部分看见的<br>-->
			</div>
			
			<div class="comments">
				<h3>热门评论</h3>
				<div class="comments-text">
					<ul id="ajax_comment_return">
						<!--<li>-->
							<!--<div class="comments-pic">-->
								<!--<img src="demo/<?php echo (C("MB_IMG_URL")); ?>4.png"/>-->
							<!--</div>-->
							<!--<div class="comments-name">-->
								<!--<span>呵呵哒</span>-->
								<!--<p>呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵</p>-->
							<!--</div>-->
							<!--<div class="comments-time">-->
								<!--<span>今天17：44</span>-->
							<!--</div>-->
						<!--</li>-->
					</ul>
				</div>
			</div>
		</div>

		<div class="footer">
			<!--<img src="<?php echo (C("MB_IMG_URL")); ?>icon/heart.png">-->
			<?php if(($res_job['showCol'] == 1)): ?><a  class="icon-star" onclick="collect_job(<?php echo ($res_job['jid']); ?>)"><img id="collect" src="<?php echo (C("MB_IMG_URL")); ?>icon/collect.png" class="detail-rtxt deIcon" /></a>
				<?php else: ?>
				<a  class="icon-star" onclick="collect_job(<?php echo ($res_job['jid']); ?>)"><img id="collect" src="<?php echo (C("MB_IMG_URL")); ?>icon/collect-1.png" class="detail-rtxt deIcon" /></a><?php endif; ?>
			<!--<div id="socialShare" ></div>-->
			<img src="<?php echo (C("MB_IMG_URL")); ?>icon/share.png" class="oper-f"/>
			
			<form style="display: inline-block;line-height: 1.5rem">
				<input type="hidden" name="job_id" value="<?php echo ($res_job['jid']); ?>"/>
				<input type="text" name="" placeholder="我来说两句...">
				<button onclick="comment_submit(this)" type="button">评论</button>
			</form>
		</div>
		<div class="zhuanfa">
			<div>
				<a href="##">
					<img src="<?php echo (C("MB_IMG_URL")); ?>icon/qq.png" alt="" class="qqq"/>
				</a>
				<a href="##">
					<img src="<?php echo (C("MB_IMG_URL")); ?>icon/wechat.png" alt="" class="vxx"/>
				</a>
				<a href="##">
					<img src="<?php echo (C("MB_IMG_URL")); ?>icon/wechat.png" alt="" class="pyq"/>
				</a>
			</div>
		</div>
	</div>
	<script src="<?php echo (C("MB_JS_URL")); ?>jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
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
                        window.location.href  = "<?php echo U('Home/LoginApi/login',array('oauth'=>'qq','is_mobile'=>1));?>"
                    }else{
                        alert(data.msg);
                    }
                }
            });
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
                        window.location.href  = "<?php echo U('Users/login');?>"
                    }else if (data.status == 1 || data.status == -3){
                        change_color()
                    }else{
                        alert(data.msg)
                    }
                }
            });
        }
        function change_color() {
            if ($('#collect').attr('src') == "<?php echo (C("MB_IMG_URL")); ?>icon/collect-1.png"){
                $('#collect').attr('src',"<?php echo (C("MB_IMG_URL")); ?>icon/collect.png");
            }else {
                $('#collect').attr('src',"<?php echo (C("MB_IMG_URL")); ?>icon/collect-1.png");
            }
        }

	</script>
	<script src="<?php echo (C("MB_JS_URL")); ?>share.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
        $(function() {
			$(".oper-f").click(function(){
				$(".zhuanfa").css("bottom","0px");
			});
			//分享至qq空间
			$(".qqq").on("click",function(){
				$(this).socialShare("qZone");
			});
			//分享至微信
			$(".vxx").on("click",function(){
				$(this).socialShare("weixinShare");
			});
			//分享至新浪
			$(".pyq").on("click",function(){
				$(this).socialShare("sinaWeibo");
			});
        });

	</script>
</body>
</html>