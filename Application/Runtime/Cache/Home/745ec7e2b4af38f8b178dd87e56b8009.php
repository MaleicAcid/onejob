<?php if (!defined('THINK_PATH')) exit();?>
<?php if(empty($index_jobs)): ?><p id="no-ajax-content" style="text-align: center;font-size: 16px;color: #575151;padding: 15px 0 18px 0;">没有更多了</p>
    <?php else: ?>
    <?php if(is_array($index_jobs)): foreach($index_jobs as $key=>$job): ?><li>
            <a href = "<?php echo U('Home/JobShow/index',array('jid'=>$job['jid']));?>" >
                <div class="left">
                    <h1><?php echo ($job['name']); ?></h1>
                    <div class="requirements">
                        <span><?php echo ($job['edu']); ?></span>
                        <span><?php echo ($job['work_year']); ?></span>
                        <span><?php echo ($job['need_people']); ?>人</span>
                    </div>
                    <div class="time">发布时间：<span><?php echo (date('Y-m-d H:i',$job['create_time'])); ?></span></div>
                </div>
                <div class="right">
                    <div class="salary"><?php echo ($job['salary_low']); ?>k~<?php echo ($job['salary_high']); ?>k</div>
                    <div><img src="<?php echo (C("IMG_URL")); ?>a.png" alt=""></div>
                    <div class="name"><?php echo ($job['c_name']); ?></div>
                </div>
            </a>
        </li><?php endforeach; endif; endif; ?>