<?php if (!defined('THINK_PATH')) exit();?><div class="modal-header no-padding">
	<div class="table-header">
		<i class="icon-lock"></i>
		<button type="button" class="close" data-dismiss="modal">&times;</button>
		添加消息通知
	</div>
</div>
<form  id="yourformid" action="do_add_short_notice" method="post">
<div class="modal-body overflow-visible">
	<div class="control-group">
		<label class="control-label" for="name">名称</label>
		<div class="controls">
			<input type="text" required="required" id="name" name="name" value="<?php echo ($res["name"]); ?>" placeholder="名称"/>
			<input name="id" value="<?php echo ($res["id"]); ?>" type="hidden" id="id"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">是否显示</label>
		<div class="controls">

			<!-- Inline Radios -->
			<label class="radio inline">
				<input type="radio" value="0" checked="checked" name="is_show">
				不显示
			</label>
			<label class="radio inline">
				<input type="radio" value="1" name="is_show">
				显示
			</label>
		</div>
	</div>
	<div class="control-group">
		<!-- Textarea -->
		<label class="control-label">输入内容</label>
		<div class="controls">
			<div class="textarea">
				<textarea name="content" style="resize:none; width:255px; height:100px;" type="" class=""> <?php echo ($res["content"]); ?></textarea>
			</div>
		</div>
	</div>
</div>

<div class="modal-footer">
	<button data-dismiss="modal" class="btn btn-small">
		<i class="icon-remove"></i>
		取消
	</button>
	<button type="button" class="btn btn-small btn-primary" onclick="$.add('<?php echo U('Admin/Notice/do_add_short_notice');?>', this);">
		<i class="icon-ok"></i>确认
	</button>
</div>
</form>

<script type="text/javascript">
	jQuery(function($){
		$.extend({
			add : function(url, obj)
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
			}
		});
	});
</script>