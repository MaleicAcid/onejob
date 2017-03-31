<?php if (!defined('THINK_PATH')) exit();?>
<?php if(empty($commentlist)): ?><p id="no-ajax-content" style="text-align: center;font-size: 16px;color: #575151;padding: 15px 0 18px 0;">没有更多了</p>
    <?php else: ?>
<?php if(is_array($commentlist)): foreach($commentlist as $key=>$v): ?><div class="comment-list">
    <div class="userName">
        <div class="userIcon">
            <img src="<?php echo ($v['head_pic']); ?>" alt="">
            <span><?php echo ($v['name']); ?></span>
        </div>
        <div class="userTime">
            <span><?php echo ($v['add_time']); ?></span>
        </div>
    </div>
    <div class="comment-content">
    <p><?php echo ($v['content']); ?></p>
    </div>
    <div class="comment-content">
        <?php if(($v['reply'] != null)): ?><div class="userName">
                <div class="userIcon">
                    <img src="<?php echo ($v['reply']['logo']); ?>" alt="">
                    <span><?php echo ($v['reply']['name']); ?></span>
                </div>
                <div class="userTime">
                    <span><?php echo ($v['reply']['add_time']); ?></span>
                </div>
            </div>
            <div class="comment-content">
                <p><?php echo ($v['reply']['content']); ?></p>
            </div>
            <?php elseif($is_author == 1): ?>

            <div onclick="showReply(this)" class="reply">回复</div>
            <div class="inp">
                <form action="">
                    <input type="text" name="content">
                    <button type="submit">发送</button>
                </form>
            </div>
            <?php else: endif; ?>
    </div>
</div>
<hr><?php endforeach; endif; endif; ?>