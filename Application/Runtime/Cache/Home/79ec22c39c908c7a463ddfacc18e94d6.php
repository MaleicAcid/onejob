<?php if (!defined('THINK_PATH')) exit();?>
<?php if(empty($companies)): ?><p id="no-ajax-content" style="text-align: center;font-size: 16px;color: #575151;padding: 15px 0 18px 0;">没有更多了</p>
    <?php else: ?>
    <?php if(is_array($companies)): foreach($companies as $key=>$com): ?><a href="<?php echo U('Home/CompanyShow/index',array('id'=>$com['id']));?>">
            <li>
                <div class="basicInformation">
                    <img src="<?php echo (get_img($com['logo'])); ?>" alt="">
                    <p>
                        <span><?php echo ($com['name']); ?></span><br>
                        <span><i class="icon-menu"></i><?php echo ($com['trade']); ?></span>
                    </p>
                    <div class="com-manage">
                        <span><i class="icon-menu"></i><?php echo ($com['invest']); ?></span>
                        <span><i class="icon-menu"></i><?php echo ($com['scale']); ?></span>
                        <span><i class="icon-menu"></i><?php echo ($com['address']); ?></span>
                    </div>
                </div>
                <div class="num">
                    <p><?php echo ($com['view_num']); ?></p>
                    <span>阅览量</span>
                </div>
            </li>
        </a><?php endforeach; endif; endif; ?>