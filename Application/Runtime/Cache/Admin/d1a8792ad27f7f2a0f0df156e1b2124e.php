<?php if (!defined('THINK_PATH')) exit();?><div class="modal-header no-padding">
	<div class="table-header">
		<i class="icon-lock"></i>
		<button type="button" class="close" data-dismiss="modal">&times;</button>
		添加轮播图
	</div>
</div>
<form  id="yourformid" enctype="multipart/form-data" action="doAdd" method="post">
<div class="modal-body overflow-visible">
	<div class="control-group">
		<label class="control-label" for="name">名称</label>
		<div class="controls">
			<input type="text" required="required" id="name" name="name" placeholder="名称"/>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="link_pic">选择图片</label>
		<div class="controls">
			<input type="file" name="link_pic" id="link_pic"/>
			<div id="pic_dv"><img src="" alt="" id="pic_im" width="160" height="160" /></div>
			<!--<input type="text" required="required" id="url" name="url" placeholder="注意添加http://"/>-->
		</div>
	</div>
	<script type="text/javascript" src="/Public/HomeStyle/js/uploadPreview.js"></script>
	<script type="text/javascript">
        $(function(){
            new uploadPreview({ UpBtn: "link_pic", DivShow: "pic_dv", ImgShow: "pic_im" });
        });
	</script>
</div>

<div class="modal-footer">
	<button data-dismiss="modal" class="btn btn-small">
		<i class="icon-remove"></i>
		取消
	</button>
	<button type="button" class="btn btn-small btn-primary" onclick="$.add('<?php echo U('Admin/Link/doAdd');?>', this);">
		<i class="icon-ok"></i>确认
	</button>
</div>
</form>

<script type="text/javascript" src="/Public/HomeStyle/js/ajaxfileupload.js"></script>
<script type="text/javascript">
	jQuery(function($){
		$.extend({
			add : function(url, obj)
			{
                var link_pic = new FormData(document.getElementById("yourformid"));

				$.ajax({
					url : url,
					type : 'post',
					data : link_pic,
                    processData:false,
                    contentType:false,
					success : function(res)
					{
						$.lagou.alert(res.msg, res.code, 2);
						$.lagou.formHide();
						location.reload();
					}
				});
			}
		});
	});
</script>