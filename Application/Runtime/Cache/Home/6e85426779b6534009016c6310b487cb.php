<?php if (!defined('THINK_PATH')) exit();?>
<?php if(empty($jobs)): ?><!--<p id="no-ajax-content" style="text-align: center;font-size: 16px;color: #575151;padding: 15px 0 18px 0;">没有更多了</p>-->
    <?php else: ?>
    <?php if(is_array($jobs)): foreach($jobs as $key=>$job): ?><li>
            <a href="Position_management.html">
                <p><?php echo ($job['name']); ?></p>
                <div class="C-listBox">
                    <div class="C-classify">
                        <i class=" icon-address-1"></i>
                        <span>0</span>
                    </div>
                    <div class="C-classify">
                        <i class=" icon-address-1"></i>
                        <span>1</span>
                    </div>
                    <div class="C-classify">
                        <i class=" icon-address-1"></i>
                        <span>0</span>
                    </div>
                </div>
            </a>
            <div class="C-offon">
                <?php if(($job['state'] == 1) ): ?><span class="C-off_hover" data-jid="<?php echo ($job['jid']); ?>" onclick="hide_or_show(this)"></span>
                    <?php else: ?><span data-jid="<?php echo ($job['jid']); ?>" onclick="hide_or_show(this)"></span><?php endif; ?>
            </div>
        </li><?php endforeach; endif; endif; ?>