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
		<li <?php if(company == 'index'): ?>class="active open"<?php endif; ?>>
			<a href="<?php echo U('admin/index/index');?>">
				<i class="icon-home"></i>
				<span class="menu-text"> 主视图 </span>
			</a>
		</li>

		<li <?php if(company == 'notice'): ?>class="active open"<?php endif; ?>>
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

		<li <?php if(company == 'user'): ?>class="active open"<?php endif; ?>>
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

		<li <?php if(company == 'company'): ?>class="active open"<?php endif; ?>>
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

		<li <?php if(company == 'type'): ?>class="active open"<?php endif; ?>>
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

		<li <?php if(company == 'link'): ?>class="active open"<?php endif; ?>>
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

		<li <?php if(company == 'manager'): ?>class="active open"<?php endif; ?>>
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
						
<li class="active">公司审核列表</li>

					</ul>
				</div>
				<!-- /面包屑导航 -->

				<div class="page-content">
					
<div class="row-fluid">
	<h3 class="header blue lighter smaller">
		<form action="<?php echo U('Admin/Company/index');?>" method="get">
		<div class="row-fluid  dataTables_wrapper">
			
		</div>
		</form>
	</h3>
	<div class="table-header">公司审核列表</div>
	<table id="data_table" class="table table-striped table-bordered table-hover" style="margin-bottom:0px;">
		<thead>
			<tr>
				<th class="center" width="5%">
					<label>
						<input type="checkbox" class="ace" />
						<span class="lbl"></span>
					</label>
				</th>
				<th width="6%">公司LOGO</br>(可点击查看)</th>
				<th width="6%">营业执照</th>
				<th>公司名称(简称)</th>
				<th width="6%">状态</th>
				<th width="8%">操作</th>
			</tr>
		</thead>

		<tbody>
			<?php foreach ($data as $key => $val): ?>
				<tr>
					<td class="center">
						<label>
							<input type="checkbox" class="ace" />
							<span class="lbl"></span>
						</label>
					</td>
					<td>
						<span data-original-title="<?php echo ($val["name"]); ?>信息" data-rel="popover" class="tooltip-info" data-content="电话：<?php echo ($val["tel"]); ?><br/>邮箱：<?php echo ($val["email"]); ?><br/>公司领域：<b class='orange'><?php echo ($val["trade"]); ?></b><br/>公司网站：<a href='http://<?php echo ($val["web"]); ?>' target='_blank'><?php echo ($val["web"]); ?></a><br/>城市：<?php echo ($val["city"]); ?><br/>规模人数：<?php echo ($val["scale"]); ?><br/>发展阶段：<?php echo ($val["stage"]); ?><br/>公司描述：<?php echo ($val["desc"]); ?><br/>一句话：<?php echo ($val["one_desc"]); ?>">
							<?php if (empty($val['logo'])): ?>
							<?php $val['logo'] = '/Public/Assets/images/dimg.jpg'; ?>
							<?php endif ?>
							<img src="<?php echo ($val["logo"]); ?>" style="width:45px;height:45px;cursor:pointer;">
						</span>
					</td>
					<td>
						<a data-rel="tooltip" data-original-title="点击查看大图" href="<?php echo (get_img($val["licence"])); ?>" target="_blank"><img src="<?php echo (get_img($val["licence"])); ?>" style="width:45px;height:45px;cursor:pointer;"></a>
					</td>
					<td>
						<!--<a href="<?php echo U('Home/Index/showCompany', array('id'=>$val['id']));?>">-->
						<a>
							<?php echo ($val["name"]); ?>【<?php echo ($val["short_name"]); ?>】
						</a>
					</td>
					<td>待审核</td>
					<td>
						<div class="hidden-phone visible-desktop action-buttons">
							<a href="javascript:;" class="blue tooltip-info no-hover-underline" data-rel="tooltip" data-original-title="审核通过" onclick="$.check('<?php echo U('Admin/Company/check', array('id'=>$val['id']));?>');">
								<i class="icon-legal bigger-130"></i>
							</a>
							<a href="javascript:;" class="red uncheck tooltip-info no-hover-underline" data-rel="tooltip" data-original-title="不通过" data-id="<?php echo ($val["id"]); ?>" onclick="$.lagou.formShow('<?php echo U('Admin/Company/uncheck', array('id'=>$val['id']));?>');">
								<i class="icon-legal bigger-130"></i>
							</a>
							<a href="javascript:;" class="orange uncheck tooltip-info no-hover-underline" data-rel="tooltip" data-original-title="审核为学校" data-id="<?php echo ($val["id"]); ?>" onclick="$.check_to_school('<?php echo U('Admin/Company/check_to_school', array('id'=>$val['id']));?>');">
								<i class="icon-legal bigger-130"></i>
							</a>
						</div>
					</td>
				</tr>
			<?php endforeach ?>
		</tbody>
	</table>
	<!-- 分页 -->
	<div class="row-fluid">
		<div class="page"><?php echo ($page); ?></div>
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
		

		
		
	<script type="text/javascript">
			jQuery(function($) {

				// 这就是全选按钮
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});	
				});
                $.extend({
                    check_to_school : function(url)
                    {
                        $.lagou.confirm('确认审核为学校么？', function(res){
                            if (res) {
                                $.get(url, function(response){
                                    $.lagou.alert(response.msg, response.code, 2);
                                    location.reload(0);
                                });
                            }
                        });
                    }
                });
				$.extend({
					check : function(url)
					{
						$.lagou.confirm('确认审核通过么？', function(res){
							if (res) {
								$.get(url, function(response){
									$.lagou.alert(response.msg, response.code, 2);
									location.reload(0);
								});
							}
						});
					}
				});
			})

			//审核不通过
            function uncheck(id)
            {
                layer.open({
                    type: 2,
                    area: ['800px', '660px'],
                    shadeClose: true, //点击遮罩关闭
                    content: '<?php echo U('Admin/Company/uncheck', array('id'=>id));?>',
                });
            }

//            $('.uncheck').on('click' , function(){
//                layer.open({
//                    type: 1,
//                    area: ['600px', '360px'],
//                    shadeClose: true, //点击遮罩关闭
//                    content: '\<\div style="padding:20px;">自定义内容\<\/div>'
//                });
//            });
		</script>

	</body>
</html>