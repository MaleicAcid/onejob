<?php if (!defined('THINK_PATH')) exit();?><div class="modal-header no-padding">
    <div class="table-header">
        <i class="icon-lock"></i>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        填写【<?php echo ($info["name"]); ?>】认证不通过的原因
    </div>
</div>

    <div class="modal-body overflow-visible">
    <div class="control-group">

        <!-- Select Basic -->
        <label class="control-label">选择原因</label>
        <div class="controls">
            <select name="uncheck_title" class="input-xlarge">
                <option>公司全名与照片不符</option>
                <option>公司简称不正式</option>
                <option>照片清晰度不够</option>
                <option>其他</option>
            </select>
        </div>

    </div>
    <div class="control-group">

        <!-- Textarea -->
        <label class="control-label">附加说明</label>
        <div class="controls">
            <div class="textarea">
                <textarea name="uncheck_content" style="resize:none; width:255px; height:100px;" type="" class=""> </textarea>
            </div>
        </div>
    </div>
</div>

    <div class="modal-footer">
        <input type="hidden" name="com_id" id="com_id" value="<?php echo ($info["id"]); ?>"/>
        <button data-dismiss="modal" class="btn btn-small">
            <i class="icon-remove"></i>
            取消
        </button>
        <button type="button" class="btn btn-small btn-primary" onclick="$.action3('<?php echo U('Admin/Company/doUncheck');?>', this);">
            <i class="icon-ok"></i>提交
        </button>
    </div>
<script type="text/javascript">
    jQuery(function($){

        $.extend({
            action3 : function(url, obj)
            {
                var data =$(obj).parents('form');
                $.ajax({
                    url : url,
                    type : 'post',
                    data : data.serialize(),
                    success : function(res)
                    {
                        $.lagou.alert(res.msg, res.code, 2);
                        if (res.code ==1) {
                            $.lagou.formHide();
                            location.reload();
                        }

                    }
                });
            }
        });
    });
</script>