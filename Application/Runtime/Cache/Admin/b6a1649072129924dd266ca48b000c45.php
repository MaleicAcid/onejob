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
		<li <?php if(notice == 'index'): ?>class="active open"<?php endif; ?>>
			<a href="<?php echo U('admin/index/index');?>">
				<i class="icon-home"></i>
				<span class="menu-text"> 主视图 </span>
			</a>
		</li>

		<li <?php if(notice == 'notice'): ?>class="active open"<?php endif; ?>>
		<a href="javascript:;" class="dropdown-toggle">
			<i class="icon-envelope"></i>
			<span class="menu-text">公告管理</span>
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
					添加/编辑
				</a>
			</li>
		</ul>
		</li>

		<li <?php if(notice == 'user'): ?>class="active open"<?php endif; ?>>
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

		<li <?php if(notice == 'company'): ?>class="active open"<?php endif; ?>>
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

		<li <?php if(notice == 'type'): ?>class="active open"<?php endif; ?>>
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

		<li <?php if(notice == 'link'): ?>class="active open"<?php endif; ?>>
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

		<li <?php if(notice == 'manager'): ?>class="active open"<?php endif; ?>>
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
						
<li class="active">添加/编辑</li>

					</ul>
				</div>
				<!-- /面包屑导航 -->

				<div class="page-content">
					
<div class="row-fluid">
	<!--<h3 class="header blue lighter smaller">-->
		<form id="" action="" method="get">
		<div class="row-fluid  dataTables_wrapper">
			<div class="span8">
				公告标题:
				<input name="title" value="<?php echo ($data["title"]); ?>" type="text" id="title" class="" placeholder="请输入标题"/>
				<input name="nid" value="<?php echo ($data["nid"]); ?>" type="hidden" id="nid"/>
				<!--<label class="control-label pull-right"></label>-->
				</br>
				<textarea id="editor" type="text/plain" style="width:1024px;height:500px;" placeholder="请输入内容"><?php echo ($data["content"]); ?></textarea>
				<button onclick="save_notice(this)" type="button" class="btn btn-primary btn-small pull-left" id="search_submit"><i class="icon-ok bigger-110"></i>保存</button>
			</div>

			<!--<div class="span8" id="m_search_div">-->

			<!--</div>-->

		</div>
		</form>
	<!--</h3>-->


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
		

		
		
	<script type="text/javascript" charset="utf-8" src="/Public/Assets/js/ueditor/ueditor.config.js"></script>

	<script type="text/javascript">
        UEDITOR_CONFIG.toolbars = [[
            'fullscreen', 'source', '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
            'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
            'directionalityltr', 'directionalityrtl', 'indent', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            'link', 'unlink', '', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
            'simpleupload', '', 'emotion', 'scrawl', '', '', 'attachment', 'map', '', '', 'insertcode', '', '', 'template', 'background', '|',
            'horizontal', 'date', 'time', 'spechars', '', '', '|',
            'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
            '', '', 'searchreplace', '', 'drafts'
        ]]
	</script>
	<script type="text/javascript" charset="utf-8" src="/Public/Assets/js/ueditor/ueditor.all.js"> </script>
	<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
	<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
	<script type="text/javascript" charset="utf-8" src="/Public/Assets/js/ueditor/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript">

        //实例化编辑器
        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
        var ue = UE.getEditor('editor');
	</script>
	<script type="text/javascript">
		function save_notice(obj) {
		    if($('#title').val() == '') {
                alert('标题不能为空');
                return;
            }

            var obj = $(obj).parents('form');
			var url = "<?php echo U('Notice/doAdd');?>"
			var nid = $('#nid').val();
			var change = true;
			if(nid != '') {
                change = false;
			}
            $.ajax({
                url : url,
                type : 'post',
				data : obj.serialize(),
//                processData:false,
//                contentType:false,
                success : function(res)
                {
                    if(res.code == 1 && change) {
                        $('#nid').val(res.nid);
                        change = false;
					}
                    $.lagou.alert(res.msg, res.code, 2);
                    $.lagou.formHide();
//                    location.reload();
                }
            });
		}

	</script>
        <script type="text/javascript">
		jQuery(function($) {


			$.extend({

				action : function(url, obj)
				{
					var obj = $(obj).parents('form');

					$.ajax({
						url : url,
						type : 'post',
						data : obj.serialize(),
						success : function(res)
						{
							$.lagou.alert(res.msg, res.code, 2);
							$.lagou.formHide();
							location.reload();
						}
					});
				},

				del : function(url)
				{
					$.ajax({
						url : url,
						type : 'get',
						success : function(res)
						{
							$.lagou.alert(res.msg, res.code, 2);
							location.reload();
						}
					});
				}
			});
		
		})
	</script>

	</body>
</html>