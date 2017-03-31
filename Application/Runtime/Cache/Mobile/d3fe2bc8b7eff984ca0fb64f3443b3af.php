<?php if (!defined('THINK_PATH')) exit();?>
<?php if(empty($index_jobs)): ?><p id="no-ajax-content" style="text-align: center;font-size: 16px;color: #575151;padding: 15px 0 18px 0;">没有更多了</p>
    <?php else: ?>
    <?php if(is_array($index_jobs)): foreach($index_jobs as $key=>$job): ?><a href="<?php echo U('Mobile/JobShow/index',array('jid'=>$job['jid']));?>">
            <div class="newList">
                <div>
                    <span class="jobName"><?php echo ($job['name']); ?></span>
                    <span class="price"><?php echo ($job['salary_low']); ?>k~<?php echo ($job['salary_high']); ?>k</span>
                </div>
                <span class="conName"><?php echo ($job['c_name']); ?></span>

                <div class="require">
                    <div>
                        <img src="<?php echo (C("MB_IMG_URL")); ?>icon/study.png" alt="">
                        本科
                    </div>
                    <div>
                        <img src="<?php echo (C("MB_IMG_URL")); ?>icon/time.png" alt="">
                        3 ~ 5年
                    </div>
                    <div>
                        <img src="<?php echo (C("MB_IMG_URL")); ?>icon/person (2).png">
                        3人
                    </div>
                </div>
            </div>
        </a><?php endforeach; endif; endif; ?>