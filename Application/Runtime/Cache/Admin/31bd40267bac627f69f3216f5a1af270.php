<?php if (!defined('THINK_PATH')) exit();?><div class="modal-header no-padding">
	<div class="table-header">
		<i class="icon-lock"></i>
		<button type="button" class="close" data-dismiss="modal">&times;</button>
		修改【<?php echo ($info["name"]); ?>】置顶顺序
	</div>
</div>

<div class="modal-body overflow-visible">
	<div class="control-group">
		<label class="control-label" for="num">当前置顶顺序</label>
		<div class="controls">
			<input type="text" class="text" name="num" readOnly="true" value="<?php echo ($info["is_top"]); ?>"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="name">输入顺序</label>
		<div class="controls">
			<input type="text" id="num" class="text" name="name" placeholder="输入0-255的整数" value="" onKeyUp="value=value.replace(/[^\d]/g,'')"/>
		</div>
	</div>
</div>

<div class="modal-footer">
	<input type="hidden" name="id" id="com_id" value="<?php echo ($info["id"]); ?>"/>
	<button data-dismiss="modal" class="btn btn-small">
		<i class="icon-remove"></i>
		取消
	</button>
	<button type="button" class="btn btn-small btn-primary" onclick="$.action2('<?php echo U('Admin/Company/is_top_doEdit');?>', this);">
		<i class="icon-ok"></i>修改
	</button>
</div>