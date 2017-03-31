<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>就业直达号 - 后台管理</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!-- 必须的css -->
		<link href="/Public/Assets/css/bootstrap.min.css" rel="stylesheet" />
		<link href="/Public/Assets/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="/Public/Assets/css/font-awesome.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="/Public/Assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="/Public/Assets/css/ace-fonts.css" />
		<link rel="stylesheet" href="/Public/Assets/css/jquery-ui-1.10.3.full.min.css" />
		<link rel="stylesheet" href="/Public/Assets/css/ace.min.css" />
		<link rel="stylesheet" href="/Public/Assets/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="/Public/Assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="/Public/Assets/css/lagou.admin.css" />
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="/Public/Assets/css/ace-ie.min.css" />
		<![endif]-->
        <link rel="stylesheet" href="/Public/Assets/css/bootstrap-timepicker.css" />
        <link rel="stylesheet" href="/Public/Assets/css/datepicker.css" />
        <link rel="stylesheet" href="/Public/Assets/css/lagou.global.css" />
		<!-- /必须的css -->
		
		
		<script src="/Public/Assets/js/ace-extra.min.js"></script>

		<!--为了使用layer弹出层-->
		<script src="/Public/Assets/js/jquery-2.0.3.min.js"></script>
		<script src="/Public/Assets/js/layer1/layer.js"></script>
	</head>

	<body>
		<!-- 头部 -->
		<div class="navbar" id="navbar">
	<div class="navbar-inner">
		<div class="container-fluid">
			<a href="#" class="brand">
				<small>
					<i class="icon-inbox"></i>
					就业直达号 - 后台管理
				</small>
			</a><!--/.brand-->

			<ul class="nav ace-nav pull-right">

				<li class="light-blue">
					<a data-toggle="dropdown" href="#" class="dropdown-toggle">
						<img class="nav-user-photo" src="<?php echo oj_admin_logo(session('admin.id'), session('admin.image'));?>" alt="<?php echo session('admin.username');?>" />
						<span class="user-info">
							<small>欢迎回来</small>
							<?php echo session('admin.username');?>
						</span>

						<i class="icon-caret-down"></i>
					</a>

					<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
						<!-- <li>
							<a href="#">
								<i class="icon-cog"></i>
								修改信息
							</a>
						</li> -->

						<li>
							<a href="javascript:;" onclick="$.lagou.formShow('<?php echo U('admin/user/editPwd');?>');">
								<i class="icon-lock"></i>
								修改密码
							</a>
						</li>

						<li class="divider"></li>

						<li>
							<a href="<?php echo U('Login/logout');?>">
								<i class="icon-off"></i>
								退出
							</a>
						</li>
					</ul>
				</li>
			</ul><!--/.ace-nav-->
		</div><!--/.container-fluid-->
	</div><!--/.navbar-inner-->
</div>
		<!-- /头部 -->

		<div class="main-container container-fluid">
			<a class="menu-toggler" id="menu-toggler" href="#">
				<span class="menu-text"></span>
			</a>

			<!-- 左侧菜单 -->
			
	<div class="sidebar" id="sidebar">
	<ul class="nav nav-list">
		<li <?php if(index == 'index'): ?>class="active open"<?php endif; ?>>
			<a href="<?php echo U('admin/index/index');?>">
				<i class="icon-home"></i>
				<span class="menu-text"> 主视图 </span>
			</a>
		</li>

		<li <?php if(index == 'notice'): ?>class="active open"<?php endif; ?>>
		<a href="javascript:;" class="dropdown-toggle">
			<i class="icon-envelope"></i>
			<span class="menu-text">通知管理</span>
			<b class="arrow icon-angle-down"></b>
		</a>
		<ul class="submenu">
			<li>
				<a href=<?php echo U('Admin/Notice/index');?>>
					<i class="icon-double-angle-right"></i>
					公告一览
				</a>
			</li>
			<li>
				<a href=<?php echo U('Admin/Notice/add');?>>
					<i class="icon-double-angle-right"></i>
					添加/编辑公告
				</a>
			</li>
			<li>
				<a href=<?php echo U('Admin/Notice/short_notice');?>>
					<i class="icon-double-angle-right"></i>
					短消息管理
				</a>
			</li>
		</ul>
		</li>

		<li <?php if(index == 'user'): ?>class="active open"<?php endif; ?>>
			<a href="javascript:;" class="dropdown-toggle">
				<i class="icon-group"></i>
				<span class="menu-text">用户管理</span>
				<b class="arrow icon-angle-down"></b>
			</a>
			<ul class="submenu">
				<li>
				<a href=<?php echo U('Admin/User/index');?>>
						<i class="icon-double-angle-right"></i>
						注册会员列表
					</a>
				</li>
			</ul>
		</li>

		<li <?php if(index == 'company'): ?>class="active open"<?php endif; ?>>
			<a href="javascript:;" class="dropdown-toggle">
				<i class="icon-folder-close"></i>
				<span class="menu-text">公司信息管理</span>
				<b class="arrow icon-angle-down"></b>
			</a>
			<ul class="submenu">
				<li <?php if([ac] == 'xxx'): ?>class="active open"<?php endif; ?>>
					<a href="<?php echo U('Admin/Company/index');?>">
						<i class="icon-double-angle-right"></i>
						公司信息列表
					</a>
				</li>
				<li <?php if([ac] == 'xxx'): ?>class="active open"<?php endif; ?>>
					<a href="<?php echo U('Admin/Company/apply');?>">
						<i class="icon-double-angle-right"></i>
						申请认证公司列表
					</a>
				</li>
			</ul>
		</li>

		<li <?php if(index == 'type'): ?>class="active open"<?php endif; ?>>
			<a href="javascript:;" class="dropdown-toggle">
				<i class="icon-film"></i>
				<span class="menu-text">职位分类管理</span>
				<b class="arrow icon-angle-down"></b>
			</a>
			<ul class="submenu">
				<li <?php if([ac] == 'xxx'): ?>class="active open"<?php endif; ?>>
					<a href="<?php echo U('Admin/Type/index');?>">
						<i class="icon-double-angle-right"></i>
						全部分类列表
					</a>
				</li>
			</ul>
		</li>

		<li <?php if(index == 'link'): ?>class="active open"<?php endif; ?>>
			<a href="javascript:;" class="dropdown-toggle">
				<i class="icon-heart"></i>
				<span class="menu-text">轮播图管理</span>
				<b class="arrow icon-angle-down"></b>
			</a>
			<ul class="submenu">
				<li <?php if([ac] == 'index'): ?>class="active open"<?php endif; ?>>
					<a href="<?php echo U('Admin/Link/index');?>">
						<i class="icon-double-angle-right"></i>
						轮播图列表
					</a>
				</li>
			</ul>
		</li>

		<li <?php if(index == 'manager'): ?>class="active open"<?php endif; ?>>
			<a href="javascript:;" class="dropdown-toggle">
				<i class="icon-legal"></i>
				<span class="menu-text">管理员管理</span>
				<b class="arrow icon-angle-down"></b>
			</a>
			<ul class="submenu">
				<li>
				<a href=<?php echo U('Admin/Manager/index');?>>
						<i class="icon-double-angle-right"></i>
						管理员列表
					</a>
				</li>
			</ul>
		</li>

	</ul>

	<div class="sidebar-collapse" id="sidebar-collapse">
		<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
	</div>

	<script type="text/javascript">
		try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
	</script>
</div>

			<!-- /左侧菜单 -->

			<div class="main-content">
				<!-- 面包屑导航 -->
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="icon-home home-icon"></i>
							<a href="<?php echo U('index/index');?>">首页</a>
							<span class="divider">
							<i class="icon-angle-right arrow-icon"></i>
							</span>
						</li>
						
<li class="active">主视图</li>

					</ul>
				</div>
				<!-- /面包屑导航 -->

				<div class="page-content">
					


<div class="row-fluid">

	<div class="span12">
		<div class="alert alert-block alert-success">
			<button data-dismiss="alert" class="close" type="button">
				<i class="icon-remove"></i>
			</button>
			<i class="icon-leaf green"></i>
			欢迎回来~
			<strong class="green">
			<?php echo $_SESSION['admin']['username']?>
			</strong>
			<!--//text-->
		</div>
		<div class="space-6"></div>

		<div class="row-fluid">
			<div class="span5 infobox-container">

				<div class="infobox infobox-green">
					<div class="infobox-icon">
						<i class="icon-bar-chart"></i>
					</div>

					<div class="infobox-data">
						<span class="infobox-data-number"><?php echo ($data["resume_total"]); ?></span>
						<div class="infobox-content">用户简历数</div>
					</div>
					
				</div>

				<div class="infobox infobox-blue">
					<div class="infobox-icon">
						<i class="icon-bar-chart"></i>
					</div>

					<div class="infobox-data">
						<span class="infobox-data-number"><?php echo ($data["job_total"]); ?></span>
						<div class="infobox-content">招聘职位数</div>
					</div>
					
				</div>

				<div class="infobox infobox-pink">
					<div class="infobox-icon">
						<i class="icon-bar-chart"></i>
					</div>

					<div class="infobox-data">
						<span class="infobox-data-number"><?php echo ($data["link_total"]); ?></span>
						<div class="infobox-content">友情链接数</div>
					</div>
					
				</div>

				<div class="infobox infobox-red">
					<div class="infobox-icon">
						<i class="icon-bar-chart"></i>
					</div>

					<div class="infobox-data">
						<span class="infobox-data-number"><?php echo ($data["user_incheck"]); ?></span>
						<div class="infobox-content">已验证用户数</div>
					</div>
					
				</div>

				<div class="infobox infobox-orange2">
					<div class="infobox-icon">
						<i class="icon-bar-chart"></i>
					</div>

					<div class="infobox-data">
						<span class="infobox-data-number"><?php echo ($data["user_uncheck"]); ?></span>
						<div class="infobox-content">未验证用户数</div>
					</div>
					
				</div>

				<div class="infobox infobox-blue2">
					<div class="infobox-icon">
						<i class="icon-bar-chart"></i>
					</div>

					<div class="infobox-data">
						<span class="infobox-data-number"><?php echo ($data["company_incheck"]); ?></span>
						<div class="infobox-content">已验证企业用户数</div>
					</div>
					
				</div>

				<div class="infobox infobox-green">
					<div class="infobox-icon">
						<i class="icon-bar-chart"></i>
					</div>

					<div class="infobox-data">
						<span class="infobox-data-number"><?php echo ($data["company_uncheck"]); ?></span>
						<div class="infobox-content">未验证企业用户数</div>
					</div>
					
				</div>
			</div>
			<div class="vspace"></div>



			<table class="table table-hover">
				<!--<caption>当前热门企业</caption>-->
				<thead>
				<tr >
					<th>当前热门企业</th>
					<th>查看详情</th>
					<th>前台地址</th>
				</tr>
				</thead>
				<tbody>
					<?php if(is_array($all_hot_com)): foreach($all_hot_com as $key=>$hc): ?><tr>
							<td><?php echo ($hc['name']); ?></td>
							<td><a data-id = "<?php echo ($hc['id']); ?>" onclick="com_search_url(this);" href="#">点击查看</a></td>
							<td><a data-id = "<?php echo ($hc['id']); ?>" onclick="com_show_url(this);" href="#">点击前往</a></td>
						</tr><?php endforeach; endif; ?>
				</tbody>

			</table>
			<!--<div class="span5">-->
				<!--<div class="widget-box">-->
					<!--<div class="widget-header widget-header-flat widget-header-small">-->
						<!--<h5><i class="icon-signal"></i>全部用户</h5>-->
					<!--</div>-->
					<!--<div class="widget-body">-->
						<!--<div class="widget-main">-->
							<!--<div id="piechart-placeholder"></div>-->
							<!--<div class="hr hr8 hr-double"></div>-->
							<!--<div class="clearfix">-->
								<!--<div style="width:45%;float:left;">-->
									<!--<span class="grey">-->
										<!--<i class="icon-group icon-2x blue"></i>-->
										<!--&nbsp; 普通用户-->
									<!--</span>-->
									<!--<h4 class="bigger pull-right"><?php echo ($data["user_total"]); ?></h4>-->
								<!--</div>-->
								<!--<div style="width:45%;float:right;">-->
									<!--<span class="grey">-->
										<!--<i class="icon-group icon-2x red"></i>-->
										<!--&nbsp; 企业用户-->
									<!--</span>-->
									<!--<h4 class="bigger pull-right"><?php echo ($data["company_total"]); ?></h4>-->
								<!--</div>-->
								<!--<div style="clear:both;"></div>-->
							<!--</div>-->
						<!--</div>-->
					<!--</div>-->
				<!--</div>-->
			<!--</div>-->
		</div>
		<div class="hr hr32 hr-dotted"></div>

		<div id="main1" style="width: 600px;height:400px;"></div>

		<script src="/Public/Assets/js/echarts/echarts.js"></script>
		<script type="text/javascript">
            // 基于准备好的dom，初始化echarts实例
            var myChart1 = echarts.init(document.getElementById('main1'));

			var company_total =<?php echo ($data["company_total"]); ?>;
            var user_total =<?php echo ($data["user_total"]); ?>;
            var user_incheck = <?php echo ($data["user_incheck"]); ?>;
            var user_uncheck = <?php echo ($data["user_uncheck"]); ?>;
            var company_incheck = <?php echo ($data["company_incheck"]); ?>;
            var company_uncheck = <?php echo ($data["company_uncheck"]); ?>;

            // 指定图表的配置项和数据
            var option1 = {
                title : {
                    text: '注册分布图',
                    x:'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    x: 'left',
                    data:['企业总数','用户总数','已验证企业','未验证企业','已验证用户','未验证用户']
                },
                series: [
                    {
                        name:'总数比例',
                        type:'pie',
                        selectedMode: 'single',
                        radius: [0, '30%'],

                        label: {
                            normal: {
                                position: 'inner'
                            }
                        },
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data:[
                            {value:company_total, name:'企业总数', selected:true},
                            {value: user_total, name:'用户总数'},
                        ]
                    },
                    {
                        name:'详细比例',
                        type:'pie',
                        radius: ['40%', '55%'],

                        data:[
                            {value:company_incheck, name:'已验证企业'},
                            {value:company_uncheck, name:'未验证企业'},
                            {value:user_incheck, name:'已验证用户'},
                            {value:user_uncheck, name:'未验证用户'},
                        ]
                    }
                ]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart1.setOption(option1);
		</script>
		<!-- <div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-header">
						<h4 class="lighter smaller">
							<i class="icon-calendar blue"></i>
							操作日志
						</h4>
					</div>

					<div class="widget-body">
						<div class="widget-main no-padding">
							<div class="dialogs">

								<div class="itemdiv dialogdiv">
									<div class="user">
										<img alt="Alexa's Avatar" src="/Public/Assets/avatars/avatar1.png" />
									</div>
									<div class="body">
										<div class="time">
											<i class="icon-time"></i>
											<span class="green">2014-11-09 12:48:36</span>
										</div>

										<div class="name">
											<a href="#">仔仔</a>
										</div>
										<div class="text">审核了 xxx 企业</div>

										<div class="tools">
											<a href="#" class="btn btn-minier btn-info">
												<i class="icon-only icon-share-alt"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>				

			</div>
		</div> -->
	</div>
</div>

				</div><!--/.page-content-->

				<!-- 右侧悬浮的设置按钮,去掉好像会引起js报错 -->
				<div class="ace-settings-container hide" id="ace-settings-container">
					<div class="btn btn-app btn-mini btn-warning ace-settings-btn" id="ace-settings-btn">
						<i class="icon-cog bigger-150"></i>
					</div>

					<div class="ace-settings-box" id="ace-settings-box">
						<div>
							<div class="pull-left">
								<select id="skin-colorpicker" class="hide">
									<option data-skin="default" value="#438EB9">#438EB9</option>
									<option data-skin="skin-1" value="#222A2D">#222A2D</option>
									<option data-skin="skin-2" value="#C6487E">#C6487E</option>
									<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
								</select>
							</div>
							<span>&nbsp; Choose Skin</span>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
							<label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
							<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
							<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
							<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
						</div>
					</div>
				</div>
				<!-- /右侧悬浮的设置按钮,去掉好像会引起js报错 -->
			</div>
		</div>

		<!-- 回到顶部 -->
		<a href="###" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>
		<!-- /回到顶部 -->

		<!-- 操作后提示框 -->
		<div id="lg-alert" class="hide" style="margin-bottom:-1.5em;"></div>
		<!--modal表单弹出框-->
		<form id="lg-form" class="modal fade hide form-horizontal" method="post" tabindex="-1" enctype="multipart/form-data" onsubmit="return false;"></form>

		<!-- 基础js部分 -->
		<script src='/Public/Assets/js/jquery-1.10.2.min.js'></script>
		<script src='/Public/Assets/js/jquery.mobile.custom.min.js'></script>
		
		<script src="/Public/Assets/js/jquery-ui-1.10.3.full.min.js"></script>
		<script src="/Public/Assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="/Public/Assets/js/bootstrap.min.js"></script>
		<script src="/Public/Assets/js/ace-elements.min.js"></script>
		<script src="/Public/Assets/js/ace.min.js"></script>
		
		<script src="/Public/Assets/js/jquery.dataTables.min.js"></script>
		<script src="/Public/Assets/js/jquery.dataTables.bootstrap.js"></script>
		<script src="/Public/Assets/lagou/lagou.global.js"></script>
		<script src="/Public/Assets/js/jquery.inputlimiter.1.3.1.min.js"></script>

		<!-- /基础js部分 -->
		<script type="text/javascript">
		jQuery(function($){
			try{
				ace.settings.navbar_fixed(true);
				ace.settings.sidebar_fixed(true);
				ace.settings.breadcrumbs_fixed(true);
			}catch(e){}
			
			$('[data-rel=tooltip]').tooltip();
			$('[data-rel=popover]').popover({html:true});

		});	
		</script>
		

		
		
<script src="/Public/Assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="/Public/Assets/js/jquery.slimscroll.min.js"></script>
<script src="/Public/Assets/js/jquery.sparkline.min.js"></script>
<script src="/Public/Assets/js/flot/jquery.flot.min.js"></script>
<script src="/Public/Assets/js/flot/jquery.flot.pie.min.js"></script>
<script src="/Public/Assets/js/flot/jquery.flot.resize.min.js"></script>

	<script type="text/javascript">
        function com_search_url(obj) {
            var com_id = $(obj).attr("data-id");
            var url = "<?php echo U('Admin/Company/index',array('id'=>'com_id'));?>"
            url =  url.replace("com_id",com_id);

            window.open(url);
        }

        function com_show_url(obj) {
            var com_id = $(obj).attr("data-id");
            var url = "<?php echo U('Home/Index/showCompany',array('id'=>'com_id'));?>"
            url =  url.replace("com_id",com_id);

            window.open(url);
        }
	</script>

<script type="text/javascript">
//	jQuery(function($){
//
//		$('.dialogs,.comments').slimScroll({
//			height: '300px'
//	    });
//
//		/* 统计饼图 */
//		var placeholder = $('#piechart-placeholder').css({'width':'90%' , 'min-height':'150px'});
//		var data = [
//			{ label: "普通用户",  data: <?php echo ($data["user_bite"]); ?>, color: "#2091CF"},
//			{ label: "企业用户",  data: <?php echo ($data["company_bite"]); ?>, color: "#DE5A42"}
//		]
//		function drawPieChart(placeholder, data, position) {
//			$.plot(placeholder, data, {
//			series: {
//				pie: {
//					show: true,
//					tilt:0.8,
//					highlight: {
//						opacity: 0.25
//					},
//					stroke: {
//						color: '#fff',
//						width: 2
//					},
//					startAngle: 2
//				}
//			},
//			legend: {
//				show: true,
//				position: position || "ne",
//				labelBoxBorderColor: null,
//				margin:[-30,15]
//			}
//			,
//			grid: {
//				hoverable: true,
//				clickable: true
//			}
//		 })
//		}
//		drawPieChart(placeholder, data);
//
//		/**
//		we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
//		so that's not needed actually.
//		*/
//		placeholder.data('chart', data);
//		placeholder.data('draw', drawPieChart);
//		var $tooltip = $("<div class='tooltip top in hide'><div class='tooltip-inner'></div></div>").appendTo('body');
//		var previousPoint = null;
//		placeholder.on('plothover', function (event, pos, item) {
//		if(item) {
//			if (previousPoint != item.seriesIndex) {
//				previousPoint = item.seriesIndex;
//				var tip = item.series['label'] + " : " + item.series['percent']+'%';
//				$tooltip.show().children(0).text(tip);
//			}
//			$tooltip.css({top:pos.pageY + 10, left:pos.pageX + 10});
//		} else {
//			$tooltip.hide();
//			previousPoint = null;
//		}
//		});
//		/* /统计饼图 */
//
//
//
//	});



</script>

	</body>
</html>