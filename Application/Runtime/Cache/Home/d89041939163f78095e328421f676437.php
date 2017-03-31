<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>就业直达号</title>
    <link rel="stylesheet" href="<?php echo (C("CSS_URL")); ?>animation.css">
    <link rel="stylesheet" href="<?php echo (C("CSS_URL")); ?>fontello.css">
    <link rel="stylesheet" href="<?php echo (C("CSS_URL")); ?>reset.css">
    <link rel="stylesheet" href="<?php echo (C("CSS_URL")); ?>index.css">
    <!--新建-->
    <link rel="stylesheet" type="text/css" href="<?php echo (C("CSS_URL")); ?>Chord.css"/>
    <link rel="stylesheet" href="<?php echo (C("CSS_URL")); ?>job_list.css" />


</head>
<body>
<div id="app">
    <div class="header">
        <div class="user">
            <?php if($_SESSION['user']!= null): ?><a href="<?php echo U('Home/User/index');?>">消息中心</a>
                <a href="#"><?php echo ($_SESSION['user']['username']); ?></a>
                <a href="<?php echo U('Home/User/logout');?>">退出登录</a>
            <?php elseif($_SESSION['company']!= null): ?>
                <a href="<?php echo U('Home/Company/index');?>">企业中心</a>
                <a href="#"><?php echo ($_SESSION['company']['name']); ?></a>
                <a href="<?php echo U('Home/Company/logout');?>">退出登录</a>
                <?php else: ?>
                <a href="<?php echo U('Home/Users/login');?>">消息中心</a>
                <a href="<?php echo U('Home/Users/login');?>">快速登录</a><?php endif; ?>
        </div>
    </div>
    <div class="navBg">
        <div class="nav">
            <ul>
                <li>
                    <a href="<?php echo U('Home/Index/index');?>">首页</a>
                </li>
                <li>
                    <a href="<?php echo U('Home/Index/companyList');?>">企业</a>
                </li>
                <li>
                    <a href="#">互联网</a>
                </li>
                <li>
                    <a href="#">航海</a>
                </li>
                <li>
                    <a href="#">金融</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="main">
        <div class="details">
            <div class="details-enterpriseInformation">
                <div class="details-enterpriseInformation-basic">
                    <img src="image/a.png" alt="">
                    <h1>阿里巴巴</h1>
                    <ul>
                        <li><i class=" icon-user-7"></i>马云</li>
                        <li><i class=" icon-phone-outline"></i>马云</li>
                        <li><i class=" icon-mail"></i>马云</li>
                        <li><i class=" icon-location-outline"></i>职位</li>
                    </ul>
                </div>
                <div class="details-enterpriseInformation-introduce">
                    <p>公司介绍</p>
                    <hr>
                    <textarea>公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍公司介绍</textarea>
	                <a href="##" class="Chord-baocun">保存</a>
                </div>
            </div>
            <div class="positionInformation">
                <form>
                	<div class="C-fuck">
                		<div>
                			<p>时间：</p>
                			<span>2017.3.1</span>~<span>2017.3.3</span>
                		</div>
                	</div>
                <div class="positionInformation-position">
                
                        <div class="left">
                            <h1>职位：<input type="text" id="name" name="" placeholder="输入职位名称" required/></h1>
                            <div class="requirements">
                                <span>学历：
                                    <select name="edu" required>
                                        <option>大专</option>
                                        <option>本科</option>
                                        <option>硕士</option>
                                        <option>博士</option>
                                    </select>
                                </span>
                                <span>经验：
                                    <select name="work_year" required>
                                        <option>无经验</option>
                                        <option>1~3年</option>
                                        <option>3~5年</option>
                                        <option>5年以上</option>
                                    </select>
                                </span>
                                <span>人数：
                                    <!--<select name="" required>-->
                                        <!--<option>1人</option>-->
                                        <!--<option>2人</option>-->
                                        <!--<option>3人</option>-->
                                        <!--<option>4人</option>-->
                                        <!--<option>5人</option>-->
                                        <!--<option>6人</option>-->
                                        <!--<option>7人</option>-->
                                    <!--</select>-->
                                    <input type="text" id="need_people" name="need_people" placeholder="输入招聘人数" required/>
                                </span>
                            </div>
                            <!-- <div class="time">发布时间：<span>2017.2.19</span><span>19:00</span></div> -->
                        </div>
                        <div class="right">
                            <div class="salary">薪资：
                                <!--<select required>-->
                                        <!--<option>2k以下</option>-->
                                        <!--<option>2~3k</option>-->
                                        <!--<option>3~4.5k</option>-->
                                        <!--<option>4.5~6k</option>-->
                                        <!--<option>6~8k</option>-->
                                        <!--<option>0.8~1w</option>-->
                                        <!--<option>1~1.5w</option>-->
                                        <!--<option>1.5~2w</option>-->
                                        <!--<option>2~3w</option>-->
                                        <!--<option>3~5w</option>-->
                                    <!--</select>-->
                                <input type="text" id="salary_low" name="salary_low" placeholder="薪资下限" required/>
                                <input type="text" id="salary_high" name="salary_high" placeholder="薪资上限" required/>
                            </div>
                        </div>       
                </div>
                <div class="positionInformation-introduce">
                    <div class="describe">
                        <p>企业介绍</p>
                    </div>
                    <div class="introduce">
                        <!--<ul>
                            <li><i class="  icon-user-7"></i>联系人：</li>
                            <li><i class="  "></i><input type="text" name="" required/></li>
                            <li><i class="    icon-phone-outline"></i>电话：</li>
                            <li><i class=" "></i><input type="tel" name="" required/></li>
                        </ul>
                        <ul>
                            <li><i class="  icon-mail"></i>邮箱：</li>
                            <li><i class="  "></i><input type="email" name="" required/></li>
                            <li><i class="   icon-location-outline"></i>职位：</li>
                            <li><i class="  "></i><input type="text" name="" required/></li>
                        </ul>-->
                        <ul>
                        	<li>
                        		<i class="  icon-user-7"></i>
                        		<p><?php echo ($company['trade']); ?></p>
                        	</li>
                        	<li>
                        		<i class="  icon-user-7"></i>
                        		<p><?php echo ($company['invest']); ?></p>
                        	</li>
                        	<li>
                        		<i class="  icon-user-7"></i>
                        		<p><?php echo ($company['scale']); ?></p>
                        	</li>
                        </ul>
                    </div>
                </div>
                <div class="positionInformation-describe">
                    <div class="describe">
                        <p>职位描述</p>
                    </div>
                    <div class="describe-list">
                        <p>岗位职责:</p>
                        <textarea id="editor" style="margin: 0px;width: 798px;height: 400px;" autocomplete="off" required>
                            
                        </textarea>

                    </div>
                    <div><button type="button" onclick="save_job(this)" value=""  style="padding: 10px 15px;float: right" >提交</button><div style="height: 54px;">&nbsp;</div></div>
                </div>
                </form>
            </div>
            <div style="clear: both"></div>
        </div>
    </div>
    <script src="<?php echo (C("JS_URL")); ?>jquery-3.1.0.js" type="text/javascript" charset="utf-8"></script>
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
        function save_job(obj) {
            if($('#name').val() == '') {
                alert('职位名称不能为空');
                return;
            }

            var obj = $(obj).parents('form');
            var url = "<?php echo U('Company/do_add_job');?>"
            var change = true;
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
    <div class="footer">
    <div class="pro">
        <div class="pro-content">
            <img src="<?php echo (C("IMG_URL")); ?>erweima.jpg" alt="">
            <span>扫一扫微信小程序</span>
            <p>电话咨询:<span>400-123-4564</span></p>
        </div>
    </div>
    <div class="manage">
        <p>Copyright © 2017 jyzd.com XXXXXXX有限公司 沪ICP备134679852号-1</p>
        <p>联系地址：上海市XX区XX街道XX大楼XX号 联系电话：010-82585200</p>
    </div>
</div>
</div>



<script type="text/javascript">
	$(function(){
		
	});
</script>
</body>
</html>