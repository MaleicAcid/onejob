/*
Navicat MySQL Data Transfer

Source Server         : 招聘直达号服务器
Source Server Version : 50635
Source Host           : 123.56.73.180:3306
Source Database       : onejob

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2017-03-31 17:48:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oj_admin
-- ----------------------------
DROP TABLE IF EXISTS `oj_admin`;
CREATE TABLE `oj_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `image` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否上传头像',
  `gid` int(11) NOT NULL DEFAULT '1' COMMENT '用户组',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态1开启0关闭',
  `create_time` int(11) NOT NULL COMMENT '注册时间',
  `login_time` int(11) NOT NULL COMMENT '登陆时间',
  `login_ip` varchar(20) NOT NULL COMMENT '登陆ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oj_admin
-- ----------------------------
INSERT INTO `oj_admin` VALUES ('4', 'admin', '4297f44b13955235245b2497399d7a93', '1', '1', '1', '1416051921', '1490931287', '124.76.61.226');
INSERT INTO `oj_admin` VALUES ('5', 'zaizai', '4297f44b13955235245b2497399d7a93', '1', '1', '1', '1416555488', '1486961505', '127.0.0.1');
INSERT INTO `oj_admin` VALUES ('6', 'panzhijie', 'a85ea8af42bcd0da4103f96bd63029cf', '0', '1', '1', '1490438735', '1490875971', '124.76.64.33');
INSERT INTO `oj_admin` VALUES ('7', 'ikedou', '4297f44b13955235245b2497399d7a93', '0', '1', '1', '1490602190', '1490771242', '124.93.4.60');

-- ----------------------------
-- Table structure for oj_area_category
-- ----------------------------
DROP TABLE IF EXISTS `oj_area_category`;
CREATE TABLE `oj_area_category` (
  `aid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '地区分类id',
  `pid` int(11) unsigned NOT NULL COMMENT '父地区id',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '地区名',
  `phonetic_name` varchar(30) NOT NULL DEFAULT '' COMMENT '地区拼音名',
  `path` varchar(40) NOT NULL COMMENT '路径',
  PRIMARY KEY (`aid`),
  KEY `phonetic_name` (`phonetic_name`) COMMENT '拼音索引',
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1105 DEFAULT CHARSET=utf8 COMMENT='地区列表';

-- ----------------------------
-- Records of oj_area_category
-- ----------------------------
INSERT INTO `oj_area_category` VALUES ('1', '0', '北京市', 'beijingshi', '0');
INSERT INTO `oj_area_category` VALUES ('2', '1', '北京市', 'beijingshi', '0_1');
INSERT INTO `oj_area_category` VALUES ('3', '0', '天津市', 'tianjinshi', '0');
INSERT INTO `oj_area_category` VALUES ('4', '3', '天津市', 'tianjinshi', '0_3');
INSERT INTO `oj_area_category` VALUES ('5', '0', '河北省', 'hebeisheng', '0');
INSERT INTO `oj_area_category` VALUES ('6', '5', '石家庄市', 'shijiazhuangshi', '0_5');
INSERT INTO `oj_area_category` VALUES ('7', '5', '唐山市', 'tangshanshi', '0_5');
INSERT INTO `oj_area_category` VALUES ('8', '5', '秦皇岛市', 'qinhuangdaoshi', '0_5');
INSERT INTO `oj_area_category` VALUES ('9', '5', '邯郸市', 'handanshi', '0_5');
INSERT INTO `oj_area_category` VALUES ('10', '5', '邢台市', 'xingtaishi', '0_5');
INSERT INTO `oj_area_category` VALUES ('11', '5', '保定市', 'baodingshi', '0_5');
INSERT INTO `oj_area_category` VALUES ('12', '5', '张家口市', 'zhangjiakoushi', '0_5');
INSERT INTO `oj_area_category` VALUES ('13', '5', '承德市', 'chengdeshi', '0_5');
INSERT INTO `oj_area_category` VALUES ('14', '5', '沧州市', 'cangzhoushi', '0_5');
INSERT INTO `oj_area_category` VALUES ('15', '5', '廊坊市', 'langfangshi', '0_5');
INSERT INTO `oj_area_category` VALUES ('16', '5', '衡水市', 'hengshuishi', '0_5');
INSERT INTO `oj_area_category` VALUES ('17', '0', '山西省', 'shanxisheng', '0');
INSERT INTO `oj_area_category` VALUES ('18', '17', '太原市', 'taiyuanshi', '0_17');
INSERT INTO `oj_area_category` VALUES ('19', '17', '大同市', 'datongshi', '0_17');
INSERT INTO `oj_area_category` VALUES ('20', '17', '阳泉市', 'yangquanshi', '0_17');
INSERT INTO `oj_area_category` VALUES ('21', '17', '长治市', 'changzhishi', '0_17');
INSERT INTO `oj_area_category` VALUES ('22', '17', '晋城市', 'jinchengshi', '0_17');
INSERT INTO `oj_area_category` VALUES ('23', '17', '朔州市', 'shuozhoushi', '0_17');
INSERT INTO `oj_area_category` VALUES ('24', '17', '忻州市', 'xinzhoushi', '0_17');
INSERT INTO `oj_area_category` VALUES ('25', '17', '吕梁市', 'lvliangshi', '0_17');
INSERT INTO `oj_area_category` VALUES ('26', '17', '晋中市', 'jinzhongshi', '0_17');
INSERT INTO `oj_area_category` VALUES ('27', '17', '临汾市', 'linfenshi', '0_17');
INSERT INTO `oj_area_category` VALUES ('28', '17', '运城市', 'yunchengshi', '0_17');
INSERT INTO `oj_area_category` VALUES ('29', '0', '内蒙古', 'neimenggu', '0');
INSERT INTO `oj_area_category` VALUES ('30', '29', '呼和浩特市', 'huhehaoteshi', '0_29');
INSERT INTO `oj_area_category` VALUES ('31', '29', '包头市', 'baotoushi', '0_29');
INSERT INTO `oj_area_category` VALUES ('32', '29', '乌海市', 'wuhaishi', '0_29');
INSERT INTO `oj_area_category` VALUES ('33', '29', '赤峰市', 'chifengshi', '0_29');
INSERT INTO `oj_area_category` VALUES ('34', '29', '呼伦贝尔市', 'hulunbeiershi', '0_29');
INSERT INTO `oj_area_category` VALUES ('35', '29', '兴安盟', 'xinganmeng', '0_29');
INSERT INTO `oj_area_category` VALUES ('36', '29', '通辽市', 'tongliaoshi', '0_29');
INSERT INTO `oj_area_category` VALUES ('37', '29', '锡林郭勒盟', 'xilinguolemeng', '0_29');
INSERT INTO `oj_area_category` VALUES ('38', '29', '乌兰察布盟', 'wulanchabumeng', '0_29');
INSERT INTO `oj_area_category` VALUES ('39', '29', '伊克昭盟', 'yikezhaomeng', '0_29');
INSERT INTO `oj_area_category` VALUES ('40', '29', '巴彦淖尔盟', 'bayannaoermeng', '0_29');
INSERT INTO `oj_area_category` VALUES ('41', '29', '阿拉善盟', 'alashanmeng', '0_29');
INSERT INTO `oj_area_category` VALUES ('42', '0', '辽宁省', 'liaoningsheng', '0');
INSERT INTO `oj_area_category` VALUES ('43', '42', '沈阳市', 'shenyangshi', '0_42');
INSERT INTO `oj_area_category` VALUES ('44', '42', '大连市', 'dalianshi', '0_42');
INSERT INTO `oj_area_category` VALUES ('45', '42', '鞍山市', 'anshanshi', '0_42');
INSERT INTO `oj_area_category` VALUES ('46', '42', '抚顺市', 'fushunshi', '0_42');
INSERT INTO `oj_area_category` VALUES ('47', '42', '本溪市', 'benxishi', '0_42');
INSERT INTO `oj_area_category` VALUES ('48', '42', '丹东市', 'dandongshi', '0_42');
INSERT INTO `oj_area_category` VALUES ('49', '42', '锦州市', 'jinzhoushi', '0_42');
INSERT INTO `oj_area_category` VALUES ('50', '42', '营口市', 'yingkoushi', '0_42');
INSERT INTO `oj_area_category` VALUES ('51', '42', '阜新市', 'fuxinshi', '0_42');
INSERT INTO `oj_area_category` VALUES ('52', '42', '辽阳市', 'liaoyangshi', '0_42');
INSERT INTO `oj_area_category` VALUES ('53', '42', '盘锦市', 'panjinshi', '0_42');
INSERT INTO `oj_area_category` VALUES ('54', '42', '铁岭市', 'tielingshi', '0_42');
INSERT INTO `oj_area_category` VALUES ('55', '42', '朝阳市', 'chaoyangshi', '0_42');
INSERT INTO `oj_area_category` VALUES ('56', '42', '葫芦岛市', 'huludaoshi', '0_42');
INSERT INTO `oj_area_category` VALUES ('57', '0', '吉林省', 'jilinsheng', '0');
INSERT INTO `oj_area_category` VALUES ('58', '57', '长春市', 'changchunshi', '0_57');
INSERT INTO `oj_area_category` VALUES ('59', '57', '吉林市', 'jilinshi', '0_57');
INSERT INTO `oj_area_category` VALUES ('60', '57', '四平市', 'sipingshi', '0_57');
INSERT INTO `oj_area_category` VALUES ('61', '57', '辽源市', 'liaoyuanshi', '0_57');
INSERT INTO `oj_area_category` VALUES ('62', '57', '通化市', 'tonghuashi', '0_57');
INSERT INTO `oj_area_category` VALUES ('63', '57', '白山市', 'baishanshi', '0_57');
INSERT INTO `oj_area_category` VALUES ('64', '57', '松原市', 'songyuanshi', '0_57');
INSERT INTO `oj_area_category` VALUES ('65', '57', '白城市', 'baichengshi', '0_57');
INSERT INTO `oj_area_category` VALUES ('66', '57', '延边朝鲜族自治州', 'yanbianchaoxianzuzizhizhou', '0_57');
INSERT INTO `oj_area_category` VALUES ('67', '0', '黑龙江省', 'heilongjiangsheng', '0');
INSERT INTO `oj_area_category` VALUES ('68', '67', '哈尔滨市', 'haerbinshi', '0_67');
INSERT INTO `oj_area_category` VALUES ('69', '67', '齐齐哈尔市', 'qiqihaershi', '0_67');
INSERT INTO `oj_area_category` VALUES ('70', '67', '鸡西市', 'jixishi', '0_67');
INSERT INTO `oj_area_category` VALUES ('71', '67', '鹤岗市', 'hegangshi', '0_67');
INSERT INTO `oj_area_category` VALUES ('72', '67', '双鸭山市', 'shuangyashanshi', '0_67');
INSERT INTO `oj_area_category` VALUES ('73', '67', '大庆市', 'daqingshi', '0_67');
INSERT INTO `oj_area_category` VALUES ('74', '67', '伊春市', 'yichunshi', '0_67');
INSERT INTO `oj_area_category` VALUES ('75', '67', '七台河市', 'qitaiheshi', '0_67');
INSERT INTO `oj_area_category` VALUES ('76', '67', '牡丹江市', 'mudanjiangshi', '0_67');
INSERT INTO `oj_area_category` VALUES ('77', '67', '黑河市', 'heiheshi', '0_67');
INSERT INTO `oj_area_category` VALUES ('78', '67', '绥化市', 'suihuashi', '0_67');
INSERT INTO `oj_area_category` VALUES ('79', '67', '大兴安岭地区', 'daxinganlingdiqu', '0_67');
INSERT INTO `oj_area_category` VALUES ('80', '0', '上海市', 'shanghaishi', '0');
INSERT INTO `oj_area_category` VALUES ('81', '80', '上海市', 'shanghaishi', '0_80');
INSERT INTO `oj_area_category` VALUES ('82', '0', '江苏省', 'jiangsusheng', '0');
INSERT INTO `oj_area_category` VALUES ('83', '82', '南京市', 'nanjingshi', '0_82');
INSERT INTO `oj_area_category` VALUES ('84', '82', '无锡市', 'wuxishi', '0_82');
INSERT INTO `oj_area_category` VALUES ('85', '82', '徐州市', 'xuzhoushi', '0_82');
INSERT INTO `oj_area_category` VALUES ('86', '82', '常州市', 'changzhoushi', '0_82');
INSERT INTO `oj_area_category` VALUES ('87', '82', '苏州市', 'suzhoushi', '0_82');
INSERT INTO `oj_area_category` VALUES ('88', '82', '南通市', 'nantongshi', '0_82');
INSERT INTO `oj_area_category` VALUES ('89', '82', '连云港市', 'lianyungangshi', '0_82');
INSERT INTO `oj_area_category` VALUES ('90', '82', '淮阴市', 'huaiyinshi', '0_82');
INSERT INTO `oj_area_category` VALUES ('91', '82', '盐城市', 'yanchengshi', '0_82');
INSERT INTO `oj_area_category` VALUES ('92', '82', '扬州市', 'yangzhoushi', '0_82');
INSERT INTO `oj_area_category` VALUES ('93', '82', '镇江市', 'zhenjiangshi', '0_82');
INSERT INTO `oj_area_category` VALUES ('94', '82', '泰州市', 'taizhoushi', '0_82');
INSERT INTO `oj_area_category` VALUES ('95', '82', '宿迁市', 'suqianshi', '0_82');
INSERT INTO `oj_area_category` VALUES ('96', '0', '浙江省', 'zhejiangsheng', '0');
INSERT INTO `oj_area_category` VALUES ('97', '96', '杭州市', 'hangzhoushi', '0_96');
INSERT INTO `oj_area_category` VALUES ('98', '96', '宁波市', 'ningboshi', '0_96');
INSERT INTO `oj_area_category` VALUES ('99', '96', '温州市', 'wenzhoushi', '0_96');
INSERT INTO `oj_area_category` VALUES ('100', '96', '嘉兴市', 'jiaxingshi', '0_96');
INSERT INTO `oj_area_category` VALUES ('101', '96', '湖州市', 'huzhoushi', '0_96');
INSERT INTO `oj_area_category` VALUES ('102', '96', '绍兴市', 'shaoxingshi', '0_96');
INSERT INTO `oj_area_category` VALUES ('103', '96', '金华市', 'jinhuashi', '0_96');
INSERT INTO `oj_area_category` VALUES ('104', '96', '衢州市', 'quzhoushi', '0_96');
INSERT INTO `oj_area_category` VALUES ('105', '96', '舟山市', 'zhoushanshi', '0_96');
INSERT INTO `oj_area_category` VALUES ('106', '96', '台州市', 'taizhoushi', '0_96');
INSERT INTO `oj_area_category` VALUES ('107', '96', '丽水市', 'lishuishi', '0_96');
INSERT INTO `oj_area_category` VALUES ('108', '0', '安徽省', 'anhuisheng', '0');
INSERT INTO `oj_area_category` VALUES ('109', '108', '合肥市', 'hefeishi', '0_108');
INSERT INTO `oj_area_category` VALUES ('110', '108', '芜湖市', 'wuhushi', '0_108');
INSERT INTO `oj_area_category` VALUES ('111', '108', '蚌埠市', 'bangbushi', '0_108');
INSERT INTO `oj_area_category` VALUES ('112', '108', '淮南市', 'huainanshi', '0_108');
INSERT INTO `oj_area_category` VALUES ('113', '108', '马鞍山市', 'maanshanshi', '0_108');
INSERT INTO `oj_area_category` VALUES ('114', '108', '淮北市', 'huaibeishi', '0_108');
INSERT INTO `oj_area_category` VALUES ('115', '108', '铜陵市', 'tonglingshi', '0_108');
INSERT INTO `oj_area_category` VALUES ('116', '108', '安庆市', 'anqingshi', '0_108');
INSERT INTO `oj_area_category` VALUES ('117', '108', '黄山市', 'huangshanshi', '0_108');
INSERT INTO `oj_area_category` VALUES ('118', '108', '滁州市', 'chuzhoushi', '0_108');
INSERT INTO `oj_area_category` VALUES ('119', '108', '阜阳市', 'fuyangshi', '0_108');
INSERT INTO `oj_area_category` VALUES ('120', '108', '宿州市', 'suzhoushi', '0_108');
INSERT INTO `oj_area_category` VALUES ('121', '108', '六安市', 'liuanshi', '0_108');
INSERT INTO `oj_area_category` VALUES ('122', '108', '宣城市', 'xuanchengshi', '0_108');
INSERT INTO `oj_area_category` VALUES ('123', '108', '巢湖市', 'chaohushi', '0_108');
INSERT INTO `oj_area_category` VALUES ('124', '108', '池州市', 'chizhoushi', '0_108');
INSERT INTO `oj_area_category` VALUES ('125', '0', '福建省', 'fujiansheng', '0');
INSERT INTO `oj_area_category` VALUES ('126', '125', '福州市', 'fuzhoushi', '0_125');
INSERT INTO `oj_area_category` VALUES ('127', '125', '厦门市', 'xiamenshi', '0_125');
INSERT INTO `oj_area_category` VALUES ('128', '125', '宁德市', 'ningdeshi', '0_125');
INSERT INTO `oj_area_category` VALUES ('129', '125', '莆田市', 'putianshi', '0_125');
INSERT INTO `oj_area_category` VALUES ('130', '125', '泉州市', 'quanzhoushi', '0_125');
INSERT INTO `oj_area_category` VALUES ('131', '125', '漳州市', 'zhangzhoushi', '0_125');
INSERT INTO `oj_area_category` VALUES ('132', '125', '龙岩', 'longyan', '0_125');
INSERT INTO `oj_area_category` VALUES ('133', '125', '三明市', 'sanmingshi', '0_125');
INSERT INTO `oj_area_category` VALUES ('134', '125', '南平市', 'nanpingshi', '0_125');
INSERT INTO `oj_area_category` VALUES ('135', '0', '江西省', 'jiangxisheng', '0');
INSERT INTO `oj_area_category` VALUES ('136', '135', '南昌市', 'nanchangshi', '0_135');
INSERT INTO `oj_area_category` VALUES ('137', '135', '景德镇市', 'jingdezhenshi', '0_135');
INSERT INTO `oj_area_category` VALUES ('138', '135', '萍乡市', 'pingxiangshi', '0_135');
INSERT INTO `oj_area_category` VALUES ('139', '135', '九江市', 'jiujiangshi', '0_135');
INSERT INTO `oj_area_category` VALUES ('140', '135', '新余市', 'xinyushi', '0_135');
INSERT INTO `oj_area_category` VALUES ('141', '135', '鹰潭市', 'yingtanshi', '0_135');
INSERT INTO `oj_area_category` VALUES ('142', '135', '赣州市', 'ganzhoushi', '0_135');
INSERT INTO `oj_area_category` VALUES ('143', '135', '宜春市', 'yichunshi', '0_135');
INSERT INTO `oj_area_category` VALUES ('144', '135', '上饶市', 'shangraoshi', '0_135');
INSERT INTO `oj_area_category` VALUES ('145', '135', '吉安市', 'jianshi', '0_135');
INSERT INTO `oj_area_category` VALUES ('146', '135', '抚州市', 'fuzhoushi', '0_135');
INSERT INTO `oj_area_category` VALUES ('147', '0', '山东省', 'shandongsheng', '0');
INSERT INTO `oj_area_category` VALUES ('148', '147', '济南市', 'jinanshi', '0_147');
INSERT INTO `oj_area_category` VALUES ('149', '147', '青岛市', 'qingdaoshi', '0_147');
INSERT INTO `oj_area_category` VALUES ('150', '147', '淄博市', 'ziboshi', '0_147');
INSERT INTO `oj_area_category` VALUES ('151', '147', '枣庄市', 'zaozhuangshi', '0_147');
INSERT INTO `oj_area_category` VALUES ('152', '147', '东营市', 'dongyingshi', '0_147');
INSERT INTO `oj_area_category` VALUES ('153', '147', '烟台市', 'yantaishi', '0_147');
INSERT INTO `oj_area_category` VALUES ('154', '147', '潍坊市', 'weifangshi', '0_147');
INSERT INTO `oj_area_category` VALUES ('155', '147', '济宁市', 'jiningshi', '0_147');
INSERT INTO `oj_area_category` VALUES ('156', '147', '泰安市', 'taianshi', '0_147');
INSERT INTO `oj_area_category` VALUES ('157', '147', '威海市', 'weihaishi', '0_147');
INSERT INTO `oj_area_category` VALUES ('158', '147', '日照市', 'rizhaoshi', '0_147');
INSERT INTO `oj_area_category` VALUES ('159', '147', '莱芜市', 'laiwushi', '0_147');
INSERT INTO `oj_area_category` VALUES ('160', '147', '临沂市', 'linyishi', '0_147');
INSERT INTO `oj_area_category` VALUES ('161', '147', '德州市', 'dezhoushi', '0_147');
INSERT INTO `oj_area_category` VALUES ('162', '147', '聊城市', 'liaochengshi', '0_147');
INSERT INTO `oj_area_category` VALUES ('163', '147', '滨州地区', 'binzhoudiqu', '0_147');
INSERT INTO `oj_area_category` VALUES ('164', '147', '菏泽地区', 'hezediqu', '0_147');
INSERT INTO `oj_area_category` VALUES ('165', '0', '河南省', 'henansheng', '0');
INSERT INTO `oj_area_category` VALUES ('166', '165', '郑州市', 'zhengzhoushi', '0_165');
INSERT INTO `oj_area_category` VALUES ('167', '165', '开封市', 'kaifengshi', '0_165');
INSERT INTO `oj_area_category` VALUES ('168', '165', '洛阳市', 'luoyangshi', '0_165');
INSERT INTO `oj_area_category` VALUES ('169', '165', '平顶山市', 'pingdingshanshi', '0_165');
INSERT INTO `oj_area_category` VALUES ('170', '165', '安阳市', 'anyangshi', '0_165');
INSERT INTO `oj_area_category` VALUES ('171', '165', '鹤壁市', 'hebishi', '0_165');
INSERT INTO `oj_area_category` VALUES ('172', '165', '新乡市', 'xinxiangshi', '0_165');
INSERT INTO `oj_area_category` VALUES ('173', '165', '焦作市', 'jiaozuoshi', '0_165');
INSERT INTO `oj_area_category` VALUES ('174', '165', '濮阳市', 'puyangshi', '0_165');
INSERT INTO `oj_area_category` VALUES ('175', '165', '许昌市', 'xuchangshi', '0_165');
INSERT INTO `oj_area_category` VALUES ('176', '165', '漯河市', 'luoheshi', '0_165');
INSERT INTO `oj_area_category` VALUES ('177', '165', '三门峡市', 'sanmenxiashi', '0_165');
INSERT INTO `oj_area_category` VALUES ('178', '165', '南阳市', 'nanyangshi', '0_165');
INSERT INTO `oj_area_category` VALUES ('179', '165', '商丘市', 'shangqiushi', '0_165');
INSERT INTO `oj_area_category` VALUES ('180', '165', '信阳市', 'xinyangshi', '0_165');
INSERT INTO `oj_area_category` VALUES ('181', '165', '周口市', 'zhoukoushi', '0_165');
INSERT INTO `oj_area_category` VALUES ('182', '165', '驻马店地区', 'zhumadiandiqu', '0_165');
INSERT INTO `oj_area_category` VALUES ('183', '165', '济源市', 'jiyuanshi', '0_165');
INSERT INTO `oj_area_category` VALUES ('184', '165', '江岸区', 'jianganqu', '0_165');
INSERT INTO `oj_area_category` VALUES ('185', '0', '湖北省', 'hubeisheng', '0');
INSERT INTO `oj_area_category` VALUES ('186', '185', '武汉市', 'wuhanshi', '0_185');
INSERT INTO `oj_area_category` VALUES ('187', '185', '黄石市', 'huangshishi', '0_185');
INSERT INTO `oj_area_category` VALUES ('188', '185', '十堰市', 'shiyanshi', '0_185');
INSERT INTO `oj_area_category` VALUES ('189', '185', '宜昌市', 'yichangshi', '0_185');
INSERT INTO `oj_area_category` VALUES ('190', '185', '襄樊市', 'xiangfanshi', '0_185');
INSERT INTO `oj_area_category` VALUES ('191', '185', '鄂州市', 'ezhoushi', '0_185');
INSERT INTO `oj_area_category` VALUES ('192', '185', '荆门市', 'jingmenshi', '0_185');
INSERT INTO `oj_area_category` VALUES ('193', '185', '孝感市', 'xiaoganshi', '0_185');
INSERT INTO `oj_area_category` VALUES ('194', '185', '荆州市', 'jingzhoushi', '0_185');
INSERT INTO `oj_area_category` VALUES ('195', '185', '黄冈市', 'huanggangshi', '0_185');
INSERT INTO `oj_area_category` VALUES ('196', '185', '咸宁市', 'xianningshi', '0_185');
INSERT INTO `oj_area_category` VALUES ('197', '185', '恩施土家族苗族自治州', 'enshitujiazumiaozuzizhizhou', '0_185');
INSERT INTO `oj_area_category` VALUES ('198', '185', '仙桃市', 'xiantaoshi', '0_185');
INSERT INTO `oj_area_category` VALUES ('199', '185', '潜江市', 'qianjiangshi', '0_185');
INSERT INTO `oj_area_category` VALUES ('200', '185', '天门市', 'tianmenshi', '0_185');
INSERT INTO `oj_area_category` VALUES ('201', '185', '神农架林区', 'shennongjialinqu', '0_185');
INSERT INTO `oj_area_category` VALUES ('202', '185', '芙蓉区', 'furongqu', '0_185');
INSERT INTO `oj_area_category` VALUES ('203', '0', '湖南省', 'hunansheng', '0');
INSERT INTO `oj_area_category` VALUES ('204', '203', '长沙市', 'changshashi', '0_203');
INSERT INTO `oj_area_category` VALUES ('205', '203', '株洲市', 'zhuzhoushi', '0_203');
INSERT INTO `oj_area_category` VALUES ('206', '203', '湘潭市', 'xiangtanshi', '0_203');
INSERT INTO `oj_area_category` VALUES ('207', '203', '衡阳市', 'hengyangshi', '0_203');
INSERT INTO `oj_area_category` VALUES ('208', '203', '邵阳市', 'shaoyangshi', '0_203');
INSERT INTO `oj_area_category` VALUES ('209', '203', '岳阳市', 'yueyangshi', '0_203');
INSERT INTO `oj_area_category` VALUES ('210', '203', '常德市', 'changdeshi', '0_203');
INSERT INTO `oj_area_category` VALUES ('211', '203', '张家界市', 'zhangjiajieshi', '0_203');
INSERT INTO `oj_area_category` VALUES ('212', '203', '益阳市', 'yiyangshi', '0_203');
INSERT INTO `oj_area_category` VALUES ('213', '203', '郴州市', 'chenzhoushi', '0_203');
INSERT INTO `oj_area_category` VALUES ('214', '203', '永州市', 'yongzhoushi', '0_203');
INSERT INTO `oj_area_category` VALUES ('215', '203', '怀化市', 'huaihuashi', '0_203');
INSERT INTO `oj_area_category` VALUES ('216', '203', '娄底地区', 'loudidiqu', '0_203');
INSERT INTO `oj_area_category` VALUES ('217', '203', '湘西土家族苗族自治州', 'xiangxitujiazumiaozuzizhizhou', '0_203');
INSERT INTO `oj_area_category` VALUES ('218', '0', '广东省', 'guangdongsheng', '0');
INSERT INTO `oj_area_category` VALUES ('219', '218', '广州市', 'guangzhoushi', '0_218');
INSERT INTO `oj_area_category` VALUES ('220', '218', '韶关市', 'shaoguanshi', '0_218');
INSERT INTO `oj_area_category` VALUES ('221', '218', '深圳市', 'shenzhenshi', '0_218');
INSERT INTO `oj_area_category` VALUES ('222', '218', '珠海市', 'zhuhaishi', '0_218');
INSERT INTO `oj_area_category` VALUES ('223', '218', '汕头市', 'shantoushi', '0_218');
INSERT INTO `oj_area_category` VALUES ('224', '218', '佛山市', 'foshanshi', '0_218');
INSERT INTO `oj_area_category` VALUES ('225', '218', '江门市', 'jiangmenshi', '0_218');
INSERT INTO `oj_area_category` VALUES ('226', '218', '湛江市', 'zhanjiangshi', '0_218');
INSERT INTO `oj_area_category` VALUES ('227', '218', '茂名市', 'maomingshi', '0_218');
INSERT INTO `oj_area_category` VALUES ('228', '218', '肇庆市', 'zhaoqingshi', '0_218');
INSERT INTO `oj_area_category` VALUES ('229', '218', '惠州市', 'huizhoushi', '0_218');
INSERT INTO `oj_area_category` VALUES ('230', '218', '梅州市', 'meizhoushi', '0_218');
INSERT INTO `oj_area_category` VALUES ('231', '218', '汕尾市', 'shanweishi', '0_218');
INSERT INTO `oj_area_category` VALUES ('232', '218', '河源市', 'heyuanshi', '0_218');
INSERT INTO `oj_area_category` VALUES ('233', '218', '阳江市', 'yangjiangshi', '0_218');
INSERT INTO `oj_area_category` VALUES ('234', '218', '清远市', 'qingyuanshi', '0_218');
INSERT INTO `oj_area_category` VALUES ('235', '218', '潮州市', 'chaozhoushi', '0_218');
INSERT INTO `oj_area_category` VALUES ('236', '218', '揭阳市', 'jieyangshi', '0_218');
INSERT INTO `oj_area_category` VALUES ('237', '218', '云浮市', 'yunfushi', '0_218');
INSERT INTO `oj_area_category` VALUES ('238', '0', '广西', 'guangxi', '0');
INSERT INTO `oj_area_category` VALUES ('239', '238', '南宁市', 'nanningshi', '0_238');
INSERT INTO `oj_area_category` VALUES ('240', '238', '柳州市', 'liuzhoushi', '0_238');
INSERT INTO `oj_area_category` VALUES ('241', '238', '桂林市', 'guilinshi', '0_238');
INSERT INTO `oj_area_category` VALUES ('242', '238', '梧州市', 'wuzhoushi', '0_238');
INSERT INTO `oj_area_category` VALUES ('243', '238', '北海市', 'beihaishi', '0_238');
INSERT INTO `oj_area_category` VALUES ('244', '238', '防城港市', 'fangchenggangshi', '0_238');
INSERT INTO `oj_area_category` VALUES ('245', '238', '钦州市', 'qinzhoushi', '0_238');
INSERT INTO `oj_area_category` VALUES ('246', '238', '贵港市', 'guigangshi', '0_238');
INSERT INTO `oj_area_category` VALUES ('247', '238', '玉林市', 'yulinshi', '0_238');
INSERT INTO `oj_area_category` VALUES ('248', '238', '崇左市', 'chongzuoshi', '0_238');
INSERT INTO `oj_area_category` VALUES ('249', '238', '来宾市', 'laibinshi', '0_238');
INSERT INTO `oj_area_category` VALUES ('250', '238', '贺州市', 'hezhoushi', '0_238');
INSERT INTO `oj_area_category` VALUES ('251', '238', '百色市', 'baiseshi', '0_238');
INSERT INTO `oj_area_category` VALUES ('252', '238', '河池市', 'hechishi', '0_238');
INSERT INTO `oj_area_category` VALUES ('253', '0', '海南省', 'hainansheng', '0');
INSERT INTO `oj_area_category` VALUES ('254', '253', '琼海市', 'qionghaishi', '0_253');
INSERT INTO `oj_area_category` VALUES ('255', '253', '儋州市', 'danzhoushi', '0_253');
INSERT INTO `oj_area_category` VALUES ('256', '253', '五指山市', 'wuzhishanshi', '0_253');
INSERT INTO `oj_area_category` VALUES ('257', '253', '文昌市', 'wenchangshi', '0_253');
INSERT INTO `oj_area_category` VALUES ('258', '253', '万宁市', 'wanningshi', '0_253');
INSERT INTO `oj_area_category` VALUES ('259', '253', '东方市', 'dongfangshi', '0_253');
INSERT INTO `oj_area_category` VALUES ('260', '253', '定安县', 'dinganxian', '0_253');
INSERT INTO `oj_area_category` VALUES ('261', '253', '屯昌县', 'tunchangxian', '0_253');
INSERT INTO `oj_area_category` VALUES ('262', '253', '澄迈县', 'chengmaixian', '0_253');
INSERT INTO `oj_area_category` VALUES ('263', '253', '临高县', 'lingaoxian', '0_253');
INSERT INTO `oj_area_category` VALUES ('264', '253', '白沙黎族自治县', 'baishalizuzizhixian', '0_253');
INSERT INTO `oj_area_category` VALUES ('265', '253', '昌江黎族自治县', 'changjianglizuzizhixian', '0_253');
INSERT INTO `oj_area_category` VALUES ('266', '253', '乐东黎族自治县', 'ledonglizuzizhixian', '0_253');
INSERT INTO `oj_area_category` VALUES ('267', '253', '陵水黎族自治县', 'lingshuilizuzizhixian', '0_253');
INSERT INTO `oj_area_category` VALUES ('268', '253', '保亭黎族苗族自治县', 'baotinglizumiaozuzizhixian', '0_253');
INSERT INTO `oj_area_category` VALUES ('269', '253', '琼中黎族苗族自治县', 'qiongzhonglizumiaozuzizhixian', '0_253');
INSERT INTO `oj_area_category` VALUES ('270', '253', '西南中沙群岛办事处', 'xinanzhongshaqundaobanshichu', '0_253');
INSERT INTO `oj_area_category` VALUES ('271', '253', '龙华区', 'longhuaqu', '0_253');
INSERT INTO `oj_area_category` VALUES ('272', '253', '海口市', 'haikoushi', '0_253');
INSERT INTO `oj_area_category` VALUES ('273', '253', '三亚市', 'sanyashi', '0_253');
INSERT INTO `oj_area_category` VALUES ('274', '0', '重庆市', 'zhongqingshi', '0');
INSERT INTO `oj_area_category` VALUES ('275', '274', '重庆市', 'zhongqingshi', '0_274');
INSERT INTO `oj_area_category` VALUES ('276', '0', '四川省', 'sichuansheng', '0');
INSERT INTO `oj_area_category` VALUES ('277', '276', '成都市', 'chengdushi', '0_276');
INSERT INTO `oj_area_category` VALUES ('278', '276', '自贡市', 'zigongshi', '0_276');
INSERT INTO `oj_area_category` VALUES ('279', '276', '攀枝花市', 'panzhihuashi', '0_276');
INSERT INTO `oj_area_category` VALUES ('280', '276', '泸州市', 'luzhoushi', '0_276');
INSERT INTO `oj_area_category` VALUES ('281', '276', '德阳市', 'deyangshi', '0_276');
INSERT INTO `oj_area_category` VALUES ('282', '276', '绵阳市', 'mianyangshi', '0_276');
INSERT INTO `oj_area_category` VALUES ('283', '276', '广元市', 'guangyuanshi', '0_276');
INSERT INTO `oj_area_category` VALUES ('284', '276', '遂宁市', 'suiningshi', '0_276');
INSERT INTO `oj_area_category` VALUES ('285', '276', '内江市', 'neijiangshi', '0_276');
INSERT INTO `oj_area_category` VALUES ('286', '276', '乐山市', 'leshanshi', '0_276');
INSERT INTO `oj_area_category` VALUES ('287', '276', '南充市', 'nanchongshi', '0_276');
INSERT INTO `oj_area_category` VALUES ('288', '276', '宜宾市', 'yibinshi', '0_276');
INSERT INTO `oj_area_category` VALUES ('289', '276', '广安市', 'guanganshi', '0_276');
INSERT INTO `oj_area_category` VALUES ('290', '276', '达川地区', 'dachuandiqu', '0_276');
INSERT INTO `oj_area_category` VALUES ('291', '276', '雅安地区', 'yaandiqu', '0_276');
INSERT INTO `oj_area_category` VALUES ('292', '276', '阿坝藏族羌族自治州', 'abacangzuqiangzuzizhizhou', '0_276');
INSERT INTO `oj_area_category` VALUES ('293', '276', '甘孜藏族自治州', 'ganzicangzuzizhizhou', '0_276');
INSERT INTO `oj_area_category` VALUES ('294', '276', '凉山彝族自治州', 'liangshanyizuzizhizhou', '0_276');
INSERT INTO `oj_area_category` VALUES ('295', '276', '巴中地区', 'bazhongdiqu', '0_276');
INSERT INTO `oj_area_category` VALUES ('296', '276', '眉山地区', 'meishandiqu', '0_276');
INSERT INTO `oj_area_category` VALUES ('297', '276', '资阳地区', 'ziyangdiqu', '0_276');
INSERT INTO `oj_area_category` VALUES ('298', '0', '贵州省', 'guizhousheng', '0');
INSERT INTO `oj_area_category` VALUES ('299', '298', '贵阳市', 'guiyangshi', '0_298');
INSERT INTO `oj_area_category` VALUES ('300', '298', '六盘水市', 'liupanshuishi', '0_298');
INSERT INTO `oj_area_category` VALUES ('301', '298', '遵义市', 'zunyishi', '0_298');
INSERT INTO `oj_area_category` VALUES ('302', '298', '铜仁地区', 'tongrendiqu', '0_298');
INSERT INTO `oj_area_category` VALUES ('303', '298', '黔西南布依族苗族自治州', 'qianxinanbuyizumiaozuzizhizhou', '0_298');
INSERT INTO `oj_area_category` VALUES ('304', '298', '毕节地区', 'bijiediqu', '0_298');
INSERT INTO `oj_area_category` VALUES ('305', '298', '安顺地区', 'anshundiqu', '0_298');
INSERT INTO `oj_area_category` VALUES ('306', '298', '黔东南苗族侗族自治州', 'qiandongnanmiaozudongzuzizhizh', '0_298');
INSERT INTO `oj_area_category` VALUES ('307', '298', '黔南布依族苗族自治州', 'qiannanbuyizumiaozuzizhizhou', '0_298');
INSERT INTO `oj_area_category` VALUES ('308', '0', '云南省', 'yunnansheng', '0');
INSERT INTO `oj_area_category` VALUES ('309', '308', '昆明市', 'kunmingshi', '0_308');
INSERT INTO `oj_area_category` VALUES ('310', '308', '曲靖市', 'qujingshi', '0_308');
INSERT INTO `oj_area_category` VALUES ('311', '308', '玉溪市', 'yuxishi', '0_308');
INSERT INTO `oj_area_category` VALUES ('312', '308', '昭通地区', 'zhaotongdiqu', '0_308');
INSERT INTO `oj_area_category` VALUES ('313', '308', '楚雄彝族自治州', 'chuxiongyizuzizhizhou', '0_308');
INSERT INTO `oj_area_category` VALUES ('314', '308', '红河哈尼族彝族自治州', 'honghehanizuyizuzizhizhou', '0_308');
INSERT INTO `oj_area_category` VALUES ('315', '308', '文山壮族苗族自治州', 'wenshanzhuangzumiaozuzizhizhou', '0_308');
INSERT INTO `oj_area_category` VALUES ('316', '308', '思茅市', 'simaoshi', '0_308');
INSERT INTO `oj_area_category` VALUES ('317', '308', '西双版纳傣族自治州', 'xishuangbannadaizuzizhizhou', '0_308');
INSERT INTO `oj_area_category` VALUES ('318', '308', '大理白族自治州', 'dalibaizuzizhizhou', '0_308');
INSERT INTO `oj_area_category` VALUES ('319', '308', '保山地区', 'baoshandiqu', '0_308');
INSERT INTO `oj_area_category` VALUES ('320', '308', '德宏傣族景颇族自治州', 'dehongdaizujingpozuzizhizhou', '0_308');
INSERT INTO `oj_area_category` VALUES ('321', '308', '丽江地区', 'lijiangdiqu', '0_308');
INSERT INTO `oj_area_category` VALUES ('322', '308', '怒江傈僳族自治州', 'nujianglisuzuzizhizhou', '0_308');
INSERT INTO `oj_area_category` VALUES ('323', '308', '迪庆藏族自治州', 'diqingcangzuzizhizhou', '0_308');
INSERT INTO `oj_area_category` VALUES ('324', '308', '临沧地区', 'lincangdiqu', '0_308');
INSERT INTO `oj_area_category` VALUES ('325', '0', '西藏', 'xicang', '0');
INSERT INTO `oj_area_category` VALUES ('326', '325', '拉萨市', 'lasashi', '0_325');
INSERT INTO `oj_area_category` VALUES ('327', '325', '昌都地区', 'changdudiqu', '0_325');
INSERT INTO `oj_area_category` VALUES ('328', '325', '山南地区', 'shannandiqu', '0_325');
INSERT INTO `oj_area_category` VALUES ('329', '325', '日喀则地区', 'rikazediqu', '0_325');
INSERT INTO `oj_area_category` VALUES ('330', '325', '那曲地区', 'naqudiqu', '0_325');
INSERT INTO `oj_area_category` VALUES ('331', '325', '阿里地区', 'alidiqu', '0_325');
INSERT INTO `oj_area_category` VALUES ('332', '325', '林芝地区', 'linzhidiqu', '0_325');
INSERT INTO `oj_area_category` VALUES ('333', '0', '陕西省', 'shanxisheng', '0');
INSERT INTO `oj_area_category` VALUES ('334', '333', '西安市', 'xianshi', '0_333');
INSERT INTO `oj_area_category` VALUES ('335', '333', '铜川市', 'tongchuanshi', '0_333');
INSERT INTO `oj_area_category` VALUES ('336', '333', '宝鸡市', 'baojishi', '0_333');
INSERT INTO `oj_area_category` VALUES ('337', '333', '咸阳市', 'xianyangshi', '0_333');
INSERT INTO `oj_area_category` VALUES ('338', '333', '渭南市', 'weinanshi', '0_333');
INSERT INTO `oj_area_category` VALUES ('339', '333', '延安市', 'yananshi', '0_333');
INSERT INTO `oj_area_category` VALUES ('340', '333', '汉中市', 'hanzhongshi', '0_333');
INSERT INTO `oj_area_category` VALUES ('341', '333', '安康地区', 'ankangdiqu', '0_333');
INSERT INTO `oj_area_category` VALUES ('342', '333', '商洛地区', 'shangluodiqu', '0_333');
INSERT INTO `oj_area_category` VALUES ('343', '333', '榆林地区', 'yulindiqu', '0_333');
INSERT INTO `oj_area_category` VALUES ('344', '0', '甘肃省', 'gansusheng', '0');
INSERT INTO `oj_area_category` VALUES ('345', '344', '兰州市', 'lanzhoushi', '0_344');
INSERT INTO `oj_area_category` VALUES ('346', '344', '嘉峪关市', 'jiayuguanshi', '0_344');
INSERT INTO `oj_area_category` VALUES ('347', '344', '金昌市', 'jinchangshi', '0_344');
INSERT INTO `oj_area_category` VALUES ('348', '344', '白银市', 'baiyinshi', '0_344');
INSERT INTO `oj_area_category` VALUES ('349', '344', '天水市', 'tianshuishi', '0_344');
INSERT INTO `oj_area_category` VALUES ('350', '344', '酒泉地区', 'jiuquandiqu', '0_344');
INSERT INTO `oj_area_category` VALUES ('351', '344', '张掖地区', 'zhangyediqu', '0_344');
INSERT INTO `oj_area_category` VALUES ('352', '344', '武威地区', 'wuweidiqu', '0_344');
INSERT INTO `oj_area_category` VALUES ('353', '344', '定西地区', 'dingxidiqu', '0_344');
INSERT INTO `oj_area_category` VALUES ('354', '344', '陇南地区', 'longnandiqu', '0_344');
INSERT INTO `oj_area_category` VALUES ('355', '344', '平凉地区', 'pingliangdiqu', '0_344');
INSERT INTO `oj_area_category` VALUES ('356', '344', '庆阳地区', 'qingyangdiqu', '0_344');
INSERT INTO `oj_area_category` VALUES ('357', '344', '临夏回族自治州', 'linxiahuizuzizhizhou', '0_344');
INSERT INTO `oj_area_category` VALUES ('358', '344', '甘南藏族自治州', 'gannancangzuzizhizhou', '0_344');
INSERT INTO `oj_area_category` VALUES ('359', '0', '青海省', 'qinghaisheng', '0');
INSERT INTO `oj_area_category` VALUES ('360', '359', '西宁市', 'xiningshi', '0_359');
INSERT INTO `oj_area_category` VALUES ('361', '359', '海东地区', 'haidongdiqu', '0_359');
INSERT INTO `oj_area_category` VALUES ('362', '359', '海北藏族自治州', 'haibeicangzuzizhizhou', '0_359');
INSERT INTO `oj_area_category` VALUES ('363', '359', '黄南藏族自治州', 'huangnancangzuzizhizhou', '0_359');
INSERT INTO `oj_area_category` VALUES ('364', '359', '海南藏族自治州', 'hainancangzuzizhizhou', '0_359');
INSERT INTO `oj_area_category` VALUES ('365', '359', '果洛藏族自治州', 'guoluocangzuzizhizhou', '0_359');
INSERT INTO `oj_area_category` VALUES ('366', '359', '玉树藏族自治州', 'yushucangzuzizhizhou', '0_359');
INSERT INTO `oj_area_category` VALUES ('367', '359', '海西蒙古族藏族自治州', 'haiximengguzucangzuzizhizhou', '0_359');
INSERT INTO `oj_area_category` VALUES ('368', '0', '宁夏', 'ningxia', '0');
INSERT INTO `oj_area_category` VALUES ('369', '368', '银川市', 'yinchuanshi', '0_368');
INSERT INTO `oj_area_category` VALUES ('370', '368', '石嘴山市', 'shizuishanshi', '0_368');
INSERT INTO `oj_area_category` VALUES ('371', '368', '吴忠市', 'wuzhongshi', '0_368');
INSERT INTO `oj_area_category` VALUES ('372', '368', '固原地区', 'guyuandiqu', '0_368');
INSERT INTO `oj_area_category` VALUES ('373', '368', '中卫市', 'zhongweishi', '0_368');
INSERT INTO `oj_area_category` VALUES ('374', '0', '新疆', 'xinjiang', '0');
INSERT INTO `oj_area_category` VALUES ('375', '374', '乌鲁木齐市', 'wulumuqishi', '0_374');
INSERT INTO `oj_area_category` VALUES ('376', '374', '克拉玛依市', 'kelamayishi', '0_374');
INSERT INTO `oj_area_category` VALUES ('377', '374', '吐鲁番地区', 'tulufandiqu', '0_374');
INSERT INTO `oj_area_category` VALUES ('378', '374', '哈密地区', 'hamidiqu', '0_374');
INSERT INTO `oj_area_category` VALUES ('379', '374', '昌吉回族自治州', 'changjihuizuzizhizhou', '0_374');
INSERT INTO `oj_area_category` VALUES ('380', '374', '博尔塔拉蒙古自治州', 'boertalamengguzizhizhou', '0_374');
INSERT INTO `oj_area_category` VALUES ('381', '374', '巴音郭楞蒙古自治州', 'bayinguolengmengguzizhizhou', '0_374');
INSERT INTO `oj_area_category` VALUES ('382', '374', '阿克苏地区', 'akesudiqu', '0_374');
INSERT INTO `oj_area_category` VALUES ('383', '374', '克孜勒苏柯尔克孜自治州', 'kezilesukeerkezizizhizhou', '0_374');
INSERT INTO `oj_area_category` VALUES ('384', '374', '喀什地区', 'kashidiqu', '0_374');
INSERT INTO `oj_area_category` VALUES ('385', '374', '和田地区', 'hetiandiqu', '0_374');
INSERT INTO `oj_area_category` VALUES ('386', '374', '伊犁哈萨克自治州', 'yilihasakezizhizhou', '0_374');
INSERT INTO `oj_area_category` VALUES ('387', '374', '塔城地区', 'tachengdiqu', '0_374');
INSERT INTO `oj_area_category` VALUES ('388', '374', '阿勒泰地区', 'aletaidiqu', '0_374');
INSERT INTO `oj_area_category` VALUES ('389', '374', '石河子市', 'shihezishi', '0_374');
INSERT INTO `oj_area_category` VALUES ('390', '374', '阿拉尔市', 'alaershi', '0_374');
INSERT INTO `oj_area_category` VALUES ('391', '374', '图木舒克市', 'tumushukeshi', '0_374');
INSERT INTO `oj_area_category` VALUES ('392', '374', '五家渠市', 'wujiaqushi', '0_374');
INSERT INTO `oj_area_category` VALUES ('1001', '0', '石家庄科技工程职业学院', 'shi jia zhuang ke ji gong chen', '');
INSERT INTO `oj_area_category` VALUES ('1002', '0', '河北劳动关系职业学院', 'he bei lao dong guan xi zhi ye', '');
INSERT INTO `oj_area_category` VALUES ('1003', '0', '石家庄科技职业学院', 'shi jia zhuang ke ji zhi ye xu', '');
INSERT INTO `oj_area_category` VALUES ('1004', '0', '泊头职业学院', 'bo tou zhi ye xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1005', '0', '宣化科技职业学院', 'xuan hua ke ji zhi ye xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1006', '0', '廊坊燕京职业技术学院', 'lang fang yan jing zhi ye ji s', '');
INSERT INTO `oj_area_category` VALUES ('1007', '0', '承德护理职业学院', 'cheng de hu li zhi ye xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1008', '0', '石家庄幼儿师范高等专科学校', 'shi jia zhuang you er shi fan ', '');
INSERT INTO `oj_area_category` VALUES ('1009', '0', '廊坊卫生职业学院', 'lang fang wei sheng zhi ye xue', '');
INSERT INTO `oj_area_category` VALUES ('1010', '0', '河北轨道运输职业技术学院', 'he bei gui dao yun shu zhi ye ', '');
INSERT INTO `oj_area_category` VALUES ('1011', '0', '保定幼儿师范高等专科学校', 'bao ding you er shi fan gao de', '');
INSERT INTO `oj_area_category` VALUES ('1012', '0', '河北工艺美术职业学院', 'he bei gong yi mei shu zhi ye ', '');
INSERT INTO `oj_area_category` VALUES ('1013', '0', '渤海理工职业学院', 'bo hai li gong zhi ye xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1014', '0', '唐山幼儿师范高等专科学校', 'tang shan you er shi fan gao d', '');
INSERT INTO `oj_area_category` VALUES ('1015', '0', '山西大学', 'shan xi da xue', '');
INSERT INTO `oj_area_category` VALUES ('1016', '0', '太原科技大学', 'tai yuan ke ji da xue', '');
INSERT INTO `oj_area_category` VALUES ('1017', '0', '中北大学', 'zhong bei da xue', '');
INSERT INTO `oj_area_category` VALUES ('1018', '0', '太原理工大学', 'tai yuan li gong da xue', '');
INSERT INTO `oj_area_category` VALUES ('1019', '0', '山西农业大学', 'shan xi nong ye da xue', '');
INSERT INTO `oj_area_category` VALUES ('1020', '0', '山西医科大学', 'shan xi yi ke da xue', '');
INSERT INTO `oj_area_category` VALUES ('1021', '0', '长治医学院', 'chang zhi yi xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1022', '0', '山西师范大学', 'shan xi shi fan da xue', '');
INSERT INTO `oj_area_category` VALUES ('1023', '0', '太原师范学院', 'tai yuan shi fan xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1024', '0', '山西大同大学', 'shan xi da tong da xue', '');
INSERT INTO `oj_area_category` VALUES ('1025', '0', '晋中学院', 'jin zhong xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1026', '0', '长治学院', 'chang zhi xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1027', '0', '运城学院', 'yun cheng xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1028', '0', '忻州师范学院', 'xin zhou shi fan xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1029', '0', '山西财经大学', 'shan xi cai jing da xue', '');
INSERT INTO `oj_area_category` VALUES ('1030', '0', '山西中医学院', 'shan xi zhong yi xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1031', '0', '吕梁学院', 'lv liang xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1032', '0', '太原学院', 'tai yuan xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1033', '0', '山西警察学院', 'shan xi jing cha xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1034', '0', '山西应用科技学院', 'shan xi ying yong ke ji xue yu', '');
INSERT INTO `oj_area_category` VALUES ('1035', '0', '山西大学商务学院', 'shan xi da xue shang wu xue yu', '');
INSERT INTO `oj_area_category` VALUES ('1036', '0', '太原理工大学现代科技学院', 'tai yuan li gong da xue xian d', '');
INSERT INTO `oj_area_category` VALUES ('1037', '0', '山西农业大学信息学院', 'shan xi nong ye da xue xin xi ', '');
INSERT INTO `oj_area_category` VALUES ('1038', '0', '山西师范大学现代文理学院', 'shan xi shi fan da xue xian da', '');
INSERT INTO `oj_area_category` VALUES ('1039', '0', '中北大学信息商务学院', 'zhong bei da xue xin xi shang ', '');
INSERT INTO `oj_area_category` VALUES ('1040', '0', '太原科技大学华科学院', 'tai yuan ke ji da xue hua ke x', '');
INSERT INTO `oj_area_category` VALUES ('1041', '0', '山西医科大学晋祠学院', 'shan xi yi ke da xue jin ci xu', '');
INSERT INTO `oj_area_category` VALUES ('1042', '0', '山西财经大学华商学院', 'shan xi cai jing da xue hua sh', '');
INSERT INTO `oj_area_category` VALUES ('1043', '0', '山西工商学院', 'shan xi gong shang xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1044', '0', '太原工业学院', 'tai yuan gong ye xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1045', '0', '山西传媒学院', 'shan xi chuan mei xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1046', '0', '山西工程技术学院', 'shan xi gong cheng ji shu xue ', '');
INSERT INTO `oj_area_category` VALUES ('1047', '0', '山西能源学院', 'shan xi neng yuan xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1048', '0', '山西省财政税务专科学校', 'shan xi sheng cai zheng shui w', '');
INSERT INTO `oj_area_category` VALUES ('1049', '0', '长治职业技术学院', 'chang zhi zhi ye ji shu xue yu', '');
INSERT INTO `oj_area_category` VALUES ('1050', '0', '山西艺术职业学院', 'shan xi yi shu zhi ye xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1051', '0', '晋城职业技术学院', 'jin cheng zhi ye ji shu xue yu', '');
INSERT INTO `oj_area_category` VALUES ('1052', '0', '山西建筑职业技术学院', 'shan xi jian zhu zhi ye ji shu', '');
INSERT INTO `oj_area_category` VALUES ('1053', '0', '山西药科职业学院', 'shan xi yao ke zhi ye xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1054', '0', '山西工程职业技术学院', 'shan xi gong cheng zhi ye ji s', '');
INSERT INTO `oj_area_category` VALUES ('1055', '0', '山西交通职业技术学院', 'shan xi jiao tong zhi ye ji sh', '');
INSERT INTO `oj_area_category` VALUES ('1056', '0', '大同煤炭职业技术学院', 'da tong mei tan zhi ye ji shu ', '');
INSERT INTO `oj_area_category` VALUES ('1057', '0', '山西机电职业技术学院', 'shan xi ji dian zhi ye ji shu ', '');
INSERT INTO `oj_area_category` VALUES ('1058', '0', '山西戏剧职业学院', 'shan xi xi ju zhi ye xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1059', '0', '山西财贸职业技术学院', 'shan xi cai mao zhi ye ji shu ', '');
INSERT INTO `oj_area_category` VALUES ('1060', '0', '山西林业职业技术学院', 'shan xi lin ye zhi ye ji shu x', '');
INSERT INTO `oj_area_category` VALUES ('1061', '0', '山西水利职业技术学院', 'shan xi shui li zhi ye ji shu ', '');
INSERT INTO `oj_area_category` VALUES ('1062', '0', '阳泉职业技术学院', 'yang quan zhi ye ji shu xue yu', '');
INSERT INTO `oj_area_category` VALUES ('1063', '0', '临汾职业技术学院', 'lin fen zhi ye ji shu xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1064', '0', '山西职业技术学院', 'shan xi zhi ye ji shu xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1065', '0', '山西煤炭职业技术学院', 'shan xi mei tan zhi ye ji shu ', '');
INSERT INTO `oj_area_category` VALUES ('1066', '0', '山西金融职业学院', 'shan xi jin rong zhi ye xue yu', '');
INSERT INTO `oj_area_category` VALUES ('1067', '0', '太原城市职业技术学院', 'tai yuan cheng shi zhi ye ji s', '');
INSERT INTO `oj_area_category` VALUES ('1068', '0', '山西信息职业技术学院', 'shan xi xin xi zhi ye ji shu x', '');
INSERT INTO `oj_area_category` VALUES ('1069', '0', '山西体育职业学院', 'shan xi ti yu zhi ye xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1070', '0', '山西警官职业学院', 'shan xi jing guan zhi ye xue y', '');
INSERT INTO `oj_area_category` VALUES ('1071', '0', '山西国际商务职业学院', 'shan xi guo ji shang wu zhi ye', '');
INSERT INTO `oj_area_category` VALUES ('1072', '0', '潞安职业技术学院', 'lu an zhi ye ji shu xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1073', '0', '太原旅游职业学院', 'tai yuan lv you zhi ye xue yua', '');
INSERT INTO `oj_area_category` VALUES ('1074', '0', '山西旅游职业学院', 'shan xi lv you zhi ye xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1075', '0', '山西管理职业学院', 'shan xi guan li zhi ye xue yua', '');
INSERT INTO `oj_area_category` VALUES ('1076', '0', '山西电力职业技术学院', 'shan xi dian li zhi ye ji shu ', '');
INSERT INTO `oj_area_category` VALUES ('1077', '0', '忻州职业技术学院', 'xin zhou zhi ye ji shu xue yua', '');
INSERT INTO `oj_area_category` VALUES ('1078', '0', '山西同文职业技术学院', 'shan xi tong wen zhi ye ji shu', '');
INSERT INTO `oj_area_category` VALUES ('1079', '0', '晋中职业技术学院', 'jin zhong zhi ye ji shu xue yu', '');
INSERT INTO `oj_area_category` VALUES ('1080', '0', '山西华澳商贸职业学院', 'shan xi hua ao shang mao zhi y', '');
INSERT INTO `oj_area_category` VALUES ('1081', '0', '山西运城农业职业技术学院', 'shan xi yun cheng nong ye zhi ', '');
INSERT INTO `oj_area_category` VALUES ('1082', '0', '运城幼儿师范高等专科学校', 'yun cheng you er shi fan gao d', '');
INSERT INTO `oj_area_category` VALUES ('1083', '0', '山西老区职业技术学院', 'shan xi lao qu zhi ye ji shu x', '');
INSERT INTO `oj_area_category` VALUES ('1084', '0', '山西经贸职业学院', 'shan xi jing mao zhi ye xue yu', '');
INSERT INTO `oj_area_category` VALUES ('1085', '0', '朔州职业技术学院', 'shuo zhou zhi ye ji shu xue yu', '');
INSERT INTO `oj_area_category` VALUES ('1086', '0', '运城职业技术学院', 'yun cheng zhi ye ji shu xue yu', '');
INSERT INTO `oj_area_category` VALUES ('1087', '0', '山西轻工职业技术学院', 'shan xi qing gong zhi ye ji sh', '');
INSERT INTO `oj_area_category` VALUES ('1088', '0', '晋中师范高等专科学校', 'jin zhong shi fan gao deng zhu', '');
INSERT INTO `oj_area_category` VALUES ('1089', '0', '阳泉师范高等专科学校', 'yang quan shi fan gao deng zhu', '');
INSERT INTO `oj_area_category` VALUES ('1090', '0', '山西青年职业学院', 'shan xi qing nian zhi ye xue y', '');
INSERT INTO `oj_area_category` VALUES ('1091', '0', '运城护理职业学院', 'yun cheng hu li zhi ye xue yua', '');
INSERT INTO `oj_area_category` VALUES ('1092', '0', '运城师范高等专科学校', 'yun cheng shi fan gao deng zhu', '');
INSERT INTO `oj_area_category` VALUES ('1093', '0', '朔州师范高等专科学校', 'shuo zhou shi fan gao deng zhu', '');
INSERT INTO `oj_area_category` VALUES ('1094', '0', '吕梁职业技术学院', 'lv liang zhi ye ji shu xue yua', '');
INSERT INTO `oj_area_category` VALUES ('1095', '0', '内蒙古大学', 'nei meng gu da xue', '');
INSERT INTO `oj_area_category` VALUES ('1096', '0', '内蒙古科技大学', 'nei meng gu ke ji da xue', '');
INSERT INTO `oj_area_category` VALUES ('1097', '0', '内蒙古工业大学', 'nei meng gu gong ye da xue', '');
INSERT INTO `oj_area_category` VALUES ('1098', '0', '内蒙古农业大学', 'nei meng gu nong ye da xue', '');
INSERT INTO `oj_area_category` VALUES ('1099', '0', '内蒙古医科大学', 'nei meng gu yi ke da xue', '');
INSERT INTO `oj_area_category` VALUES ('1100', '0', '内蒙古师范大学', 'nei meng gu shi fan da xue', '');
INSERT INTO `oj_area_category` VALUES ('1101', '0', '内蒙古民族大学', 'nei meng gu min zu da xue', '');
INSERT INTO `oj_area_category` VALUES ('1102', '0', '赤峰学院', 'chi feng xue yuan', '');
INSERT INTO `oj_area_category` VALUES ('1103', '0', '内蒙古财经大学', 'nei meng gu cai jing da xue', '');
INSERT INTO `oj_area_category` VALUES ('1104', '0', '呼伦贝尔学院', 'hu lun bei er xue yuan', '');

-- ----------------------------
-- Table structure for oj_comment
-- ----------------------------
DROP TABLE IF EXISTS `oj_comment`;
CREATE TABLE `oj_comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `job_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '职位id',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示 0不显示 1显示',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '回复内容',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0用户评论 1企业回复',
  `author_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论用户',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复的评论id',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`comment_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oj_comment
-- ----------------------------
INSERT INTO `oj_comment` VALUES ('1', '5', '1', '', '0', '0', '0', '0');
INSERT INTO `oj_comment` VALUES ('2', '5', '1', '', '0', '0', '0', '0');
INSERT INTO `oj_comment` VALUES ('3', '5', '1', '22', '0', '0', '0', '0');
INSERT INTO `oj_comment` VALUES ('4', '5', '1', '&lt;script&gt;alert(11)&lt;/script&gt;', '0', '0', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('5', '12', '1', '哈哈', '0', '0', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('6', '12', '1', '22', '0', '0', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('7', '12', '1', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '0', '0', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('8', '17', '1', '11', '0', '0', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('9', '26', '1', 'ha', '0', '0', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('10', '770', '1', '啊啊', '0', '317', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('11', '770', '1', '22', '0', '317', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('12', '770', '1', '33', '0', '317', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('13', '770', '1', '3344', '0', '317', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('14', '770', '1', '55', '0', '317', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('15', '770', '1', '66', '0', '317', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('16', '770', '1', '77', '0', '317', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('17', '770', '1', '66', '0', '317', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('18', '770', '1', '55', '0', '317', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('19', '5', '1', '11111', '0', '0', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('20', '12', '1', '多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行多行', '0', '0', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('21', '4', '1', '1', '0', '0', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('22', '4', '1', '2', '0', '0', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('23', '4', '1', '3', '0', '0', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('24', '770', '1', '企业的回复回复', '1', '15', '10', '1488896619');
INSERT INTO `oj_comment` VALUES ('25', '770', '1', '企业的回复回复', '1', '15', '10', '1488896619');
INSERT INTO `oj_comment` VALUES ('26', '4', '1', '', '0', '317', '0', '1488896619');
INSERT INTO `oj_comment` VALUES ('27', '770', '1', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '0', '317', '0', '0');
INSERT INTO `oj_comment` VALUES ('28', '4', '1', '222', '0', '317', '0', '0');
INSERT INTO `oj_comment` VALUES ('29', '770', '1', '这职位不错', '0', '320', '0', '0');
INSERT INTO `oj_comment` VALUES ('30', '770', '1', '这职位不错', '0', '320', '0', '0');
INSERT INTO `oj_comment` VALUES ('31', '770', '1', '这职位不错', '0', '320', '0', '0');
INSERT INTO `oj_comment` VALUES ('32', '770', '1', '这职位不错', '0', '320', '0', '0');
INSERT INTO `oj_comment` VALUES ('33', '770', '1', '这职位不错', '0', '320', '0', '0');
INSERT INTO `oj_comment` VALUES ('34', '770', '1', '这职位不错', '0', '320', '0', '0');
INSERT INTO `oj_comment` VALUES ('35', '770', '1', '这职位不错', '0', '320', '0', '1488990353');
INSERT INTO `oj_comment` VALUES ('36', '770', '1', '这职位不错', '0', '320', '0', '1488990915');
INSERT INTO `oj_comment` VALUES ('37', '4', '1', '', '0', '326', '0', '1489315745');
INSERT INTO `oj_comment` VALUES ('38', '4', '1', '', '0', '326', '0', '1489315750');
INSERT INTO `oj_comment` VALUES ('39', '4', '1', '', '0', '327', '0', '1489480163');
INSERT INTO `oj_comment` VALUES ('40', '4', '1', '测试', '0', '327', '0', '1489480379');
INSERT INTO `oj_comment` VALUES ('41', '4', '1', '测试', '0', '327', '0', '1489480616');
INSERT INTO `oj_comment` VALUES ('42', '4', '1', '2321', '0', '327', '0', '1489481125');
INSERT INTO `oj_comment` VALUES ('43', '4', '1', '1232132', '0', '327', '0', '1489481173');
INSERT INTO `oj_comment` VALUES ('44', '782', '1', '23213', '0', '327', '0', '1489481193');
INSERT INTO `oj_comment` VALUES ('45', '4', '1', '測試過', '0', '328', '0', '1489481542');
INSERT INTO `oj_comment` VALUES ('46', '4', '1', '評論', '0', '328', '0', '1489481591');
INSERT INTO `oj_comment` VALUES ('47', '4', '1', '評論', '0', '328', '0', '1489481596');
INSERT INTO `oj_comment` VALUES ('48', '4', '1', '評論', '0', '328', '0', '1489481606');
INSERT INTO `oj_comment` VALUES ('49', '4', '1', '2312', '0', '327', '0', '1489481848');
INSERT INTO `oj_comment` VALUES ('50', '4', '1', '1232', '0', '327', '0', '1489483163');
INSERT INTO `oj_comment` VALUES ('51', '782', '1', '12321321321', '0', '327', '0', '1489483400');
INSERT INTO `oj_comment` VALUES ('52', '11', '1', '拉我', '0', '329', '0', '1489484051');
INSERT INTO `oj_comment` VALUES ('53', '4', '1', '123sa', '0', '327', '0', '1489559868');
INSERT INTO `oj_comment` VALUES ('54', '783', '1', '根据了', '0', '329', '0', '1489562573');
INSERT INTO `oj_comment` VALUES ('55', '4', '1', '你是猪吗？', '0', '327', '0', '1489570975');
INSERT INTO `oj_comment` VALUES ('56', '4', '1', '宋', '0', '327', '0', '1489571011');
INSERT INTO `oj_comment` VALUES ('57', '4', '1', '晓', '0', '327', '0', '1489571023');
INSERT INTO `oj_comment` VALUES ('58', '4', '1', '梅', '0', '327', '0', '1489571031');
INSERT INTO `oj_comment` VALUES ('59', '4', '1', '你', '0', '327', '0', '1489571037');
INSERT INTO `oj_comment` VALUES ('60', '4', '1', '是', '0', '327', '0', '1489571042');
INSERT INTO `oj_comment` VALUES ('61', '4', '1', '...', '0', '327', '0', '1489571081');
INSERT INTO `oj_comment` VALUES ('62', '783', '1', '测试', '0', '327', '0', '1489592406');
INSERT INTO `oj_comment` VALUES ('63', '4', '1', '好了？', '0', '331', '0', '1489617437');
INSERT INTO `oj_comment` VALUES ('64', '4', '1', '啊', '0', '332', '0', '1489621169');
INSERT INTO `oj_comment` VALUES ('65', '11', '1', '', '0', '334', '0', '1489676104');
INSERT INTO `oj_comment` VALUES ('66', '22', '1', '测试', '0', '327', '0', '1489682843');
INSERT INTO `oj_comment` VALUES ('67', '9', '1', '测试', '0', '327', '0', '1489682865');
INSERT INTO `oj_comment` VALUES ('68', '5', '1', '测试', '0', '327', '0', '1489682928');
INSERT INTO `oj_comment` VALUES ('69', '17', '1', '', '0', '334', '0', '1489707021');
INSERT INTO `oj_comment` VALUES ('70', '17', '1', '', '0', '334', '0', '1489707029');
INSERT INTO `oj_comment` VALUES ('71', '17', '1', '', '0', '334', '0', '1489707036');
INSERT INTO `oj_comment` VALUES ('72', '26', '1', '', '0', '317', '0', '1489708921');
INSERT INTO `oj_comment` VALUES ('73', '5', '1', '', '0', '317', '0', '1489709013');
INSERT INTO `oj_comment` VALUES ('74', '5', '1', '', '0', '317', '0', '1489709030');
INSERT INTO `oj_comment` VALUES ('75', '13', '1', '', '0', '317', '0', '1489726638');
INSERT INTO `oj_comment` VALUES ('76', '22', '1', '', '0', '317', '0', '1489811691');
INSERT INTO `oj_comment` VALUES ('77', '22', '1', '', '0', '317', '0', '1489811704');
INSERT INTO `oj_comment` VALUES ('78', '22', '1', '', '0', '317', '0', '1489811729');
INSERT INTO `oj_comment` VALUES ('79', '22', '1', '', '0', '317', '0', '1489811972');
INSERT INTO `oj_comment` VALUES ('80', '22', '1', '测试', '0', '317', '0', '1489812410');
INSERT INTO `oj_comment` VALUES ('81', '22', '1', '我的评论内容', '0', '317', '0', '1489812424');
INSERT INTO `oj_comment` VALUES ('82', '22', '1', '', '0', '317', '0', '1489812506');
INSERT INTO `oj_comment` VALUES ('83', '22', '1', '', '0', '317', '0', '1489812613');
INSERT INTO `oj_comment` VALUES ('84', '22', '1', '啊啊', '0', '317', '0', '1489812779');
INSERT INTO `oj_comment` VALUES ('85', '17', '1', '啊啊啊', '0', '317', '0', '1489813516');
INSERT INTO `oj_comment` VALUES ('86', '808', '1', '哈哈', '0', '329', '0', '1489851661');
INSERT INTO `oj_comment` VALUES ('87', '6', '1', '哈哈哈', '0', '329', '0', '1489943014');
INSERT INTO `oj_comment` VALUES ('88', '6', '1', '哈哈哈', '0', '329', '0', '1489943020');
INSERT INTO `oj_comment` VALUES ('89', '6', '1', '哈哈哈', '0', '329', '0', '1489943026');
INSERT INTO `oj_comment` VALUES ('90', '4', '1', 'ss', '0', '317', '0', '1490194452');
INSERT INTO `oj_comment` VALUES ('91', '12', '1', '好棒', '0', '350', '0', '1490438140');
INSERT INTO `oj_comment` VALUES ('92', '12', '1', '沙琪玛很好啊', '0', '331', '0', '1490442947');
INSERT INTO `oj_comment` VALUES ('93', '12', '1', '沙琪玛沙琪玛', '0', '331', '0', '1490442970');
INSERT INTO `oj_comment` VALUES ('94', '6', '1', '试一下', '0', '351', '0', '1490451966');
INSERT INTO `oj_comment` VALUES ('95', '12', '1', '?', '0', '351', '0', '1490590417');
INSERT INTO `oj_comment` VALUES ('96', '816', '1', '测试', '0', '327', '0', '1490701345');
INSERT INTO `oj_comment` VALUES ('97', '816', '1', '测测看', '0', '317', '0', '1490701530');
INSERT INTO `oj_comment` VALUES ('98', '816', '1', '测测2', '0', '317', '0', '1490701540');
INSERT INTO `oj_comment` VALUES ('99', '816', '1', 'qqq', '1', '0', '98', '1490704512');
INSERT INTO `oj_comment` VALUES ('100', '816', '1', 'qqq', '1', '0', '98', '1490704517');
INSERT INTO `oj_comment` VALUES ('101', '816', '1', '', '1', '0', '97', '1490704549');
INSERT INTO `oj_comment` VALUES ('102', '816', '1', '回复你', '1', '0', '96', '1490704598');
INSERT INTO `oj_comment` VALUES ('103', '816', '1', '回复你', '1', '0', '96', '1490704607');
INSERT INTO `oj_comment` VALUES ('104', '816', '1', '22', '0', '317', '0', '1490704660');
INSERT INTO `oj_comment` VALUES ('105', '816', '1', '33', '0', '317', '0', '1490704663');
INSERT INTO `oj_comment` VALUES ('106', '816', '1', '33', '0', '317', '0', '1490704663');
INSERT INTO `oj_comment` VALUES ('107', '816', '1', '44', '0', '317', '0', '1490704666');
INSERT INTO `oj_comment` VALUES ('108', '816', '1', '44', '0', '317', '0', '1490704667');
INSERT INTO `oj_comment` VALUES ('109', '816', '1', '44', '0', '317', '0', '1490704671');
INSERT INTO `oj_comment` VALUES ('110', '816', '1', '44', '0', '317', '0', '1490704673');
INSERT INTO `oj_comment` VALUES ('111', '816', '1', '44', '0', '317', '0', '1490704676');
INSERT INTO `oj_comment` VALUES ('112', '816', '1', '44', '0', '317', '0', '1490704677');
INSERT INTO `oj_comment` VALUES ('113', '816', '1', '12', '0', '317', '0', '1490704705');
INSERT INTO `oj_comment` VALUES ('114', '816', '1', '12', '0', '317', '0', '1490704710');
INSERT INTO `oj_comment` VALUES ('115', '816', '1', '12', '0', '317', '0', '1490704748');
INSERT INTO `oj_comment` VALUES ('116', '816', '1', '', '0', '317', '0', '1490704755');
INSERT INTO `oj_comment` VALUES ('117', '816', '1', '搜索', '0', '317', '0', '1490704758');
INSERT INTO `oj_comment` VALUES ('118', '816', '1', '23', '0', '317', '0', '1490704794');
INSERT INTO `oj_comment` VALUES ('119', '816', '1', '21', '0', '317', '0', '1490704914');
INSERT INTO `oj_comment` VALUES ('120', '816', '1', '21', '0', '317', '0', '1490704919');
INSERT INTO `oj_comment` VALUES ('121', '816', '1', '23', '0', '317', '0', '1490704951');
INSERT INTO `oj_comment` VALUES ('122', '816', '1', '23', '0', '317', '0', '1490704963');
INSERT INTO `oj_comment` VALUES ('123', '816', '1', '12', '0', '317', '0', '1490705057');
INSERT INTO `oj_comment` VALUES ('124', '816', '1', '12', '0', '317', '0', '1490705058');
INSERT INTO `oj_comment` VALUES ('125', '5', '1', '12', '0', '317', '0', '1490705068');
INSERT INTO `oj_comment` VALUES ('126', '5', '1', '12', '0', '317', '0', '1490705071');
INSERT INTO `oj_comment` VALUES ('127', '5', '1', '12', '0', '317', '0', '1490705073');
INSERT INTO `oj_comment` VALUES ('128', '5', '1', '12', '0', '317', '0', '1490705075');
INSERT INTO `oj_comment` VALUES ('129', '5', '1', '12', '0', '317', '0', '1490705077');
INSERT INTO `oj_comment` VALUES ('130', '5', '1', '12', '0', '317', '0', '1490705078');
INSERT INTO `oj_comment` VALUES ('131', '5', '1', '12', '0', '317', '0', '1490705080');
INSERT INTO `oj_comment` VALUES ('132', '5', '1', '12', '0', '317', '0', '1490705081');
INSERT INTO `oj_comment` VALUES ('133', '5', '1', '12', '0', '317', '0', '1490705083');
INSERT INTO `oj_comment` VALUES ('134', '816', '1', '1233', '0', '317', '0', '1490705090');
INSERT INTO `oj_comment` VALUES ('135', '4', '1', '搜索', '0', '317', '0', '1490705156');
INSERT INTO `oj_comment` VALUES ('136', '4', '1', '搜索', '0', '317', '0', '1490705170');
INSERT INTO `oj_comment` VALUES ('137', '4', '1', '1212', '0', '317', '0', '1490705195');
INSERT INTO `oj_comment` VALUES ('138', '4', '1', '1212', '0', '317', '0', '1490705219');
INSERT INTO `oj_comment` VALUES ('139', '4', '1', '啊啊', '0', '317', '0', '1490705279');
INSERT INTO `oj_comment` VALUES ('140', '4', '1', '啊啊', '0', '317', '0', '1490705283');
INSERT INTO `oj_comment` VALUES ('141', '816', '1', '回复1233', '1', '364', '134', '1490705307');
INSERT INTO `oj_comment` VALUES ('142', '816', '1', '回复12', '1', '364', '124', '1490705346');
INSERT INTO `oj_comment` VALUES ('143', '816', '1', '回复12', '1', '364', '124', '1490705350');
INSERT INTO `oj_comment` VALUES ('144', '816', '1', '回复12', '1', '364', '123', '1490705380');
INSERT INTO `oj_comment` VALUES ('145', '816', '1', '回复23', '1', '364', '122', '1490705631');
INSERT INTO `oj_comment` VALUES ('146', '816', '1', '回回复2223', '1', '364', '121', '1490707311');
INSERT INTO `oj_comment` VALUES ('147', '819', '1', '哈哈哈', '0', '355', '0', '1490713755');
INSERT INTO `oj_comment` VALUES ('148', '819', '1', '哈哈哈', '0', '355', '0', '1490713763');
INSERT INTO `oj_comment` VALUES ('149', '819', '1', '哈哈哈', '0', '355', '0', '1490713770');
INSERT INTO `oj_comment` VALUES ('150', '814', '1', 'ce', '0', '317', '0', '1490715073');
INSERT INTO `oj_comment` VALUES ('151', '814', '1', '啊啊', '0', '317', '0', '1490715389');

-- ----------------------------
-- Table structure for oj_company
-- ----------------------------
DROP TABLE IF EXISTS `oj_company`;
CREATE TABLE `oj_company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '企业id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父企业id 即发布此企业的学校企业',
  `account_name` varchar(50) NOT NULL DEFAULT '' COMMENT '公司登录的账户名',
  `account_pass` char(32) NOT NULL DEFAULT '' COMMENT '公司登录密码',
  `oauth` varchar(10) NOT NULL DEFAULT '' COMMENT '第三方来源 wx qq',
  `unionid` varchar(100) NOT NULL DEFAULT '' COMMENT '微信多平台绑定后返回的表示',
  `openid` varchar(100) NOT NULL DEFAULT '' COMMENT '第三方唯一表示',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '企业名称',
  `short_name` varchar(20) NOT NULL DEFAULT '' COMMENT '企业简称',
  `position` varchar(20) NOT NULL DEFAULT '' COMMENT '工作职位',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '企业电话',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '企业邮箱',
  `licence` varchar(255) NOT NULL DEFAULT '' COMMENT '企业营业执照',
  `licence_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0未上传 1营业执照 2工牌',
  `logo` varchar(255) NOT NULL DEFAULT 'Uploads/Admin/Default/company_default_logo.png' COMMENT '企业logo',
  `web` varchar(255) NOT NULL DEFAULT '' COMMENT '企业网站',
  `city` varchar(10) NOT NULL DEFAULT '' COMMENT '所在城市',
  `scale` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '公司规模人数 0少于15人 5 2000人以上',
  `stage` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发展阶段 0天使轮 4D轮及以上5上市公司6不需要融资',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '公司地址',
  `desc` text COMMENT '公司介绍',
  `one_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '一句话介绍公司',
  `invest` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '投资类型 0独资 1合资',
  `uncheck_title` varchar(64) NOT NULL DEFAULT '' COMMENT '认证失败主因',
  `uncheck_content` varchar(255) NOT NULL DEFAULT '' COMMENT '认证失败附加信息',
  `state` tinyint(3) NOT NULL DEFAULT '2' COMMENT '状态 -1未验证 1已认证 2未认证3正在申请认证4认证失败',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否禁用 0禁用 1启用',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '企业类型 1普通企业 2学校 3附属企业',
  `is_hot` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否热门 0不热门 1热门 热门优先级低于置顶',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶 0不置顶  1,2,3..按序置顶',
  `new_job_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '剩余可发布简历数',
  `step` tinyint(4) NOT NULL DEFAULT '0' COMMENT '注册步骤',
  `trade` varchar(20) NOT NULL DEFAULT '' COMMENT '公司领域',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上次更新时间——时间戳形式',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间——时间戳形式',
  `point` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `view_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  PRIMARY KEY (`id`),
  KEY `k_trade` (`trade`),
  KEY `k_scale` (`scale`),
  KEY `k_city` (`city`),
  KEY `k_stage` (`stage`)
) ENGINE=InnoDB AUTO_INCREMENT=391 DEFAULT CHARSET=utf8 COMMENT='公司表';

-- ----------------------------
-- Records of oj_company
-- ----------------------------
INSERT INTO `oj_company` VALUES ('373', '0', '', '', 'qq', '', 'D05E14AB3EDD914A2FCFE6EE83CF3992', '大连海事大学', '第三方用户', '', '18940884139', '1376145001@qq.com', 'Uploads/Admin/Auth/2017-03-29/58db5fd6cd835.jpg', '1', 'Uploads/Company/Logo/2017-03-29/small_58db5fc49e1c9.jpg', '', '', '1', '0', '辽宁大连', '大连海事就业', '', '5', '', '', '1', '1', '2', '0', '0', '0', '0', '教育', '1490781604', '1490771417', '10', '4');
INSERT INTO `oj_company` VALUES ('374', '373', '', '', '', '', '', '大连中和正道投资管理有限公司', '刘', '', '18940884139', '1376145001@qq.com', '', '0', 'Uploads/Company/Logo/2017-03-29/small_58db5fc49e1c9.jpg', '', '', '1', '0', '大连', null, '', '7', '', '', '2', '1', '3', '0', '0', '0', '0', '金融', '0', '1490781861', '0', '0');
INSERT INTO `oj_company` VALUES ('387', '373', '', '', '', '', '', '罗罗中国', 'hdk', '', '', 'http://careers.rolls-royce.com', '', '0', 'Uploads/Company/Logo/2017-03-29/small_58db5fc49e1c9.jpg', '', '', '1', '0', '', null, '', '1', '', '', '2', '1', '3', '0', '0', '0', '0', '', '0', '1490841568', '0', '0');
INSERT INTO `oj_company` VALUES ('390', '0', '', '', 'weixin', 'on93psmAKvJssy47t7LTGpiclpVI', '', '', '第三方用户', '', '', '', '', '0', 'Uploads/Admin/Default/company_default_logo.png', '', '', '0', '0', '', null, '', '1', '', '', '2', '1', '1', '0', '0', '0', '0', '', '0', '1490943488', '0', '0');

-- ----------------------------
-- Table structure for oj_company_jobcate
-- ----------------------------
DROP TABLE IF EXISTS `oj_company_jobcate`;
CREATE TABLE `oj_company_jobcate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `company_id` int(11) NOT NULL COMMENT '公司id',
  `cate_id` int(11) NOT NULL COMMENT '职位id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oj_company_jobcate
-- ----------------------------

-- ----------------------------
-- Table structure for oj_job
-- ----------------------------
DROP TABLE IF EXISTS `oj_job`;
CREATE TABLE `oj_job` (
  `jid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '职位id',
  `company_id` int(11) unsigned NOT NULL COMMENT '公司id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '职位名称',
  `branch` varchar(50) NOT NULL DEFAULT '' COMMENT '所属部门',
  `salary_high` smallint(8) NOT NULL DEFAULT '0' COMMENT '最高薪资',
  `salary_low` smallint(8) unsigned NOT NULL DEFAULT '0' COMMENT '最低薪资',
  `city` varchar(10) NOT NULL DEFAULT '' COMMENT '职位所在城市',
  `work_year` varchar(10) NOT NULL DEFAULT '0' COMMENT '工作经验 0无经验 1 1~3年 2 3~5年 3 5年以上',
  `need_people` smallint(8) unsigned NOT NULL DEFAULT '0' COMMENT '招聘人数',
  `edu` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '学历 0不限1博士...',
  `nature` varchar(10) NOT NULL DEFAULT '0' COMMENT '工作性质',
  `welfare` varchar(100) NOT NULL DEFAULT '' COMMENT '福利，职位诱惑',
  `text` text NOT NULL COMMENT '职位描述',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '置顶顺序 0不置顶',
  `is_hot` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否热门 0不热门 1热门',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '管理员是否禁用 1未禁用 0禁用',
  `state` tinyint(3) NOT NULL DEFAULT '1' COMMENT '发布状态 1正常发布0隐藏',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '职位所在地址',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '接收简历的邮箱',
  `share_num` int(11) NOT NULL DEFAULT '0' COMMENT '收藏次数',
  `collect_num` int(11) NOT NULL DEFAULT '0' COMMENT '收藏次数',
  `view_num` int(11) NOT NULL DEFAULT '0' COMMENT '访问次数',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `cate_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '职位所在分类id',
  `cate_path` varchar(255) NOT NULL DEFAULT '' COMMENT '职位分类路径',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `modify_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`jid`),
  KEY `NewIndex1` (`company_id`),
  KEY `NewIndex2` (`salary_high`,`salary_low`),
  KEY `NewIndex3` (`city`),
  KEY `NewIndex4` (`branch`),
  KEY `NewIndex5` (`nature`)
) ENGINE=InnoDB AUTO_INCREMENT=833 DEFAULT CHARSET=utf8 COMMENT='职位表';

-- ----------------------------
-- Records of oj_job
-- ----------------------------
INSERT INTO `oj_job` VALUES ('820', '374', '理财顾问', '', '2', '1', '', '0', '20', '3', '0', '', '&lt;p&gt;【职位需求】&lt;br/&gt;职位名称：理财顾问&lt;br/&gt;&lt;br/&gt;职位描述：&lt;br/&gt;1、在超市驻点，收集有理财意向客户的电话号码，并解答客户问题；&lt;br/&gt;2、对有理财意向的客户进行邀约面谈或参加公司活动；&lt;br/&gt;3、向有理财意向的客户推荐公司理财产品，持续跟进与服务，引导老客户介绍新客户。&lt;br/&gt;&lt;br/&gt;职位要求：&lt;br/&gt;1、热爱金融行业，想在金融行业发展并有所作为；&lt;br/&gt;2、喜欢销售工作，想通过个人努力改变目前经济状况；&lt;br/&gt;3、学历不限，有无经验均可，为人正直、诚信、乐观、积极进取，具有良好的沟通能力和团队意识。&lt;br/&gt;&lt;/p&gt;&lt;p&gt;薪资待遇：&lt;br/&gt;1、无责任底薪2100元/月+绩效（0-5700）+2%提成，综合薪资5400元/月以上，五险一金，包住宿；&lt;br/&gt;2、公司提供带薪岗前培训、丰富的产品知识培训，专业的行业知识培训，实用的销售技巧培训，系统的业务流程培训，并提供广阔的职业发展空间；&lt;br/&gt;3、公司提供完善的超市展业渠道，丰富的客户营销活动和专业的理财沙龙；&lt;br/&gt;4、公司提供丰富的员工娱乐活动，生日Party、户外烧烤、真人CS、羽毛球、漂流；&lt;br/&gt;5、公司提供充足的营销活动，品海鲜、吃烧烤、一日游、农家院、采摘……让你与客户有近距离接触，增加成单率；&lt;br/&gt;6、公司提供1000平豪华办公职场，有独立的办公区、高档的洽谈区、温馨的休闲咖啡区、专业的健身区；&lt;br/&gt;7、工作时间早8:30-17:00，周六周日休息，法定节假日休息。&lt;/p&gt;', '0', '0', '1', '0', '', '', '0', '0', '0', '1490781861', '208', '', '0', '0');
INSERT INTO `oj_job` VALUES ('832', '387', '罗罗暑期实习生', '', '0', '0', '', '0', '30', '3', '0', '', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(0, 72, 144); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 14px; line-height: 22.4px; text-align: center; white-space: normal; widows: 1; word-wrap: break-word !important; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(0, 72, 144); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 14px; line-height: 22.4px; white-space: normal; widows: 1; word-wrap: break-word !important; background-color: rgb(255, 255, 255);&quot;&gt;作为全球动力系统市场的杰出领导者，&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(0, 72, 144); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 14px; line-height: 22.4px; white-space: normal; widows: 1; word-wrap: break-word !important; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;line-height: 22.4px;&quot;&gt;罗罗拥有科学与技术的百年传承，&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(0, 72, 144); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 14px; line-height: 22.4px; white-space: normal; widows: 1; word-wrap: break-word !important; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;line-height: 22.4px; text-align: center;&quot;&gt;更期待青年一代“最强大脑”的加入。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(0, 72, 144); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 14px; line-height: 22.4px; text-align: center; white-space: normal; widows: 1; word-wrap: break-word !important; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;line-height: 22.4px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(0, 72, 144); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 14px; line-height: 22.4px; white-space: normal; widows: 1; word-wrap: break-word !important; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;line-height: 22.4px;&quot;&gt;我们通过全球范围内的培训项目，&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(0, 72, 144); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 14px; line-height: 22.4px; white-space: normal; widows: 1; word-wrap: break-word !important; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;line-height: 22.4px; text-align: center;&quot;&gt;发掘了数百名人才，&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(0, 72, 144); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 14px; line-height: 22.4px; white-space: normal; widows: 1; word-wrap: break-word !important; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;line-height: 22.4px; text-align: center;&quot;&gt;为其提供世界顶级的发展培训机会，&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(0, 72, 144); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 14px; line-height: 22.4px; white-space: normal; widows: 1; word-wrap: break-word !important; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;line-height: 22.4px; text-align: center;&quot;&gt;助其获取能力的显著提升和有竞争力的薪酬。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(63, 61, 61); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 14px; line-height: 22.4px; white-space: normal; widows: 1; word-wrap: break-word !important; background-color: rgb(254, 255, 255);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; letter-spacing: 0px; line-height: 2;&quot;&gt;&amp;nbsp; &amp;nbsp;工程 - 工作地点：北京&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(63, 61, 61); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 14px; line-height: 22.4px; white-space: normal; widows: 1; word-wrap: break-word !important; background-color: rgb(254, 255, 255);&quot;&gt;◽&amp;nbsp;制造工程&amp;nbsp;- 工作地点：&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Emoji Symbols Font&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, Arial, sans-serif; line-height: 27.6889px; box-sizing: border-box !important; word-wrap: break-word !important;&quot;&gt;上海，成都，苏州，无锡，西安等&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(63, 61, 61); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 14px; line-height: 22.4px; white-space: normal; widows: 1; word-wrap: break-word !important; background-color: rgb(254, 255, 255);&quot;&gt;◽&amp;nbsp;供应链管理&amp;nbsp;- 工作地点：上海&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(63, 61, 61); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 14px; line-height: 22.4px; white-space: normal; widows: 1; word-wrap: break-word !important; background-color: rgb(254, 255, 255);&quot;&gt;◽&amp;nbsp;运营管理&amp;nbsp;- 工作地点：上海&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(63, 61, 61); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 14px; line-height: 22.4px; white-space: normal; widows: 1; word-wrap: break-word !important; background-color: rgb(254, 255, 255);&quot;&gt;◽&amp;nbsp;项目管理&amp;nbsp;- 工作地点：上海&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(63, 61, 61); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 14px; line-height: 22.4px; white-space: normal; widows: 1; word-wrap: break-word !important; background-color: rgb(254, 255, 255);&quot;&gt;◽&amp;nbsp;客户管理 - 工作地点：北京&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(63, 61, 61); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 14px; line-height: 22.4px; white-space: normal; widows: 1; word-wrap: break-word !important; background-color: rgb(254, 255, 255);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; letter-spacing: 0px; line-height: 2;&quot;&gt;◽&amp;nbsp;工程专业：航天航空、能源、动力学、自动化、材料工程等专业毕业生；&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(63, 61, 61); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 14px; line-height: 22.4px; white-space: normal; widows: 1; word-wrap: break-word !important; background-color: rgb(254, 255, 255);&quot;&gt;◽&amp;nbsp;管理专业：商学，管理学，经济学，国际关系，英语等专业毕业生。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(63, 61, 61); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, Arial, sans-serif; font-size: 14px; line-height: 22.4px; white-space: normal; widows: 1; word-wrap: break-word !important; background-color: rgb(254, 255, 255);&quot;&gt;◽&amp;nbsp;2018届优秀本科及研究生毕业生；&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '0', '1', '1', '', '', '1', '0', '13', '1490841568', '138', '', '1493481600', '0');

-- ----------------------------
-- Table structure for oj_job_category
-- ----------------------------
DROP TABLE IF EXISTS `oj_job_category`;
CREATE TABLE `oj_job_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '职位分类id',
  `pid` int(11) unsigned NOT NULL COMMENT '父id',
  `name` varchar(30) NOT NULL COMMENT '职位分类名称',
  `path` varchar(255) NOT NULL COMMENT '路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=323 DEFAULT CHARSET=utf8 COMMENT='职位类别表';

-- ----------------------------
-- Records of oj_job_category
-- ----------------------------
INSERT INTO `oj_job_category` VALUES ('1', '0', '技术', '0');
INSERT INTO `oj_job_category` VALUES ('2', '0', '产品', '0');
INSERT INTO `oj_job_category` VALUES ('3', '0', '设计', '0');
INSERT INTO `oj_job_category` VALUES ('5', '0', '市场与销售', '0');
INSERT INTO `oj_job_category` VALUES ('7', '1', '前端开发', '0_1');
INSERT INTO `oj_job_category` VALUES ('8', '18', 'HTML5', '0_1_18');
INSERT INTO `oj_job_category` VALUES ('9', '7', 'Javascript', '0_1_7');
INSERT INTO `oj_job_category` VALUES ('10', '7', 'UI', '0_1_7');
INSERT INTO `oj_job_category` VALUES ('11', '1', '后端开发', '0_1');
INSERT INTO `oj_job_category` VALUES ('12', '11', 'PHP', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('13', '11', 'JAVA', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('14', '11', 'C', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('15', '11', 'C++', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('18', '1', '移动开发', '0_1');
INSERT INTO `oj_job_category` VALUES ('19', '18', 'IOS', '0_1_18');
INSERT INTO `oj_job_category` VALUES ('20', '18', 'WP', '0_1_18');
INSERT INTO `oj_job_category` VALUES ('21', '18', 'Android', '0_1_18');
INSERT INTO `oj_job_category` VALUES ('22', '2', '产品经理', '0_2');
INSERT INTO `oj_job_category` VALUES ('23', '22', '产品助理', '0_2_22');
INSERT INTO `oj_job_category` VALUES ('24', '3', '视觉设计', '0_3');
INSERT INTO `oj_job_category` VALUES ('25', '24', '广告设计师', '0_3_24');
INSERT INTO `oj_job_category` VALUES ('26', '3', '交互设计', '0_3');
INSERT INTO `oj_job_category` VALUES ('27', '24', '游戏场景', '0_3_24');
INSERT INTO `oj_job_category` VALUES ('34', '5', '市场与营销', '0_5');
INSERT INTO `oj_job_category` VALUES ('35', '34', '市场营销其他', '0_5_34');
INSERT INTO `oj_job_category` VALUES ('36', '5', '公关', '0_5');
INSERT INTO `oj_job_category` VALUES ('37', '36', '公关其他', '0_5_36');
INSERT INTO `oj_job_category` VALUES ('38', '5', '销售', '0_5');
INSERT INTO `oj_job_category` VALUES ('39', '38', '销售专员', '0_5_38');
INSERT INTO `oj_job_category` VALUES ('40', '38', '销售经理', '0_5_38');
INSERT INTO `oj_job_category` VALUES ('53', '7', 'CSS', '0_1_7');
INSERT INTO `oj_job_category` VALUES ('54', '1', '硬件开发', '0_1');
INSERT INTO `oj_job_category` VALUES ('55', '1', '测试', '0_1');
INSERT INTO `oj_job_category` VALUES ('56', '1', '运维', '0_1');
INSERT INTO `oj_job_category` VALUES ('57', '1', 'DBA', '0_1');
INSERT INTO `oj_job_category` VALUES ('58', '1', '项目管理', '0_1');
INSERT INTO `oj_job_category` VALUES ('59', '1', '高端职位', '0_1');
INSERT INTO `oj_job_category` VALUES ('60', '1', '企业软件', '0_1');
INSERT INTO `oj_job_category` VALUES ('61', '2', '产品设计', '0_2');
INSERT INTO `oj_job_category` VALUES ('62', '2', '高端职位', '0_2');
INSERT INTO `oj_job_category` VALUES ('63', '3', '用户研究', '0_3');
INSERT INTO `oj_job_category` VALUES ('64', '3', '高端职位', '0_3');
INSERT INTO `oj_job_category` VALUES ('67', '5', '供应链', '0_5');
INSERT INTO `oj_job_category` VALUES ('68', '5', '采购', '0_5');
INSERT INTO `oj_job_category` VALUES ('69', '5', '投资', '0_5');
INSERT INTO `oj_job_category` VALUES ('70', '5', '高端职位', '0_5');
INSERT INTO `oj_job_category` VALUES ('72', '7', 'web前端', '0_1_7');
INSERT INTO `oj_job_category` VALUES ('73', '7', 'Flash', '0_1_7');
INSERT INTO `oj_job_category` VALUES ('74', '7', 'U3D', '0_1_7');
INSERT INTO `oj_job_category` VALUES ('75', '7', 'COCOS2D-X', '0_1_7');
INSERT INTO `oj_job_category` VALUES ('76', '11', '数据挖掘', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('77', '11', '.NET', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('78', '11', 'Python', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('79', '11', 'ASP', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('80', '11', 'Ruby', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('81', '54', '嵌入式', '0_1_54');
INSERT INTO `oj_job_category` VALUES ('82', '54', '自动化', '0_1_54');
INSERT INTO `oj_job_category` VALUES ('83', '54', '单片机', '0_1_54');
INSERT INTO `oj_job_category` VALUES ('84', '54', '电路设计', '0_1_54');
INSERT INTO `oj_job_category` VALUES ('85', '54', '驱动开发', '0_1_54');
INSERT INTO `oj_job_category` VALUES ('86', '54', '系统集成', '0_1_54');
INSERT INTO `oj_job_category` VALUES ('87', '54', 'PCB工艺', '0_1_54');
INSERT INTO `oj_job_category` VALUES ('88', '54', '模具设计', '0_1_54');
INSERT INTO `oj_job_category` VALUES ('89', '54', '热传导', '0_1_54');
INSERT INTO `oj_job_category` VALUES ('90', '54', '精益工程师', '0_1_54');
INSERT INTO `oj_job_category` VALUES ('91', '54', 'ARM开发', '0_1_54');
INSERT INTO `oj_job_category` VALUES ('92', '55', '测试工程师', '0_1_55');
INSERT INTO `oj_job_category` VALUES ('93', '55', '自动化测试', '0_1_55');
INSERT INTO `oj_job_category` VALUES ('94', '55', '功能测试', '0_1_55');
INSERT INTO `oj_job_category` VALUES ('95', '55', '项目测试', '0_1_55');
INSERT INTO `oj_job_category` VALUES ('96', '55', '测试开发', '0_1_55');
INSERT INTO `oj_job_category` VALUES ('97', '55', '游戏测试', '0_1_55');
INSERT INTO `oj_job_category` VALUES ('98', '55', '白盒测试', '0_1_55');
INSERT INTO `oj_job_category` VALUES ('99', '55', '灰盒测试', '0_1_55');
INSERT INTO `oj_job_category` VALUES ('100', '55', '黑盒测试', '0_1_55');
INSERT INTO `oj_job_category` VALUES ('101', '55', '手机测试', '0_1_55');
INSERT INTO `oj_job_category` VALUES ('102', '56', '运维工程师', '0_1_56');
INSERT INTO `oj_job_category` VALUES ('103', '56', '运维开发工程师', '0_1_56');
INSERT INTO `oj_job_category` VALUES ('104', '56', '网络工程师', '0_1_56');
INSERT INTO `oj_job_category` VALUES ('105', '56', '系统工程师', '0_1_56');
INSERT INTO `oj_job_category` VALUES ('106', '56', 'IT支持', '0_1_56');
INSERT INTO `oj_job_category` VALUES ('107', '56', 'IDC', '0_1_56');
INSERT INTO `oj_job_category` VALUES ('108', '56', 'CDN', '0_1_56');
INSERT INTO `oj_job_category` VALUES ('109', '56', '系统管理员', '0_1_56');
INSERT INTO `oj_job_category` VALUES ('110', '56', '病毒分析', '0_1_56');
INSERT INTO `oj_job_category` VALUES ('111', '57', 'MySQL', '0_1_57');
INSERT INTO `oj_job_category` VALUES ('112', '57', 'SQLServer', '0_1_57');
INSERT INTO `oj_job_category` VALUES ('113', '57', 'Oracle', '0_1_57');
INSERT INTO `oj_job_category` VALUES ('114', '57', 'DB2', '0_1_57');
INSERT INTO `oj_job_category` VALUES ('115', '57', 'MongoDB', '0_1_57');
INSERT INTO `oj_job_category` VALUES ('116', '57', 'ETL', '0_1_57');
INSERT INTO `oj_job_category` VALUES ('117', '57', 'Hive', '0_1_57');
INSERT INTO `oj_job_category` VALUES ('118', '57', '数据仓库', '0_1_57');
INSERT INTO `oj_job_category` VALUES ('119', '58', '项目经理', '0_1_58');
INSERT INTO `oj_job_category` VALUES ('120', '58', '项目助理', '0_1_58');
INSERT INTO `oj_job_category` VALUES ('121', '60', '实施工程师', '0_1_60');
INSERT INTO `oj_job_category` VALUES ('122', '60', '售前工程师', '0_1_60');
INSERT INTO `oj_job_category` VALUES ('123', '60', '售后工程师', '0_1_60');
INSERT INTO `oj_job_category` VALUES ('124', '60', 'BI工程师', '0_1_60');
INSERT INTO `oj_job_category` VALUES ('125', '59', '技术经理', '0_1_59');
INSERT INTO `oj_job_category` VALUES ('126', '59', '技术总监', '0_1_59');
INSERT INTO `oj_job_category` VALUES ('127', '59', '测试经理', '0_1_59');
INSERT INTO `oj_job_category` VALUES ('128', '59', '架构师', '0_1_59');
INSERT INTO `oj_job_category` VALUES ('129', '59', 'CTO', '0_1_59');
INSERT INTO `oj_job_category` VALUES ('130', '59', '运维总监', '0_1_59');
INSERT INTO `oj_job_category` VALUES ('131', '59', '项目总监', '0_1_59');
INSERT INTO `oj_job_category` VALUES ('132', '59', '测试总监', '0_1_59');
INSERT INTO `oj_job_category` VALUES ('133', '22', '产品经理', '0_2_22');
INSERT INTO `oj_job_category` VALUES ('134', '22', '网页产品经理', '0_2_22');
INSERT INTO `oj_job_category` VALUES ('135', '22', '移动产品经理', '0_2_22');
INSERT INTO `oj_job_category` VALUES ('136', '22', '数据产品经理', '0_2_22');
INSERT INTO `oj_job_category` VALUES ('137', '22', '游戏策划', '0_2_22');
INSERT INTO `oj_job_category` VALUES ('138', '22', '产品实习生', '0_2_22');
INSERT INTO `oj_job_category` VALUES ('139', '61', '产品设计师', '0_2_61');
INSERT INTO `oj_job_category` VALUES ('140', '61', '网页产品设计师', '0_2_61');
INSERT INTO `oj_job_category` VALUES ('141', '61', '无限产品设计师', '0_2_61');
INSERT INTO `oj_job_category` VALUES ('142', '62', '产品部经理', '0_2_62');
INSERT INTO `oj_job_category` VALUES ('143', '62', '产品总监', '0_2_62');
INSERT INTO `oj_job_category` VALUES ('144', '62', '游戏制作人', '0_2_62');
INSERT INTO `oj_job_category` VALUES ('145', '24', '视觉设计师', '0_3_24');
INSERT INTO `oj_job_category` VALUES ('146', '24', '网页设计师', '0_3_24');
INSERT INTO `oj_job_category` VALUES ('147', '24', 'Flash设计师', '0_3_24');
INSERT INTO `oj_job_category` VALUES ('148', '24', 'APP设计师', '0_3_24');
INSERT INTO `oj_job_category` VALUES ('149', '24', 'UI设计师', '0_3_24');
INSERT INTO `oj_job_category` VALUES ('150', '24', '平面设计师', '0_3_24');
INSERT INTO `oj_job_category` VALUES ('151', '24', '美术设计师（2D/3D）', '0_3_24');
INSERT INTO `oj_job_category` VALUES ('152', '26', '交互设计师', '0_3_26');
INSERT INTO `oj_job_category` VALUES ('153', '26', '无线交互设计师', '0_3_26');
INSERT INTO `oj_job_category` VALUES ('154', '26', '网页交互设计师', '0_3_26');
INSERT INTO `oj_job_category` VALUES ('155', '26', '硬件交互设计师', '0_3_26');
INSERT INTO `oj_job_category` VALUES ('156', '63', '数据分析师', '0_3_63');
INSERT INTO `oj_job_category` VALUES ('157', '63', '用户研究员', '0_3_63');
INSERT INTO `oj_job_category` VALUES ('158', '63', '游戏数值策划', '0_3_63');
INSERT INTO `oj_job_category` VALUES ('159', '64', '设计总监', '0_3_64');
INSERT INTO `oj_job_category` VALUES ('160', '64', '视觉设计总监', '0_3_64');
INSERT INTO `oj_job_category` VALUES ('161', '64', '交互设计总监', '0_3_64');
INSERT INTO `oj_job_category` VALUES ('180', '64', '运营总监', '0_3_64');
INSERT INTO `oj_job_category` VALUES ('182', '34', '市场营销', '0_5_34');
INSERT INTO `oj_job_category` VALUES ('183', '34', '市场策划', '0_5_34');
INSERT INTO `oj_job_category` VALUES ('184', '34', '市场顾问', '0_5_34');
INSERT INTO `oj_job_category` VALUES ('185', '34', '市场推广', '0_5_34');
INSERT INTO `oj_job_category` VALUES ('186', '34', 'SEO', '0_5_34');
INSERT INTO `oj_job_category` VALUES ('187', '34', 'SEM', '0_5_34');
INSERT INTO `oj_job_category` VALUES ('188', '34', '商务渠道', '0_5_34');
INSERT INTO `oj_job_category` VALUES ('189', '34', '商业数据分析', '0_5_34');
INSERT INTO `oj_job_category` VALUES ('190', '34', '活动策划', '0_5_34');
INSERT INTO `oj_job_category` VALUES ('191', '34', '海外市场', '0_5_34');
INSERT INTO `oj_job_category` VALUES ('192', '34', '政府关系', '0_5_34');
INSERT INTO `oj_job_category` VALUES ('193', '36', '媒介经理', '0_5_36');
INSERT INTO `oj_job_category` VALUES ('194', '36', '广告协调', '0_5_36');
INSERT INTO `oj_job_category` VALUES ('195', '36', '品牌公关', '0_5_36');
INSERT INTO `oj_job_category` VALUES ('196', '38', '客户代表', '0_5_38');
INSERT INTO `oj_job_category` VALUES ('197', '38', 'BD经理', '0_5_38');
INSERT INTO `oj_job_category` VALUES ('198', '38', '代理商销售', '0_5_38');
INSERT INTO `oj_job_category` VALUES ('199', '38', '电话销售', '0_5_38');
INSERT INTO `oj_job_category` VALUES ('200', '38', '销售顾问', '0_5_38');
INSERT INTO `oj_job_category` VALUES ('201', '38', '商品经理', '0_5_38');
INSERT INTO `oj_job_category` VALUES ('202', '67', '物流', '0_5_67');
INSERT INTO `oj_job_category` VALUES ('203', '67', '仓储', '0_5_67');
INSERT INTO `oj_job_category` VALUES ('204', '68', '采购专员', '0_5_68');
INSERT INTO `oj_job_category` VALUES ('205', '68', '采购经理', '0_5_68');
INSERT INTO `oj_job_category` VALUES ('206', '68', '商品经理', '0_5_68');
INSERT INTO `oj_job_category` VALUES ('207', '69', '分析师', '0_5_69');
INSERT INTO `oj_job_category` VALUES ('208', '69', '投资顾问', '0_5_69');
INSERT INTO `oj_job_category` VALUES ('209', '69', '投资经理', '0_5_69');
INSERT INTO `oj_job_category` VALUES ('210', '70', '市场总监', '0_5_70');
INSERT INTO `oj_job_category` VALUES ('211', '70', '销售总监', '0_5_70');
INSERT INTO `oj_job_category` VALUES ('212', '70', '商务总监', '0_5_70');
INSERT INTO `oj_job_category` VALUES ('213', '70', '公关总监', '0_5_70');
INSERT INTO `oj_job_category` VALUES ('231', '7', 'html5', '0_1_7');
INSERT INTO `oj_job_category` VALUES ('232', '7', '前端开发其它', '0_1_7');
INSERT INTO `oj_job_category` VALUES ('233', '11', 'C#', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('234', '11', 'VB', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('235', '11', 'Delphi', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('236', '11', 'Perl', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('237', '11', 'Ruby', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('238', '11', 'Hadoop', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('239', '11', 'Node.js', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('240', '11', '自然语言处理', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('241', '11', '搜索算法', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('242', '11', '精准推荐', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('243', '11', '全栈工程师', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('244', '11', 'Go', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('245', '11', 'ASP', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('246', '11', 'Shell', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('247', '11', '后端开发其它', '0_1_11');
INSERT INTO `oj_job_category` VALUES ('248', '18', '移动开发其它', '0_1_18');
INSERT INTO `oj_job_category` VALUES ('249', '55', '性能测试', '0_1_55');
INSERT INTO `oj_job_category` VALUES ('250', '55', '硬件测试', '0_1_55');
INSERT INTO `oj_job_category` VALUES ('251', '55', '测试经理', '0_1_55');
INSERT INTO `oj_job_category` VALUES ('252', '55', '测试其它', '0_1_55');
INSERT INTO `oj_job_category` VALUES ('253', '56', 'F5', '0_1_56');
INSERT INTO `oj_job_category` VALUES ('254', '56', 'WEB安全', '0_1_56');
INSERT INTO `oj_job_category` VALUES ('255', '56', '网络安全', '0_1_56');
INSERT INTO `oj_job_category` VALUES ('256', '56', '系统安全', '0_1_56');
INSERT INTO `oj_job_category` VALUES ('257', '56', '运维经理', '0_1_56');
INSERT INTO `oj_job_category` VALUES ('258', '56', '运维其它', '0_1_56');
INSERT INTO `oj_job_category` VALUES ('259', '57', 'DBA其它', '0_1_57');
INSERT INTO `oj_job_category` VALUES ('260', '59', '技术合伙人', '0_1_59');
INSERT INTO `oj_job_category` VALUES ('261', '59', '安全专家', '0_1_59');
INSERT INTO `oj_job_category` VALUES ('262', '59', '高端技术职位其它', '0_1_59');
INSERT INTO `oj_job_category` VALUES ('263', '60', '企业软件其它', '0_1_60');
INSERT INTO `oj_job_category` VALUES ('264', '54', 'FPGA开发', '0_1_54');
INSERT INTO `oj_job_category` VALUES ('265', '54', 'DSP开发', '0_1_54');
INSERT INTO `oj_job_category` VALUES ('266', '54', '材料工程师', '0_1_54');
INSERT INTO `oj_job_category` VALUES ('267', '54', '射频工程师', '0_1_54');
INSERT INTO `oj_job_category` VALUES ('268', '54', '硬件开发其它', '0_1_54');
INSERT INTO `oj_job_category` VALUES ('269', '22', '电商产品经理', '0_2_22');
INSERT INTO `oj_job_category` VALUES ('270', '24', '多媒体设计师', '0_3_24');
INSERT INTO `oj_job_category` VALUES ('271', '24', '原画师', '0_3_24');
INSERT INTO `oj_job_category` VALUES ('272', '24', '游戏特效', '0_3_24');
INSERT INTO `oj_job_category` VALUES ('273', '24', '游戏界面设计师', '0_3_24');
INSERT INTO `oj_job_category` VALUES ('274', '24', '游戏角色', '0_3_24');
INSERT INTO `oj_job_category` VALUES ('275', '24', '游戏动作', '0_3_24');
INSERT INTO `oj_job_category` VALUES ('276', '64', '设计经理/主管', '0_3_64');
INSERT INTO `oj_job_category` VALUES ('277', '64', '视觉设计经理/主管', '0_3_64');
INSERT INTO `oj_job_category` VALUES ('278', '64', '交互设计经理/主管', '0_3_64');
INSERT INTO `oj_job_category` VALUES ('279', '64', '交互设计总监', '0_3_64');
INSERT INTO `oj_job_category` VALUES ('280', '64', '用户研究经理/主管', '0_3_64');
INSERT INTO `oj_job_category` VALUES ('281', '64', '用户研究总监', '0_3_64');
INSERT INTO `oj_job_category` VALUES ('289', '34', '网络营销', '0_5_34');
INSERT INTO `oj_job_category` VALUES ('290', '0', '航运', '0');
INSERT INTO `oj_job_category` VALUES ('291', '0', '互联网', '0');
INSERT INTO `oj_job_category` VALUES ('292', '290', '船员', '0_290');
INSERT INTO `oj_job_category` VALUES ('293', '290', '航运管理', '0_290');
INSERT INTO `oj_job_category` VALUES ('294', '291', '物联', '0_291');
INSERT INTO `oj_job_category` VALUES ('295', '291', '智能化', '0_291');
INSERT INTO `oj_job_category` VALUES ('296', '291', '电商', '0_291');
INSERT INTO `oj_job_category` VALUES ('297', '0', '金融', '0');
INSERT INTO `oj_job_category` VALUES ('298', '297', '金融分析', '0_297');
INSERT INTO `oj_job_category` VALUES ('299', '297', '金融管理', '0_297');
INSERT INTO `oj_job_category` VALUES ('300', '292', '船长', '0_290_292');
INSERT INTO `oj_job_category` VALUES ('301', '292', '大副', '0_290_292');
INSERT INTO `oj_job_category` VALUES ('302', '292', '二副', '0_290_292');
INSERT INTO `oj_job_category` VALUES ('303', '292', '三副', '0_290_292');
INSERT INTO `oj_job_category` VALUES ('304', '292', '水手', '0_290_292');
INSERT INTO `oj_job_category` VALUES ('305', '292', '二轮管', '0_290_292');
INSERT INTO `oj_job_category` VALUES ('306', '292', '机轮长', '0_290_292');
INSERT INTO `oj_job_category` VALUES ('307', '292', '机工', '0_290_292');
INSERT INTO `oj_job_category` VALUES ('308', '292', '大轮管', '0_290_292');
INSERT INTO `oj_job_category` VALUES ('309', '293', '航运管理', '0_290_293');
INSERT INTO `oj_job_category` VALUES ('310', '293', '海务主管', '0_290_293');
INSERT INTO `oj_job_category` VALUES ('311', '293', '船员调配', '0_290_293');
INSERT INTO `oj_job_category` VALUES ('312', '293', '船员人事', '0_290_293');
INSERT INTO `oj_job_category` VALUES ('313', '298', '金融分析师', '0_297_298');
INSERT INTO `oj_job_category` VALUES ('315', '298', '高级分析师', '0_297_298');
INSERT INTO `oj_job_category` VALUES ('316', '295', '数据清洗', '0_291_295');
INSERT INTO `oj_job_category` VALUES ('317', '294', '居家物联', '0_291_294');
INSERT INTO `oj_job_category` VALUES ('318', '294', '车辆物联', '0_291_294');
INSERT INTO `oj_job_category` VALUES ('319', '296', 'B2B', '0_291_296');
INSERT INTO `oj_job_category` VALUES ('320', '296', 'B2C', '0_291_296');
INSERT INTO `oj_job_category` VALUES ('321', '296', 'C2C', '0_291_296');
INSERT INTO `oj_job_category` VALUES ('322', '295', '计算机视觉', '0_291_295');

-- ----------------------------
-- Table structure for oj_link
-- ----------------------------
DROP TABLE IF EXISTS `oj_link`;
CREATE TABLE `oj_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `notice_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联的公告编号id',
  `name` varchar(20) NOT NULL COMMENT '链接名称',
  `small_pic` varchar(64) NOT NULL COMMENT '轮播图的缩略图',
  `link_pic` varchar(64) NOT NULL COMMENT '轮播图',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示 0不显示 1显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oj_link
-- ----------------------------
INSERT INTO `oj_link` VALUES ('59', '0', '拳击22', 'Uploads/Admin/Link/2017-03-06/small_58bd1f32edfa3.jpg', 'Uploads/Admin/Link/2017-03-06/58bd1f32edfa3.jpg', '1488789298', '0');
INSERT INTO `oj_link` VALUES ('68', '0', '招聘', 'Uploads/Admin/Link/2017-03-15/small_58c8f3fea5306.png', 'Uploads/Admin/Link/2017-03-15/58c8f3fea5306.png', '1489564670', '1');
INSERT INTO `oj_link` VALUES ('69', '0', '菊花', 'Uploads/Admin/Link/2017-03-15/small_58c8f4ae991d6.jpg', 'Uploads/Admin/Link/2017-03-15/58c8f4ae991d6.jpg', '1489564846', '0');
INSERT INTO `oj_link` VALUES ('70', '0', 'v0.1.0', 'Uploads/Admin/Link/2017-03-20/small_58cec1a8d82b7.png', 'Uploads/Admin/Link/2017-03-20/58cec1a8d82b7.png', '1489945000', '1');

-- ----------------------------
-- Table structure for oj_notice
-- ----------------------------
DROP TABLE IF EXISTS `oj_notice`;
CREATE TABLE `oj_notice` (
  `nid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) NOT NULL COMMENT '公告标题',
  `content` text COMMENT '公告内容',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示 0不显示 1显示',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oj_notice
-- ----------------------------
INSERT INTO `oj_notice` VALUES ('1', '&lt;script&gt;&lt;script&gt;&lt;script&gt;&lt;script&gt;&lt;script哈哈哈哈哈哈ccccddddddddddddddddddddddd哈哈哈哈&lt;script&gt;&lt;script&gt;&lt;script&gt;&lt;script&gt;&lt;script哈哈哈哈哈哈ccccddddddddddddddddddddddd哈哈哈哈', null, '1488534666', '0');
INSERT INTO `oj_notice` VALUES ('2', '&lt;script&gt;&lt;script&gt;&lt;script&gt;&lt;script&gt;&lt;script哈哈哈哈哈哈ccccddddddddddddddddddddddd哈哈哈哈&lt;script&gt;&lt;script&gt;&lt;script&gt;&lt;script&gt;&lt;script哈哈哈哈哈哈ccccddddddddddddddddddddddd哈哈哈哈', null, '1488537956', '0');
INSERT INTO `oj_notice` VALUES ('3', '&lt;script&gt;&lt;script&gt;&lt;script&gt;&lt;script&gt;&lt;script哈哈哈哈哈哈ccccddddddddddddddddddddddd哈哈哈哈&lt;script&gt;&lt;script&gt;&lt;script&gt;&lt;script&gt;&lt;script哈哈哈哈哈哈ccccddddddddddddddddddddddd哈哈哈哈', '&lt;pre style=&quot;font-family: 宋体; font-size: 9.6pt; background-color: rgb(255, 255, 255);&quot;&gt;&amp;lt;script&amp;gt;&amp;lt;script&amp;gt;&amp;lt;script&amp;gt;&amp;lt;script&amp;gt;&amp;lt;script哈哈哈哈哈哈ccccddddddddddddddddddddddd哈哈哈哈&lt;/pre&gt;&lt;pre style=&quot;font-family: 宋体; font-size: 9.6pt; background-color: rgb(255, 255, 255);&quot;&gt;&amp;lt;script&amp;gt;&amp;lt;script&amp;gt;&amp;lt;script&amp;gt;&amp;lt;script&amp;gt;&amp;lt;script哈哈哈哈哈哈ccccddddddddddddddddddddddd哈哈哈哈&lt;/pre&gt;&lt;pre style=&quot;font-family: 宋体; font-size: 9.6pt; background-color: rgb(255, 255, 255);&quot;&gt;&amp;lt;script&amp;gt;&amp;lt;script&amp;gt;&amp;lt;script&amp;gt;&amp;lt;script&amp;gt;&amp;lt;script哈哈哈哈哈哈ccccddddddddddddddddddddddd哈哈哈哈&lt;/pre&gt;&lt;pre style=&quot;font-family: 宋体; font-size: 9.6pt; background-color: rgb(255, 255, 255);&quot;&gt;&amp;lt;script&amp;gt;&amp;lt;script&amp;gt;&amp;lt;script&amp;gt;&amp;lt;script&amp;gt;&amp;lt;script哈哈哈哈哈哈ccccddddddddddddddddddddddd哈哈哈哈&lt;/pre&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1488534895', '0');
INSERT INTO `oj_notice` VALUES ('4', '小红书', '&lt;p&gt;小红书小红书小红书&lt;/p&gt;', '1488615673', '0');
INSERT INTO `oj_notice` VALUES ('5', '小红书晒2015年成绩单：就是这么惹人眼红', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img src=&quot;/ueditor/php/upload/image/20170303/1488535497110002.jpg&quot; alt=&quot;小红书APP 小红书官网 小红书社区 社区电商&quot; border=&quot;0&quot; style=&quot;border: 0px; vertical-align: bottom;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;2月3日消息，在2015年结束不久，不少零售和品牌公司对过去一年进行了盘点与总结。亿邦动力网从社区电商小红书了解到，从2015年3月郑州仓正式运营到9月份，小红书半年时间销售额达到7亿。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;“小红书从2014年底正式开始做电商，目前做交易仅有一年时间，2015年销售额已经完成内部制定的目标。”小红书副总裁、电商业务负责人娄伊琳告诉亿邦动力网，小红书是个纯移动互联网公司，100%订单来自移动端，且客单价在200元以上。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img src=&quot;/ueditor/php/upload/image/20170303/1488535497807663.jpg&quot; alt=&quot;小红书APP 小红书官网 小红书社区 社区电商&quot; border=&quot;0&quot; style=&quot;border: 0px; vertical-align: bottom;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;图：小红书的品类包括护肤、彩妆、个护、保健品、食品、家居百货、家清、小家电、厨具和轻奢等&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;好看的业务数据离不开优秀的团队，娄伊琳对亿邦动力网透露，目前小红书有近300名员工。Google上海研发总经理、Google Adwords核心设计成员之一Tiger在2015年加入了小红书，负责带领小红书的技术团队。“Tiger2003年就加入Google，是Google前5位的华人工程师，负责广告系统核心技术和产品的开发，因其对Google广告系统的突出贡献，多次获得Google创始人奖。”&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;小红书联合创始人瞿芳曾在亿邦动力网举办的疯人会上分享，小红书在创业过程中最头痛的问题就是人跟不上公司的发展速度。“对于高管来说要不断学习，对于执行团队来说，要提前为下一步准备人才，不然临时抓人肯定会令速度慢下来。”&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;娄伊琳表示，在技术团队有谱之后，在小红书2016年的战略规划中，大数据运营是一件非做不可的事情。“小红书购物社区每天有3万多条新笔记，同时也积累了大量的用户行为数据，我们可以根据用户喜好去做个性化推荐，让她们在社区和福利社中更容易发现自己喜欢的商品。同时，希望可以做到不同用户打开小红书时看到的内容是不同的，实现千人千面的阅览效果。”&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;小红书在2015年迅速窜红，到底解决了用户什么痛点？亿邦动力网了解到，诞生于2013年的小红书，最初的身份是“购物攻略”，主要是瞄准的是爱好出境游和购物价值的女性用户，尤其是一二线城市的白领。到2014年12月，当单纯的攻略已无法满足用户的需求时，才正式上线了“福利社”开始向购物分享社区转型，让用户可以直接点击购买。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;创始人兼CEO毛文超在接受媒体采访时表示，小红书选择是UGC的内容生产模式，与其他社区相比最特别的一点是挖到了真实用户，社区内容来自于种子用户的真实分享。“中国年轻人的未来生活方式，不是几个人可以决定的，他们应该自己去说，向往什么样的生活。如果我拥有200个编辑，那我一定是失败的。”&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;资料显示，小红书是一家社区电商平台，目的是为下一代消费者找到全世界的好东西。多数用户是一线城市85后和90后，以学生、白领居多，其中女性占到大半。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;以下是亿邦动力网与娄伊琳的8问8答&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img src=&quot;/ueditor/php/upload/image/20170303/1488535498108745.jpg&quot; alt=&quot;小红书APP 小红书官网 小红书社区 社区电商&quot; border=&quot;0&quot; style=&quot;border: 0px; vertical-align: bottom;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;图：小红书副总裁娄伊琳&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;亿邦动力网：所在行业出现了什么新趋势？&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;娄伊琳：&lt;/strong&gt;2015年整个跨境电商行业还是蛮精彩的，受关注度也很高。不过回顾过去一年，我最想说的还是消费者的变化。随着85后和90后年轻一代成为了消费主力，越来越多的新中产加入了购买全世界好东西的行列中，他们对于好商品和好生活的追求，会让跨境电商至少在未来几年都在一个快速上升的通道。也很庆幸自己入了这行。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;亿邦动力网：在商业理念上，2015年最大收获是什么？&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;娄伊琳：&lt;/strong&gt;更深刻地理解了一切以用户为先，这真的不只是个口号。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;举个很小的例子，比如在选品上，如何确保提供真正的国外的好东西，而不只是毛利高的东西；在具体商品页的描述上，如何从用户的视角和体验出发，而不是冷冰冰的介绍。所有用心的地方用户都感受地到。小红书在过去一年的快速发展，包括在黑五大促中，登上苹果应用商店总榜第一，很大程度上也是得益于这点。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;亿邦动力网：2015年最痛的领悟是什么？&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;娄伊琳：&lt;/strong&gt;哈哈，可以说是创业真的好苦逼么，不过痛并快乐着。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;亿邦动力网：推荐一家欣赏的公司（除开自家公司）。&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;ins class=&quot;chinazads&quot; id=&quot;PAGE_AD_1104309&quot; data-ad-pdps=&quot;PDPS000000044086&quot; data-ad-status=&quot;async&quot; style=&quot;text-decoration: none;&quot;&gt;&lt;/ins&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;娄伊琳：&lt;/strong&gt;我觉得是亚马逊吧。虽然业界对贝佐斯本人的评价毁誉参半，不过对他优先考虑长期利益，专注甚至痴迷于用户体验的态度，我还是挺欣赏的。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;亿邦动力网：看衰哪种商业模式（或：自己绝对不做哪种生意）&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;娄伊琳：&lt;/strong&gt;应该是盲目烧钱的模式吧，小红书自己本身是不打价格战的。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;亿邦动力网：描绘一下自己心中未来零售的模样。&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;娄伊琳：&lt;/strong&gt;简单地说，从消费者的角度，全世界的好东西可以触手可及。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;亿邦动力网：推荐一本书以及理由。&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;娄伊琳：&lt;/strong&gt;推荐一本之前看过的《经营的原点》吧，是7-eleven日本创建者铃木敏文写的，读了这本书你会发现，其实零售的精髓是不变的，得彻底做好最基本的工作。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;亿邦动力网：为啥看或者不看亿邦。&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(37, 37, 37); line-height: 28px; text-indent: 2em; font-family: tahoma, arial, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;娄伊琳：&lt;/strong&gt;有时间会看，可以及时和全面地了解行业动态，一些观点性的文章对我也很有启发，让我们在低头做事的同时，也抬头看看路。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1488535524', '0');
INSERT INTO `oj_notice` VALUES ('6', 'PHPCon China 2016 第四届中国 PHP 开发者大会', '&lt;h4 class=&quot;name text-center&quot; style=&quot;box-sizing: border-box; font-family: inherit; -webkit-transform-origin-x: 0px; font-weight: 500; line-height: 1.1; color: inherit; margin-top: 10px; margin-bottom: 10px; font-size: 18px; padding-bottom: 20px;&quot;&gt;&lt;span class=&quot;glyphicon glyphicon-star&quot; aria-hidden=&quot;true&quot; style=&quot;box-sizing: border-box; font-family: &amp;#39;Glyphicons Halflings&amp;#39;; -webkit-transform-origin-x: 0px; position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased;&quot;&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; font-weight: 700;&quot;&gt;惠新宸 - 链家网, 技术副总裁&lt;/span&gt;&amp;nbsp;/&amp;nbsp;&lt;a href=&quot;http://weibo.com/laruence&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; color: rgb(51, 122, 183); text-decoration: none; background-color: transparent;&quot;&gt;@Laruence&lt;/a&gt;&lt;/h4&gt;&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20170303/1488535632991151.jpg&quot; class=&quot;speak_head center-block img-circle&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; border: 0px; vertical-align: middle; border-radius: 100px; display: block; margin-right: auto; margin-left: auto; margin-bottom: 20px; width: 200px; height: 200px;&quot;/&gt;&lt;/p&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;span class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-bottom: 20px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;p style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 1.75; text-indent: 2em;&quot;&gt;国内最有影响力的PHP技术专家， PHP开发组核心成员 , PECL开发者 , Zend公司外聘顾问, 是PHP 7的核心开发者，PHP5.4，5.5的 主要开发者。 作为PECL开发者贡献了Yaf (Yet another framework)，Yar(Yet another RPC framework) 以及Yac(Yet another Cache)、Taint等多个优秀开源作品，同时也是APC，Opcache ，Msgpack等项目的维护者。&lt;/p&gt;&lt;/span&gt;&lt;/blockquote&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;p class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;span class=&quot;label label-default&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; display: inline; padding: 0.2em 0.6em 0.3em; font-size: 15.75px; font-weight: bold; line-height: 1; color: rgb(255, 255, 255); vertical-align: baseline; border-radius: 0.25em; background-color: rgb(119, 119, 119);&quot;&gt;《PHP7高性能之源》&lt;/span&gt;&lt;/p&gt;&lt;/blockquote&gt;&lt;h4 class=&quot;name text-center&quot; style=&quot;box-sizing: border-box; font-family: inherit; -webkit-transform-origin-x: 0px; font-weight: 500; line-height: 1.1; color: inherit; margin-top: 10px; margin-bottom: 10px; font-size: 18px; padding-bottom: 20px;&quot;&gt;&lt;span class=&quot;glyphicon glyphicon-star&quot; aria-hidden=&quot;true&quot; style=&quot;box-sizing: border-box; font-family: &amp;#39;Glyphicons Halflings&amp;#39;; -webkit-transform-origin-x: 0px; position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased;&quot;&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; font-weight: 700;&quot;&gt;韩天峰 - 车轮互联总架构师&lt;/span&gt;&amp;nbsp;/&amp;nbsp;&lt;a href=&quot;http://weibo.com/hantianfeng&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; color: rgb(51, 122, 183); text-decoration: none; background-color: transparent;&quot;&gt;@韩天峰&lt;/a&gt;&lt;/h4&gt;&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20170303/1488535635788987.jpg&quot; class=&quot;speak_head center-block img-circle&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; border: 0px; vertical-align: middle; border-radius: 100px; display: block; margin-right: auto; margin-left: auto; margin-bottom: 20px; width: 200px; height: 200px;&quot;/&gt;&lt;/p&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;span class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-bottom: 20px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;p style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 1.75; text-indent: 2em;&quot;&gt;Swoole开源项目, 创始人，PHP官方PECL开发组成员，Swoole开源项目创始人，前腾讯朋友网、易迅网、淘宝网搜索的后台团队核心技术 骨干，虎牙游戏直播APP后台技术团队负责人。&lt;/p&gt;&lt;/span&gt;&lt;/blockquote&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;p class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;span class=&quot;label label-default&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; display: inline; padding: 0.2em 0.6em 0.3em; font-size: 15.75px; font-weight: bold; line-height: 1; color: rgb(255, 255, 255); vertical-align: baseline; border-radius: 0.25em; background-color: rgb(119, 119, 119);&quot;&gt;《PHP7+Swoole开发超高性能后台程序》&lt;/span&gt;&amp;nbsp;剖析公司基于swoole开发的MySQL中间件平台，sock5异步代理服务器，基于swoole 和redis的短网址Server，以及超高性能的统计服务器。并对比Nginx和go语言相关性能测试供参考。&lt;/p&gt;&lt;/blockquote&gt;&lt;h4 class=&quot;name text-center&quot; style=&quot;box-sizing: border-box; font-family: inherit; -webkit-transform-origin-x: 0px; font-weight: 500; line-height: 1.1; color: inherit; margin-top: 10px; margin-bottom: 10px; font-size: 18px; padding-bottom: 20px;&quot;&gt;&lt;span class=&quot;glyphicon glyphicon-star&quot; aria-hidden=&quot;true&quot; style=&quot;box-sizing: border-box; font-family: &amp;#39;Glyphicons Halflings&amp;#39;; -webkit-transform-origin-x: 0px; position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased;&quot;&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; font-weight: 700;&quot;&gt;信海龙 - 淘宝, 技术专家&lt;/span&gt;&amp;nbsp;/&amp;nbsp;&lt;a href=&quot;http://www.weibo.com/exinnet&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; color: rgb(51, 122, 183); text-decoration: none; background-color: transparent;&quot;&gt;@淘宝信海龙&lt;/a&gt;&lt;/h4&gt;&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20170303/1488535635316240.jpg&quot; class=&quot;speak_head center-block img-circle&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; border: 0px; vertical-align: middle; border-radius: 100px; display: block; margin-right: auto; margin-left: auto; margin-bottom: 20px; width: 200px; height: 200px;&quot;/&gt;&lt;/p&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;span class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-bottom: 20px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;p style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 1.75; text-indent: 2em;&quot;&gt;信海龙，花名沧龙，淘宝技术专家。已经有10年的互联网开发经验。2013年加入淘宝技术部，把工作中遇到的问题记录到博客 （&lt;a href=&quot;http://www.bo56.com/&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; color: rgb(51, 122, 183); text-decoration: none; background-color: transparent;&quot;&gt;www.bo56.com&lt;/a&gt;）。同时也是多个开源项目的开发者和维护者。代表开源作品，tclip， 基于人脸识别的图片裁剪扩展。&lt;/p&gt;&lt;/span&gt;&lt;/blockquote&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;p class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;span class=&quot;label label-default&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; display: inline; padding: 0.2em 0.6em 0.3em; font-size: 15.75px; font-weight: bold; line-height: 1; color: rgb(255, 255, 255); vertical-align: baseline; border-radius: 0.25em; background-color: rgb(119, 119, 119);&quot;&gt;《PHP系统问题排查实践》&lt;/span&gt;&lt;/p&gt;&lt;/blockquote&gt;&lt;h4 class=&quot;name text-center&quot; style=&quot;box-sizing: border-box; font-family: inherit; -webkit-transform-origin-x: 0px; font-weight: 500; line-height: 1.1; color: inherit; margin-top: 10px; margin-bottom: 10px; font-size: 18px; padding-bottom: 20px;&quot;&gt;&lt;span class=&quot;glyphicon glyphicon-star&quot; aria-hidden=&quot;true&quot; style=&quot;box-sizing: border-box; font-family: &amp;#39;Glyphicons Halflings&amp;#39;; -webkit-transform-origin-x: 0px; position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased;&quot;&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; font-weight: 700;&quot;&gt;胡波 - 新浪微博移动应用服务高级架构师&lt;/span&gt;&lt;/h4&gt;&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20170303/1488535636691047.jpg&quot; class=&quot;speak_head center-block img-circle&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; border: 0px; vertical-align: middle; border-radius: 100px; display: block; margin-right: auto; margin-left: auto; margin-bottom: 20px; width: 200px; height: 200px;&quot;/&gt;&lt;/p&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;span class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-bottom: 20px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;p style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 1.75; text-indent: 2em;&quot;&gt;先后经历了两次创业，摸爬滚打五六年。现在“痛改前非”，进入新浪微博,带团队负责客户端接口。互联网摸爬滚打12年的老码农，善于在产 品需求和技术规划之间寻找平衡点。&lt;/p&gt;&lt;/span&gt;&lt;/blockquote&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;p class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;span class=&quot;label label-default&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; display: inline; padding: 0.2em 0.6em 0.3em; font-size: 15.75px; font-weight: bold; line-height: 1; color: rgb(255, 255, 255); vertical-align: baseline; border-radius: 0.25em; background-color: rgb(119, 119, 119);&quot;&gt;《手机微博升级PHP7那些事儿》&lt;/span&gt;&lt;/p&gt;&lt;/blockquote&gt;&lt;h4 class=&quot;name text-center&quot; style=&quot;box-sizing: border-box; font-family: inherit; -webkit-transform-origin-x: 0px; font-weight: 500; line-height: 1.1; color: inherit; margin-top: 10px; margin-bottom: 10px; font-size: 18px; padding-bottom: 20px;&quot;&gt;&lt;span class=&quot;glyphicon glyphicon-star&quot; aria-hidden=&quot;true&quot; style=&quot;box-sizing: border-box; font-family: &amp;#39;Glyphicons Halflings&amp;#39;; -webkit-transform-origin-x: 0px; position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased;&quot;&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; font-weight: 700;&quot;&gt;张凌 - 阅文集团起点中文网技术负责人&lt;/span&gt;&lt;/h4&gt;&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20170303/1488535636872383.jpg&quot; class=&quot;speak_head center-block img-circle&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; border: 0px; vertical-align: middle; border-radius: 100px; display: block; margin-right: auto; margin-left: auto; margin-bottom: 20px; width: 200px; height: 200px;&quot;/&gt;&lt;/p&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;span class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-bottom: 20px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;p style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 1.75; text-indent: 2em;&quot;&gt;张凌（瓦力），前腾讯企业QQ的技术核心、QQ公众号Web团队负责人。Swoole官方开发组成员，TSF开发组核心成员。阅文集团成立后，担 任起点中文网的全新改版技术负责人，用“起点中文网”大型项目的改造迁移来作为PHP+Swoole+TSF的协程框架的最佳实践。建立了起点首 页和各类分类频道页等门户网站模型、网文介绍页和阅读页等业务开发模型、底层SOA服务化模型，实现亿级用户的高性能的稳定服务。&lt;/p&gt;&lt;/span&gt;&lt;/blockquote&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;p class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;span class=&quot;label label-default&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; display: inline; padding: 0.2em 0.6em 0.3em; font-size: 15.75px; font-weight: bold; line-height: 1; color: rgb(255, 255, 255); vertical-align: baseline; border-radius: 0.25em; background-color: rgb(119, 119, 119);&quot;&gt;《PHP+TSF在起点中文网全新改版中的协程之路》&lt;/span&gt;&lt;/p&gt;&lt;/blockquote&gt;&lt;h4 class=&quot;name text-center&quot; style=&quot;box-sizing: border-box; font-family: inherit; -webkit-transform-origin-x: 0px; font-weight: 500; line-height: 1.1; color: inherit; margin-top: 10px; margin-bottom: 10px; font-size: 18px; padding-bottom: 20px;&quot;&gt;&lt;span class=&quot;glyphicon glyphicon-star&quot; aria-hidden=&quot;true&quot; style=&quot;box-sizing: border-box; font-family: &amp;#39;Glyphicons Halflings&amp;#39;; -webkit-transform-origin-x: 0px; position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased;&quot;&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; font-weight: 700;&quot;&gt;代维&lt;/span&gt;&lt;/h4&gt;&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20170303/1488535637127675.jpg&quot; class=&quot;speak_head center-block img-circle&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; border: 0px; vertical-align: middle; border-radius: 100px; display: block; margin-right: auto; margin-left: auto; margin-bottom: 20px; width: 200px; height: 200px;&quot;/&gt;&lt;/p&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;span class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-bottom: 20px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;p style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 1.75; text-indent: 2em;&quot;&gt;代维，花名蚩尤，江湖人称“大门”，PHP官方PECL开发组成员。Yac(Yet another Cache) Windows版本开发者，作为PECL开发者贡献了很多常用扩展的PHP7支持，如：memcache、redis等。曾就职于淘宝，蘑菇街。现就职于有赞，负责有赞大规模使用下的PHP架构和PHP服务化。&lt;/p&gt;&lt;/span&gt;&lt;/blockquote&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;p class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;span class=&quot;label label-default&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; display: inline; padding: 0.2em 0.6em 0.3em; font-size: 15.75px; font-weight: bold; line-height: 1; color: rgb(255, 255, 255); vertical-align: baseline; border-radius: 0.25em; background-color: rgb(119, 119, 119);&quot;&gt;《百万并发下PHP协程+异步非阻塞框架设计实践》&lt;/span&gt;&lt;/p&gt;&lt;/blockquote&gt;&lt;h4 class=&quot;name text-center&quot; style=&quot;box-sizing: border-box; font-family: inherit; -webkit-transform-origin-x: 0px; font-weight: 500; line-height: 1.1; color: inherit; margin-top: 10px; margin-bottom: 10px; font-size: 18px; padding-bottom: 20px;&quot;&gt;&lt;span class=&quot;glyphicon glyphicon-star&quot; aria-hidden=&quot;true&quot; style=&quot;box-sizing: border-box; font-family: &amp;#39;Glyphicons Halflings&amp;#39;; -webkit-transform-origin-x: 0px; position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased;&quot;&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; font-weight: 700;&quot;&gt;付超群&lt;/span&gt;&lt;/h4&gt;&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20170303/1488535638500416.jpg&quot; class=&quot;speak_head center-block img-circle&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; border: 0px; vertical-align: middle; border-radius: 100px; display: block; margin-right: auto; margin-left: auto; margin-bottom: 20px; width: 200px; height: 200px;&quot;/&gt;&lt;/p&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;span class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-bottom: 20px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;p style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 1.75; text-indent: 2em;&quot;&gt;ColaPHP作者，原腾讯财经技术负责人，先后负责过腾讯自选股、股票行情系统、全腾讯网天气数据等海量服务系统，积累了一些大访问项目开发经验，现在负责看盘宝后台系统(PHP)。&lt;/p&gt;&lt;/span&gt;&lt;/blockquote&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;p class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;span class=&quot;label label-default&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; display: inline; padding: 0.2em 0.6em 0.3em; font-size: 15.75px; font-weight: bold; line-height: 1; color: rgb(255, 255, 255); vertical-align: baseline; border-radius: 0.25em; background-color: rgb(119, 119, 119);&quot;&gt;《PHP在金融股票项目中的应用》&lt;/span&gt;&lt;/p&gt;&lt;/blockquote&gt;&lt;h4 class=&quot;name text-center&quot; style=&quot;box-sizing: border-box; font-family: inherit; -webkit-transform-origin-x: 0px; font-weight: 500; line-height: 1.1; color: inherit; margin-top: 10px; margin-bottom: 10px; font-size: 18px; padding-bottom: 20px;&quot;&gt;&lt;span class=&quot;glyphicon glyphicon-star&quot; aria-hidden=&quot;true&quot; style=&quot;box-sizing: border-box; font-family: &amp;#39;Glyphicons Halflings&amp;#39;; -webkit-transform-origin-x: 0px; position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased;&quot;&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; font-weight: 700;&quot;&gt;姜承尧&lt;/span&gt;&lt;/h4&gt;&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20170303/1488535638817388.jpg&quot; class=&quot;speak_head center-block img-circle&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; border: 0px; vertical-align: middle; border-radius: 100px; display: block; margin-right: auto; margin-left: auto; margin-bottom: 20px; width: 200px; height: 200px;&quot;/&gt;&lt;/p&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;span class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-bottom: 20px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;p style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 1.75; text-indent: 2em;&quot;&gt;姜承尧，网易工程师， IMG社区创始人，Oracle MySQL ACE。著有《MySQL内核》、《MySQL技术内幕》系列书籍。自媒体账号InsideMySQL深受广大IT技术人员的喜欢。&lt;/p&gt;&lt;/span&gt;&lt;/blockquote&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;p class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;span class=&quot;label label-default&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; display: inline; padding: 0.2em 0.6em 0.3em; font-size: 15.75px; font-weight: bold; line-height: 1; color: rgb(255, 255, 255); vertical-align: baseline; border-radius: 0.25em; background-color: rgb(119, 119, 119);&quot;&gt;《MySQL死锁与经典案例分析》&lt;/span&gt;&lt;/p&gt;&lt;/blockquote&gt;&lt;h4 class=&quot;name text-center&quot; style=&quot;box-sizing: border-box; font-family: inherit; -webkit-transform-origin-x: 0px; font-weight: 500; line-height: 1.1; color: inherit; margin-top: 10px; margin-bottom: 10px; font-size: 18px; padding-bottom: 20px;&quot;&gt;&lt;span class=&quot;glyphicon glyphicon-star&quot; aria-hidden=&quot;true&quot; style=&quot;box-sizing: border-box; font-family: &amp;#39;Glyphicons Halflings&amp;#39;; -webkit-transform-origin-x: 0px; position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased;&quot;&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; font-weight: 700;&quot;&gt;卜赫&lt;/span&gt;&lt;/h4&gt;&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20170303/1488535639566341.jpg&quot; class=&quot;speak_head center-block img-circle&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; border: 0px; vertical-align: middle; border-radius: 100px; display: block; margin-right: auto; margin-left: auto; margin-bottom: 20px; width: 200px; height: 200px;&quot;/&gt;&lt;/p&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;span class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-bottom: 20px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;p style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 1.75; text-indent: 2em;&quot;&gt;卜赫，先后供职于MaxLeap, 七牛云等云计算公司，历任大数据部技术总监，技术布道师等职位，积累了云计算平台的一线开发运维经验。对实时数据分析，海量数据存储有比较深入的理解，同时也对React 和 React Native有些研究，参与开源社区活动。现在七牛主要负责技术布道工作。本次演讲的Topic是：介绍一个云计算公司的架构探险，从支持一个App的单体架构，一步步演进成一个BaaS平台，提供了全产品线的支持，最后探讨了之后的架构走向。&lt;/p&gt;&lt;/span&gt;&lt;/blockquote&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;p class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;span class=&quot;label label-default&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; display: inline; padding: 0.2em 0.6em 0.3em; font-size: 15.75px; font-weight: bold; line-height: 1; color: rgb(255, 255, 255); vertical-align: baseline; border-radius: 0.25em; background-color: rgb(119, 119, 119);&quot;&gt;《从支持一个APP的后端到BaaS平台的探险》&lt;/span&gt;&amp;nbsp;探讨如下方面的内容：支持一个APP的Backend；支持一个APP的数据分析；支持内部所有APP的Backend；服务化，容器化的BaaS；全功能的数据分析平台，微服务，DCOS在未来。&lt;/p&gt;&lt;/blockquote&gt;&lt;h4 class=&quot;name text-center&quot; style=&quot;box-sizing: border-box; font-family: inherit; -webkit-transform-origin-x: 0px; font-weight: 500; line-height: 1.1; color: inherit; margin-top: 10px; margin-bottom: 10px; font-size: 18px; padding-bottom: 20px;&quot;&gt;&lt;span class=&quot;glyphicon glyphicon-star&quot; aria-hidden=&quot;true&quot; style=&quot;box-sizing: border-box; font-family: &amp;#39;Glyphicons Halflings&amp;#39;; -webkit-transform-origin-x: 0px; position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased;&quot;&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; font-weight: 700;&quot;&gt;徐汉彬&lt;/span&gt;&lt;/h4&gt;&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20170303/1488535640953541.jpg&quot; class=&quot;speak_head center-block img-circle&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; border: 0px; vertical-align: middle; border-radius: 100px; display: block; margin-right: auto; margin-left: auto; margin-bottom: 20px; width: 200px; height: 200px;&quot;/&gt;&lt;/p&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;span class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-bottom: 20px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;p style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 1.75; text-indent: 2em;&quot;&gt;徐汉彬，现任腾讯高级工程师（SNG增值产品部），会员体系合作线技术团队负责人，AMS活动运营平台负责人。同时也是AMS的初始开发人员，将AMS从CGI日请求量百万级升级至亿级（3-5亿），高峰期日请求达到8亿。主要负责QQ会员生活特权、AMS运营平台的架构设计和研发建设，在Web系统设计和架构方面有多年的技术积累和实践。曾就职于阿里巴巴、小满科技。&lt;/p&gt;&lt;/span&gt;&lt;/blockquote&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;p class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;span class=&quot;label label-default&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; display: inline; padding: 0.2em 0.6em 0.3em; font-size: 15.75px; font-weight: bold; line-height: 1; color: rgb(255, 255, 255); vertical-align: baseline; border-radius: 0.25em; background-color: rgb(119, 119, 119);&quot;&gt;《QQ会员活动平台的PHP7升级实践》&lt;/span&gt;&amp;nbsp;2016年4月下旬，我们成功地将我们的AMS平台升级到PHP7，性能获得可观的提升。&lt;/p&gt;&lt;/blockquote&gt;&lt;h4 class=&quot;name text-center&quot; style=&quot;box-sizing: border-box; font-family: inherit; -webkit-transform-origin-x: 0px; font-weight: 500; line-height: 1.1; color: inherit; margin-top: 10px; margin-bottom: 10px; font-size: 18px; padding-bottom: 20px;&quot;&gt;&lt;span class=&quot;glyphicon glyphicon-star&quot; aria-hidden=&quot;true&quot; style=&quot;box-sizing: border-box; font-family: &amp;#39;Glyphicons Halflings&amp;#39;; -webkit-transform-origin-x: 0px; position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased;&quot;&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; font-weight: 700;&quot;&gt;范圣佑 - 得宽科技研究员 / Laravel 道场 传教士&lt;/span&gt;&lt;/h4&gt;&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20170303/1488535644321060.jpg&quot; class=&quot;speak_head center-block img-circle&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; border: 0px; vertical-align: middle; border-radius: 100px; display: block; margin-right: auto; margin-left: auto; margin-bottom: 20px; width: 200px; height: 200px;&quot;/&gt;&lt;/p&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;span class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-bottom: 20px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;p style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 1.75; text-indent: 2em;&quot;&gt;来自台湾台北，目前担任得宽科技研究员、Laravel 传教士 。在历览了众语言及框架后，最终爱上 Laravel 开发流程的优雅与简洁。于 Facebook 上成立 Laravel 台湾，每月固定举办三场 PHP/Laravel 社群活动，并开发数项与 Laravel 开发相关的懒人包及指令列工具，从此踏上框架推广及导入之路。同时成立 Laravel 道场学习资源网站，除了提供学习资源外，也与学校及企业内部合办多项教育训练。&lt;/p&gt;&lt;/span&gt;&lt;/blockquote&gt;&lt;blockquote style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; padding: 10px 20px; margin: 0px 0px 20px; font-size: 17.5px; border-left-width: 5px; border-left-style: solid; border-left-color: rgb(238, 238, 238);&quot;&gt;&lt;p class=&quot;lead&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 20px; font-size: 21px; line-height: 1.4;&quot;&gt;&lt;span class=&quot;label label-default&quot; style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; display: inline; padding: 0.2em 0.6em 0.3em; font-size: 15.75px; font-weight: bold; line-height: 1; color: rgb(255, 255, 255); vertical-align: baseline; border-radius: 0.25em; background-color: rgb(119, 119, 119);&quot;&gt;《从学徒变大师：谈 Laravel 框架扩充与套件开发》&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 10px; font-size: 16px; line-height: 1.75; text-indent: 2em;&quot;&gt;许多团队对导入框架犹豫不决的原因，大多是因为刻板印象觉得框架在扩充上没有弹性，或是掌握不到将现有实作整合至框架内的技巧。因此，在这场分享里，将从依赖注入这个基本概念开始谈起，逐步深入至 Laravel 的 IoC 容器、Service Provider 等机制，并搭配以简讯寄送当范例，示范如何整合现有类别，并扩充 Laravel 原有架构。最后，再将这些扩充实作成可供 Laravel 独立安装的套件做为结尾。期能透过这一连串的脉络，让开发人员更了解 Laravel 的核心运作，提高对 Laravel 的掌握度及导入信心。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; -webkit-transform-origin-x: 0px; margin-top: 0px; margin-bottom: 0px; font-size: 16px; line-height: 1.75;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;/blockquote&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1488535682', '0');
INSERT INTO `oj_notice` VALUES ('8', '', null, '1488615535', '0');
INSERT INTO `oj_notice` VALUES ('9', '', null, '1488615688', '0');
INSERT INTO `oj_notice` VALUES ('13', '', null, '1488616127', '0');
INSERT INTO `oj_notice` VALUES ('15', '', null, '1488616343', '0');
INSERT INTO `oj_notice` VALUES ('22', '习近平出席某某峰会', '&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/e/ee/ee8a59f0c89049f55566d8c20255a1cc.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;section style=&quot;color: rgb(64, 64, 64); font-family: &amp;#39;Microsoft Yahei&amp;#39;; font-size: 18px; line-height: 32px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;p style=&quot;margin-top: 26px; margin-bottom: 26px; padding: 0px; font-size: 16px; text-indent: 2em;&quot;&gt;&lt;strong&gt;【学习进行时】&lt;/strong&gt;&lt;/p&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;p style=&quot;margin-top: 26px; margin-bottom: 26px; padding: 0px; font-size: 16px; text-indent: 2em;&quot;&gt;3月5日，&lt;span style=&quot;background-color: rgb(255, 0, 0);&quot;&gt;十二届全国人大五次会议开幕&lt;/span&gt;。新华社《习近&lt;span style=&quot;color: rgb(192, 0, 0);&quot;&gt;平的两会时间》用独家图文，为你呈现全国人大代&lt;/span&gt;表习近平的这一天。&lt;/p&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;p&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;3月5日&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;a href=&quot;http://www.baidu.com&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;text-align: justify; text-indent: 36px;&quot;&gt;十二届全国人大五次会议大幕开启&lt;/span&gt;&lt;/a&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/2/2a/2a26f5e491ffe5c5b25d50002133e261.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;一大早&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;天安门广场红旗猎猎&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/f/f9/f9667638b4e4dc0f2bb7bccf6b04e89f.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;代表们看起来精神不错&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/9/93/9325f4d1b26d0f43f6f0110f145cdba1.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;中外媒体记者也架起了“长枪短炮”&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/9/9f/9f228d4f28b87726d3f856e02d9bddc0.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;军乐团奏起欢迎进行曲&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/5/55/55272a89cbc5eae20eef5bb1d396f22c.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;习近平等中央领导同志&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;健步走上主席台&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/d/de/de22c3f67d286caf6b9208a6a2deff88.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;9点，大会开幕&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/8/81/810bef61b8756ab41a08e3b4cd4e8a59.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/8/8b/8bdd608866e477e37ddb301a7ce0ee57.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;全场高唱国歌&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/2/21/21df0ad9e7d7a72e711533f4605ebe11.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;大家一起听取政府工作报告&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/a/a1/a1ab9b2b88d822a4e78f590ee7a73991.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;过去一年，我国发展面临国内外诸多矛盾叠加、风险隐患交汇的严峻挑战&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;在以习近平同志为核心的党中央坚强领导下，全国各族人民迎难而上，砥砺前行，推动经济社会持续健康发展&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/f/fe/feba69dd66191b0c25a77e5baf3208f5.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;外国使节们也来了&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;他们对中国取得的成绩表示赞赏&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;关注着习近平领导下的中国&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;新的一年如何奋勇前行&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/4/44/4495278d2fe9b998eccf76ff38b52f79.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;下午，人民大会堂上海厅&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;代表们翘首以盼&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/1/1a/1ab670a91bc7d6fa106948ec8299c120.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;掌声响起&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/8/87/870e970b69222c60c2fa35bfa22ed586.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;习近平总书记来了&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;习近平是上海代表团的全国人大代表&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;每年3月5日&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;他都到上海团参加审议&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/b/b6/b6a04e3710cc1854dcd8539d49079906.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/d/df/dfccdd82ed65cfae52674b4d3c8cad05.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;七位代表先后发言&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;谈到了上海发展、发挥科研人员创新活力、加强海洋人才培养、推进财税体制改革、深化教育改革等问题&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/1/1f/1f1c161fc2b84f15eb6310179fc3b7ef.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/c/c7/c7d2c480f163d8f14258cd0e0a127434.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;习近平边听边记&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;同大家深入讨论&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/7/78/78ff83d840d4c1fb115f033ac4604eaa.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;上海社科院副院长张兆安代表说&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;来北京之前，他到崇明岛去了3次&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;就是要把当地干部群众的意见和建议&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;带到会上来&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;2007年在上海工作时&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;习近平到崇明岛考察过&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;转眼已十年&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;张兆安对总书记说&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;“崇明百姓希望您再到崇明岛考察”&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/5/5f/5f1ee5b12668e63049d3de2bdc9999be.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;孙跃明代表是上海奉贤区南桥镇杨王村党委书记&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;他告诉总书记，村里特别重视文化建设&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;以家训带家风，以家风树村风，以村风扬民风&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;习近平说，这也是“奉贤”的含义吧？&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/6/61/617702e1edefae983b5e44b9a3269dd9.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;section style=&quot;color: rgb(64, 64, 64); font-family: &amp;#39;Microsoft Yahei&amp;#39;; font-size: 18px; line-height: 32px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;在谈到上海发展时，习近平说&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;走出一条符合超大城市特点和规律的社会治理新路子，是关系上海发展的大问题。城市管理应该像绣花一样精细。城市精细化管理，必须适应城市发展。要持续用力、不断深化，提升社会治理能力，增强社会发展活力。&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;p&gt;&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/c/c1/c14be678ca84be5de5eac376587fb845.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;section style=&quot;color: rgb(64, 64, 64); font-family: &amp;#39;Microsoft Yahei&amp;#39;; font-size: 18px; line-height: 32px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;总书记希望上海的同志们&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;section&gt;&lt;p style=&quot;margin-top: 26px; margin-bottom: 26px; padding: 0px; font-size: 16px; text-indent: 2em;&quot;&gt;继续按照当好全国改革开放排头兵、创新发展先行者的要求&lt;/p&gt;&lt;p style=&quot;margin-top: 26px; margin-bottom: 26px; padding: 0px; font-size: 16px; text-indent: 2em;&quot;&gt;在深化自由贸易试验区改革上有新作为&lt;/p&gt;&lt;p style=&quot;margin-top: 26px; margin-bottom: 26px; padding: 0px; font-size: 16px; text-indent: 2em;&quot;&gt;在推进科技创新中心建设上有新作为&lt;/p&gt;&lt;p style=&quot;margin-top: 26px; margin-bottom: 26px; padding: 0px; font-size: 16px; text-indent: 2em;&quot;&gt;在推进社会治理创新上有新作为&lt;/p&gt;&lt;p style=&quot;margin-top: 26px; margin-bottom: 26px; padding: 0px; font-size: 16px; text-indent: 2em;&quot;&gt;在全面从严治党上有新作为&lt;/p&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 26px; margin-bottom: 26px; padding: 0px; font-size: 16px; text-align: center;&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/2/2b/2bd7d5dbc119ec3976bcf9b6076a0192.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;/section&gt;&lt;p&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;总书记对上海寄予厚望&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;代表们认真听、认真记、认真思考&lt;/p&gt;&lt;p class=&quot;f_center&quot; style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;img alt=&quot;习近平的两会时间 独家图文记录习近平代表的一天&quot; src=&quot;http://cms-bucket.nosdn.127.net/catchpic/f/f0/f09c7889332b81eb058a114de89754fc.jpg?imageView&amp;thumbnail=550x0&quot; style=&quot;vertical-align: top; border: 0px; margin: 0px auto; display: block;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;审议结束时&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;习近平又来到代表们中间&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;同大家握手、交谈&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;复旦大学脑科学研究院院长马兰代表&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;向总书记汇报了脑科学领域研究进展&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;她说：我们已经撸起了袖子&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;大家会心地笑了，总书记也笑了&lt;/p&gt;&lt;p style=&quot;margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &amp;#39;Microsoft Yahei&amp;#39;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;……&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1488794961', '0');
INSERT INTO `oj_notice` VALUES ('23', '温总理', '&lt;p&gt;&lt;a href=&quot;http://www.baidu.com&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;温总理温总理温总理温总理&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;', '1488795061', '0');

-- ----------------------------
-- Table structure for oj_plugin
-- ----------------------------
DROP TABLE IF EXISTS `oj_plugin`;
CREATE TABLE `oj_plugin` (
  `code` varchar(13) DEFAULT NULL COMMENT '插件编码',
  `name` varchar(55) DEFAULT NULL COMMENT '中文名字',
  `version` varchar(255) DEFAULT NULL COMMENT '插件的版本',
  `author` varchar(30) DEFAULT NULL COMMENT '插件作者',
  `config` text COMMENT '配置信息',
  `config_value` text COMMENT '配置值信息',
  `desc` varchar(255) DEFAULT NULL COMMENT '插件描述',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否启用',
  `type` varchar(50) DEFAULT NULL COMMENT '插件类型 payment支付 login 登陆 shipping物流',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `bank_code` text COMMENT '网银配置信息',
  `scene` tinyint(1) DEFAULT '0' COMMENT '使用场景 0 PC+手机 1 手机 2 PC'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oj_plugin
-- ----------------------------
INSERT INTO `oj_plugin` VALUES ('weixin', '微信登陆', '1.0', '彭老师', 'a:2:{i:0;a:4:{s:4:\"name\";s:5:\"appid\";s:5:\"label\";s:17:\"开放平台appid\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:6:\"secret\";s:5:\"label\";s:18:\"开放平台secret\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}', 'a:2:{s:5:\"appid\";s:18:\"wx196b144decec8c69\";s:6:\"secret\";s:32:\"d0e4dd437abe3c94dd9a82c509123b73\";}', '微信登陆插件 ', '1', 'login', 'logo.jpg', 'N;', '0');
INSERT INTO `oj_plugin` VALUES ('qq', 'QQ登陆', '1.0', '彭老师', 'a:2:{i:0;a:4:{s:4:\"name\";s:6:\"app_id\";s:5:\"label\";s:6:\"app_id\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:10:\"app_secret\";s:5:\"label\";s:10:\"app_secret\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}', 'a:2:{s:6:\"app_id\";s:9:\"101386196\";s:10:\"app_secret\";s:32:\"2cff4ab04e5dce2b5b66bd2d94f28f95\";}', 'QQ登陆插件 ', '1', 'login', 'logo.jpg', 'N;', '0');
INSERT INTO `oj_plugin` VALUES ('mina', '微信小程序', '1.0', 'maleic', null, 'a:2:{s:6:\"app_id\";s:18:\"wxaed8d8fb8a10a99a\";s:10:\"app_secret\";s:32:\"cb3b9decc9a35bcaa5b5bd97351ceaef\";}', '小程序', '1', 'mina', 'logo.jpg', 'N;', '0');
INSERT INTO `oj_plugin` VALUES ('weixinmp', '微信登陆', '1.0', '彭老师', 'a:2:{i:0;a:4:{s:4:\"name\";s:5:\"appid\";s:5:\"label\";s:17:\"开放平台appid\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:6:\"secret\";s:5:\"label\";s:18:\"开放平台secret\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}', 'a:2:{s:5:\"appid\";s:18:\"wx5c0c4def22779391\";s:9:\"appsecret\";s:32:\"4cc82f0054ce7b9170f72ca7ffc5dcd7\";}', '微信登陆插件 ', '1', 'login', 'logo.jpg', 'N;', '0');

-- ----------------------------
-- Table structure for oj_project
-- ----------------------------
DROP TABLE IF EXISTS `oj_project`;
CREATE TABLE `oj_project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `rid` int(11) unsigned NOT NULL COMMENT '简历id',
  `name` varchar(30) NOT NULL COMMENT '项目名称',
  `job` varchar(30) NOT NULL COMMENT '职务',
  `begin_yeartime` varchar(20) NOT NULL COMMENT '开始年份',
  `begin_monthtime` varchar(20) NOT NULL COMMENT '开始月份',
  `end_yeartime` varchar(20) NOT NULL COMMENT '结束年份',
  `end_monthtime` varchar(20) NOT NULL COMMENT '结束月份',
  `description` text NOT NULL COMMENT '项目介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='项目经验表';

-- ----------------------------
-- Records of oj_project
-- ----------------------------
INSERT INTO `oj_project` VALUES ('1', '2', '无', '无', '2014', '01', '至今', '至今', '呜呜呜呜');
INSERT INTO `oj_project` VALUES ('2', '1', '拉勾网', '开发工程师', '2014', '01', '至今', '至今', '呜呜呜呜呜呜');

-- ----------------------------
-- Table structure for oj_school
-- ----------------------------
DROP TABLE IF EXISTS `oj_school`;
CREATE TABLE `oj_school` (
  `sid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '学校id',
  `name` varchar(50) NOT NULL COMMENT '学校名称',
  `phonetic_name` varchar(50) NOT NULL COMMENT '学校拼音名',
  `level` tinyint(4) NOT NULL COMMENT '学校层次 1本科2专科',
  `area_id` smallint(5) NOT NULL COMMENT '学校所在地id',
  PRIMARY KEY (`sid`),
  KEY `phonetic_name` (`phonetic_name`) COMMENT '拼音索引',
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2596 DEFAULT CHARSET=utf8 COMMENT='学校表';

-- ----------------------------
-- Records of oj_school
-- ----------------------------
INSERT INTO `oj_school` VALUES ('1', '北京大学', 'beijingdaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('2', '中国人民大学', 'zhongguorenmindaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('3', '清华大学', 'qinghuadaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('4', '北京交通大学', 'beijingjiaotongdaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('5', '北京工业大学', 'beijinggongyedaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('6', '北京航空航天大学', 'beijinghangkonghangtiandaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('7', '北京理工大学', 'beijingligongdaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('8', '北京科技大学', 'beijingkejidaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('9', '北方工业大学', 'beifanggongyedaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('10', '北京化工大学', 'beijinghuagongdaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('11', '北京工商大学', 'beijinggongshangdaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('12', '北京服装学院', 'beijingfuzhuangxueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('13', '北京邮电大学', 'beijingyoudiandaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('14', '北京印刷学院', 'beijingyinshuaxueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('15', '北京建筑大学', 'beijingjianzhudaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('16', '北京石油化工学院', 'beijingshiyouhuagongxueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('17', '北京电子科技学院', 'beijingdianzikejixueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('18', '中国农业大学', 'zhongguonongyedaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('19', '北京农学院', 'beijingnongxueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('20', '北京林业大学', 'beijinglinyedaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('21', '北京协和医学院', 'beijingxieheyixueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('22', '首都医科大学', 'shouduyikedaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('23', '北京中医药大学', 'beijingzhongyiyaodaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('24', '北京师范大学', 'beijingshifandaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('25', '首都师范大学', 'shoudushifandaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('26', '首都体育学院', 'shoudutiyuxueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('27', '北京外国语大学', 'beijingwaiguoyudaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('28', '北京第二外国语学院', 'beijingdierwaiguoyuxueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('29', '北京语言大学', 'beijingyuyandaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('30', '中国传媒大学', 'zhongguochuanmeidaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('31', '中央财经大学', 'zhongyangcaijingdaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('32', '对外经济贸易大学', 'duiwaijingjimaoyidaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('33', '北京物资学院', 'beijingwuzixueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('34', '首都经济贸易大学', 'shoudujingjimaoyidaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('35', '外交学院', 'waijiaoxueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('36', '中国人民公安大学', 'zhongguorenmingongandaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('37', '国际关系学院', 'guojiguanxixueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('38', '北京体育大学', 'beijingtiyudaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('39', '中央音乐学院', 'zhongyangyinlexueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('40', '中国音乐学院', 'zhongguoyinlexueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('41', '中央美术学院', 'zhongyangmeishuxueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('42', '中央戏剧学院', 'zhongyangxijuxueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('43', '中国戏曲学院', 'zhongguoxiquxueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('44', '北京电影学院', 'beijingdianyingxueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('45', '北京舞蹈学院', 'beijingwudaoxueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('46', '中央民族大学', 'zhongyangminzudaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('47', '中国政法大学', 'zhongguozhengfadaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('48', '华北电力大学', 'huabeidianlidaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('49', '中华女子学院', 'zhonghuanvzixueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('50', '北京信息科技大学', 'beijingxinxikejidaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('51', '中国矿业大学（北京）', 'zhongguokuangyedaxuebeijing', '1', '1');
INSERT INTO `oj_school` VALUES ('52', '中国石油大学（北京）', 'zhongguoshiyoudaxuebeijing', '1', '1');
INSERT INTO `oj_school` VALUES ('53', '中国地质大学（北京）', 'zhongguodizhidaxuebeijing', '1', '1');
INSERT INTO `oj_school` VALUES ('54', '北京联合大学', 'beijinglianhedaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('55', '北京城市学院', 'beijingchengshixueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('56', '中国青年政治学院', 'zhongguoqingnianzhengzhixueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('57', '首钢工学院', 'shouganggongxueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('58', '中国劳动关系学院', 'zhongguolaodongguanxixueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('59', '北京吉利学院', 'beijingjilixueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('60', '首都师范大学科德学院', 'shoudushifandaxuekedexueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('61', '北京工商大学嘉华学院', 'beijinggongshangdaxuejiahuaxueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('62', '北京邮电大学世纪学院', 'beijingyoudiandaxueshijixueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('63', '北京工业大学耿丹学院', 'beijinggongyedaxuegengdanxueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('64', '北京警察学院', 'beijingjingchaxueyuan', '1', '1');
INSERT INTO `oj_school` VALUES ('65', '北京第二外国语学院中瑞酒店管理学院', 'beijingdierwaiguoyuxueyuanzhongruijiudianguanlixue', '1', '1');
INSERT INTO `oj_school` VALUES ('66', '中国科学院大学', 'zhongguokexueyuandaxue', '1', '1');
INSERT INTO `oj_school` VALUES ('67', '北京工业职业技术学院', 'beijinggongyezhiyejishuxueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('68', '北京信息职业技术学院', 'beijingxinxizhiyejishuxueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('69', '北京电子科技职业学院', 'beijingdianzikejizhiyexueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('70', '北京京北职业技术学院', 'beijingjingbeizhiyejishuxueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('71', '北京交通职业技术学院', 'beijingjiaotongzhiyejishuxueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('72', '北京青年政治学院', 'beijingqingnianzhengzhixueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('73', '北京农业职业学院', 'beijingnongyezhiyexueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('74', '北京政法职业学院', 'beijingzhengfazhiyexueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('75', '北京财贸职业学院', 'beijingcaimaozhiyexueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('76', '北京北大方正软件职业技术学院', 'beijingbeidafangzhengruanjianzhiyejishuxueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('77', '北京经贸职业学院', 'beijingjingmaozhiyexueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('78', '北京经济技术职业学院', 'beijingjingjijishuzhiyexueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('79', '北京戏曲艺术职业学院', 'beijingxiquyishuzhiyexueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('80', '北京汇佳职业学院', 'beijinghuijiazhiyexueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('81', '北京科技经营管理学院', 'beijingkejijingyingguanlixueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('82', '北京科技职业学院', 'beijingkejizhiyexueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('83', '北京培黎职业学院', 'beijingpeilizhiyexueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('84', '北京经济管理职业学院', 'beijingjingjiguanlizhiyexueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('85', '北京劳动保障职业学院', 'beijinglaodongbaozhangzhiyexueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('86', '北京社会管理职业学院', 'beijingshehuiguanlizhiyexueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('87', '北京艺术传媒职业学院', 'beijingyishuchuanmeizhiyexueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('88', '北京体育职业学院', 'beijingtiyuzhiyexueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('89', '北京交通运输职业学院', 'beijingjiaotongyunshuzhiyexueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('90', '北京卫生职业学院', 'beijingweishengzhiyexueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('91', '北京网络职业学院', 'beijingwangluozhiyexueyuan', '2', '1');
INSERT INTO `oj_school` VALUES ('92', '南开大学', 'nankaidaxue', '1', '3');
INSERT INTO `oj_school` VALUES ('93', '天津大学', 'tianjindaxue', '1', '3');
INSERT INTO `oj_school` VALUES ('94', '天津科技大学', 'tianjinkejidaxue', '1', '3');
INSERT INTO `oj_school` VALUES ('95', '天津工业大学', 'tianjingongyedaxue', '1', '3');
INSERT INTO `oj_school` VALUES ('96', '中国民航大学', 'zhongguominhangdaxue', '1', '3');
INSERT INTO `oj_school` VALUES ('97', '天津理工大学', 'tianjinligongdaxue', '1', '3');
INSERT INTO `oj_school` VALUES ('98', '天津农学院', 'tianjinnongxueyuan', '1', '3');
INSERT INTO `oj_school` VALUES ('99', '天津医科大学', 'tianjinyikedaxue', '1', '3');
INSERT INTO `oj_school` VALUES ('100', '天津中医药大学', 'tianjinzhongyiyaodaxue', '1', '3');
INSERT INTO `oj_school` VALUES ('101', '天津师范大学', 'tianjinshifandaxue', '1', '3');
INSERT INTO `oj_school` VALUES ('102', '天津职业技术师范大学', 'tianjinzhiyejishushifandaxue', '1', '3');
INSERT INTO `oj_school` VALUES ('103', '天津外国语大学', 'tianjinwaiguoyudaxue', '1', '3');
INSERT INTO `oj_school` VALUES ('104', '天津商业大学', 'tianjinshangyedaxue', '1', '3');
INSERT INTO `oj_school` VALUES ('105', '天津财经大学', 'tianjincaijingdaxue', '1', '3');
INSERT INTO `oj_school` VALUES ('106', '天津体育学院', 'tianjintiyuxueyuan', '1', '3');
INSERT INTO `oj_school` VALUES ('107', '天津音乐学院', 'tianjinyinlexueyuan', '1', '3');
INSERT INTO `oj_school` VALUES ('108', '天津美术学院', 'tianjinmeishuxueyuan', '1', '3');
INSERT INTO `oj_school` VALUES ('109', '天津城建大学', 'tianjinchengjiandaxue', '1', '3');
INSERT INTO `oj_school` VALUES ('110', '天津天狮学院', 'tianjintianshixueyuan', '1', '3');
INSERT INTO `oj_school` VALUES ('111', '天津中德应用技术大学', 'tianjinzhongdeyingyongjishudaxue', '1', '3');
INSERT INTO `oj_school` VALUES ('112', '天津外国语大学滨海外事学院', 'tianjinwaiguoyudaxuebinhaiwaishixueyuan', '1', '3');
INSERT INTO `oj_school` VALUES ('113', '天津体育学院运动与文化艺术学院', 'tianjintiyuxueyuanyundongyuwenhuayishuxueyuan', '1', '3');
INSERT INTO `oj_school` VALUES ('114', '天津商业大学宝德学院', 'tianjinshangyedaxuebaodexueyuan', '1', '3');
INSERT INTO `oj_school` VALUES ('115', '天津医科大学临床医学院', 'tianjinyikedaxuelinchuangyixueyuan', '1', '3');
INSERT INTO `oj_school` VALUES ('116', '南开大学滨海学院', 'nankaidaxuebinhaixueyuan', '1', '3');
INSERT INTO `oj_school` VALUES ('117', '天津师范大学津沽学院', 'tianjinshifandaxuejinguxueyuan', '1', '3');
INSERT INTO `oj_school` VALUES ('118', '天津理工大学中环信息学院', 'tianjinligongdaxuezhonghuanxinxixueyuan', '1', '3');
INSERT INTO `oj_school` VALUES ('119', '北京科技大学天津学院', 'beijingkejidaxuetianjinxueyuan', '1', '3');
INSERT INTO `oj_school` VALUES ('120', '天津大学仁爱学院', 'tianjindaxuerenaixueyuan', '1', '3');
INSERT INTO `oj_school` VALUES ('121', '天津财经大学珠江学院', 'tianjincaijingdaxuezhujiangxueyuan', '1', '3');
INSERT INTO `oj_school` VALUES ('122', '天津市职业大学', 'tianjinshizhiyedaxue', '2', '3');
INSERT INTO `oj_school` VALUES ('123', '天津滨海职业学院', 'tianjinbinhaizhiyexueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('124', '天津工程职业技术学院', 'tianjingongchengzhiyejishuxueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('125', '天津青年职业学院', 'tianjinqingnianzhiyexueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('126', '天津渤海职业技术学院', 'tianjinbohaizhiyejishuxueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('127', '天津电子信息职业技术学院', 'tianjindianzixinxizhiyejishuxueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('128', '天津机电职业技术学院', 'tianjinjidianzhiyejishuxueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('129', '天津现代职业技术学院', 'tianjinxiandaizhiyejishuxueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('130', '天津公安警官职业学院', 'tianjingonganjingguanzhiyexueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('131', '天津轻工职业技术学院', 'tianjinqinggongzhiyejishuxueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('132', '天津商务职业学院', 'tianjinshangwuzhiyexueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('133', '天津国土资源和房屋职业学院', 'tianjinguotuziyuanhefangwuzhiyexueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('134', '天津医学高等专科学校', 'tianjinyixuegaodengzhuankexuexiao', '2', '3');
INSERT INTO `oj_school` VALUES ('135', '天津开发区职业技术学院', 'tianjinkaifaquzhiyejishuxueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('136', '天津艺术职业学院', 'tianjinyishuzhiyexueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('137', '天津交通职业学院', 'tianjinjiaotongzhiyexueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('138', '天津冶金职业技术学院', 'tianjinyejinzhiyejishuxueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('139', '天津石油职业技术学院', 'tianjinshiyouzhiyejishuxueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('140', '天津城市职业学院', 'tianjinchengshizhiyexueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('141', '天津铁道职业技术学院', 'tianjintiedaozhiyejishuxueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('142', '天津工艺美术职业学院', 'tianjingongyimeishuzhiyexueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('143', '天津城市建设管理职业技术学院', 'tianjinchengshijiansheguanlizhiyejishuxueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('144', '天津生物工程职业技术学院', 'tianjinshengwugongchengzhiyejishuxueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('145', '天津海运职业学院', 'tianjinhaiyunzhiyexueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('146', '天津广播影视职业学院', 'tianjinguangboyingshizhiyexueyuan', '2', '3');
INSERT INTO `oj_school` VALUES ('147', '河北大学', 'hebeidaxue', '1', '11');
INSERT INTO `oj_school` VALUES ('148', '河北工程大学', 'hebeigongchengdaxue', '1', '9');
INSERT INTO `oj_school` VALUES ('149', '河北地质大学', 'hebeidizhidaxue', '1', '6');
INSERT INTO `oj_school` VALUES ('150', '河北工业大学', 'hebeigongyedaxue', '1', '3');
INSERT INTO `oj_school` VALUES ('151', '华北理工大学', 'huabeiligongdaxue', '1', '7');
INSERT INTO `oj_school` VALUES ('152', '河北科技大学', 'hebeikejidaxue', '1', '6');
INSERT INTO `oj_school` VALUES ('153', '河北建筑工程学院', 'hebeijianzhugongchengxueyuan', '1', '12');
INSERT INTO `oj_school` VALUES ('154', '河北水利电力学院', 'hebeishuilidianlixueyuan', '1', '14');
INSERT INTO `oj_school` VALUES ('155', '河北农业大学', 'hebeinongyedaxue', '1', '11');
INSERT INTO `oj_school` VALUES ('156', '河北医科大学', 'hebeiyikedaxue', '1', '6');
INSERT INTO `oj_school` VALUES ('157', '河北北方学院', 'hebeibeifangxueyuan', '1', '12');
INSERT INTO `oj_school` VALUES ('158', '承德医学院', 'chengdeyixueyuan', '1', '13');
INSERT INTO `oj_school` VALUES ('159', '河北师范大学', 'hebeishifandaxue', '1', '6');
INSERT INTO `oj_school` VALUES ('160', '保定学院', 'baodingxueyuan', '1', '11');
INSERT INTO `oj_school` VALUES ('161', '河北民族师范学院', 'hebeiminzushifanxueyuan', '1', '13');
INSERT INTO `oj_school` VALUES ('162', '唐山师范学院', 'tangshanshifanxueyuan', '1', '7');
INSERT INTO `oj_school` VALUES ('163', '廊坊师范学院', 'langfangshifanxueyuan', '1', '15');
INSERT INTO `oj_school` VALUES ('164', '衡水学院', 'hengshuixueyuan', '1', '16');
INSERT INTO `oj_school` VALUES ('165', '石家庄学院', 'shijiazhuangxueyuan', '1', '6');
INSERT INTO `oj_school` VALUES ('166', '邯郸学院', 'handanxueyuan', '1', '9');
INSERT INTO `oj_school` VALUES ('167', '邢台学院', 'xingtaixueyuan', '1', '10');
INSERT INTO `oj_school` VALUES ('168', '沧州师范学院', 'cangzhoushifanxueyuan', '1', '14');
INSERT INTO `oj_school` VALUES ('169', '石家庄铁道大学', 'shijiazhuangtiedaodaxue', '1', '6');
INSERT INTO `oj_school` VALUES ('170', '燕山大学', 'yanshandaxue', '1', '8');
INSERT INTO `oj_school` VALUES ('171', '河北科技师范学院', 'hebeikejishifanxueyuan', '1', '8');
INSERT INTO `oj_school` VALUES ('172', '唐山学院', 'tangshanxueyuan', '1', '7');
INSERT INTO `oj_school` VALUES ('173', '华北科技学院', 'huabeikejixueyuan', '1', '15');
INSERT INTO `oj_school` VALUES ('174', '中国人民武装警察部队学院', 'zhongguorenminwuzhuangjingchabuduixueyuan', '1', '15');
INSERT INTO `oj_school` VALUES ('175', '河北体育学院', 'hebeitiyuxueyuan', '1', '6');
INSERT INTO `oj_school` VALUES ('176', '河北金融学院', 'hebeijinrongxueyuan', '1', '11');
INSERT INTO `oj_school` VALUES ('177', '北华航天工业学院', 'beihuahangtiangongyexueyuan', '1', '15');
INSERT INTO `oj_school` VALUES ('178', '防灾科技学院', 'fangzaikejixueyuan', '1', '15');
INSERT INTO `oj_school` VALUES ('179', '河北经贸大学', 'hebeijingmaodaxue', '1', '6');
INSERT INTO `oj_school` VALUES ('180', '中央司法警官学院', 'zhongyangsifajingguanxueyuan', '1', '11');
INSERT INTO `oj_school` VALUES ('181', '河北传媒学院', 'hebeichuanmeixueyuan', '1', '6');
INSERT INTO `oj_school` VALUES ('182', '河北工程技术学院', 'hebeigongchengjishuxueyuan', '1', '6');
INSERT INTO `oj_school` VALUES ('183', '河北美术学院', 'hebeimeishuxueyuan', '1', '6');
INSERT INTO `oj_school` VALUES ('184', '河北科技学院', 'hebeikejixueyuan', '1', '11');
INSERT INTO `oj_school` VALUES ('185', '河北外国语学院', 'hebeiwaiguoyuxueyuan', '1', '6');
INSERT INTO `oj_school` VALUES ('186', '河北大学工商学院', 'hebeidaxuegongshangxueyuan', '1', '11');
INSERT INTO `oj_school` VALUES ('187', '华北理工大学轻工学院', 'huabeiligongdaxueqinggongxueyuan', '1', '7');
INSERT INTO `oj_school` VALUES ('188', '河北科技大学理工学院', 'hebeikejidaxueligongxueyuan', '1', '6');
INSERT INTO `oj_school` VALUES ('189', '河北师范大学汇华学院', 'hebeishifandaxuehuihuaxueyuan', '1', '6');
INSERT INTO `oj_school` VALUES ('190', '河北经贸大学经济管理学院', 'hebeijingmaodaxuejingjiguanlixueyuan', '1', '6');
INSERT INTO `oj_school` VALUES ('191', '河北医科大学临床学院', 'hebeiyikedaxuelinchuangxueyuan', '1', '6');
INSERT INTO `oj_school` VALUES ('192', '华北电力大学科技学院', 'huabeidianlidaxuekejixueyuan', '1', '11');
INSERT INTO `oj_school` VALUES ('193', '河北工程大学科信学院', 'hebeigongchengdaxuekexinxueyuan', '1', '9');
INSERT INTO `oj_school` VALUES ('194', '河北工业大学城市学院', 'hebeigongyedaxuechengshixueyuan', '1', '15');
INSERT INTO `oj_school` VALUES ('195', '燕山大学里仁学院', 'yanshandaxuelirenxueyuan', '1', '8');
INSERT INTO `oj_school` VALUES ('196', '石家庄铁道大学四方学院', 'shijiazhuangtiedaodaxuesifangxueyuan', '1', '6');
INSERT INTO `oj_school` VALUES ('197', '河北地质大学华信学院', 'hebeidizhidaxuehuaxinxueyuan', '1', '6');
INSERT INTO `oj_school` VALUES ('198', '河北农业大学现代科技学院', 'hebeinongyedaxuexiandaikejixueyuan', '1', '11');
INSERT INTO `oj_school` VALUES ('199', '华北理工大学冀唐学院', 'huabeiligongdaxuejitangxueyuan', '1', '7');
INSERT INTO `oj_school` VALUES ('200', '中国地质大学长城学院', 'zhongguodizhidaxuechangchengxueyuan', '1', '11');
INSERT INTO `oj_school` VALUES ('201', '燕京理工学院', 'yanjingligongxueyuan', '1', '15');
INSERT INTO `oj_school` VALUES ('202', '北京中医药大学东方学院', 'beijingzhongyiyaodaxuedongfangxueyuan', '1', '15');
INSERT INTO `oj_school` VALUES ('203', '北京交通大学海滨学院', 'beijingjiaotongdaxuehaibinxueyuan', '1', '14');
INSERT INTO `oj_school` VALUES ('204', '河北东方学院', 'hebeidongfangxueyuan', '1', '15');
INSERT INTO `oj_school` VALUES ('205', '河北中医学院', 'hebeizhongyixueyuan', '1', '6');
INSERT INTO `oj_school` VALUES ('206', '张家口学院', 'zhangjiakouxueyuan', '1', '12');
INSERT INTO `oj_school` VALUES ('207', '河北环境工程学院', 'hebeihuanjinggongchengxueyuan', '1', '8');
INSERT INTO `oj_school` VALUES ('208', '河北工业职业技术学院', 'hebeigongyezhiyejishuxueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('209', '邯郸职业技术学院', 'handanzhiyejishuxueyuan', '2', '9');
INSERT INTO `oj_school` VALUES ('210', '石家庄职业技术学院', 'shijiazhuangzhiyejishuxueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('211', '张家口职业技术学院', 'zhangjiakouzhiyejishuxueyuan', '2', '12');
INSERT INTO `oj_school` VALUES ('212', '承德石油高等专科学校', 'chengdeshiyougaodengzhuankexuexiao', '2', '13');
INSERT INTO `oj_school` VALUES ('213', '邢台职业技术学院', 'xingtaizhiyejishuxueyuan', '2', '10');
INSERT INTO `oj_school` VALUES ('214', '河北软件职业技术学院', 'hebeiruanjianzhiyejishuxueyuan', '2', '11');
INSERT INTO `oj_school` VALUES ('215', '河北石油职业技术学院', 'hebeishiyouzhiyejishuxueyuan', '2', '15');
INSERT INTO `oj_school` VALUES ('216', '河北建材职业技术学院', 'hebeijiancaizhiyejishuxueyuan', '2', '8');
INSERT INTO `oj_school` VALUES ('217', '河北政法职业学院', 'hebeizhengfazhiyexueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('218', '沧州职业技术学院', 'cangzhouzhiyejishuxueyuan', '2', '14');
INSERT INTO `oj_school` VALUES ('219', '河北能源职业技术学院', 'hebeinengyuanzhiyejishuxueyuan', '2', '7');
INSERT INTO `oj_school` VALUES ('220', '石家庄铁路职业技术学院', 'shijiazhuangtieluzhiyejishuxueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('221', '保定职业技术学院', 'baodingzhiyejishuxueyuan', '2', '11');
INSERT INTO `oj_school` VALUES ('222', '秦皇岛职业技术学院', 'qinhuangdaozhiyejishuxueyuan', '2', '8');
INSERT INTO `oj_school` VALUES ('223', '石家庄工程职业学院', 'shijiazhuanggongchengzhiyexueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('224', '石家庄城市经济职业学院', 'shijiazhuangchengshijingjizhiyexueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('225', '唐山职业技术学院', 'tangshanzhiyejishuxueyuan', '2', '7');
INSERT INTO `oj_school` VALUES ('226', '衡水职业技术学院', 'hengshuizhiyejishuxueyuan', '2', '16');
INSERT INTO `oj_school` VALUES ('227', '唐山工业职业技术学院', 'tangshangongyezhiyejishuxueyuan', '2', '7');
INSERT INTO `oj_school` VALUES ('228', '邢台医学高等专科学校', 'xingtaiyixuegaodengzhuankexuexiao', '2', '10');
INSERT INTO `oj_school` VALUES ('229', '河北省艺术职业学院', 'hebeishengyishuzhiyexueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('230', '河北旅游职业学院', 'hebeilvyouzhiyexueyuan', '2', '13');
INSERT INTO `oj_school` VALUES ('231', '石家庄财经职业学院', 'shijiazhuangcaijingzhiyexueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('232', '河北交通职业技术学院', 'hebeijiaotongzhiyejishuxueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('233', '河北化工医药职业技术学院', 'hebeihuagongyiyaozhiyejishuxueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('234', '石家庄信息工程职业学院', 'shijiazhuangxinxigongchengzhiyexueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('235', '河北对外经贸职业学院', 'hebeiduiwaijingmaozhiyexueyuan', '2', '8');
INSERT INTO `oj_school` VALUES ('236', '保定电力职业技术学院', 'baodingdianlizhiyejishuxueyuan', '2', '11');
INSERT INTO `oj_school` VALUES ('237', '河北机电职业技术学院', 'hebeijidianzhiyejishuxueyuan', '2', '10');
INSERT INTO `oj_school` VALUES ('238', '渤海石油职业学院', 'bohaishiyouzhiyexueyuan', '2', '14');
INSERT INTO `oj_school` VALUES ('239', '廊坊职业技术学院', 'langfangzhiyejishuxueyuan', '2', '15');
INSERT INTO `oj_school` VALUES ('240', '唐山科技职业技术学院', 'tangshankejizhiyejishuxueyuan', '2', '7');
INSERT INTO `oj_school` VALUES ('241', '石家庄邮电职业技术学院', 'shijiazhuangyoudianzhiyejishuxueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('242', '河北公安警察职业学院', 'hebeigonganjingchazhiyexueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('243', '石家庄工商职业学院', 'shijiazhuanggongshangzhiyexueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('244', '石家庄理工职业学院', 'shijiazhuangligongzhiyexueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('245', '石家庄科技信息职业学院', 'shijiazhuangkejixinxizhiyexueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('246', '河北司法警官职业学院', 'hebeisifajingguanzhiyexueyuan', '2', '9');
INSERT INTO `oj_school` VALUES ('247', '沧州医学高等专科学校', 'cangzhouyixuegaodengzhuankexuexiao', '2', '14');
INSERT INTO `oj_school` VALUES ('248', '河北女子职业技术学院', 'hebeinvzizhiyejishuxueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('249', '石家庄医学高等专科学校', 'shijiazhuangyixuegaodengzhuankexuexiao', '2', '6');
INSERT INTO `oj_school` VALUES ('250', '石家庄经济职业学院', 'shijiazhuangjingjizhiyexueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('251', '冀中职业学院', 'jizhongzhiyexueyuan', '2', '11');
INSERT INTO `oj_school` VALUES ('252', '石家庄人民医学高等专科学校', 'shijiazhuangrenminyixuegaodengzhuankexuexiao', '2', '6');
INSERT INTO `oj_school` VALUES ('253', '石家庄科技工程职业学院', 'shijiazhuangkejigongchengzhiyexueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('254', '河北劳动关系职业学院', 'hebeilaodongguanxizhiyexueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('255', '石家庄科技职业学院', 'shijiazhuangkejizhiyexueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('256', '泊头职业学院', 'botouzhiyexueyuan', '2', '14');
INSERT INTO `oj_school` VALUES ('257', '宣化科技职业学院', 'xuanhuakejizhiyexueyuan', '2', '12');
INSERT INTO `oj_school` VALUES ('258', '廊坊燕京职业技术学院', 'langfangyanjingzhiyejishuxueyuan', '2', '15');
INSERT INTO `oj_school` VALUES ('259', '承德护理职业学院', 'chengdehulizhiyexueyuan', '2', '13');
INSERT INTO `oj_school` VALUES ('260', '石家庄幼儿师范高等专科学校', 'shijiazhuangyouershifangaodengzhuankexuexiao', '2', '6');
INSERT INTO `oj_school` VALUES ('261', '廊坊卫生职业学院', 'langfangweishengzhiyexueyuan', '2', '15');
INSERT INTO `oj_school` VALUES ('262', '河北轨道运输职业技术学院', 'hebeiguidaoyunshuzhiyejishuxueyuan', '2', '6');
INSERT INTO `oj_school` VALUES ('263', '保定幼儿师范高等专科学校', 'baodingyouershifangaodengzhuankexuexiao', '2', '11');
INSERT INTO `oj_school` VALUES ('264', '河北工艺美术职业学院', 'hebeigongyimeishuzhiyexueyuan', '2', '11');
INSERT INTO `oj_school` VALUES ('265', '渤海理工职业学院', 'bohailigongzhiyexueyuan', '2', '14');
INSERT INTO `oj_school` VALUES ('266', '唐山幼儿师范高等专科学校', 'tangshanyouershifangaodengzhuankexuexiao', '2', '7');
INSERT INTO `oj_school` VALUES ('267', '山西大学', 'shanxidaxue', '1', '18');
INSERT INTO `oj_school` VALUES ('268', '太原科技大学', 'taiyuankejidaxue', '1', '18');
INSERT INTO `oj_school` VALUES ('269', '中北大学', 'zhongbeidaxue', '1', '18');
INSERT INTO `oj_school` VALUES ('270', '太原理工大学', 'taiyuanligongdaxue', '1', '18');
INSERT INTO `oj_school` VALUES ('271', '山西农业大学', 'shanxinongyedaxue', '1', '26');
INSERT INTO `oj_school` VALUES ('272', '山西医科大学', 'shanxiyikedaxue', '1', '18');
INSERT INTO `oj_school` VALUES ('273', '长治医学院', 'changzhiyixueyuan', '1', '21');
INSERT INTO `oj_school` VALUES ('274', '山西师范大学', 'shanxishifandaxue', '1', '27');
INSERT INTO `oj_school` VALUES ('275', '太原师范学院', 'taiyuanshifanxueyuan', '1', '18');
INSERT INTO `oj_school` VALUES ('276', '山西大同大学', 'shanxidatongdaxue', '1', '19');
INSERT INTO `oj_school` VALUES ('277', '晋中学院', 'jinzhongxueyuan', '1', '26');
INSERT INTO `oj_school` VALUES ('278', '长治学院', 'changzhixueyuan', '1', '21');
INSERT INTO `oj_school` VALUES ('279', '运城学院', 'yunchengxueyuan', '1', '28');
INSERT INTO `oj_school` VALUES ('280', '忻州师范学院', 'xinzhoushifanxueyuan', '1', '24');
INSERT INTO `oj_school` VALUES ('281', '山西财经大学', 'shanxicaijingdaxue', '1', '18');
INSERT INTO `oj_school` VALUES ('282', '山西中医学院', 'shanxizhongyixueyuan', '1', '18');
INSERT INTO `oj_school` VALUES ('283', '吕梁学院', 'lvliangxueyuan', '1', '25');
INSERT INTO `oj_school` VALUES ('284', '太原学院', 'taiyuanxueyuan', '1', '18');
INSERT INTO `oj_school` VALUES ('285', '山西警察学院', 'shanxijingchaxueyuan', '1', '18');
INSERT INTO `oj_school` VALUES ('286', '山西应用科技学院', 'shanxiyingyongkejixueyuan', '1', '18');
INSERT INTO `oj_school` VALUES ('287', '山西大学商务学院', 'shanxidaxueshangwuxueyuan', '1', '18');
INSERT INTO `oj_school` VALUES ('288', '太原理工大学现代科技学院', 'taiyuanligongdaxuexiandaikejixueyuan', '1', '18');
INSERT INTO `oj_school` VALUES ('289', '山西农业大学信息学院', 'shanxinongyedaxuexinxixueyuan', '1', '26');
INSERT INTO `oj_school` VALUES ('290', '山西师范大学现代文理学院', 'shanxishifandaxuexiandaiwenlixueyuan', '1', '27');
INSERT INTO `oj_school` VALUES ('291', '中北大学信息商务学院', 'zhongbeidaxuexinxishangwuxueyuan', '1', '18');
INSERT INTO `oj_school` VALUES ('292', '太原科技大学华科学院', 'taiyuankejidaxuehuakexueyuan', '1', '18');
INSERT INTO `oj_school` VALUES ('293', '山西医科大学晋祠学院', 'shanxiyikedaxuejincixueyuan', '1', '18');
INSERT INTO `oj_school` VALUES ('294', '山西财经大学华商学院', 'shanxicaijingdaxuehuashangxueyuan', '1', '18');
INSERT INTO `oj_school` VALUES ('295', '山西工商学院', 'shanxigongshangxueyuan', '1', '18');
INSERT INTO `oj_school` VALUES ('296', '太原工业学院', 'taiyuangongyexueyuan', '1', '18');
INSERT INTO `oj_school` VALUES ('297', '山西传媒学院', 'shanxichuanmeixueyuan', '1', '18');
INSERT INTO `oj_school` VALUES ('298', '山西工程技术学院', 'shanxigongchengjishuxueyuan', '1', '20');
INSERT INTO `oj_school` VALUES ('299', '山西能源学院', 'shanxinengyuanxueyuan', '1', '26');
INSERT INTO `oj_school` VALUES ('300', '山西省财政税务专科学校', 'shanxishengcaizhengshuiwuzhuankexuexiao', '2', '18');
INSERT INTO `oj_school` VALUES ('301', '长治职业技术学院', 'changzhizhiyejishuxueyuan', '2', '21');
INSERT INTO `oj_school` VALUES ('302', '山西艺术职业学院', 'shanxiyishuzhiyexueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('303', '晋城职业技术学院', 'jinchengzhiyejishuxueyuan', '2', '22');
INSERT INTO `oj_school` VALUES ('304', '山西建筑职业技术学院', 'shanxijianzhuzhiyejishuxueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('305', '山西药科职业学院', 'shanxiyaokezhiyexueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('306', '山西工程职业技术学院', 'shanxigongchengzhiyejishuxueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('307', '山西交通职业技术学院', 'shanxijiaotongzhiyejishuxueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('308', '大同煤炭职业技术学院', 'datongmeitanzhiyejishuxueyuan', '2', '19');
INSERT INTO `oj_school` VALUES ('309', '山西机电职业技术学院', 'shanxijidianzhiyejishuxueyuan', '2', '21');
INSERT INTO `oj_school` VALUES ('310', '山西戏剧职业学院', 'shanxixijuzhiyexueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('311', '山西财贸职业技术学院', 'shanxicaimaozhiyejishuxueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('312', '山西林业职业技术学院', 'shanxilinyezhiyejishuxueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('313', '山西水利职业技术学院', 'shanxishuilizhiyejishuxueyuan', '2', '28');
INSERT INTO `oj_school` VALUES ('314', '阳泉职业技术学院', 'yangquanzhiyejishuxueyuan', '2', '20');
INSERT INTO `oj_school` VALUES ('315', '临汾职业技术学院', 'linfenzhiyejishuxueyuan', '2', '27');
INSERT INTO `oj_school` VALUES ('316', '山西职业技术学院', 'shanxizhiyejishuxueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('317', '山西煤炭职业技术学院', 'shanximeitanzhiyejishuxueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('318', '山西金融职业学院', 'shanxijinrongzhiyexueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('319', '太原城市职业技术学院', 'taiyuanchengshizhiyejishuxueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('320', '山西信息职业技术学院', 'shanxixinxizhiyejishuxueyuan', '2', '27');
INSERT INTO `oj_school` VALUES ('321', '山西体育职业学院', 'shanxitiyuzhiyexueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('322', '山西警官职业学院', 'shanxijingguanzhiyexueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('323', '山西国际商务职业学院', 'shanxiguojishangwuzhiyexueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('324', '潞安职业技术学院', 'luanzhiyejishuxueyuan', '2', '21');
INSERT INTO `oj_school` VALUES ('325', '太原旅游职业学院', 'taiyuanlvyouzhiyexueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('326', '山西旅游职业学院', 'shanxilvyouzhiyexueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('327', '山西管理职业学院', 'shanxiguanlizhiyexueyuan', '2', '27');
INSERT INTO `oj_school` VALUES ('328', '山西电力职业技术学院', 'shanxidianlizhiyejishuxueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('329', '忻州职业技术学院', 'xinzhouzhiyejishuxueyuan', '2', '24');
INSERT INTO `oj_school` VALUES ('330', '山西同文职业技术学院', 'shanxitongwenzhiyejishuxueyuan', '2', '26');
INSERT INTO `oj_school` VALUES ('331', '晋中职业技术学院', 'jinzhongzhiyejishuxueyuan', '2', '26');
INSERT INTO `oj_school` VALUES ('332', '山西华澳商贸职业学院', 'shanxihuaaoshangmaozhiyexueyuan', '2', '26');
INSERT INTO `oj_school` VALUES ('333', '山西运城农业职业技术学院', 'shanxiyunchengnongyezhiyejishuxueyuan', '2', '28');
INSERT INTO `oj_school` VALUES ('334', '运城幼儿师范高等专科学校', 'yunchengyouershifangaodengzhuankexuexiao', '2', '28');
INSERT INTO `oj_school` VALUES ('335', '山西老区职业技术学院', 'shanxilaoquzhiyejishuxueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('336', '山西经贸职业学院', 'shanxijingmaozhiyexueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('337', '朔州职业技术学院', 'shuozhouzhiyejishuxueyuan', '2', '23');
INSERT INTO `oj_school` VALUES ('338', '运城职业技术学院', 'yunchengzhiyejishuxueyuan', '2', '28');
INSERT INTO `oj_school` VALUES ('339', '山西轻工职业技术学院', 'shanxiqinggongzhiyejishuxueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('340', '晋中师范高等专科学校', 'jinzhongshifangaodengzhuankexuexiao', '2', '26');
INSERT INTO `oj_school` VALUES ('341', '阳泉师范高等专科学校', 'yangquanshifangaodengzhuankexuexiao', '2', '20');
INSERT INTO `oj_school` VALUES ('342', '山西青年职业学院', 'shanxiqingnianzhiyexueyuan', '2', '18');
INSERT INTO `oj_school` VALUES ('343', '运城护理职业学院', 'yunchenghulizhiyexueyuan', '2', '28');
INSERT INTO `oj_school` VALUES ('344', '运城师范高等专科学校', 'yunchengshifangaodengzhuankexuexiao', '2', '28');
INSERT INTO `oj_school` VALUES ('345', '朔州师范高等专科学校', 'shuozhoushifangaodengzhuankexuexiao', '2', '23');
INSERT INTO `oj_school` VALUES ('346', '吕梁职业技术学院', 'lvliangzhiyejishuxueyuan', '2', '25');
INSERT INTO `oj_school` VALUES ('347', '内蒙古大学', 'neimenggudaxue', '1', '30');
INSERT INTO `oj_school` VALUES ('348', '内蒙古科技大学', 'neimenggukejidaxue', '1', '31');
INSERT INTO `oj_school` VALUES ('349', '内蒙古工业大学', 'neimenggugongyedaxue', '1', '30');
INSERT INTO `oj_school` VALUES ('350', '内蒙古农业大学', 'neimenggunongyedaxue', '1', '30');
INSERT INTO `oj_school` VALUES ('351', '内蒙古医科大学', 'neimengguyikedaxue', '1', '30');
INSERT INTO `oj_school` VALUES ('352', '内蒙古师范大学', 'neimenggushifandaxue', '1', '30');
INSERT INTO `oj_school` VALUES ('353', '内蒙古民族大学', 'neimengguminzudaxue', '1', '36');
INSERT INTO `oj_school` VALUES ('354', '赤峰学院', 'chifengxueyuan', '1', '33');
INSERT INTO `oj_school` VALUES ('355', '内蒙古财经大学', 'neimenggucaijingdaxue', '1', '30');
INSERT INTO `oj_school` VALUES ('356', '呼伦贝尔学院', 'hulunbeierxueyuan', '1', '34');
INSERT INTO `oj_school` VALUES ('357', '集宁师范学院', 'jiningshifanxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('358', '河套学院', 'hetaoxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('359', '呼和浩特民族学院', 'huhehaoteminzuxueyuan', '1', '30');
INSERT INTO `oj_school` VALUES ('360', '内蒙古大学创业学院', 'neimenggudaxuechuangyexueyuan', '1', '30');
INSERT INTO `oj_school` VALUES ('361', '内蒙古师范大学鸿德学院', 'neimenggushifandaxuehongdexueyuan', '1', '30');
INSERT INTO `oj_school` VALUES ('362', '内蒙古艺术学院', 'neimengguyishuxueyuan', '1', '30');
INSERT INTO `oj_school` VALUES ('363', '鄂尔多斯应用技术学院', 'eerduosiyingyongjishuxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('364', '内蒙古建筑职业技术学院', 'neimenggujianzhuzhiyejishuxueyuan', '2', '30');
INSERT INTO `oj_school` VALUES ('365', '内蒙古丰州职业学院', 'neimenggufengzhouzhiyexueyuan', '2', '30');
INSERT INTO `oj_school` VALUES ('366', '包头职业技术学院', 'baotouzhiyejishuxueyuan', '2', '31');
INSERT INTO `oj_school` VALUES ('367', '兴安职业技术学院', 'xinganzhiyejishuxueyuan', '2', '35');
INSERT INTO `oj_school` VALUES ('368', '呼和浩特职业学院', 'huhehaotezhiyexueyuan', '2', '30');
INSERT INTO `oj_school` VALUES ('369', '包头轻工职业技术学院', 'baotouqinggongzhiyejishuxueyuan', '2', '31');
INSERT INTO `oj_school` VALUES ('370', '内蒙古电子信息职业技术学院', 'neimenggudianzixinxizhiyejishuxueyuan', '2', '30');
INSERT INTO `oj_school` VALUES ('371', '内蒙古机电职业技术学院', 'neimenggujidianzhiyejishuxueyuan', '2', '30');
INSERT INTO `oj_school` VALUES ('372', '内蒙古化工职业学院', 'neimengguhuagongzhiyexueyuan', '2', '30');
INSERT INTO `oj_school` VALUES ('373', '内蒙古商贸职业学院', 'neimenggushangmaozhiyexueyuan', '2', '30');
INSERT INTO `oj_school` VALUES ('374', '锡林郭勒职业学院', 'xilinguolezhiyexueyuan', '2', '37');
INSERT INTO `oj_school` VALUES ('375', '内蒙古警察职业学院', 'neimenggujingchazhiyexueyuan', '2', '30');
INSERT INTO `oj_school` VALUES ('376', '内蒙古体育职业学院', 'neimenggutiyuzhiyexueyuan', '2', '30');
INSERT INTO `oj_school` VALUES ('377', '乌兰察布职业学院', 'wulanchabuzhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('378', '通辽职业学院', 'tongliaozhiyexueyuan', '2', '36');
INSERT INTO `oj_school` VALUES ('379', '科尔沁艺术职业学院', 'keerqinyishuzhiyexueyuan', '2', '36');
INSERT INTO `oj_school` VALUES ('380', '内蒙古交通职业技术学院', 'neimenggujiaotongzhiyejishuxueyuan', '2', '33');
INSERT INTO `oj_school` VALUES ('381', '包头钢铁职业技术学院', 'baotougangtiezhiyejishuxueyuan', '2', '31');
INSERT INTO `oj_school` VALUES ('382', '乌海职业技术学院', 'wuhaizhiyejishuxueyuan', '2', '32');
INSERT INTO `oj_school` VALUES ('383', '内蒙古科技职业学院', 'neimenggukejizhiyexueyuan', '2', '30');
INSERT INTO `oj_school` VALUES ('384', '内蒙古北方职业技术学院', 'neimenggubeifangzhiyejishuxueyuan', '2', '30');
INSERT INTO `oj_school` VALUES ('385', '赤峰职业技术学院', 'chifengzhiyejishuxueyuan', '2', '33');
INSERT INTO `oj_school` VALUES ('386', '内蒙古经贸外语职业学院', 'neimenggujingmaowaiyuzhiyexueyuan', '2', '30');
INSERT INTO `oj_school` VALUES ('387', '包头铁道职业技术学院', 'baotoutiedaozhiyejishuxueyuan', '2', '31');
INSERT INTO `oj_school` VALUES ('388', '乌兰察布医学高等专科学校', 'wulanchabuyixuegaodengzhuankexuexiao', '2', '999');
INSERT INTO `oj_school` VALUES ('389', '鄂尔多斯职业学院', 'eerduosizhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('390', '内蒙古工业职业学院', 'neimenggugongyezhiyexueyuan', '2', '30');
INSERT INTO `oj_school` VALUES ('391', '呼伦贝尔职业技术学院', 'hulunbeierzhiyejishuxueyuan', '2', '34');
INSERT INTO `oj_school` VALUES ('392', '满洲里俄语职业学院', 'manzhoulieyuzhiyexueyuan', '2', '34');
INSERT INTO `oj_school` VALUES ('393', '内蒙古能源职业学院', 'neimenggunengyuanzhiyexueyuan', '2', '30');
INSERT INTO `oj_school` VALUES ('394', '赤峰工业职业技术学院', 'chifenggongyezhiyejishuxueyuan', '2', '33');
INSERT INTO `oj_school` VALUES ('395', '阿拉善职业技术学院', 'alashanzhiyejishuxueyuan', '2', '41');
INSERT INTO `oj_school` VALUES ('396', '内蒙古美术职业学院', 'neimenggumeishuzhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('397', '内蒙古民族幼儿师范高等专科学校', 'neimengguminzuyouershifangaodengzhuankexuexiao', '2', '999');
INSERT INTO `oj_school` VALUES ('398', '鄂尔多斯生态环境职业学院', 'eerduosishengtaihuanjingzhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('399', '扎兰屯职业学院', 'zhalantunzhiyexueyuan', '2', '34');
INSERT INTO `oj_school` VALUES ('400', '辽宁大学', 'liaoningdaxue', '1', '43');
INSERT INTO `oj_school` VALUES ('401', '大连理工大学', 'dalianligongdaxue', '1', '44');
INSERT INTO `oj_school` VALUES ('402', '沈阳工业大学', 'shenyanggongyedaxue', '1', '43');
INSERT INTO `oj_school` VALUES ('403', '沈阳航空航天大学', 'shenyanghangkonghangtiandaxue', '1', '43');
INSERT INTO `oj_school` VALUES ('404', '沈阳理工大学', 'shenyangligongdaxue', '1', '43');
INSERT INTO `oj_school` VALUES ('405', '东北大学', 'dongbeidaxue', '1', '43');
INSERT INTO `oj_school` VALUES ('406', '辽宁科技大学', 'liaoningkejidaxue', '1', '45');
INSERT INTO `oj_school` VALUES ('407', '辽宁工程技术大学', 'liaoninggongchengjishudaxue', '1', '51');
INSERT INTO `oj_school` VALUES ('408', '辽宁石油化工大学', 'liaoningshiyouhuagongdaxue', '1', '46');
INSERT INTO `oj_school` VALUES ('409', '沈阳化工大学', 'shenyanghuagongdaxue', '1', '43');
INSERT INTO `oj_school` VALUES ('410', '大连交通大学', 'dalianjiaotongdaxue', '1', '44');
INSERT INTO `oj_school` VALUES ('411', '大连海事大学', 'dalianhaishidaxue', '1', '44');
INSERT INTO `oj_school` VALUES ('412', '大连工业大学', 'daliangongyedaxue', '1', '44');
INSERT INTO `oj_school` VALUES ('413', '沈阳建筑大学', 'shenyangjianzhudaxue', '1', '43');
INSERT INTO `oj_school` VALUES ('414', '辽宁工业大学', 'liaoninggongyedaxue', '1', '49');
INSERT INTO `oj_school` VALUES ('415', '沈阳农业大学', 'shenyangnongyedaxue', '1', '43');
INSERT INTO `oj_school` VALUES ('416', '大连海洋大学', 'dalianhaiyangdaxue', '1', '44');
INSERT INTO `oj_school` VALUES ('417', '中国医科大学', 'zhongguoyikedaxue', '1', '43');
INSERT INTO `oj_school` VALUES ('418', '锦州医科大学', 'jinzhouyikedaxue', '1', '49');
INSERT INTO `oj_school` VALUES ('419', '大连医科大学', 'dalianyikedaxue', '1', '44');
INSERT INTO `oj_school` VALUES ('420', '辽宁中医药大学', 'liaoningzhongyiyaodaxue', '1', '43');
INSERT INTO `oj_school` VALUES ('421', '沈阳药科大学', 'shenyangyaokedaxue', '1', '43');
INSERT INTO `oj_school` VALUES ('422', '沈阳医学院', 'shenyangyixueyuan', '1', '43');
INSERT INTO `oj_school` VALUES ('423', '辽宁师范大学', 'liaoningshifandaxue', '1', '44');
INSERT INTO `oj_school` VALUES ('424', '沈阳师范大学', 'shenyangshifandaxue', '1', '43');
INSERT INTO `oj_school` VALUES ('425', '渤海大学', 'bohaidaxue', '1', '49');
INSERT INTO `oj_school` VALUES ('426', '鞍山师范学院', 'anshanshifanxueyuan', '1', '45');
INSERT INTO `oj_school` VALUES ('427', '大连外国语大学', 'dalianwaiguoyudaxue', '1', '44');
INSERT INTO `oj_school` VALUES ('428', '东北财经大学', 'dongbeicaijingdaxue', '1', '44');
INSERT INTO `oj_school` VALUES ('429', '中国刑事警察学院', 'zhongguoxingshijingchaxueyuan', '1', '43');
INSERT INTO `oj_school` VALUES ('430', '沈阳体育学院', 'shenyangtiyuxueyuan', '1', '43');
INSERT INTO `oj_school` VALUES ('431', '沈阳音乐学院', 'shenyangyinlexueyuan', '1', '43');
INSERT INTO `oj_school` VALUES ('432', '鲁迅美术学院', 'luxunmeishuxueyuan', '1', '43');
INSERT INTO `oj_school` VALUES ('433', '辽宁对外经贸学院', 'liaoningduiwaijingmaoxueyuan', '1', '44');
INSERT INTO `oj_school` VALUES ('434', '沈阳大学', 'shenyangdaxue', '1', '43');
INSERT INTO `oj_school` VALUES ('435', '大连大学', 'daliandaxue', '1', '44');
INSERT INTO `oj_school` VALUES ('436', '辽宁科技学院', 'liaoningkejixueyuan', '1', '47');
INSERT INTO `oj_school` VALUES ('437', '辽宁警察学院', 'liaoningjingchaxueyuan', '1', '44');
INSERT INTO `oj_school` VALUES ('438', '沈阳工程学院', 'shenyanggongchengxueyuan', '1', '43');
INSERT INTO `oj_school` VALUES ('439', '辽东学院', 'liaodongxueyuan', '1', '48');
INSERT INTO `oj_school` VALUES ('440', '大连民族大学', 'dalianminzudaxue', '1', '44');
INSERT INTO `oj_school` VALUES ('441', '大连理工大学城市学院', 'dalianligongdaxuechengshixueyuan', '1', '44');
INSERT INTO `oj_school` VALUES ('442', '沈阳工业大学工程学院', 'shenyanggongyedaxuegongchengxueyuan', '1', '52');
INSERT INTO `oj_school` VALUES ('443', '沈阳航空航天大学北方科技学院', 'shenyanghangkonghangtiandaxuebeifangkejixueyuan', '1', '43');
INSERT INTO `oj_school` VALUES ('444', '沈阳工学院', 'shenyanggongxueyuan', '1', '43');
INSERT INTO `oj_school` VALUES ('445', '大连工业大学艺术与信息工程学院', 'daliangongyedaxueyishuyuxinxigongchengxueyuan', '1', '44');
INSERT INTO `oj_school` VALUES ('446', '大连科技学院', 'daliankejixueyuan', '1', '44');
INSERT INTO `oj_school` VALUES ('447', '沈阳城市建设学院', 'shenyangchengshijianshexueyuan', '1', '43');
INSERT INTO `oj_school` VALUES ('448', '中国医科大学临床医药学院', 'zhongguoyikedaxuelinchuangyiyaoxueyuan', '1', '43');
INSERT INTO `oj_school` VALUES ('449', '大连医科大学中山学院', 'dalianyikedaxuezhongshanxueyuan', '1', '44');
INSERT INTO `oj_school` VALUES ('450', '锦州医科大学医疗学院', 'jinzhouyikedaxueyiliaoxueyuan', '1', '49');
INSERT INTO `oj_school` VALUES ('451', '辽宁师范大学海华学院', 'liaoningshifandaxuehaihuaxueyuan', '1', '43');
INSERT INTO `oj_school` VALUES ('452', '辽宁理工学院', 'liaoningligongxueyuan', '1', '49');
INSERT INTO `oj_school` VALUES ('453', '大连财经学院', 'daliancaijingxueyuan', '1', '44');
INSERT INTO `oj_school` VALUES ('454', '沈阳城市学院', 'shenyangchengshixueyuan', '1', '43');
INSERT INTO `oj_school` VALUES ('455', '辽宁科技大学信息技术学院', 'liaoningkejidaxuexinxijishuxueyuan', '1', '45');
INSERT INTO `oj_school` VALUES ('456', '辽宁石油化工大学顺华能源学院', 'liaoningshiyouhuagongdaxueshunhuanengyuanxueyuan', '1', '46');
INSERT INTO `oj_school` VALUES ('457', '大连艺术学院', 'dalianyishuxueyuan', '1', '44');
INSERT INTO `oj_school` VALUES ('458', '辽宁中医药大学杏林学院', 'liaoningzhongyiyaodaxuexinglinxueyuan', '1', '43');
INSERT INTO `oj_school` VALUES ('459', '辽宁何氏医学院', 'liaoningheshiyixueyuan', '1', '43');
INSERT INTO `oj_school` VALUES ('460', '沈阳科技学院', 'shenyangkejixueyuan', '1', '43');
INSERT INTO `oj_school` VALUES ('461', '大连东软信息学院', 'daliandongruanxinxixueyuan', '1', '44');
INSERT INTO `oj_school` VALUES ('462', '辽宁财贸学院', 'liaoningcaimaoxueyuan', '1', '56');
INSERT INTO `oj_school` VALUES ('463', '辽宁传媒学院', 'liaoningchuanmeixueyuan', '1', '43');
INSERT INTO `oj_school` VALUES ('464', '营口理工学院', 'yingkouligongxueyuan', '1', '50');
INSERT INTO `oj_school` VALUES ('465', '朝阳师范高等专科学校', 'chaoyangshifangaodengzhuankexuexiao', '2', '55');
INSERT INTO `oj_school` VALUES ('466', '抚顺师范高等专科学校', 'fushunshifangaodengzhuankexuexiao', '2', '46');
INSERT INTO `oj_school` VALUES ('467', '锦州师范高等专科学校', 'jinzhoushifangaodengzhuankexuexiao', '2', '49');
INSERT INTO `oj_school` VALUES ('468', '营口职业技术学院', 'yingkouzhiyejishuxueyuan', '2', '50');
INSERT INTO `oj_school` VALUES ('469', '铁岭师范高等专科学校', 'tielingshifangaodengzhuankexuexiao', '2', '54');
INSERT INTO `oj_school` VALUES ('470', '大连职业技术学院', 'dalianzhiyejishuxueyuan', '2', '44');
INSERT INTO `oj_school` VALUES ('471', '辽宁农业职业技术学院', 'liaoningnongyezhiyejishuxueyuan', '2', '50');
INSERT INTO `oj_school` VALUES ('472', '抚顺职业技术学院', 'fushunzhiyejishuxueyuan', '2', '46');
INSERT INTO `oj_school` VALUES ('473', '辽阳职业技术学院', 'liaoyangzhiyejishuxueyuan', '2', '52');
INSERT INTO `oj_school` VALUES ('474', '阜新高等专科学校', 'fuxingaodengzhuankexuexiao', '2', '51');
INSERT INTO `oj_school` VALUES ('475', '辽宁省交通高等专科学校', 'liaoningshengjiaotonggaodengzhuankexuexiao', '2', '43');
INSERT INTO `oj_school` VALUES ('476', '辽宁税务高等专科学校', 'liaoningshuiwugaodengzhuankexuexiao', '2', '44');
INSERT INTO `oj_school` VALUES ('477', '盘锦职业技术学院', 'panjinzhiyejishuxueyuan', '2', '53');
INSERT INTO `oj_school` VALUES ('478', '沈阳航空职业技术学院', 'shenyanghangkongzhiyejishuxueyuan', '2', '43');
INSERT INTO `oj_school` VALUES ('479', '辽宁体育运动职业技术学院', 'liaoningtiyuyundongzhiyejishuxueyuan', '2', '43');
INSERT INTO `oj_school` VALUES ('480', '辽宁职业学院', 'liaoningzhiyexueyuan', '2', '54');
INSERT INTO `oj_school` VALUES ('481', '辽宁林业职业技术学院', 'liaoninglinyezhiyejishuxueyuan', '2', '43');
INSERT INTO `oj_school` VALUES ('482', '沈阳职业技术学院', 'shenyangzhiyejishuxueyuan', '2', '43');
INSERT INTO `oj_school` VALUES ('483', '辽宁理工职业学院', 'liaoningligongzhiyexueyuan', '2', '49');
INSERT INTO `oj_school` VALUES ('484', '大连商务职业学院', 'dalianshangwuzhiyexueyuan', '2', '44');
INSERT INTO `oj_school` VALUES ('485', '辽宁金融职业学院', 'liaoningjinrongzhiyexueyuan', '2', '43');
INSERT INTO `oj_school` VALUES ('486', '辽宁轨道交通职业学院', 'liaoningguidaojiaotongzhiyexueyuan', '2', '43');
INSERT INTO `oj_school` VALUES ('487', '辽宁广告职业学院', 'liaoningguanggaozhiyexueyuan', '2', '43');
INSERT INTO `oj_school` VALUES ('488', '辽宁机电职业技术学院', 'liaoningjidianzhiyejishuxueyuan', '2', '48');
INSERT INTO `oj_school` VALUES ('489', '辽宁经济职业技术学院', 'liaoningjingjizhiyejishuxueyuan', '2', '43');
INSERT INTO `oj_school` VALUES ('490', '辽宁石化职业技术学院', 'liaoningshihuazhiyejishuxueyuan', '2', '49');
INSERT INTO `oj_school` VALUES ('491', '渤海船舶职业学院', 'bohaichuanbozhiyexueyuan', '2', '56');
INSERT INTO `oj_school` VALUES ('492', '大连软件职业学院', 'dalianruanjianzhiyexueyuan', '2', '44');
INSERT INTO `oj_school` VALUES ('493', '大连翻译职业学院', 'dalianfanyizhiyexueyuan', '2', '44');
INSERT INTO `oj_school` VALUES ('494', '辽宁商贸职业学院', 'liaoningshangmaozhiyexueyuan', '2', '43');
INSERT INTO `oj_school` VALUES ('495', '大连枫叶职业技术学院', 'dalianfengyezhiyejishuxueyuan', '2', '44');
INSERT INTO `oj_school` VALUES ('496', '辽宁装备制造职业技术学院', 'liaoningzhuangbeizhizaozhiyejishuxueyuan', '2', '43');
INSERT INTO `oj_school` VALUES ('497', '辽河石油职业技术学院', 'liaoheshiyouzhiyejishuxueyuan', '2', '53');
INSERT INTO `oj_school` VALUES ('498', '辽宁地质工程职业学院', 'liaoningdizhigongchengzhiyexueyuan', '2', '48');
INSERT INTO `oj_school` VALUES ('499', '辽宁铁道职业技术学院', 'liaoningtiedaozhiyejishuxueyuan', '2', '49');
INSERT INTO `oj_school` VALUES ('500', '辽宁建筑职业学院', 'liaoningjianzhuzhiyexueyuan', '2', '52');
INSERT INTO `oj_school` VALUES ('501', '大连航运职业技术学院', 'dalianhangyunzhiyejishuxueyuan', '2', '44');
INSERT INTO `oj_school` VALUES ('502', '大连装备制造职业技术学院', 'dalianzhuangbeizhizaozhiyejishuxueyuan', '2', '44');
INSERT INTO `oj_school` VALUES ('503', '大连汽车职业技术学院', 'dalianqichezhiyejishuxueyuan', '2', '44');
INSERT INTO `oj_school` VALUES ('504', '辽宁现代服务职业技术学院', 'liaoningxiandaifuwuzhiyejishuxueyuan', '2', '43');
INSERT INTO `oj_school` VALUES ('505', '辽宁冶金职业技术学院', 'liaoningyejinzhiyejishuxueyuan', '2', '47');
INSERT INTO `oj_school` VALUES ('506', '辽宁工程职业学院', 'liaoninggongchengzhiyexueyuan', '2', '54');
INSERT INTO `oj_school` VALUES ('507', '辽宁城市建设职业技术学院', 'liaoningchengshijianshezhiyejishuxueyuan', '2', '43');
INSERT INTO `oj_school` VALUES ('508', '辽宁医药职业学院', 'liaoningyiyaozhiyexueyuan', '2', '43');
INSERT INTO `oj_school` VALUES ('509', '铁岭卫生职业学院', 'tielingweishengzhiyexueyuan', '2', '54');
INSERT INTO `oj_school` VALUES ('510', '沈阳北软信息职业技术学院', 'shenyangbeiruanxinxizhiyejishuxueyuan', '2', '43');
INSERT INTO `oj_school` VALUES ('511', '辽宁政法职业学院', 'liaoningzhengfazhiyexueyuan', '2', '43');
INSERT INTO `oj_school` VALUES ('512', '辽宁民族师范高等专科学校', 'liaoningminzushifangaodengzhuankexuexiao', '2', '43');
INSERT INTO `oj_school` VALUES ('513', '辽宁轻工职业学院', 'liaoningqinggongzhiyexueyuan', '2', '44');
INSERT INTO `oj_school` VALUES ('514', '辽宁水利职业学院', 'liaoningshuilizhiyexueyuan', '2', '43');
INSERT INTO `oj_school` VALUES ('515', '辽宁特殊教育师范高等专科学校', 'liaoningteshujiaoyushifangaodengzhuankexuexiao', '2', '43');
INSERT INTO `oj_school` VALUES ('516', '吉林大学', 'jilindaxue', '1', '58');
INSERT INTO `oj_school` VALUES ('517', '延边大学', 'yanbiandaxue', '1', '66');
INSERT INTO `oj_school` VALUES ('518', '长春理工大学', 'changchunligongdaxue', '1', '58');
INSERT INTO `oj_school` VALUES ('519', '东北电力大学', 'dongbeidianlidaxue', '1', '59');
INSERT INTO `oj_school` VALUES ('520', '长春工业大学', 'changchungongyedaxue', '1', '58');
INSERT INTO `oj_school` VALUES ('521', '吉林建筑大学', 'jilinjianzhudaxue', '1', '58');
INSERT INTO `oj_school` VALUES ('522', '吉林化工学院', 'jilinhuagongxueyuan', '1', '59');
INSERT INTO `oj_school` VALUES ('523', '吉林农业大学', 'jilinnongyedaxue', '1', '58');
INSERT INTO `oj_school` VALUES ('524', '长春中医药大学', 'changchunzhongyiyaodaxue', '1', '58');
INSERT INTO `oj_school` VALUES ('525', '东北师范大学', 'dongbeishifandaxue', '1', '58');
INSERT INTO `oj_school` VALUES ('526', '北华大学', 'beihuadaxue', '1', '59');
INSERT INTO `oj_school` VALUES ('527', '通化师范学院', 'tonghuashifanxueyuan', '1', '62');
INSERT INTO `oj_school` VALUES ('528', '吉林师范大学', 'jilinshifandaxue', '1', '60');
INSERT INTO `oj_school` VALUES ('529', '吉林工程技术师范学院', 'jilingongchengjishushifanxueyuan', '1', '58');
INSERT INTO `oj_school` VALUES ('530', '长春师范大学', 'changchunshifandaxue', '1', '58');
INSERT INTO `oj_school` VALUES ('531', '白城师范学院', 'baichengshifanxueyuan', '1', '65');
INSERT INTO `oj_school` VALUES ('532', '吉林财经大学', 'jilincaijingdaxue', '1', '58');
INSERT INTO `oj_school` VALUES ('533', '吉林体育学院', 'jilintiyuxueyuan', '1', '58');
INSERT INTO `oj_school` VALUES ('534', '吉林艺术学院', 'jilinyishuxueyuan', '1', '58');
INSERT INTO `oj_school` VALUES ('535', '吉林华桥外国语学院', 'jilinhuaqiaowaiguoyuxueyuan', '1', '58');
INSERT INTO `oj_school` VALUES ('536', '吉林工商学院', 'jilingongshangxueyuan', '1', '58');
INSERT INTO `oj_school` VALUES ('537', '长春工程学院', 'changchungongchengxueyuan', '1', '58');
INSERT INTO `oj_school` VALUES ('538', '吉林农业科技学院', 'jilinnongyekejixueyuan', '1', '59');
INSERT INTO `oj_school` VALUES ('539', '吉林警察学院', 'jilinjingchaxueyuan', '1', '58');
INSERT INTO `oj_school` VALUES ('540', '长春大学', 'changchundaxue', '1', '58');
INSERT INTO `oj_school` VALUES ('541', '长春光华学院', 'changchunguanghuaxueyuan', '1', '58');
INSERT INTO `oj_school` VALUES ('542', '长春工业大学人文信息学院', 'changchungongyedaxuerenwenxinxixueyuan', '1', '58');
INSERT INTO `oj_school` VALUES ('543', '长春理工大学光电信息学院', 'changchunligongdaxueguangdianxinxixueyuan', '1', '58');
INSERT INTO `oj_school` VALUES ('544', '长春财经学院', 'changchuncaijingxueyuan', '1', '58');
INSERT INTO `oj_school` VALUES ('545', '吉林建筑大学城建学院', 'jilinjianzhudaxuechengjianxueyuan', '1', '58');
INSERT INTO `oj_school` VALUES ('546', '长春建筑学院', 'changchunjianzhuxueyuan', '1', '58');
INSERT INTO `oj_school` VALUES ('547', '长春科技学院', 'changchunkejixueyuan', '1', '58');
INSERT INTO `oj_school` VALUES ('548', '吉林动画学院', 'jilindonghuaxueyuan', '1', '58');
INSERT INTO `oj_school` VALUES ('549', '吉林师范大学博达学院', 'jilinshifandaxuebodaxueyuan', '1', '60');
INSERT INTO `oj_school` VALUES ('550', '长春大学旅游学院', 'changchundaxuelvyouxueyuan', '1', '58');
INSERT INTO `oj_school` VALUES ('551', '东北师范大学人文学院', 'dongbeishifandaxuerenwenxueyuan', '1', '58');
INSERT INTO `oj_school` VALUES ('552', '吉林医药学院', 'jilinyiyaoxueyuan', '1', '59');
INSERT INTO `oj_school` VALUES ('553', '长春师范高等专科学校', 'changchunshifangaodengzhuankexuexiao', '2', '58');
INSERT INTO `oj_school` VALUES ('554', '辽源职业技术学院', 'liaoyuanzhiyejishuxueyuan', '2', '61');
INSERT INTO `oj_school` VALUES ('555', '四平职业大学', 'sipingzhiyedaxue', '2', '60');
INSERT INTO `oj_school` VALUES ('556', '长春汽车工业高等专科学校', 'changchunqichegongyegaodengzhuankexuexiao', '2', '58');
INSERT INTO `oj_school` VALUES ('557', '长春金融高等专科学校', 'changchunjinronggaodengzhuankexuexiao', '2', '58');
INSERT INTO `oj_school` VALUES ('558', '长春医学高等专科学校', 'changchunyixuegaodengzhuankexuexiao', '2', '58');
INSERT INTO `oj_school` VALUES ('559', '吉林交通职业技术学院', 'jilinjiaotongzhiyejishuxueyuan', '2', '58');
INSERT INTO `oj_school` VALUES ('560', '长春东方职业学院', 'changchundongfangzhiyexueyuan', '2', '58');
INSERT INTO `oj_school` VALUES ('561', '吉林司法警官职业学院', 'jilinsifajingguanzhiyexueyuan', '2', '58');
INSERT INTO `oj_school` VALUES ('562', '吉林电子信息职业技术学院', 'jilindianzixinxizhiyejishuxueyuan', '2', '59');
INSERT INTO `oj_school` VALUES ('563', '吉林工业职业技术学院', 'jilingongyezhiyejishuxueyuan', '2', '59');
INSERT INTO `oj_school` VALUES ('564', '吉林工程职业学院', 'jilingongchengzhiyexueyuan', '2', '60');
INSERT INTO `oj_school` VALUES ('565', '长春职业技术学院', 'changchunzhiyejishuxueyuan', '2', '58');
INSERT INTO `oj_school` VALUES ('566', '白城医学高等专科学校', 'baichengyixuegaodengzhuankexuexiao', '2', '65');
INSERT INTO `oj_school` VALUES ('567', '长春信息技术职业学院', 'changchunxinxijishuzhiyexueyuan', '2', '58');
INSERT INTO `oj_school` VALUES ('568', '松原职业技术学院', 'songyuanzhiyejishuxueyuan', '2', '64');
INSERT INTO `oj_school` VALUES ('569', '吉林铁道职业技术学院', 'jilintiedaozhiyejishuxueyuan', '2', '59');
INSERT INTO `oj_school` VALUES ('570', '白城职业技术学院', 'baichengzhiyejishuxueyuan', '2', '65');
INSERT INTO `oj_school` VALUES ('571', '长白山职业技术学院', 'changbaishanzhiyejishuxueyuan', '2', '63');
INSERT INTO `oj_school` VALUES ('572', '吉林科技职业技术学院', 'jilinkejizhiyejishuxueyuan', '2', '58');
INSERT INTO `oj_school` VALUES ('573', '延边职业技术学院', 'yanbianzhiyejishuxueyuan', '2', '66');
INSERT INTO `oj_school` VALUES ('574', '吉林城市职业技术学院', 'jilinchengshizhiyejishuxueyuan', '2', '58');
INSERT INTO `oj_school` VALUES ('575', '吉林职业技术学院', 'jilinzhiyejishuxueyuan', '2', '66');
INSERT INTO `oj_school` VALUES ('576', '黑龙江大学', 'heilongjiangdaxue', '1', '68');
INSERT INTO `oj_school` VALUES ('577', '哈尔滨工业大学', 'haerbingongyedaxue', '1', '68');
INSERT INTO `oj_school` VALUES ('578', '哈尔滨理工大学', 'haerbinligongdaxue', '1', '68');
INSERT INTO `oj_school` VALUES ('579', '哈尔滨工程大学', 'haerbingongchengdaxue', '1', '68');
INSERT INTO `oj_school` VALUES ('580', '黑龙江科技大学', 'heilongjiangkejidaxue', '1', '68');
INSERT INTO `oj_school` VALUES ('581', '东北石油大学', 'dongbeishiyoudaxue', '1', '73');
INSERT INTO `oj_school` VALUES ('582', '佳木斯大学', 'jiamusidaxue', '1', '999');
INSERT INTO `oj_school` VALUES ('583', '黑龙江八一农垦大学', 'heilongjiangbayinongkendaxue', '1', '73');
INSERT INTO `oj_school` VALUES ('584', '东北农业大学', 'dongbeinongyedaxue', '1', '68');
INSERT INTO `oj_school` VALUES ('585', '东北林业大学', 'dongbeilinyedaxue', '1', '68');
INSERT INTO `oj_school` VALUES ('586', '哈尔滨医科大学', 'haerbinyikedaxue', '1', '68');
INSERT INTO `oj_school` VALUES ('587', '黑龙江中医药大学', 'heilongjiangzhongyiyaodaxue', '1', '68');
INSERT INTO `oj_school` VALUES ('588', '牡丹江医学院', 'mudanjiangyixueyuan', '1', '76');
INSERT INTO `oj_school` VALUES ('589', '哈尔滨师范大学', 'haerbinshifandaxue', '1', '68');
INSERT INTO `oj_school` VALUES ('590', '齐齐哈尔大学', 'qiqihaerdaxue', '1', '69');
INSERT INTO `oj_school` VALUES ('591', '牡丹江师范学院', 'mudanjiangshifanxueyuan', '1', '76');
INSERT INTO `oj_school` VALUES ('592', '哈尔滨学院', 'haerbinxueyuan', '1', '68');
INSERT INTO `oj_school` VALUES ('593', '大庆师范学院', 'daqingshifanxueyuan', '1', '73');
INSERT INTO `oj_school` VALUES ('594', '绥化学院', 'suihuaxueyuan', '1', '78');
INSERT INTO `oj_school` VALUES ('595', '哈尔滨商业大学', 'haerbinshangyedaxue', '1', '68');
INSERT INTO `oj_school` VALUES ('596', '哈尔滨体育学院', 'haerbintiyuxueyuan', '1', '68');
INSERT INTO `oj_school` VALUES ('597', '哈尔滨金融学院', 'haerbinjinrongxueyuan', '1', '68');
INSERT INTO `oj_school` VALUES ('598', '齐齐哈尔医学院', 'qiqihaeryixueyuan', '1', '69');
INSERT INTO `oj_school` VALUES ('599', '黑龙江工业学院', 'heilongjianggongyexueyuan', '1', '70');
INSERT INTO `oj_school` VALUES ('600', '黑龙江东方学院', 'heilongjiangdongfangxueyuan', '1', '68');
INSERT INTO `oj_school` VALUES ('601', '哈尔滨信息工程学院', 'haerbinxinxigongchengxueyuan', '1', '68');
INSERT INTO `oj_school` VALUES ('602', '黑龙江工程学院', 'heilongjianggongchengxueyuan', '1', '68');
INSERT INTO `oj_school` VALUES ('603', '齐齐哈尔工程学院', 'qiqihaergongchengxueyuan', '1', '69');
INSERT INTO `oj_school` VALUES ('604', '黑龙江外国语学院', 'heilongjiangwaiguoyuxueyuan', '1', '68');
INSERT INTO `oj_school` VALUES ('605', '黑龙江财经学院', 'heilongjiangcaijingxueyuan', '1', '68');
INSERT INTO `oj_school` VALUES ('606', '哈尔滨石油学院', 'haerbinshiyouxueyuan', '1', '68');
INSERT INTO `oj_school` VALUES ('607', '黑龙江工商学院', 'heilongjianggongshangxueyuan', '1', '68');
INSERT INTO `oj_school` VALUES ('608', '哈尔滨远东理工学院', 'haerbinyuandongligongxueyuan', '1', '68');
INSERT INTO `oj_school` VALUES ('609', '哈尔滨剑桥学院', 'haerbinjianqiaoxueyuan', '1', '68');
INSERT INTO `oj_school` VALUES ('610', '黑龙江工程学院昆仑旅游学院', 'heilongjianggongchengxueyuankunlunlvyouxueyuan', '1', '68');
INSERT INTO `oj_school` VALUES ('611', '哈尔滨广厦学院', 'haerbinguangxiaxueyuan', '1', '68');
INSERT INTO `oj_school` VALUES ('612', '哈尔滨华德学院', 'haerbinhuadexueyuan', '1', '68');
INSERT INTO `oj_school` VALUES ('613', '黑河学院', 'heihexueyuan', '1', '77');
INSERT INTO `oj_school` VALUES ('614', '哈尔滨音乐学院', 'haerbinyinlexueyuan', '1', '68');
INSERT INTO `oj_school` VALUES ('615', '齐齐哈尔高等师范专科学校', 'qiqihaergaodengshifanzhuankexuexiao', '2', '69');
INSERT INTO `oj_school` VALUES ('616', '伊春职业学院', 'yichunzhiyexueyuan', '2', '74');
INSERT INTO `oj_school` VALUES ('617', '牡丹江大学', 'mudanjiangdaxue', '2', '76');
INSERT INTO `oj_school` VALUES ('618', '黑龙江职业学院', 'heilongjiangzhiyexueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('619', '黑龙江建筑职业技术学院', 'heilongjiangjianzhuzhiyejishuxueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('620', '黑龙江艺术职业学院', 'heilongjiangyishuzhiyexueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('621', '大庆职业学院', 'daqingzhiyexueyuan', '2', '73');
INSERT INTO `oj_school` VALUES ('622', '黑龙江林业职业技术学院', 'heilongjianglinyezhiyejishuxueyuan', '2', '76');
INSERT INTO `oj_school` VALUES ('623', '黑龙江农业职业技术学院', 'heilongjiangnongyezhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('624', '黑龙江农业工程职业学院', 'heilongjiangnongyegongchengzhiyexueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('625', '黑龙江农垦职业学院', 'heilongjiangnongkenzhiyexueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('626', '黑龙江司法警官职业学院', 'heilongjiangsifajingguanzhiyexueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('627', '鹤岗师范高等专科学校', 'hegangshifangaodengzhuankexuexiao', '2', '71');
INSERT INTO `oj_school` VALUES ('628', '哈尔滨电力职业技术学院', 'haerbindianlizhiyejishuxueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('629', '哈尔滨铁道职业技术学院', 'haerbintiedaozhiyejishuxueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('630', '大兴安岭职业学院', 'daxinganlingzhiyexueyuan', '2', '79');
INSERT INTO `oj_school` VALUES ('631', '黑龙江农业经济职业学院', 'heilongjiangnongyejingjizhiyexueyuan', '2', '76');
INSERT INTO `oj_school` VALUES ('632', '哈尔滨职业技术学院', 'haerbinzhiyejishuxueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('633', '哈尔滨传媒职业学院', 'haerbinchuanmeizhiyexueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('634', '黑龙江生物科技职业学院', 'heilongjiangshengwukejizhiyexueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('635', '黑龙江商业职业学院', 'heilongjiangshangyezhiyexueyuan', '2', '76');
INSERT INTO `oj_school` VALUES ('636', '黑龙江公安警官职业学院', 'heilongjianggonganjingguanzhiyexueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('637', '黑龙江信息技术职业学院', 'heilongjiangxinxijishuzhiyexueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('638', '哈尔滨江南职业技术学院', 'haerbinjiangnanzhiyejishuxueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('639', '黑龙江农垦科技职业学院', 'heilongjiangnongkenkejizhiyexueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('640', '黑龙江旅游职业技术学院', 'heilongjianglvyouzhiyejishuxueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('641', '黑龙江三江美术职业学院', 'heilongjiangsanjiangmeishuzhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('642', '黑龙江生态工程职业学院', 'heilongjiangshengtaigongchengzhiyexueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('643', '黑龙江煤炭职业技术学院', 'heilongjiangmeitanzhiyejishuxueyuan', '2', '72');
INSERT INTO `oj_school` VALUES ('644', '七台河职业学院', 'qitaihezhiyexueyuan', '2', '75');
INSERT INTO `oj_school` VALUES ('645', '黑龙江民族职业学院', 'heilongjiangminzuzhiyexueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('646', '大庆医学高等专科学校', 'daqingyixuegaodengzhuankexuexiao', '2', '73');
INSERT INTO `oj_school` VALUES ('647', '黑龙江交通职业技术学院', 'heilongjiangjiaotongzhiyejishuxueyuan', '2', '69');
INSERT INTO `oj_school` VALUES ('648', '哈尔滨应用职业技术学院', 'haerbinyingyongzhiyejishuxueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('649', '黑龙江幼儿师范高等专科学校', 'heilongjiangyouershifangaodengzhuankexuexiao', '2', '76');
INSERT INTO `oj_school` VALUES ('650', '哈尔滨科学技术职业学院', 'haerbinkexuejishuzhiyexueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('651', '黑龙江粮食职业学院', 'heilongjiangliangshizhiyexueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('652', '佳木斯职业学院', 'jiamusizhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('653', '黑龙江护理高等专科学校', 'heilongjianghuligaodengzhuankexuexiao', '2', '68');
INSERT INTO `oj_school` VALUES ('654', '哈尔滨工程技术职业学院', 'haerbingongchengjishuzhiyexueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('655', '齐齐哈尔理工职业学院', 'qiqihaerligongzhiyexueyuan', '2', '69');
INSERT INTO `oj_school` VALUES ('656', '哈尔滨幼儿师范高等专科学校', 'haerbinyouershifangaodengzhuankexuexiao', '2', '68');
INSERT INTO `oj_school` VALUES ('657', '黑龙江冰雪体育职业学院', 'heilongjiangbingxuetiyuzhiyexueyuan', '2', '68');
INSERT INTO `oj_school` VALUES ('658', '复旦大学', 'fudandaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('659', '同济大学', 'tongjidaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('660', '上海交通大学', 'shanghaijiaotongdaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('661', '华东理工大学', 'huadongligongdaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('662', '上海理工大学', 'shanghailigongdaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('663', '上海海事大学', 'shanghaihaishidaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('664', '东华大学', 'donghuadaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('665', '上海电力学院', 'shanghaidianlixueyuan', '1', '80');
INSERT INTO `oj_school` VALUES ('666', '上海应用技术大学', 'shanghaiyingyongjishudaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('667', '上海健康医学院', 'shanghaijiankangyixueyuan', '1', '80');
INSERT INTO `oj_school` VALUES ('668', '上海海洋大学', 'shanghaihaiyangdaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('669', '上海中医药大学', 'shanghaizhongyiyaodaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('670', '华东师范大学', 'huadongshifandaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('671', '上海师范大学', 'shanghaishifandaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('672', '上海外国语大学', 'shanghaiwaiguoyudaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('673', '上海财经大学', 'shanghaicaijingdaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('674', '上海对外经贸大学', 'shanghaiduiwaijingmaodaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('675', '上海海关学院', 'shanghaihaiguanxueyuan', '1', '80');
INSERT INTO `oj_school` VALUES ('676', '华东政法大学', 'huadongzhengfadaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('677', '上海体育学院', 'shanghaitiyuxueyuan', '1', '80');
INSERT INTO `oj_school` VALUES ('678', '上海音乐学院', 'shanghaiyinlexueyuan', '1', '80');
INSERT INTO `oj_school` VALUES ('679', '上海戏剧学院', 'shanghaixijuxueyuan', '1', '80');
INSERT INTO `oj_school` VALUES ('680', '上海大学', 'shanghaidaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('681', '上海公安学院', 'shanghaigonganxueyuan', '1', '80');
INSERT INTO `oj_school` VALUES ('682', '上海工程技术大学', 'shanghaigongchengjishudaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('683', '上海立信会计金融学院', 'shanghailixinhuijijinrongxueyuan', '1', '80');
INSERT INTO `oj_school` VALUES ('684', '上海电机学院', 'shanghaidianjixueyuan', '1', '80');
INSERT INTO `oj_school` VALUES ('685', '上海杉达学院', 'shanghaishandaxueyuan', '1', '80');
INSERT INTO `oj_school` VALUES ('686', '上海政法学院', 'shanghaizhengfaxueyuan', '1', '80');
INSERT INTO `oj_school` VALUES ('687', '上海第二工业大学', 'shanghaidiergongyedaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('688', '上海商学院', 'shanghaishangxueyuan', '1', '80');
INSERT INTO `oj_school` VALUES ('689', '上海建桥学院', 'shanghaijianqiaoxueyuan', '1', '80');
INSERT INTO `oj_school` VALUES ('690', '上海兴伟学院', 'shanghaixingweixueyuan', '1', '80');
INSERT INTO `oj_school` VALUES ('691', '上海视觉艺术学院', 'shanghaishijueyishuxueyuan', '1', '80');
INSERT INTO `oj_school` VALUES ('692', '上海外国语大学贤达经济人文学院', 'shanghaiwaiguoyudaxuexiandajingjirenwenxueyuan', '1', '80');
INSERT INTO `oj_school` VALUES ('693', '上海师范大学天华学院', 'shanghaishifandaxuetianhuaxueyuan', '1', '80');
INSERT INTO `oj_school` VALUES ('694', '上海科技大学', 'shanghaikejidaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('695', '上海纽约大学', 'shanghainiuyuedaxue', '1', '80');
INSERT INTO `oj_school` VALUES ('696', '上海旅游高等专科学校', 'shanghailvyougaodengzhuankexuexiao', '2', '80');
INSERT INTO `oj_school` VALUES ('697', '上海东海职业技术学院', 'shanghaidonghaizhiyejishuxueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('698', '上海工商职业技术学院', 'shanghaigongshangzhiyejishuxueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('699', '上海出版印刷高等专科学校', 'shanghaichubanyinshuagaodengzhuankexuexiao', '2', '80');
INSERT INTO `oj_school` VALUES ('700', '上海行健职业学院', 'shanghaixingjianzhiyexueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('701', '上海城建职业学院', 'shanghaichengjianzhiyexueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('702', '上海交通职业技术学院', 'shanghaijiaotongzhiyejishuxueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('703', '上海海事职业技术学院', 'shanghaihaishizhiyejishuxueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('704', '上海电子信息职业技术学院', 'shanghaidianzixinxizhiyejishuxueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('705', '上海震旦职业学院', 'shanghaizhendanzhiyexueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('706', '上海民远职业技术学院', 'shanghaiminyuanzhiyejishuxueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('707', '上海欧华职业技术学院', 'shanghaiouhuazhiyejishuxueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('708', '上海思博职业技术学院', 'shanghaisibozhiyejishuxueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('709', '上海立达职业技术学院', 'shanghailidazhiyejishuxueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('710', '上海工艺美术职业学院', 'shanghaigongyimeishuzhiyexueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('711', '上海济光职业技术学院', 'shanghaijiguangzhiyejishuxueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('712', '上海工商外国语职业学院', 'shanghaigongshangwaiguoyuzhiyexueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('713', '上海科学技术职业学院', 'shanghaikexuejishuzhiyexueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('714', '上海农林职业技术学院', 'shanghainonglinzhiyejishuxueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('715', '上海邦德职业技术学院', 'shanghaibangdezhiyejishuxueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('716', '上海中侨职业技术学院', 'shanghaizhongqiaozhiyejishuxueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('717', '上海电影艺术职业学院', 'shanghaidianyingyishuzhiyexueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('718', '上海中华职业技术学院', 'shanghaizhonghuazhiyejishuxueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('719', '上海工会管理职业学院', 'shanghaigonghuiguanlizhiyexueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('720', '上海体育职业学院', 'shanghaitiyuzhiyexueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('721', '上海民航职业技术学院', 'shanghaiminhangzhiyejishuxueyuan', '2', '80');
INSERT INTO `oj_school` VALUES ('722', '南京大学', 'nanjingdaxue', '1', '83');
INSERT INTO `oj_school` VALUES ('723', '苏州大学', 'suzhoudaxue', '1', '87');
INSERT INTO `oj_school` VALUES ('724', '东南大学', 'dongnandaxue', '1', '83');
INSERT INTO `oj_school` VALUES ('725', '南京航空航天大学', 'nanjinghangkonghangtiandaxue', '1', '83');
INSERT INTO `oj_school` VALUES ('726', '南京理工大学', 'nanjingligongdaxue', '1', '83');
INSERT INTO `oj_school` VALUES ('727', '江苏科技大学', 'jiangsukejidaxue', '1', '93');
INSERT INTO `oj_school` VALUES ('728', '中国矿业大学', 'zhongguokuangyedaxue', '1', '85');
INSERT INTO `oj_school` VALUES ('729', '南京工业大学', 'nanjinggongyedaxue', '1', '83');
INSERT INTO `oj_school` VALUES ('730', '常州大学', 'changzhoudaxue', '1', '86');
INSERT INTO `oj_school` VALUES ('731', '南京邮电大学', 'nanjingyoudiandaxue', '1', '83');
INSERT INTO `oj_school` VALUES ('732', '河海大学', 'hehaidaxue', '1', '83');
INSERT INTO `oj_school` VALUES ('733', '江南大学', 'jiangnandaxue', '1', '84');
INSERT INTO `oj_school` VALUES ('734', '南京林业大学', 'nanjinglinyedaxue', '1', '83');
INSERT INTO `oj_school` VALUES ('735', '江苏大学', 'jiangsudaxue', '1', '93');
INSERT INTO `oj_school` VALUES ('736', '南京信息工程大学', 'nanjingxinxigongchengdaxue', '1', '83');
INSERT INTO `oj_school` VALUES ('737', '南通大学', 'nantongdaxue', '1', '88');
INSERT INTO `oj_school` VALUES ('738', '盐城工学院', 'yanchenggongxueyuan', '1', '91');
INSERT INTO `oj_school` VALUES ('739', '南京农业大学', 'nanjingnongyedaxue', '1', '83');
INSERT INTO `oj_school` VALUES ('740', '南京医科大学', 'nanjingyikedaxue', '1', '83');
INSERT INTO `oj_school` VALUES ('741', '徐州医科大学', 'xuzhouyikedaxue', '1', '85');
INSERT INTO `oj_school` VALUES ('742', '南京中医药大学', 'nanjingzhongyiyaodaxue', '1', '83');
INSERT INTO `oj_school` VALUES ('743', '中国药科大学', 'zhongguoyaokedaxue', '1', '83');
INSERT INTO `oj_school` VALUES ('744', '南京师范大学', 'nanjingshifandaxue', '1', '83');
INSERT INTO `oj_school` VALUES ('745', '江苏师范大学', 'jiangsushifandaxue', '1', '85');
INSERT INTO `oj_school` VALUES ('746', '淮阴师范学院', 'huaiyinshifanxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('747', '盐城师范学院', 'yanchengshifanxueyuan', '1', '91');
INSERT INTO `oj_school` VALUES ('748', '南京财经大学', 'nanjingcaijingdaxue', '1', '83');
INSERT INTO `oj_school` VALUES ('749', '江苏警官学院', 'jiangsujingguanxueyuan', '1', '83');
INSERT INTO `oj_school` VALUES ('750', '南京体育学院', 'nanjingtiyuxueyuan', '1', '83');
INSERT INTO `oj_school` VALUES ('751', '南京艺术学院', 'nanjingyishuxueyuan', '1', '83');
INSERT INTO `oj_school` VALUES ('752', '苏州科技大学', 'suzhoukejidaxue', '1', '87');
INSERT INTO `oj_school` VALUES ('753', '常熟理工学院', 'changshuligongxueyuan', '1', '87');
INSERT INTO `oj_school` VALUES ('754', '淮阴工学院', 'huaiyingongxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('755', '常州工学院', 'changzhougongxueyuan', '1', '86');
INSERT INTO `oj_school` VALUES ('756', '扬州大学', 'yangzhoudaxue', '1', '92');
INSERT INTO `oj_school` VALUES ('757', '三江学院', 'sanjiangxueyuan', '1', '83');
INSERT INTO `oj_school` VALUES ('758', '南京工程学院', 'nanjinggongchengxueyuan', '1', '83');
INSERT INTO `oj_school` VALUES ('759', '南京审计大学', 'nanjingshenjidaxue', '1', '83');
INSERT INTO `oj_school` VALUES ('760', '南京晓庄学院', 'nanjingxiaozhuangxueyuan', '1', '83');
INSERT INTO `oj_school` VALUES ('761', '江苏理工学院', 'jiangsuligongxueyuan', '1', '86');
INSERT INTO `oj_school` VALUES ('762', '淮海工学院', 'huaihaigongxueyuan', '1', '89');
INSERT INTO `oj_school` VALUES ('763', '徐州工程学院', 'xuzhougongchengxueyuan', '1', '85');
INSERT INTO `oj_school` VALUES ('764', '南京特殊教育师范学院', 'nanjingteshujiaoyushifanxueyuan', '1', '83');
INSERT INTO `oj_school` VALUES ('765', '南通理工学院', 'nantongligongxueyuan', '1', '88');
INSERT INTO `oj_school` VALUES ('766', '南京森林警察学院', 'nanjingsenlinjingchaxueyuan', '1', '83');
INSERT INTO `oj_school` VALUES ('767', '东南大学成贤学院', 'dongnandaxuechengxianxueyuan', '1', '83');
INSERT INTO `oj_school` VALUES ('768', '泰州学院', 'taizhouxueyuan', '1', '94');
INSERT INTO `oj_school` VALUES ('769', '无锡太湖学院', 'wuxitaihuxueyuan', '1', '84');
INSERT INTO `oj_school` VALUES ('770', '金陵科技学院', 'jinlingkejixueyuan', '1', '83');
INSERT INTO `oj_school` VALUES ('771', '中国矿业大学徐海学院', 'zhongguokuangyedaxuexuhaixueyuan', '1', '85');
INSERT INTO `oj_school` VALUES ('772', '南京大学金陵学院', 'nanjingdaxuejinlingxueyuan', '1', '83');
INSERT INTO `oj_school` VALUES ('773', '南京理工大学紫金学院', 'nanjingligongdaxuezijinxueyuan', '1', '83');
INSERT INTO `oj_school` VALUES ('774', '南京航空航天大学金城学院', 'nanjinghangkonghangtiandaxuejinchengxueyuan', '1', '83');
INSERT INTO `oj_school` VALUES ('775', '中国传媒大学南广学院', 'zhongguochuanmeidaxuenanguangxueyuan', '1', '83');
INSERT INTO `oj_school` VALUES ('776', '南京理工大学泰州科技学院', 'nanjingligongdaxuetaizhoukejixueyuan', '1', '94');
INSERT INTO `oj_school` VALUES ('777', '南京师范大学泰州学院', 'nanjingshifandaxuetaizhouxueyuan', '1', '94');
INSERT INTO `oj_school` VALUES ('778', '南京工业大学浦江学院', 'nanjinggongyedaxuepujiangxueyuan', '1', '83');
INSERT INTO `oj_school` VALUES ('779', '南京师范大学中北学院', 'nanjingshifandaxuezhongbeixueyuan', '1', '83');
INSERT INTO `oj_school` VALUES ('780', '南京医科大学康达学院', 'nanjingyikedaxuekangdaxueyuan', '1', '89');
INSERT INTO `oj_school` VALUES ('781', '南京中医药大学翰林学院', 'nanjingzhongyiyaodaxuehanlinxueyuan', '1', '94');
INSERT INTO `oj_school` VALUES ('782', '南京信息工程大学滨江学院', 'nanjingxinxigongchengdaxuebinjiangxueyuan', '1', '83');
INSERT INTO `oj_school` VALUES ('783', '苏州大学文正学院', 'suzhoudaxuewenzhengxueyuan', '1', '87');
INSERT INTO `oj_school` VALUES ('784', '苏州大学应用技术学院', 'suzhoudaxueyingyongjishuxueyuan', '1', '87');
INSERT INTO `oj_school` VALUES ('785', '苏州科技大学天平学院', 'suzhoukejidaxuetianpingxueyuan', '1', '87');
INSERT INTO `oj_school` VALUES ('786', '江苏大学京江学院', 'jiangsudaxuejingjiangxueyuan', '1', '93');
INSERT INTO `oj_school` VALUES ('787', '扬州大学广陵学院', 'yangzhoudaxueguanglingxueyuan', '1', '92');
INSERT INTO `oj_school` VALUES ('788', '江苏师范大学科文学院', 'jiangsushifandaxuekewenxueyuan', '1', '85');
INSERT INTO `oj_school` VALUES ('789', '南京邮电大学通达学院', 'nanjingyoudiandaxuetongdaxueyuan', '1', '92');
INSERT INTO `oj_school` VALUES ('790', '南京财经大学红山学院', 'nanjingcaijingdaxuehongshanxueyuan', '1', '93');
INSERT INTO `oj_school` VALUES ('791', '江苏科技大学苏州理工学院', 'jiangsukejidaxuesuzhouligongxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('792', '常州大学怀德学院', 'changzhoudaxuehuaidexueyuan', '1', '94');
INSERT INTO `oj_school` VALUES ('793', '南通大学杏林学院', 'nantongdaxuexinglinxueyuan', '1', '88');
INSERT INTO `oj_school` VALUES ('794', '南京审计大学金审学院', 'nanjingshenjidaxuejinshenxueyuan', '1', '83');
INSERT INTO `oj_school` VALUES ('795', '宿迁学院', 'suqianxueyuan', '1', '95');
INSERT INTO `oj_school` VALUES ('796', '江苏第二师范学院', 'jiangsudiershifanxueyuan', '1', '83');
INSERT INTO `oj_school` VALUES ('797', '西交利物浦大学', 'xijiaoliwupudaxue', '1', '87');
INSERT INTO `oj_school` VALUES ('798', '昆山杜克大学', 'kunshandukedaxue', '1', '87');
INSERT INTO `oj_school` VALUES ('799', '盐城幼儿师范高等专科学校', 'yanchengyouershifangaodengzhuankexuexiao', '2', '91');
INSERT INTO `oj_school` VALUES ('800', '苏州幼儿师范高等专科学校', 'suzhouyouershifangaodengzhuankexuexiao', '2', '87');
INSERT INTO `oj_school` VALUES ('801', '民办明达职业技术学院', 'minbanmingdazhiyejishuxueyuan', '2', '91');
INSERT INTO `oj_school` VALUES ('802', '无锡职业技术学院', 'wuxizhiyejishuxueyuan', '2', '84');
INSERT INTO `oj_school` VALUES ('803', '江苏建筑职业技术学院', 'jiangsujianzhuzhiyejishuxueyuan', '2', '85');
INSERT INTO `oj_school` VALUES ('804', '南京工业职业技术学院', 'nanjinggongyezhiyejishuxueyuan', '2', '83');
INSERT INTO `oj_school` VALUES ('805', '江苏工程职业技术学院', 'jiangsugongchengzhiyejishuxueyuan', '2', '88');
INSERT INTO `oj_school` VALUES ('806', '苏州工艺美术职业技术学院', 'suzhougongyimeishuzhiyejishuxueyuan', '2', '87');
INSERT INTO `oj_school` VALUES ('807', '连云港职业技术学院', 'lianyungangzhiyejishuxueyuan', '2', '89');
INSERT INTO `oj_school` VALUES ('808', '镇江市高等专科学校', 'zhenjiangshigaodengzhuankexuexiao', '2', '93');
INSERT INTO `oj_school` VALUES ('809', '南通职业大学', 'nantongzhiyedaxue', '2', '88');
INSERT INTO `oj_school` VALUES ('810', '苏州职业大学', 'suzhouzhiyedaxue', '2', '87');
INSERT INTO `oj_school` VALUES ('811', '沙洲职业工学院', 'shazhouzhiyegongxueyuan', '2', '87');
INSERT INTO `oj_school` VALUES ('812', '扬州市职业大学', 'yangzhoushizhiyedaxue', '2', '92');
INSERT INTO `oj_school` VALUES ('813', '连云港师范高等专科学校', 'lianyungangshifangaodengzhuankexuexiao', '2', '89');
INSERT INTO `oj_school` VALUES ('814', '江苏经贸职业技术学院', 'jiangsujingmaozhiyejishuxueyuan', '2', '83');
INSERT INTO `oj_school` VALUES ('815', '九州职业技术学院', 'jiuzhouzhiyejishuxueyuan', '2', '85');
INSERT INTO `oj_school` VALUES ('816', '硅湖职业技术学院', 'guihuzhiyejishuxueyuan', '2', '87');
INSERT INTO `oj_school` VALUES ('817', '泰州职业技术学院', 'taizhouzhiyejishuxueyuan', '2', '94');
INSERT INTO `oj_school` VALUES ('818', '常州信息职业技术学院', 'changzhouxinxizhiyejishuxueyuan', '2', '86');
INSERT INTO `oj_school` VALUES ('819', '江苏联合职业技术学院', 'jiangsulianhezhiyejishuxueyuan', '2', '83');
INSERT INTO `oj_school` VALUES ('820', '江苏海事职业技术学院', 'jiangsuhaishizhiyejishuxueyuan', '2', '83');
INSERT INTO `oj_school` VALUES ('821', '应天职业技术学院', 'yingtianzhiyejishuxueyuan', '2', '83');
INSERT INTO `oj_school` VALUES ('822', '无锡科技职业学院', 'wuxikejizhiyexueyuan', '2', '84');
INSERT INTO `oj_school` VALUES ('823', '盐城卫生职业技术学院', 'yanchengweishengzhiyejishuxueyuan', '2', '91');
INSERT INTO `oj_school` VALUES ('824', '扬州环境资源职业技术学院', 'yangzhouhuanjingziyuanzhiyejishuxueyuan', '2', '92');
INSERT INTO `oj_school` VALUES ('825', '南通科技职业学院', 'nantongkejizhiyexueyuan', '2', '88');
INSERT INTO `oj_school` VALUES ('826', '苏州经贸职业技术学院', 'suzhoujingmaozhiyejishuxueyuan', '2', '87');
INSERT INTO `oj_school` VALUES ('827', '苏州工业职业技术学院', 'suzhougongyezhiyejishuxueyuan', '2', '87');
INSERT INTO `oj_school` VALUES ('828', '苏州托普信息职业技术学院', 'suzhoutuopuxinxizhiyejishuxueyuan', '2', '87');
INSERT INTO `oj_school` VALUES ('829', '苏州卫生职业技术学院', 'suzhouweishengzhiyejishuxueyuan', '2', '87');
INSERT INTO `oj_school` VALUES ('830', '无锡商业职业技术学院', 'wuxishangyezhiyejishuxueyuan', '2', '84');
INSERT INTO `oj_school` VALUES ('831', '南通航运职业技术学院', 'nantonghangyunzhiyejishuxueyuan', '2', '88');
INSERT INTO `oj_school` VALUES ('832', '南京交通职业技术学院', 'nanjingjiaotongzhiyejishuxueyuan', '2', '83');
INSERT INTO `oj_school` VALUES ('833', '淮安信息职业技术学院', 'huaianxinxizhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('834', '江苏农牧科技职业学院', 'jiangsunongmukejizhiyexueyuan', '2', '94');
INSERT INTO `oj_school` VALUES ('835', '常州纺织服装职业技术学院', 'changzhoufangzhifuzhuangzhiyejishuxueyuan', '2', '86');
INSERT INTO `oj_school` VALUES ('836', '苏州农业职业技术学院', 'suzhounongyezhiyejishuxueyuan', '2', '87');
INSERT INTO `oj_school` VALUES ('837', '苏州工业园区职业技术学院', 'suzhougongyeyuanquzhiyejishuxueyuan', '2', '87');
INSERT INTO `oj_school` VALUES ('838', '太湖创意职业技术学院', 'taihuchuangyizhiyejishuxueyuan', '2', '84');
INSERT INTO `oj_school` VALUES ('839', '炎黄职业技术学院', 'yanhuangzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('840', '南京科技职业学院', 'nanjingkejizhiyexueyuan', '2', '83');
INSERT INTO `oj_school` VALUES ('841', '正德职业技术学院', 'zhengdezhiyejishuxueyuan', '2', '83');
INSERT INTO `oj_school` VALUES ('842', '钟山职业技术学院', 'zhongshanzhiyejishuxueyuan', '2', '83');
INSERT INTO `oj_school` VALUES ('843', '无锡南洋职业技术学院', 'wuxinanyangzhiyejishuxueyuan', '2', '84');
INSERT INTO `oj_school` VALUES ('844', '江南影视艺术职业学院', 'jiangnanyingshiyishuzhiyexueyuan', '2', '84');
INSERT INTO `oj_school` VALUES ('845', '金肯职业技术学院', 'jinkenzhiyejishuxueyuan', '2', '83');
INSERT INTO `oj_school` VALUES ('846', '常州轻工职业技术学院', 'changzhouqinggongzhiyejishuxueyuan', '2', '86');
INSERT INTO `oj_school` VALUES ('847', '常州工程职业技术学院', 'changzhougongchengzhiyejishuxueyuan', '2', '86');
INSERT INTO `oj_school` VALUES ('848', '江苏农林职业技术学院', 'jiangsunonglinzhiyejishuxueyuan', '2', '93');
INSERT INTO `oj_school` VALUES ('849', '江苏食品药品职业技术学院', 'jiangsushipinyaopinzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('850', '建东职业技术学院', 'jiandongzhiyejishuxueyuan', '2', '86');
INSERT INTO `oj_school` VALUES ('851', '南京铁道职业技术学院', 'nanjingtiedaozhiyejishuxueyuan', '2', '83');
INSERT INTO `oj_school` VALUES ('852', '徐州工业职业技术学院', 'xuzhougongyezhiyejishuxueyuan', '2', '85');
INSERT INTO `oj_school` VALUES ('853', '江苏信息职业技术学院', 'jiangsuxinxizhiyejishuxueyuan', '2', '84');
INSERT INTO `oj_school` VALUES ('854', '宿迁职业技术学院', 'suqianzhiyejishuxueyuan', '2', '95');
INSERT INTO `oj_school` VALUES ('855', '南京信息职业技术学院', 'nanjingxinxizhiyejishuxueyuan', '2', '83');
INSERT INTO `oj_school` VALUES ('856', '江海职业技术学院', 'jianghaizhiyejishuxueyuan', '2', '92');
INSERT INTO `oj_school` VALUES ('857', '常州机电职业技术学院', 'changzhoujidianzhiyejishuxueyuan', '2', '86');
INSERT INTO `oj_school` VALUES ('858', '江阴职业技术学院', 'jiangyinzhiyejishuxueyuan', '2', '84');
INSERT INTO `oj_school` VALUES ('859', '无锡城市职业技术学院', 'wuxichengshizhiyejishuxueyuan', '2', '84');
INSERT INTO `oj_school` VALUES ('860', '无锡工艺职业技术学院', 'wuxigongyizhiyejishuxueyuan', '2', '84');
INSERT INTO `oj_school` VALUES ('861', '金山职业技术学院', 'jinshanzhiyejishuxueyuan', '2', '93');
INSERT INTO `oj_school` VALUES ('862', '苏州健雄职业技术学院', 'suzhoujianxiongzhiyejishuxueyuan', '2', '87');
INSERT INTO `oj_school` VALUES ('863', '盐城工业职业技术学院', 'yanchenggongyezhiyejishuxueyuan', '2', '91');
INSERT INTO `oj_school` VALUES ('864', '江苏财经职业技术学院', 'jiangsucaijingzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('865', '扬州工业职业技术学院', 'yangzhougongyezhiyejishuxueyuan', '2', '92');
INSERT INTO `oj_school` VALUES ('866', '苏州港大思培科技职业学院', 'suzhougangdasipeikejizhiyexueyuan', '2', '87');
INSERT INTO `oj_school` VALUES ('867', '昆山登云科技职业学院', 'kunshandengyunkejizhiyexueyuan', '2', '87');
INSERT INTO `oj_school` VALUES ('868', '南京视觉艺术职业学院', 'nanjingshijueyishuzhiyexueyuan', '2', '83');
INSERT INTO `oj_school` VALUES ('869', '江苏城市职业学院', 'jiangsuchengshizhiyexueyuan', '2', '83');
INSERT INTO `oj_school` VALUES ('870', '南京城市职业学院', 'nanjingchengshizhiyexueyuan', '2', '83');
INSERT INTO `oj_school` VALUES ('871', '南京机电职业技术学院', 'nanjingjidianzhiyejishuxueyuan', '2', '83');
INSERT INTO `oj_school` VALUES ('872', '苏州高博软件技术职业学院', 'suzhougaoboruanjianjishuzhiyexueyuan', '2', '87');
INSERT INTO `oj_school` VALUES ('873', '南京旅游职业学院', 'nanjinglvyouzhiyexueyuan', '2', '83');
INSERT INTO `oj_school` VALUES ('874', '江苏建康职业学院', 'jiangsujiankangzhiyexueyuan', '2', '83');
INSERT INTO `oj_school` VALUES ('875', '苏州信息职业技术学院', 'suzhouxinxizhiyejishuxueyuan', '2', '87');
INSERT INTO `oj_school` VALUES ('876', '宿迁泽达职业技术学院', 'suqianzedazhiyejishuxueyuan', '2', '95');
INSERT INTO `oj_school` VALUES ('877', '苏州工业园区服务外包职业学院', 'suzhougongyeyuanqufuwuwaibaozhiyexueyuan', '2', '87');
INSERT INTO `oj_school` VALUES ('878', '徐州幼儿师范高等专科学校', 'xuzhouyouershifangaodengzhuankexuexiao', '2', '85');
INSERT INTO `oj_school` VALUES ('879', '徐州生物工程职业技术学院', 'xuzhoushengwugongchengzhiyejishuxueyuan', '2', '85');
INSERT INTO `oj_school` VALUES ('880', '江苏商贸职业学院', 'jiangsushangmaozhiyexueyuan', '2', '88');
INSERT INTO `oj_school` VALUES ('881', '南通师范高等专科学校', 'nantongshifangaodengzhuankexuexiao', '2', '88');
INSERT INTO `oj_school` VALUES ('882', '扬州中瑞酒店职业学院', 'yangzhouzhongruijiudianzhiyexueyuan', '2', '92');
INSERT INTO `oj_school` VALUES ('883', '江苏护理职业学院', 'jiangsuhulizhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('884', '江苏财会职业学院', 'jiangsucaihuizhiyexueyuan', '2', '89');
INSERT INTO `oj_school` VALUES ('885', '江苏城乡建设职业学院', 'jiangsuchengxiangjianshezhiyexueyuan', '2', '86');
INSERT INTO `oj_school` VALUES ('886', '江苏航空职业技术学院', 'jiangsuhangkongzhiyejishuxueyuan', '2', '93');
INSERT INTO `oj_school` VALUES ('887', '江苏安全技术职业学院', 'jiangsuanquanjishuzhiyexueyuan', '2', '85');
INSERT INTO `oj_school` VALUES ('888', '浙江大学', 'zhejiangdaxue', '1', '97');
INSERT INTO `oj_school` VALUES ('889', '杭州电子科技大学', 'hangzhoudianzikejidaxue', '1', '97');
INSERT INTO `oj_school` VALUES ('890', '浙江工业大学', 'zhejianggongyedaxue', '1', '97');
INSERT INTO `oj_school` VALUES ('891', '浙江理工大学', 'zhejiangligongdaxue', '1', '97');
INSERT INTO `oj_school` VALUES ('892', '浙江海洋大学', 'zhejianghaiyangdaxue', '1', '105');
INSERT INTO `oj_school` VALUES ('893', '浙江农林大学', 'zhejiangnonglindaxue', '1', '97');
INSERT INTO `oj_school` VALUES ('894', '温州医科大学', 'wenzhouyikedaxue', '1', '99');
INSERT INTO `oj_school` VALUES ('895', '浙江中医药大学', 'zhejiangzhongyiyaodaxue', '1', '97');
INSERT INTO `oj_school` VALUES ('896', '浙江师范大学', 'zhejiangshifandaxue', '1', '103');
INSERT INTO `oj_school` VALUES ('897', '杭州师范大学', 'hangzhoushifandaxue', '1', '97');
INSERT INTO `oj_school` VALUES ('898', '湖州师范学院', 'huzhoushifanxueyuan', '1', '101');
INSERT INTO `oj_school` VALUES ('899', '绍兴文理学院', 'shaoxingwenlixueyuan', '1', '102');
INSERT INTO `oj_school` VALUES ('900', '台州学院', 'taizhouxueyuan', '1', '106');
INSERT INTO `oj_school` VALUES ('901', '温州大学', 'wenzhoudaxue', '1', '99');
INSERT INTO `oj_school` VALUES ('902', '丽水学院', 'lishuixueyuan', '1', '107');
INSERT INTO `oj_school` VALUES ('903', '浙江工商大学', 'zhejianggongshangdaxue', '1', '97');
INSERT INTO `oj_school` VALUES ('904', '嘉兴学院', 'jiaxingxueyuan', '1', '100');
INSERT INTO `oj_school` VALUES ('905', '中国美术学院', 'zhongguomeishuxueyuan', '1', '97');
INSERT INTO `oj_school` VALUES ('906', '中国计量大学', 'zhongguojiliangdaxue', '1', '97');
INSERT INTO `oj_school` VALUES ('907', '公安海警学院', 'gonganhaijingxueyuan', '1', '98');
INSERT INTO `oj_school` VALUES ('908', '浙江万里学院', 'zhejiangwanlixueyuan', '1', '98');
INSERT INTO `oj_school` VALUES ('909', '浙江科技学院', 'zhejiangkejixueyuan', '1', '97');
INSERT INTO `oj_school` VALUES ('910', '宁波工程学院', 'ningbogongchengxueyuan', '1', '98');
INSERT INTO `oj_school` VALUES ('911', '浙江水利水电学院', 'zhejiangshuilishuidianxueyuan', '1', '97');
INSERT INTO `oj_school` VALUES ('912', '浙江财经大学', 'zhejiangcaijingdaxue', '1', '97');
INSERT INTO `oj_school` VALUES ('913', '浙江警察学院', 'zhejiangjingchaxueyuan', '1', '97');
INSERT INTO `oj_school` VALUES ('914', '衢州学院', 'quzhouxueyuan', '1', '104');
INSERT INTO `oj_school` VALUES ('915', '宁波大学', 'ningbodaxue', '1', '98');
INSERT INTO `oj_school` VALUES ('916', '浙江传媒学院', 'zhejiangchuanmeixueyuan', '1', '97');
INSERT INTO `oj_school` VALUES ('917', '浙江树人学院', 'zhejiangshurenxueyuan', '1', '97');
INSERT INTO `oj_school` VALUES ('918', '浙江越秀外国语学院', 'zhejiangyuexiuwaiguoyuxueyuan', '1', '102');
INSERT INTO `oj_school` VALUES ('919', '宁波大红鹰学院', 'ningbodahongyingxueyuan', '1', '98');
INSERT INTO `oj_school` VALUES ('920', '浙江大学城市学院', 'zhejiangdaxuechengshixueyuan', '1', '97');
INSERT INTO `oj_school` VALUES ('921', '浙江大学宁波理工学院', 'zhejiangdaxueningboligongxueyuan', '1', '98');
INSERT INTO `oj_school` VALUES ('922', '杭州医学院', 'hangzhouyixueyuan', '1', '97');
INSERT INTO `oj_school` VALUES ('923', '浙江工业大学之江学院', 'zhejianggongyedaxuezhijiangxueyuan', '1', '97');
INSERT INTO `oj_school` VALUES ('924', '浙江师范大学行知学院', 'zhejiangshifandaxuexingzhixueyuan', '1', '103');
INSERT INTO `oj_school` VALUES ('925', '宁波大学科学技术学院', 'ningbodaxuekexuejishuxueyuan', '1', '98');
INSERT INTO `oj_school` VALUES ('926', '杭州电子科技大学信息工程学院', 'hangzhoudianzikejidaxuexinxigongchengxueyuan', '1', '97');
INSERT INTO `oj_school` VALUES ('927', '浙江理工大学科技与艺术学院', 'zhejiangligongdaxuekejiyuyishuxueyuan', '1', '97');
INSERT INTO `oj_school` VALUES ('928', '浙江海洋大学东海科学技术学院', 'zhejianghaiyangdaxuedonghaikexuejishuxueyuan', '1', '105');
INSERT INTO `oj_school` VALUES ('929', '浙江农林大学暨阳学院', 'zhejiangnonglindaxuejiyangxueyuan', '1', '102');
INSERT INTO `oj_school` VALUES ('930', '温州医科大学仁济学院', 'wenzhouyikedaxuerenjixueyuan', '1', '99');
INSERT INTO `oj_school` VALUES ('931', '浙江中医药大学滨江学院', 'zhejiangzhongyiyaodaxuebinjiangxueyuan', '1', '97');
INSERT INTO `oj_school` VALUES ('932', '杭州师范大学钱江学院', 'hangzhoushifandaxueqianjiangxueyuan', '1', '97');
INSERT INTO `oj_school` VALUES ('933', '湖州师范学院求真学院', 'huzhoushifanxueyuanqiuzhenxueyuan', '1', '101');
INSERT INTO `oj_school` VALUES ('934', '绍兴文理学院元培学院', 'shaoxingwenlixueyuanyuanpeixueyuan', '1', '102');
INSERT INTO `oj_school` VALUES ('935', '温州大学瓯江学院', 'wenzhoudaxueoujiangxueyuan', '1', '99');
INSERT INTO `oj_school` VALUES ('936', '浙江工商大学杭州商学院', 'zhejianggongshangdaxuehangzhoushangxueyuan', '1', '97');
INSERT INTO `oj_school` VALUES ('937', '嘉兴学院南湖学院', 'jiaxingxueyuannanhuxueyuan', '1', '100');
INSERT INTO `oj_school` VALUES ('938', '中国计量大学现代科技学院', 'zhongguojiliangdaxuexiandaikejixueyuan', '1', '97');
INSERT INTO `oj_school` VALUES ('939', '浙江财经大学东方学院', 'zhejiangcaijingdaxuedongfangxueyuan', '1', '100');
INSERT INTO `oj_school` VALUES ('940', '温州商学院', 'wenzhoushangxueyuan', '1', '99');
INSERT INTO `oj_school` VALUES ('941', '同济大学浙江学院', 'tongjidaxuezhejiangxueyuan', '1', '100');
INSERT INTO `oj_school` VALUES ('942', '上海财经大学浙江学院', 'shanghaicaijingdaxuezhejiangxueyuan', '1', '103');
INSERT INTO `oj_school` VALUES ('943', '浙江外国语学院', 'zhejiangwaiguoyuxueyuan', '1', '97');
INSERT INTO `oj_school` VALUES ('944', '浙江音乐学院', 'zhejiangyinlexueyuan', '1', '97');
INSERT INTO `oj_school` VALUES ('945', '宁波诺丁汉大学', 'ningbonuodinghandaxue', '1', '98');
INSERT INTO `oj_school` VALUES ('946', '温州肯恩大学', 'wenzhoukenendaxue', '1', '99');
INSERT INTO `oj_school` VALUES ('947', '宁波职业技术学院', 'ningbozhiyejishuxueyuan', '2', '98');
INSERT INTO `oj_school` VALUES ('948', '温州职业技术学院', 'wenzhouzhiyejishuxueyuan', '2', '99');
INSERT INTO `oj_school` VALUES ('949', '浙江交通职业技术学院', 'zhejiangjiaotongzhiyejishuxueyuan', '2', '97');
INSERT INTO `oj_school` VALUES ('950', '金华职业技术学院', 'jinhuazhiyejishuxueyuan', '2', '103');
INSERT INTO `oj_school` VALUES ('951', '宁波城市职业技术学院', 'ningbochengshizhiyejishuxueyuan', '2', '98');
INSERT INTO `oj_school` VALUES ('952', '浙江电力职业技术学院', 'zhejiangdianlizhiyejishuxueyuan', '2', '97');
INSERT INTO `oj_school` VALUES ('953', '浙江同济科技职业学院', 'zhejiangtongjikejizhiyexueyuan', '2', '97');
INSERT INTO `oj_school` VALUES ('954', '浙江工商职业技术学院', 'zhejianggongshangzhiyejishuxueyuan', '2', '98');
INSERT INTO `oj_school` VALUES ('955', '台州职业技术学院', 'taizhouzhiyejishuxueyuan', '2', '106');
INSERT INTO `oj_school` VALUES ('956', '浙江工贸职业技术学院', 'zhejianggongmaozhiyejishuxueyuan', '2', '99');
INSERT INTO `oj_school` VALUES ('957', '浙江医药高等专科学校', 'zhejiangyiyaogaodengzhuankexuexiao', '2', '98');
INSERT INTO `oj_school` VALUES ('958', '浙江机电职业技术学院', 'zhejiangjidianzhiyejishuxueyuan', '2', '97');
INSERT INTO `oj_school` VALUES ('959', '浙江建设职业技术学院', 'zhejiangjianshezhiyejishuxueyuan', '2', '97');
INSERT INTO `oj_school` VALUES ('960', '浙江艺术职业学院', 'zhejiangyishuzhiyexueyuan', '2', '97');
INSERT INTO `oj_school` VALUES ('961', '浙江经贸职业技术学院', 'zhejiangjingmaozhiyejishuxueyuan', '2', '97');
INSERT INTO `oj_school` VALUES ('962', '浙江商业职业技术学院', 'zhejiangshangyezhiyejishuxueyuan', '2', '97');
INSERT INTO `oj_school` VALUES ('963', '浙江经济职业技术学院', 'zhejiangjingjizhiyejishuxueyuan', '2', '97');
INSERT INTO `oj_school` VALUES ('964', '浙江旅游职业学院', 'zhejianglvyouzhiyexueyuan', '2', '97');
INSERT INTO `oj_school` VALUES ('965', '浙江育英职业技术学院', 'zhejiangyuyingzhiyejishuxueyuan', '2', '97');
INSERT INTO `oj_school` VALUES ('966', '浙江警官职业学院', 'zhejiangjingguanzhiyexueyuan', '2', '97');
INSERT INTO `oj_school` VALUES ('967', '浙江金融职业学院', 'zhejiangjinrongzhiyexueyuan', '2', '97');
INSERT INTO `oj_school` VALUES ('968', '浙江工业职业技术学院', 'zhejianggongyezhiyejishuxueyuan', '2', '102');
INSERT INTO `oj_school` VALUES ('969', '杭州职业技术学院', 'hangzhouzhiyejishuxueyuan', '2', '97');
INSERT INTO `oj_school` VALUES ('970', '嘉兴职业技术学院', 'jiaxingzhiyejishuxueyuan', '2', '100');
INSERT INTO `oj_school` VALUES ('971', '湖州职业技术学院', 'huzhouzhiyejishuxueyuan', '2', '101');
INSERT INTO `oj_school` VALUES ('972', '绍兴职业技术学院', 'shaoxingzhiyejishuxueyuan', '2', '102');
INSERT INTO `oj_school` VALUES ('973', '衢州职业技术学院', 'quzhouzhiyejishuxueyuan', '2', '104');
INSERT INTO `oj_school` VALUES ('974', '丽水职业技术学院', 'lishuizhiyejishuxueyuan', '2', '107');
INSERT INTO `oj_school` VALUES ('975', '浙江东方职业技术学院', 'zhejiangdongfangzhiyejishuxueyuan', '2', '99');
INSERT INTO `oj_school` VALUES ('976', '义乌工商职业技术学院', 'yiwugongshangzhiyejishuxueyuan', '2', '103');
INSERT INTO `oj_school` VALUES ('977', '浙江纺织服装职业技术学院', 'zhejiangfangzhifuzhuangzhiyejishuxueyuan', '2', '98');
INSERT INTO `oj_school` VALUES ('978', '杭州科技职业技术学院', 'hangzhoukejizhiyejishuxueyuan', '2', '97');
INSERT INTO `oj_school` VALUES ('979', '浙江长征职业技术学院', 'zhejiangchangzhengzhiyejishuxueyuan', '2', '97');
INSERT INTO `oj_school` VALUES ('980', '嘉兴南洋职业技术学院', 'jiaxingnanyangzhiyejishuxueyuan', '2', '100');
INSERT INTO `oj_school` VALUES ('981', '浙江广厦建设职业技术学院', 'zhejiangguangxiajianshezhiyejishuxueyuan', '2', '103');
INSERT INTO `oj_school` VALUES ('982', '杭州万向职业技术学院', 'hangzhouwanxiangzhiyejishuxueyuan', '2', '97');
INSERT INTO `oj_school` VALUES ('983', '浙江邮电职业技术学院', 'zhejiangyoudianzhiyejishuxueyuan', '2', '102');
INSERT INTO `oj_school` VALUES ('984', '宁波卫生职业技术学院', 'ningboweishengzhiyejishuxueyuan', '2', '98');
INSERT INTO `oj_school` VALUES ('985', '台州科技职业学院', 'taizhoukejizhiyexueyuan', '2', '106');
INSERT INTO `oj_school` VALUES ('986', '浙江国际海运职业技术学院', 'zhejiangguojihaiyunzhiyejishuxueyuan', '2', '105');
INSERT INTO `oj_school` VALUES ('987', '浙江体育职业技术学院', 'zhejiangtiyuzhiyejishuxueyuan', '2', '97');
INSERT INTO `oj_school` VALUES ('988', '温州科技职业学院', 'wenzhoukejizhiyexueyuan', '2', '99');
INSERT INTO `oj_school` VALUES ('989', '浙江汽车职业技术学院', 'zhejiangqichezhiyejishuxueyuan', '2', '106');
INSERT INTO `oj_school` VALUES ('990', '浙江横店影视职业学院', 'zhejianghengdianyingshizhiyexueyuan', '2', '103');
INSERT INTO `oj_school` VALUES ('991', '浙江农业商贸职业学院', 'zhejiangnongyeshangmaozhiyexueyuan', '2', '102');
INSERT INTO `oj_school` VALUES ('992', '浙江特殊教育职业学院', 'zhejiangteshujiaoyuzhiyexueyuan', '2', '97');
INSERT INTO `oj_school` VALUES ('993', '浙江安防职业技术学院', 'zhejianganfangzhiyejishuxueyuan', '2', '99');
INSERT INTO `oj_school` VALUES ('994', '浙江舟山群岛新区旅游与健康职业学院', 'zhejiangzhoushanqundaoxinqulvyouyujiankangzhiyexue', '2', '105');
INSERT INTO `oj_school` VALUES ('995', '安徽大学', 'anhuidaxue', '1', '109');
INSERT INTO `oj_school` VALUES ('996', '中国科学技术大学', 'zhongguokexuejishudaxue', '1', '109');
INSERT INTO `oj_school` VALUES ('997', '合肥工业大学', 'hefeigongyedaxue', '1', '109');
INSERT INTO `oj_school` VALUES ('998', '安徽工业大学', 'anhuigongyedaxue', '1', '113');
INSERT INTO `oj_school` VALUES ('999', '安徽理工大学', 'anhuiligongdaxue', '1', '112');
INSERT INTO `oj_school` VALUES ('1000', '安徽工程大学', 'anhuigongchengdaxue', '1', '110');
INSERT INTO `oj_school` VALUES ('1001', '安徽农业大学', 'anhuinongyedaxue', '1', '109');
INSERT INTO `oj_school` VALUES ('1002', '安徽医科大学', 'anhuiyikedaxue', '1', '109');
INSERT INTO `oj_school` VALUES ('1003', '蚌埠医学院', 'bangbuyixueyuan', '1', '111');
INSERT INTO `oj_school` VALUES ('1004', '皖南医学院', 'wannanyixueyuan', '1', '110');
INSERT INTO `oj_school` VALUES ('1005', '安徽中医药大学', 'anhuizhongyiyaodaxue', '1', '109');
INSERT INTO `oj_school` VALUES ('1006', '安徽师范大学', 'anhuishifandaxue', '1', '110');
INSERT INTO `oj_school` VALUES ('1007', '阜阳师范学院', 'fuyangshifanxueyuan', '1', '119');
INSERT INTO `oj_school` VALUES ('1008', '安庆师范大学', 'anqingshifandaxue', '1', '116');
INSERT INTO `oj_school` VALUES ('1009', '淮北师范大学', 'huaibeishifandaxue', '1', '114');
INSERT INTO `oj_school` VALUES ('1010', '黄山学院', 'huangshanxueyuan', '1', '117');
INSERT INTO `oj_school` VALUES ('1011', '皖西学院', 'wanxixueyuan', '1', '121');
INSERT INTO `oj_school` VALUES ('1012', '滁州学院', 'chuzhouxueyuan', '1', '118');
INSERT INTO `oj_school` VALUES ('1013', '安徽财经大学', 'anhuicaijingdaxue', '1', '111');
INSERT INTO `oj_school` VALUES ('1014', '宿州学院', 'suzhouxueyuan', '1', '120');
INSERT INTO `oj_school` VALUES ('1015', '巢湖学院', 'chaohuxueyuan', '1', '109');
INSERT INTO `oj_school` VALUES ('1016', '淮南师范学院', 'huainanshifanxueyuan', '1', '112');
INSERT INTO `oj_school` VALUES ('1017', '铜陵学院', 'tonglingxueyuan', '1', '115');
INSERT INTO `oj_school` VALUES ('1018', '安徽建筑大学', 'anhuijianzhudaxue', '1', '109');
INSERT INTO `oj_school` VALUES ('1019', '安徽科技学院', 'anhuikejixueyuan', '1', '118');
INSERT INTO `oj_school` VALUES ('1020', '安徽三联学院', 'anhuisanlianxueyuan', '1', '109');
INSERT INTO `oj_school` VALUES ('1021', '合肥学院', 'hefeixueyuan', '1', '109');
INSERT INTO `oj_school` VALUES ('1022', '蚌埠学院', 'bangbuxueyuan', '1', '111');
INSERT INTO `oj_school` VALUES ('1023', '池州学院', 'chizhouxueyuan', '1', '124');
INSERT INTO `oj_school` VALUES ('1024', '安徽新华学院', 'anhuixinhuaxueyuan', '1', '109');
INSERT INTO `oj_school` VALUES ('1025', '安徽文达信息工程学院', 'anhuiwendaxinxigongchengxueyuan', '1', '109');
INSERT INTO `oj_school` VALUES ('1026', '亳州学院', 'bozhouxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('1027', '安徽外国语学院', 'anhuiwaiguoyuxueyuan', '1', '109');
INSERT INTO `oj_school` VALUES ('1028', '安徽财经大学商学院', 'anhuicaijingdaxueshangxueyuan', '1', '111');
INSERT INTO `oj_school` VALUES ('1029', '安徽大学江淮学院', 'anhuidaxuejianghuaixueyuan', '1', '109');
INSERT INTO `oj_school` VALUES ('1030', '安徽信息工程学院', 'anhuixinxigongchengxueyuan', '1', '110');
INSERT INTO `oj_school` VALUES ('1031', '安徽工业大学工商学院', 'anhuigongyedaxuegongshangxueyuan', '1', '113');
INSERT INTO `oj_school` VALUES ('1032', '安徽建筑大学城市建设学院', 'anhuijianzhudaxuechengshijianshexueyuan', '1', '109');
INSERT INTO `oj_school` VALUES ('1033', '安徽农业大学经济技术学院', 'anhuinongyedaxuejingjijishuxueyuan', '1', '109');
INSERT INTO `oj_school` VALUES ('1034', '安徽师范大学皖江学院', 'anhuishifandaxuewanjiangxueyuan', '1', '110');
INSERT INTO `oj_school` VALUES ('1035', '安徽医科大学临床医学院', 'anhuiyikedaxuelinchuangyixueyuan', '1', '109');
INSERT INTO `oj_school` VALUES ('1036', '阜阳师范学院信息工程学院', 'fuyangshifanxueyuanxinxigongchengxueyuan', '1', '119');
INSERT INTO `oj_school` VALUES ('1037', '淮北师范大学信息学院', 'huaibeishifandaxuexinxixueyuan', '1', '114');
INSERT INTO `oj_school` VALUES ('1038', '合肥师范学院', 'hefeishifanxueyuan', '1', '109');
INSERT INTO `oj_school` VALUES ('1039', '河海大学文天学院', 'hehaidaxuewentianxueyuan', '1', '113');
INSERT INTO `oj_school` VALUES ('1040', '安徽职业技术学院', 'anhuizhiyejishuxueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1041', '淮北职业技术学院', 'huaibeizhiyejishuxueyuan', '2', '114');
INSERT INTO `oj_school` VALUES ('1042', '芜湖职业技术学院', 'wuhuzhiyejishuxueyuan', '2', '110');
INSERT INTO `oj_school` VALUES ('1043', '淮南联合大学', 'huainanlianhedaxue', '2', '112');
INSERT INTO `oj_school` VALUES ('1044', '安徽商贸职业技术学院', 'anhuishangmaozhiyejishuxueyuan', '2', '110');
INSERT INTO `oj_school` VALUES ('1045', '安徽水利水电职业技术学院', 'anhuishuilishuidianzhiyejishuxueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1046', '阜阳职业技术学院', 'fuyangzhiyejishuxueyuan', '2', '119');
INSERT INTO `oj_school` VALUES ('1047', '铜陵职业技术学院', 'tonglingzhiyejishuxueyuan', '2', '115');
INSERT INTO `oj_school` VALUES ('1048', '民办万博科技职业学院', 'minbanwanbokejizhiyexueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1049', '安徽警官职业学院', 'anhuijingguanzhiyexueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1050', '淮南职业技术学院', 'huainanzhiyejishuxueyuan', '2', '112');
INSERT INTO `oj_school` VALUES ('1051', '安徽工业经济职业技术学院', 'anhuigongyejingjizhiyejishuxueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1052', '合肥通用职业技术学院', 'hefeitongyongzhiyejishuxueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1053', '安徽工贸职业技术学院', 'anhuigongmaozhiyejishuxueyuan', '2', '112');
INSERT INTO `oj_school` VALUES ('1054', '宿州职业技术学院', 'suzhouzhiyejishuxueyuan', '2', '120');
INSERT INTO `oj_school` VALUES ('1055', '六安职业技术学院', 'liuanzhiyejishuxueyuan', '2', '121');
INSERT INTO `oj_school` VALUES ('1056', '安徽电子信息职业技术学院', 'anhuidianzixinxizhiyejishuxueyuan', '2', '111');
INSERT INTO `oj_school` VALUES ('1057', '民办合肥经济技术职业学院', 'minbanhefeijingjijishuzhiyexueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1058', '安徽交通职业技术学院', 'anhuijiaotongzhiyejishuxueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1059', '安徽体育运动职业技术学院', 'anhuitiyuyundongzhiyejishuxueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1060', '安徽中医药高等专科学校', 'anhuizhongyiyaogaodengzhuankexuexiao', '2', '110');
INSERT INTO `oj_school` VALUES ('1061', '安徽医学高等专科学校', 'anhuiyixuegaodengzhuankexuexiao', '2', '109');
INSERT INTO `oj_school` VALUES ('1062', '合肥职业技术学院', 'hefeizhiyejishuxueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1063', '滁州职业技术学院', 'chuzhouzhiyejishuxueyuan', '2', '118');
INSERT INTO `oj_school` VALUES ('1064', '池州职业技术学院', 'chizhouzhiyejishuxueyuan', '2', '124');
INSERT INTO `oj_school` VALUES ('1065', '宣城职业技术学院', 'xuanchengzhiyejishuxueyuan', '2', '122');
INSERT INTO `oj_school` VALUES ('1066', '安徽广播影视职业技术学院', 'anhuiguangboyingshizhiyejishuxueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1067', '民办合肥滨湖职业技术学院', 'minbanhefeibinhuzhiyejishuxueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1068', '安徽电气工程职业技术学院', 'anhuidianqigongchengzhiyejishuxueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1069', '安徽冶金科技职业学院', 'anhuiyejinkejizhiyexueyuan', '2', '113');
INSERT INTO `oj_school` VALUES ('1070', '安徽城市管理职业学院', 'anhuichengshiguanlizhiyexueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1071', '安徽机电职业技术学院', 'anhuijidianzhiyejishuxueyuan', '2', '110');
INSERT INTO `oj_school` VALUES ('1072', '安徽工商职业学院', 'anhuigongshangzhiyexueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1073', '安徽中澳科技职业学院', 'anhuizhongaokejizhiyexueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1074', '阜阳科技职业学院', 'fuyangkejizhiyexueyuan', '2', '119');
INSERT INTO `oj_school` VALUES ('1075', '亳州职业技术学院', 'bozhouzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('1076', '安徽国防科技职业学院', 'anhuiguofangkejizhiyexueyuan', '2', '121');
INSERT INTO `oj_school` VALUES ('1077', '安庆职业技术学院', 'anqingzhiyejishuxueyuan', '2', '116');
INSERT INTO `oj_school` VALUES ('1078', '安徽艺术职业学院', 'anhuiyishuzhiyexueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1079', '马鞍山师范高等专科学校', 'maanshanshifangaodengzhuankexuexiao', '2', '113');
INSERT INTO `oj_school` VALUES ('1080', '安徽财贸职业学院', 'anhuicaimaozhiyexueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1081', '安徽国际商务职业学院', 'anhuiguojishangwuzhiyexueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1082', '安徽公安职业学院', 'anhuigonganzhiyexueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1083', '安徽林业职业技术学院', 'anhuilinyezhiyejishuxueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1084', '安徽审计职业学院', 'anhuishenjizhiyexueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1085', '安徽新闻出版职业技术学院', 'anhuixinwenchubanzhiyejishuxueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1086', '安徽邮电职业技术学院', 'anhuiyoudianzhiyejishuxueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1087', '安徽工业职业技术学院', 'anhuigongyezhiyejishuxueyuan', '2', '115');
INSERT INTO `oj_school` VALUES ('1088', '民办合肥财经职业学院', 'minbanhefeicaijingzhiyexueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1089', '安庆医药高等专科学校', 'anqingyiyaogaodengzhuankexuexiao', '2', '116');
INSERT INTO `oj_school` VALUES ('1090', '安徽涉外经济职业学院', 'anhuishewaijingjizhiyexueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1091', '安徽绿海商务职业学院', 'anhuilvhaishangwuzhiyexueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1092', '合肥共达职业技术学院', 'hefeigongdazhiyejishuxueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1093', '蚌埠经济技术职业学院', 'bangbujingjijishuzhiyexueyuan', '2', '111');
INSERT INTO `oj_school` VALUES ('1094', '民办安徽旅游职业学院', 'minbananhuilvyouzhiyexueyuan', '2', '119');
INSERT INTO `oj_school` VALUES ('1095', '徽商职业学院', 'huishangzhiyexueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1096', '马鞍山职业技术学院', 'maanshanzhiyejishuxueyuan', '2', '113');
INSERT INTO `oj_school` VALUES ('1097', '安徽现代信息工程职业学院', 'anhuixiandaixinxigongchengzhiyexueyuan', '2', '121');
INSERT INTO `oj_school` VALUES ('1098', '安徽矿业职业技术学院', 'anhuikuangyezhiyejishuxueyuan', '2', '114');
INSERT INTO `oj_school` VALUES ('1099', '合肥信息技术职业学院', 'hefeixinxijishuzhiyexueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1100', '桐城师范高等专科学校', 'tongchengshifangaodengzhuankexuexiao', '2', '116');
INSERT INTO `oj_school` VALUES ('1101', '黄山职业技术学院', 'huangshanzhiyejishuxueyuan', '2', '117');
INSERT INTO `oj_school` VALUES ('1102', '滁州城市职业学院', 'chuzhouchengshizhiyexueyuan', '2', '118');
INSERT INTO `oj_school` VALUES ('1103', '安徽汽车职业技术学院', 'anhuiqichezhiyejishuxueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1104', '皖西卫生职业学院', 'wanxiweishengzhiyexueyuan', '2', '121');
INSERT INTO `oj_school` VALUES ('1105', '合肥幼儿师范高等专科学校', 'hefeiyouershifangaodengzhuankexuexiao', '2', '109');
INSERT INTO `oj_school` VALUES ('1106', '安徽长江职业学院', 'anhuichangjiangzhiyexueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1107', '安徽扬子职业技术学院', 'anhuiyangzizhiyejishuxueyuan', '2', '110');
INSERT INTO `oj_school` VALUES ('1108', '安徽黄梅戏艺术职业学院', 'anhuihuangmeixiyishuzhiyexueyuan', '2', '116');
INSERT INTO `oj_school` VALUES ('1109', '安徽粮食工程职业学院', 'anhuiliangshigongchengzhiyexueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1110', '安徽人口职业学院', 'anhuirenkouzhiyexueyuan', '2', '124');
INSERT INTO `oj_school` VALUES ('1111', '合肥科技职业学院', 'hefeikejizhiyexueyuan', '2', '109');
INSERT INTO `oj_school` VALUES ('1112', '皖北卫生职业学院', 'wanbeiweishengzhiyexueyuan', '2', '120');
INSERT INTO `oj_school` VALUES ('1113', '阜阳幼儿师范高等专科学校', 'fuyangyouershifangaodengzhuankexuexiao', '2', '119');
INSERT INTO `oj_school` VALUES ('1114', '厦门大学', 'xiamendaxue', '1', '127');
INSERT INTO `oj_school` VALUES ('1115', '华侨大学', 'huaqiaodaxue', '1', '130');
INSERT INTO `oj_school` VALUES ('1116', '福州大学', 'fuzhoudaxue', '1', '126');
INSERT INTO `oj_school` VALUES ('1117', '福建工程学院', 'fujiangongchengxueyuan', '1', '126');
INSERT INTO `oj_school` VALUES ('1118', '福建农林大学', 'fujiannonglindaxue', '1', '126');
INSERT INTO `oj_school` VALUES ('1119', '集美大学', 'jimeidaxue', '1', '127');
INSERT INTO `oj_school` VALUES ('1120', '福建医科大学', 'fujianyikedaxue', '1', '126');
INSERT INTO `oj_school` VALUES ('1121', '福建中医药大学', 'fujianzhongyiyaodaxue', '1', '126');
INSERT INTO `oj_school` VALUES ('1122', '福建师范大学', 'fujianshifandaxue', '1', '126');
INSERT INTO `oj_school` VALUES ('1123', '闽江学院', 'minjiangxueyuan', '1', '126');
INSERT INTO `oj_school` VALUES ('1124', '武夷学院', 'wuyixueyuan', '1', '134');
INSERT INTO `oj_school` VALUES ('1125', '宁德师范学院', 'ningdeshifanxueyuan', '1', '128');
INSERT INTO `oj_school` VALUES ('1126', '泉州师范学院', 'quanzhoushifanxueyuan', '1', '130');
INSERT INTO `oj_school` VALUES ('1127', '闽南师范大学', 'minnanshifandaxue', '1', '131');
INSERT INTO `oj_school` VALUES ('1128', '厦门理工学院', 'xiamenligongxueyuan', '1', '127');
INSERT INTO `oj_school` VALUES ('1129', '三明学院', 'sanmingxueyuan', '1', '133');
INSERT INTO `oj_school` VALUES ('1130', '龙岩学院', 'longyanxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('1131', '福建商学院', 'fujianshangxueyuan', '1', '126');
INSERT INTO `oj_school` VALUES ('1132', '福建警察学院', 'fujianjingchaxueyuan', '1', '126');
INSERT INTO `oj_school` VALUES ('1133', '莆田学院', 'putianxueyuan', '1', '129');
INSERT INTO `oj_school` VALUES ('1134', '仰恩大学', 'yangendaxue', '1', '130');
INSERT INTO `oj_school` VALUES ('1135', '厦门医学院', 'xiamenyixueyuan', '1', '127');
INSERT INTO `oj_school` VALUES ('1136', '厦门华厦学院', 'xiamenhuaxiaxueyuan', '1', '127');
INSERT INTO `oj_school` VALUES ('1137', '闽南理工学院', 'minnanligongxueyuan', '1', '130');
INSERT INTO `oj_school` VALUES ('1138', '福建师范大学闽南科技学院', 'fujianshifandaxueminnankejixueyuan', '1', '130');
INSERT INTO `oj_school` VALUES ('1139', '福建农林大学东方学院', 'fujiannonglindaxuedongfangxueyuan', '1', '126');
INSERT INTO `oj_school` VALUES ('1140', '厦门工学院', 'xiamengongxueyuan', '1', '127');
INSERT INTO `oj_school` VALUES ('1141', '阳光学院', 'yangguangxueyuan', '1', '126');
INSERT INTO `oj_school` VALUES ('1142', '厦门大学嘉庚学院', 'xiamendaxuejiagengxueyuan', '1', '131');
INSERT INTO `oj_school` VALUES ('1143', '福州大学至诚学院', 'fuzhoudaxuezhichengxueyuan', '1', '126');
INSERT INTO `oj_school` VALUES ('1144', '集美大学诚毅学院', 'jimeidaxuechengyixueyuan', '1', '127');
INSERT INTO `oj_school` VALUES ('1145', '福建师范大学协和学院', 'fujianshifandaxuexiehexueyuan', '1', '126');
INSERT INTO `oj_school` VALUES ('1146', '福州外语外贸学院', 'fuzhouwaiyuwaimaoxueyuan', '1', '126');
INSERT INTO `oj_school` VALUES ('1147', '福建江夏学院', 'fujianjiangxiaxueyuan', '1', '126');
INSERT INTO `oj_school` VALUES ('1148', '泉州信息工程学院', 'quanzhouxinxigongchengxueyuan', '1', '130');
INSERT INTO `oj_school` VALUES ('1149', '福州理工学院', 'fuzhouligongxueyuan', '1', '126');
INSERT INTO `oj_school` VALUES ('1150', '福建农林大学金山学院', 'fujiannonglindaxuejinshanxueyuan', '1', '126');
INSERT INTO `oj_school` VALUES ('1151', '福建船政交通职业学院', 'fujianchuanzhengjiaotongzhiyexueyuan', '2', '126');
INSERT INTO `oj_school` VALUES ('1152', '漳州职业技术学院', 'zhangzhouzhiyejishuxueyuan', '2', '131');
INSERT INTO `oj_school` VALUES ('1153', '闽西职业技术学院', 'minxizhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('1154', '黎明职业大学', 'limingzhiyedaxue', '2', '130');
INSERT INTO `oj_school` VALUES ('1155', '福建华南女子职业学院', 'fujianhuanannvzizhiyexueyuan', '2', '126');
INSERT INTO `oj_school` VALUES ('1156', '福州职业技术学院', 'fuzhouzhiyejishuxueyuan', '2', '126');
INSERT INTO `oj_school` VALUES ('1157', '福建林业职业技术学院', 'fujianlinyezhiyejishuxueyuan', '2', '134');
INSERT INTO `oj_school` VALUES ('1158', '福建信息职业技术学院', 'fujianxinxizhiyejishuxueyuan', '2', '126');
INSERT INTO `oj_school` VALUES ('1159', '福建水利电力职业技术学院', 'fujianshuilidianlizhiyejishuxueyuan', '2', '133');
INSERT INTO `oj_school` VALUES ('1160', '福建电力职业技术学院', 'fujiandianlizhiyejishuxueyuan', '2', '130');
INSERT INTO `oj_school` VALUES ('1161', '厦门海洋职业技术学院', 'xiamenhaiyangzhiyejishuxueyuan', '2', '127');
INSERT INTO `oj_school` VALUES ('1162', '福建农业职业技术学院', 'fujiannongyezhiyejishuxueyuan', '2', '126');
INSERT INTO `oj_school` VALUES ('1163', '福建卫生职业技术学院', 'fujianweishengzhiyejishuxueyuan', '2', '126');
INSERT INTO `oj_school` VALUES ('1164', '泉州医学高等专科学校', 'quanzhouyixuegaodengzhuankexuexiao', '2', '130');
INSERT INTO `oj_school` VALUES ('1165', '福州英华职业学院', 'fuzhouyinghuazhiyexueyuan', '2', '126');
INSERT INTO `oj_school` VALUES ('1166', '泉州纺织服装职业学院', 'quanzhoufangzhifuzhuangzhiyexueyuan', '2', '130');
INSERT INTO `oj_school` VALUES ('1167', '泉州华光职业学院', 'quanzhouhuaguangzhiyexueyuan', '2', '130');
INSERT INTO `oj_school` VALUES ('1168', '泉州理工职业学院', 'quanzhouligongzhiyexueyuan', '2', '130');
INSERT INTO `oj_school` VALUES ('1169', '福建警官职业学院', 'fujianjingguanzhiyexueyuan', '2', '126');
INSERT INTO `oj_school` VALUES ('1170', '闽北职业技术学院', 'minbeizhiyejishuxueyuan', '2', '134');
INSERT INTO `oj_school` VALUES ('1171', '福州黎明职业技术学院', 'fuzhoulimingzhiyejishuxueyuan', '2', '126');
INSERT INTO `oj_school` VALUES ('1172', '厦门演艺职业学院', 'xiamenyanyizhiyexueyuan', '2', '127');
INSERT INTO `oj_school` VALUES ('1173', '厦门华天涉外职业技术学院', 'xiamenhuatianshewaizhiyejishuxueyuan', '2', '127');
INSERT INTO `oj_school` VALUES ('1174', '福州科技职业技术学院', 'fuzhoukejizhiyejishuxueyuan', '2', '126');
INSERT INTO `oj_school` VALUES ('1175', '泉州经贸职业技术学院', 'quanzhoujingmaozhiyejishuxueyuan', '2', '130');
INSERT INTO `oj_school` VALUES ('1176', '福建对外经济贸易职业技术学院', 'fujianduiwaijingjimaoyizhiyejishuxueyuan', '2', '126');
INSERT INTO `oj_school` VALUES ('1177', '湄洲湾职业技术学院', 'meizhouwanzhiyejishuxueyuan', '2', '129');
INSERT INTO `oj_school` VALUES ('1178', '福建生物工程职业技术学院', 'fujianshengwugongchengzhiyejishuxueyuan', '2', '126');
INSERT INTO `oj_school` VALUES ('1179', '福建艺术职业学院', 'fujianyishuzhiyexueyuan', '2', '126');
INSERT INTO `oj_school` VALUES ('1180', '福建幼儿师范高等专科学校', 'fujianyouershifangaodengzhuankexuexiao', '2', '126');
INSERT INTO `oj_school` VALUES ('1181', '厦门城市职业学院', 'xiamenchengshizhiyexueyuan', '2', '127');
INSERT INTO `oj_school` VALUES ('1182', '泉州工艺美术职业学院', 'quanzhougongyimeishuzhiyexueyuan', '2', '130');
INSERT INTO `oj_school` VALUES ('1183', '三明职业技术学院', 'sanmingzhiyejishuxueyuan', '2', '133');
INSERT INTO `oj_school` VALUES ('1184', '宁德职业技术学院', 'ningdezhiyejishuxueyuan', '2', '128');
INSERT INTO `oj_school` VALUES ('1185', '福州软件职业技术学院', 'fuzhouruanjianzhiyejishuxueyuan', '2', '126');
INSERT INTO `oj_school` VALUES ('1186', '厦门兴才职业技术学院', 'xiamenxingcaizhiyejishuxueyuan', '2', '127');
INSERT INTO `oj_school` VALUES ('1187', '厦门软件职业技术学院', 'xiamenruanjianzhiyejishuxueyuan', '2', '127');
INSERT INTO `oj_school` VALUES ('1188', '福建体育职业技术学院', 'fujiantiyuzhiyejishuxueyuan', '2', '126');
INSERT INTO `oj_school` VALUES ('1189', '漳州城市职业学院', 'zhangzhouchengshizhiyexueyuan', '2', '131');
INSERT INTO `oj_school` VALUES ('1190', '厦门南洋职业学院', 'xiamennanyangzhiyexueyuan', '2', '127');
INSERT INTO `oj_school` VALUES ('1191', '厦门东海职业技术学院', 'xiamendonghaizhiyejishuxueyuan', '2', '127');
INSERT INTO `oj_school` VALUES ('1192', '漳州科技职业学院', 'zhangzhoukejizhiyexueyuan', '2', '131');
INSERT INTO `oj_school` VALUES ('1193', '漳州理工职业学院', 'zhangzhouligongzhiyexueyuan', '2', '131');
INSERT INTO `oj_school` VALUES ('1194', '武夷山职业学院', 'wuyishanzhiyexueyuan', '2', '134');
INSERT INTO `oj_school` VALUES ('1195', '漳州卫生职业学院', 'zhangzhouweishengzhiyexueyuan', '2', '131');
INSERT INTO `oj_school` VALUES ('1196', '泉州海洋职业学院', 'quanzhouhaiyangzhiyexueyuan', '2', '130');
INSERT INTO `oj_school` VALUES ('1197', '泉州轻工职业学院', 'quanzhouqinggongzhiyexueyuan', '2', '130');
INSERT INTO `oj_school` VALUES ('1198', '厦门安防科技职业学院', 'xiamenanfangkejizhiyexueyuan', '2', '127');
INSERT INTO `oj_school` VALUES ('1199', '泉州幼儿师范高等专科学校', 'quanzhouyouershifangaodengzhuankexuexiao', '2', '130');
INSERT INTO `oj_school` VALUES ('1200', '闽江师范高等专科学校', 'minjiangshifangaodengzhuankexuexiao', '2', '126');
INSERT INTO `oj_school` VALUES ('1201', '泉州工程职业技术学院', 'quanzhougongchengzhiyejishuxueyuan', '2', '130');
INSERT INTO `oj_school` VALUES ('1202', '南昌大学', 'nanchangdaxue', '1', '136');
INSERT INTO `oj_school` VALUES ('1203', '华东交通大学', 'huadongjiaotongdaxue', '1', '136');
INSERT INTO `oj_school` VALUES ('1204', '东华理工大学', 'donghualigongdaxue', '1', '146');
INSERT INTO `oj_school` VALUES ('1205', '南昌航空大学', 'nanchanghangkongdaxue', '1', '136');
INSERT INTO `oj_school` VALUES ('1206', '江西理工大学', 'jiangxiligongdaxue', '1', '142');
INSERT INTO `oj_school` VALUES ('1207', '景德镇陶瓷大学', 'jingdezhentaocidaxue', '1', '137');
INSERT INTO `oj_school` VALUES ('1208', '江西农业大学', 'jiangxinongyedaxue', '1', '136');
INSERT INTO `oj_school` VALUES ('1209', '江西中医药大学', 'jiangxizhongyiyaodaxue', '1', '136');
INSERT INTO `oj_school` VALUES ('1210', '赣南医学院', 'gannanyixueyuan', '1', '142');
INSERT INTO `oj_school` VALUES ('1211', '江西师范大学', 'jiangxishifandaxue', '1', '136');
INSERT INTO `oj_school` VALUES ('1212', '上饶师范学院', 'shangraoshifanxueyuan', '1', '144');
INSERT INTO `oj_school` VALUES ('1213', '宜春学院', 'yichunxueyuan', '1', '143');
INSERT INTO `oj_school` VALUES ('1214', '赣南师范大学', 'gannanshifandaxue', '1', '142');
INSERT INTO `oj_school` VALUES ('1215', '井冈山大学', 'jinggangshandaxue', '1', '145');
INSERT INTO `oj_school` VALUES ('1216', '江西财经大学', 'jiangxicaijingdaxue', '1', '136');
INSERT INTO `oj_school` VALUES ('1217', '江西科技学院', 'jiangxikejixueyuan', '1', '136');
INSERT INTO `oj_school` VALUES ('1218', '景德镇学院', 'jingdezhenxueyuan', '1', '137');
INSERT INTO `oj_school` VALUES ('1219', '萍乡学院', 'pingxiangxueyuan', '1', '138');
INSERT INTO `oj_school` VALUES ('1220', '江西科技师范大学', 'jiangxikejishifandaxue', '1', '136');
INSERT INTO `oj_school` VALUES ('1221', '南昌工程学院', 'nanchanggongchengxueyuan', '1', '136');
INSERT INTO `oj_school` VALUES ('1222', '江西警察学院', 'jiangxijingchaxueyuan', '1', '136');
INSERT INTO `oj_school` VALUES ('1223', '新余学院', 'xinyuxueyuan', '1', '140');
INSERT INTO `oj_school` VALUES ('1224', '九江学院', 'jiujiangxueyuan', '1', '139');
INSERT INTO `oj_school` VALUES ('1225', '江西工程学院', 'jiangxigongchengxueyuan', '1', '140');
INSERT INTO `oj_school` VALUES ('1226', '南昌理工学院', 'nanchangligongxueyuan', '1', '136');
INSERT INTO `oj_school` VALUES ('1227', '江西应用科技学院', 'jiangxiyingyongkejixueyuan', '1', '136');
INSERT INTO `oj_school` VALUES ('1228', '江西服装学院', 'jiangxifuzhuangxueyuan', '1', '136');
INSERT INTO `oj_school` VALUES ('1229', '南昌工学院', 'nanchanggongxueyuan', '1', '136');
INSERT INTO `oj_school` VALUES ('1230', '南昌大学科学技术学院', 'nanchangdaxuekexuejishuxueyuan', '1', '136');
INSERT INTO `oj_school` VALUES ('1231', '南昌大学共青学院', 'nanchangdaxuegongqingxueyuan', '1', '139');
INSERT INTO `oj_school` VALUES ('1232', '华东交通大学理工学院', 'huadongjiaotongdaxueligongxueyuan', '1', '136');
INSERT INTO `oj_school` VALUES ('1233', '东华理工大学长江学院', 'donghualigongdaxuechangjiangxueyuan', '1', '146');
INSERT INTO `oj_school` VALUES ('1234', '南昌航空大学科技学院', 'nanchanghangkongdaxuekejixueyuan', '1', '136');
INSERT INTO `oj_school` VALUES ('1235', '江西理工大学应用科学学院', 'jiangxiligongdaxueyingyongkexuexueyuan', '1', '142');
INSERT INTO `oj_school` VALUES ('1236', '景德镇陶瓷大学科技艺术学院', 'jingdezhentaocidaxuekejiyishuxueyuan', '1', '137');
INSERT INTO `oj_school` VALUES ('1237', '江西农业大学南昌商学院', 'jiangxinongyedaxuenanchangshangxueyuan', '1', '136');
INSERT INTO `oj_school` VALUES ('1238', '江西中医药大学科技学院', 'jiangxizhongyiyaodaxuekejixueyuan', '1', '136');
INSERT INTO `oj_school` VALUES ('1239', '江西师范大学科学技术学院', 'jiangxishifandaxuekexuejishuxueyuan', '1', '136');
INSERT INTO `oj_school` VALUES ('1240', '赣南师范大学科技学院', 'gannanshifandaxuekejixueyuan', '1', '142');
INSERT INTO `oj_school` VALUES ('1241', '江西科技师范大学理工学院', 'jiangxikejishifandaxueligongxueyuan', '1', '136');
INSERT INTO `oj_school` VALUES ('1242', '江西财经大学现代经济管理学院', 'jiangxicaijingdaxuexiandaijingjiguanlixueyuan', '1', '136');
INSERT INTO `oj_school` VALUES ('1243', '南昌师范学院', 'nanchangshifanxueyuan', '1', '136');
INSERT INTO `oj_school` VALUES ('1244', '江西工业职业技术学院', 'jiangxigongyezhiyejishuxueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1245', '江西医学高等专科学校', 'jiangxiyixuegaodengzhuankexuexiao', '2', '144');
INSERT INTO `oj_school` VALUES ('1246', '九江职业大学', 'jiujiangzhiyedaxue', '2', '139');
INSERT INTO `oj_school` VALUES ('1247', '九江职业技术学院', 'jiujiangzhiyejishuxueyuan', '2', '139');
INSERT INTO `oj_school` VALUES ('1248', '江西司法警官职业学院', 'jiangxisifajingguanzhiyexueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1249', '江西陶瓷工艺美术职业技术学院', 'jiangxitaocigongyimeishuzhiyejishuxueyuan', '2', '137');
INSERT INTO `oj_school` VALUES ('1250', '江西旅游商贸职业学院', 'jiangxilvyoushangmaozhiyexueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1251', '江西电力职业技术学院', 'jiangxidianlizhiyejishuxueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1252', '江西环境工程职业学院', 'jiangxihuanjinggongchengzhiyexueyuan', '2', '142');
INSERT INTO `oj_school` VALUES ('1253', '江西艺术职业学院', 'jiangxiyishuzhiyexueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1254', '鹰潭职业技术学院', 'yingtanzhiyejishuxueyuan', '2', '141');
INSERT INTO `oj_school` VALUES ('1255', '江西信息应用职业技术学院', 'jiangxixinxiyingyongzhiyejishuxueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1256', '江西交通职业技术学院', 'jiangxijiaotongzhiyejishuxueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1257', '江西财经职业学院', 'jiangxicaijingzhiyexueyuan', '2', '139');
INSERT INTO `oj_school` VALUES ('1258', '江西应用技术职业学院', 'jiangxiyingyongjishuzhiyexueyuan', '2', '142');
INSERT INTO `oj_school` VALUES ('1259', '江西现代职业技术学院', 'jiangxixiandaizhiyejishuxueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1260', '江西工业工程职业技术学院', 'jiangxigongyegongchengzhiyejishuxueyuan', '2', '138');
INSERT INTO `oj_school` VALUES ('1261', '江西机电职业技术学院', 'jiangxijidianzhiyejishuxueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1262', '江西科技职业学院', 'jiangxikejizhiyexueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1263', '南昌职业学院', 'nanchangzhiyexueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1264', '江西外语外贸职业学院', 'jiangxiwaiyuwaimaozhiyexueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1265', '江西工业贸易职业技术学院', 'jiangxigongyemaoyizhiyejishuxueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1266', '宜春职业技术学院', 'yichunzhiyejishuxueyuan', '2', '143');
INSERT INTO `oj_school` VALUES ('1267', '江西应用工程职业学院', 'jiangxiyingyonggongchengzhiyexueyuan', '2', '138');
INSERT INTO `oj_school` VALUES ('1268', '江西生物科技职业学院', 'jiangxishengwukejizhiyexueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1269', '江西建设职业技术学院', 'jiangxijianshezhiyejishuxueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1270', '抚州职业技术学院', 'fuzhouzhiyejishuxueyuan', '2', '146');
INSERT INTO `oj_school` VALUES ('1271', '南昌师范高等专科学校', 'nanchangshifangaodengzhuankexuexiao', '2', '136');
INSERT INTO `oj_school` VALUES ('1272', '江西中医药高等专科学校', 'jiangxizhongyiyaogaodengzhuankexuexiao', '2', '146');
INSERT INTO `oj_school` VALUES ('1273', '江西先锋软件职业技术学院', 'jiangxixianfengruanjianzhiyejishuxueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1274', '江西经济管理职业学院', 'jiangxijingjiguanlizhiyexueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1275', '江西制造职业技术学院', 'jiangxizhizaozhiyejishuxueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1276', '江西工程职业学院', 'jiangxigongchengzhiyexueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1277', '江西青年职业学院', 'jiangxiqingnianzhiyexueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1278', '上饶职业技术学院', 'shangraozhiyejishuxueyuan', '2', '144');
INSERT INTO `oj_school` VALUES ('1279', '江西航空职业技术学院', 'jiangxihangkongzhiyejishuxueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1280', '江西农业工程职业学院', 'jiangxinongyegongchengzhiyexueyuan', '2', '143');
INSERT INTO `oj_school` VALUES ('1281', '赣西科技职业学院', 'ganxikejizhiyexueyuan', '2', '140');
INSERT INTO `oj_school` VALUES ('1282', '江西卫生职业学院', 'jiangxiweishengzhiyexueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1283', '江西新能源科技职业学院', 'jiangxixinnengyuankejizhiyexueyuan', '2', '140');
INSERT INTO `oj_school` VALUES ('1284', '江西枫林涉外经贸职业学院', 'jiangxifenglinshewaijingmaozhiyexueyuan', '2', '139');
INSERT INTO `oj_school` VALUES ('1285', '江西泰豪动漫职业学院', 'jiangxitaihaodongmanzhiyexueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1286', '江西冶金职业技术学院', 'jiangxiyejinzhiyejishuxueyuan', '2', '140');
INSERT INTO `oj_school` VALUES ('1287', '江西管理职业学院', 'jiangxiguanlizhiyexueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1288', '江西传媒职业学院', 'jiangxichuanmeizhiyexueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1289', '江西工商职业技术学院', 'jiangxigongshangzhiyejishuxueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1290', '景德镇陶瓷职业技术学院', 'jingdezhentaocizhiyejishuxueyuan', '2', '137');
INSERT INTO `oj_school` VALUES ('1291', '共青科技职业学院', 'gongqingkejizhiyexueyuan', '2', '139');
INSERT INTO `oj_school` VALUES ('1292', '赣州师范高等专科学校', 'ganzhoushifangaodengzhuankexuexiao', '2', '142');
INSERT INTO `oj_school` VALUES ('1293', '江西水利职业学院', 'jiangxishuilizhiyexueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1294', '宜春幼儿师范高等专科学校', 'yichunyouershifangaodengzhuankexuexiao', '2', '143');
INSERT INTO `oj_school` VALUES ('1295', '吉安职业技术学院', 'jianzhiyejishuxueyuan', '2', '145');
INSERT INTO `oj_school` VALUES ('1296', '江西洪州职业学院', 'jiangxihongzhouzhiyexueyuan', '2', '143');
INSERT INTO `oj_school` VALUES ('1297', '江西师范高等专科学校', 'jiangxishifangaodengzhuankexuexiao', '2', '141');
INSERT INTO `oj_school` VALUES ('1298', '南昌影视传播职业学院', 'nanchangyingshichuanbozhiyexueyuan', '2', '136');
INSERT INTO `oj_school` VALUES ('1299', '赣南卫生健康职业学院', 'gannanweishengjiankangzhiyexueyuan', '2', '142');
INSERT INTO `oj_school` VALUES ('1300', '山东大学', 'shandongdaxue', '1', '148');
INSERT INTO `oj_school` VALUES ('1301', '中国海洋大学', 'zhongguohaiyangdaxue', '1', '149');
INSERT INTO `oj_school` VALUES ('1302', '山东科技大学', 'shandongkejidaxue', '1', '149');
INSERT INTO `oj_school` VALUES ('1303', '中国石油大学（华东）', 'zhongguoshiyoudaxuehuadong', '1', '149');
INSERT INTO `oj_school` VALUES ('1304', '青岛科技大学', 'qingdaokejidaxue', '1', '149');
INSERT INTO `oj_school` VALUES ('1305', '济南大学', 'jinandaxue', '1', '148');
INSERT INTO `oj_school` VALUES ('1306', '青岛理工大学', 'qingdaoligongdaxue', '1', '149');
INSERT INTO `oj_school` VALUES ('1307', '山东建筑大学', 'shandongjianzhudaxue', '1', '148');
INSERT INTO `oj_school` VALUES ('1308', '齐鲁工业大学', 'qilugongyedaxue', '1', '148');
INSERT INTO `oj_school` VALUES ('1309', '山东理工大学', 'shandongligongdaxue', '1', '150');
INSERT INTO `oj_school` VALUES ('1310', '山东农业大学', 'shandongnongyedaxue', '1', '156');
INSERT INTO `oj_school` VALUES ('1311', '青岛农业大学', 'qingdaonongyedaxue', '1', '149');
INSERT INTO `oj_school` VALUES ('1312', '潍坊医学院', 'weifangyixueyuan', '1', '154');
INSERT INTO `oj_school` VALUES ('1313', '泰山医学院', 'taishanyixueyuan', '1', '156');
INSERT INTO `oj_school` VALUES ('1314', '滨州医学院', 'binzhouyixueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('1315', '山东中医药大学', 'shandongzhongyiyaodaxue', '1', '148');
INSERT INTO `oj_school` VALUES ('1316', '济宁医学院', 'jiningyixueyuan', '1', '155');
INSERT INTO `oj_school` VALUES ('1317', '山东师范大学', 'shandongshifandaxue', '1', '148');
INSERT INTO `oj_school` VALUES ('1318', '曲阜师范大学', 'qufushifandaxue', '1', '155');
INSERT INTO `oj_school` VALUES ('1319', '聊城大学', 'liaochengdaxue', '1', '162');
INSERT INTO `oj_school` VALUES ('1320', '德州学院', 'dezhouxueyuan', '1', '161');
INSERT INTO `oj_school` VALUES ('1321', '滨州学院', 'binzhouxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('1322', '鲁东大学', 'ludongdaxue', '1', '153');
INSERT INTO `oj_school` VALUES ('1323', '临沂大学', 'linyidaxue', '1', '160');
INSERT INTO `oj_school` VALUES ('1324', '泰山学院', 'taishanxueyuan', '1', '156');
INSERT INTO `oj_school` VALUES ('1325', '济宁学院', 'jiningxueyuan', '1', '155');
INSERT INTO `oj_school` VALUES ('1326', '菏泽学院', 'hezexueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('1327', '山东财经大学', 'shandongcaijingdaxue', '1', '148');
INSERT INTO `oj_school` VALUES ('1328', '山东体育学院', 'shandongtiyuxueyuan', '1', '148');
INSERT INTO `oj_school` VALUES ('1329', '山东艺术学院', 'shandongyishuxueyuan', '1', '148');
INSERT INTO `oj_school` VALUES ('1330', '齐鲁医药学院', 'qiluyiyaoxueyuan', '1', '150');
INSERT INTO `oj_school` VALUES ('1331', '青岛滨海学院', 'qingdaobinhaixueyuan', '1', '149');
INSERT INTO `oj_school` VALUES ('1332', '枣庄学院', 'zaozhuangxueyuan', '1', '151');
INSERT INTO `oj_school` VALUES ('1333', '山东工艺美术学院', 'shandonggongyimeishuxueyuan', '1', '148');
INSERT INTO `oj_school` VALUES ('1334', '青岛大学', 'qingdaodaxue', '1', '149');
INSERT INTO `oj_school` VALUES ('1335', '烟台大学', 'yantaidaxue', '1', '153');
INSERT INTO `oj_school` VALUES ('1336', '潍坊学院', 'weifangxueyuan', '1', '154');
INSERT INTO `oj_school` VALUES ('1337', '山东警察学院', 'shandongjingchaxueyuan', '1', '148');
INSERT INTO `oj_school` VALUES ('1338', '山东交通学院', 'shandongjiaotongxueyuan', '1', '148');
INSERT INTO `oj_school` VALUES ('1339', '山东工商学院', 'shandonggongshangxueyuan', '1', '153');
INSERT INTO `oj_school` VALUES ('1340', '山东女子学院', 'shandongnvzixueyuan', '1', '148');
INSERT INTO `oj_school` VALUES ('1341', '烟台南山学院', 'yantainanshanxueyuan', '1', '153');
INSERT INTO `oj_school` VALUES ('1342', '潍坊科技学院', 'weifangkejixueyuan', '1', '154');
INSERT INTO `oj_school` VALUES ('1343', '山东英才学院', 'shandongyingcaixueyuan', '1', '148');
INSERT INTO `oj_school` VALUES ('1344', '青岛恒星科技学院', 'qingdaohengxingkejixueyuan', '1', '149');
INSERT INTO `oj_school` VALUES ('1345', '青岛黄海学院', 'qingdaohuanghaixueyuan', '1', '149');
INSERT INTO `oj_school` VALUES ('1346', '山东现代学院', 'shandongxiandaixueyuan', '1', '148');
INSERT INTO `oj_school` VALUES ('1347', '山东协和学院', 'shandongxiehexueyuan', '1', '148');
INSERT INTO `oj_school` VALUES ('1348', '烟台大学文经学院', 'yantaidaxuewenjingxueyuan', '1', '153');
INSERT INTO `oj_school` VALUES ('1349', '聊城大学东昌学院', 'liaochengdaxuedongchangxueyuan', '1', '162');
INSERT INTO `oj_school` VALUES ('1350', '青岛理工大学琴岛学院', 'qingdaoligongdaxueqindaoxueyuan', '1', '149');
INSERT INTO `oj_school` VALUES ('1351', '山东师范大学历山学院', 'shandongshifandaxuelishanxueyuan', '1', '148');
INSERT INTO `oj_school` VALUES ('1352', '山东财经大学燕山学院', 'shandongcaijingdaxueyanshanxueyuan', '1', '148');
INSERT INTO `oj_school` VALUES ('1353', '中国石油大学胜利学院', 'zhongguoshiyoudaxueshenglixueyuan', '1', '152');
INSERT INTO `oj_school` VALUES ('1354', '山东科技大学泰山科技学院', 'shandongkejidaxuetaishankejixueyuan', '1', '156');
INSERT INTO `oj_school` VALUES ('1355', '山东华宇工学院', 'shandonghuayugongxueyuan', '1', '161');
INSERT INTO `oj_school` VALUES ('1356', '青岛工学院', 'qingdaogongxueyuan', '1', '149');
INSERT INTO `oj_school` VALUES ('1357', '青岛农业大学海都学院', 'qingdaonongyedaxuehaiduxueyuan', '1', '153');
INSERT INTO `oj_school` VALUES ('1358', '齐鲁理工学院', 'qiluligongxueyuan', '1', '148');
INSERT INTO `oj_school` VALUES ('1359', '山东财经大学东方学院', 'shandongcaijingdaxuedongfangxueyuan', '1', '156');
INSERT INTO `oj_school` VALUES ('1360', '济南大学泉城学院', 'jinandaxuequanchengxueyuan', '1', '148');
INSERT INTO `oj_school` VALUES ('1361', '山东政法学院', 'shandongzhengfaxueyuan', '1', '148');
INSERT INTO `oj_school` VALUES ('1362', '齐鲁师范学院', 'qilushifanxueyuan', '1', '148');
INSERT INTO `oj_school` VALUES ('1363', '山东青年政治学院', 'shandongqingnianzhengzhixueyuan', '1', '148');
INSERT INTO `oj_school` VALUES ('1364', '北京电影学院现代创意媒体学院', 'beijingdianyingxueyuanxiandaichuangyimeitixueyuan', '1', '149');
INSERT INTO `oj_school` VALUES ('1365', '山东管理学院', 'shandongguanlixueyuan', '1', '148');
INSERT INTO `oj_school` VALUES ('1366', '山东农业工程学院', 'shandongnongyegongchengxueyuan', '1', '148');
INSERT INTO `oj_school` VALUES ('1367', '山东医学高等专科学校', 'shandongyixuegaodengzhuankexuexiao', '2', '160');
INSERT INTO `oj_school` VALUES ('1368', '菏泽医学专科学校', 'hezeyixuezhuankexuexiao', '2', '999');
INSERT INTO `oj_school` VALUES ('1369', '山东商业职业技术学院', 'shandongshangyezhiyejishuxueyuan', '2', '148');
INSERT INTO `oj_school` VALUES ('1370', '山东电力高等专科学校', 'shandongdianligaodengzhuankexuexiao', '2', '148');
INSERT INTO `oj_school` VALUES ('1371', '日照职业技术学院', 'rizhaozhiyejishuxueyuan', '2', '158');
INSERT INTO `oj_school` VALUES ('1372', '曲阜远东职业技术学院', 'qufuyuandongzhiyejishuxueyuan', '2', '155');
INSERT INTO `oj_school` VALUES ('1373', '青岛职业技术学院', 'qingdaozhiyejishuxueyuan', '2', '149');
INSERT INTO `oj_school` VALUES ('1374', '威海职业学院', 'weihaizhiyexueyuan', '2', '157');
INSERT INTO `oj_school` VALUES ('1375', '山东职业学院', 'shandongzhiyexueyuan', '2', '148');
INSERT INTO `oj_school` VALUES ('1376', '山东劳动职业技术学院', 'shandonglaodongzhiyejishuxueyuan', '2', '148');
INSERT INTO `oj_school` VALUES ('1377', '莱芜职业技术学院', 'laiwuzhiyejishuxueyuan', '2', '159');
INSERT INTO `oj_school` VALUES ('1378', '济宁职业技术学院', 'jiningzhiyejishuxueyuan', '2', '155');
INSERT INTO `oj_school` VALUES ('1379', '潍坊职业学院', 'weifangzhiyexueyuan', '2', '154');
INSERT INTO `oj_school` VALUES ('1380', '烟台职业学院', 'yantaizhiyexueyuan', '2', '153');
INSERT INTO `oj_school` VALUES ('1381', '东营职业学院', 'dongyingzhiyexueyuan', '2', '152');
INSERT INTO `oj_school` VALUES ('1382', '聊城职业技术学院', 'liaochengzhiyejishuxueyuan', '2', '162');
INSERT INTO `oj_school` VALUES ('1383', '滨州职业学院', 'binzhouzhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('1384', '山东科技职业学院', 'shandongkejizhiyexueyuan', '2', '154');
INSERT INTO `oj_school` VALUES ('1385', '山东服装职业学院', 'shandongfuzhuangzhiyexueyuan', '2', '156');
INSERT INTO `oj_school` VALUES ('1386', '德州科技职业学院', 'dezhoukejizhiyexueyuan', '2', '161');
INSERT INTO `oj_school` VALUES ('1387', '山东力明科技职业学院', 'shandonglimingkejizhiyexueyuan', '2', '156');
INSERT INTO `oj_school` VALUES ('1388', '山东圣翰财贸职业学院', 'shandongshenghancaimaozhiyexueyuan', '2', '148');
INSERT INTO `oj_school` VALUES ('1389', '山东水利职业学院', 'shandongshuilizhiyexueyuan', '2', '158');
INSERT INTO `oj_school` VALUES ('1390', '山东畜牧兽医职业学院', 'shandongxumushouyizhiyexueyuan', '2', '154');
INSERT INTO `oj_school` VALUES ('1391', '青岛飞洋职业技术学院', 'qingdaofeiyangzhiyejishuxueyuan', '2', '149');
INSERT INTO `oj_school` VALUES ('1392', '东营科技职业学院', 'dongyingkejizhiyexueyuan', '2', '152');
INSERT INTO `oj_school` VALUES ('1393', '山东交通职业学院', 'shandongjiaotongzhiyexueyuan', '2', '154');
INSERT INTO `oj_school` VALUES ('1394', '淄博职业学院', 'zibozhiyexueyuan', '2', '150');
INSERT INTO `oj_school` VALUES ('1395', '山东外贸职业学院', 'shandongwaimaozhiyexueyuan', '2', '149');
INSERT INTO `oj_school` VALUES ('1396', '青岛酒店管理职业技术学院', 'qingdaojiudianguanlizhiyejishuxueyuan', '2', '149');
INSERT INTO `oj_school` VALUES ('1397', '山东信息职业技术学院', 'shandongxinxizhiyejishuxueyuan', '2', '154');
INSERT INTO `oj_school` VALUES ('1398', '青岛港湾职业技术学院', 'qingdaogangwanzhiyejishuxueyuan', '2', '149');
INSERT INTO `oj_school` VALUES ('1399', '山东胜利职业学院', 'shandongshenglizhiyexueyuan', '2', '152');
INSERT INTO `oj_school` VALUES ('1400', '山东经贸职业学院', 'shandongjingmaozhiyexueyuan', '2', '154');
INSERT INTO `oj_school` VALUES ('1401', '山东工业职业学院', 'shandonggongyezhiyexueyuan', '2', '150');
INSERT INTO `oj_school` VALUES ('1402', '山东化工职业学院', 'shandonghuagongzhiyexueyuan', '2', '150');
INSERT INTO `oj_school` VALUES ('1403', '青岛求实职业技术学院', 'qingdaoqiushizhiyejishuxueyuan', '2', '149');
INSERT INTO `oj_school` VALUES ('1404', '济南职业学院', 'jinanzhiyexueyuan', '2', '148');
INSERT INTO `oj_school` VALUES ('1405', '烟台工程职业技术学院', 'yantaigongchengzhiyejishuxueyuan', '2', '153');
INSERT INTO `oj_school` VALUES ('1406', '山东凯文科技职业学院', 'shandongkaiwenkejizhiyexueyuan', '2', '148');
INSERT INTO `oj_school` VALUES ('1407', '山东外国语职业学院', 'shandongwaiguoyuzhiyexueyuan', '2', '158');
INSERT INTO `oj_school` VALUES ('1408', '潍坊工商职业学院', 'weifanggongshangzhiyexueyuan', '2', '154');
INSERT INTO `oj_school` VALUES ('1409', '德州职业技术学院', 'dezhouzhiyejishuxueyuan', '2', '161');
INSERT INTO `oj_school` VALUES ('1410', '枣庄科技职业学院', 'zaozhuangkejizhiyexueyuan', '2', '151');
INSERT INTO `oj_school` VALUES ('1411', '淄博师范高等专科学校', 'ziboshifangaodengzhuankexuexiao', '2', '150');
INSERT INTO `oj_school` VALUES ('1412', '山东中医药高等专科学校', 'shandongzhongyiyaogaodengzhuankexuexiao', '2', '153');
INSERT INTO `oj_school` VALUES ('1413', '济南工程职业技术学院', 'jinangongchengzhiyejishuxueyuan', '2', '148');
INSERT INTO `oj_school` VALUES ('1414', '山东电子职业技术学院', 'shandongdianzizhiyejishuxueyuan', '2', '148');
INSERT INTO `oj_school` VALUES ('1415', '山东旅游职业学院', 'shandonglvyouzhiyexueyuan', '2', '148');
INSERT INTO `oj_school` VALUES ('1416', '山东铝业职业学院', 'shandonglvyezhiyexueyuan', '2', '150');
INSERT INTO `oj_school` VALUES ('1417', '山东杏林科技职业学院', 'shandongxinglinkejizhiyexueyuan', '2', '148');
INSERT INTO `oj_school` VALUES ('1418', '泰山职业技术学院', 'taishanzhiyejishuxueyuan', '2', '156');
INSERT INTO `oj_school` VALUES ('1419', '山东外事翻译职业学院', 'shandongwaishifanyizhiyexueyuan', '2', '157');
INSERT INTO `oj_school` VALUES ('1420', '山东药品食品职业学院', 'shandongyaopinshipinzhiyexueyuan', '2', '157');
INSERT INTO `oj_school` VALUES ('1421', '山东商务职业学院', 'shandongshangwuzhiyexueyuan', '2', '153');
INSERT INTO `oj_school` VALUES ('1422', '山东轻工职业学院', 'shandongqinggongzhiyexueyuan', '2', '150');
INSERT INTO `oj_school` VALUES ('1423', '山东城市建设职业学院', 'shandongchengshijianshezhiyexueyuan', '2', '148');
INSERT INTO `oj_school` VALUES ('1424', '烟台汽车工程职业学院', 'yantaiqichegongchengzhiyexueyuan', '2', '153');
INSERT INTO `oj_school` VALUES ('1425', '山东司法警官职业学院', 'shandongsifajingguanzhiyexueyuan', '2', '148');
INSERT INTO `oj_school` VALUES ('1426', '菏泽家政职业学院', 'hezejiazhengzhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('1427', '山东传媒职业学院', 'shandongchuanmeizhiyexueyuan', '2', '148');
INSERT INTO `oj_school` VALUES ('1428', '临沂职业学院', 'linyizhiyexueyuan', '2', '160');
INSERT INTO `oj_school` VALUES ('1429', '枣庄职业学院', 'zaozhuangzhiyexueyuan', '2', '151');
INSERT INTO `oj_school` VALUES ('1430', '山东理工职业学院', 'shandongligongzhiyexueyuan', '2', '155');
INSERT INTO `oj_school` VALUES ('1431', '山东文化产业职业学院', 'shandongwenhuachanyezhiyexueyuan', '2', '153');
INSERT INTO `oj_school` VALUES ('1432', '青岛远洋船员职业学院', 'qingdaoyuanyangchuanyuanzhiyexueyuan', '2', '149');
INSERT INTO `oj_school` VALUES ('1433', '济南幼儿师范高等专科学校', 'jinanyouershifangaodengzhuankexuexiao', '2', '148');
INSERT INTO `oj_school` VALUES ('1434', '济南护理职业学院', 'jinanhulizhiyexueyuan', '2', '148');
INSERT INTO `oj_school` VALUES ('1435', '泰山护理职业学院', 'taishanhulizhiyexueyuan', '2', '156');
INSERT INTO `oj_school` VALUES ('1436', '山东海事职业学院', 'shandonghaishizhiyexueyuan', '2', '154');
INSERT INTO `oj_school` VALUES ('1437', '潍坊护理职业学院', 'weifanghulizhiyexueyuan', '2', '154');
INSERT INTO `oj_school` VALUES ('1438', '潍坊工程职业学院', 'weifanggongchengzhiyexueyuan', '2', '154');
INSERT INTO `oj_school` VALUES ('1439', '菏泽职业学院', 'hezezhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('1440', '山东艺术设计职业学院', 'shandongyishushejizhiyexueyuan', '2', '148');
INSERT INTO `oj_school` VALUES ('1441', '威海海洋职业学院', 'weihaihaiyangzhiyexueyuan', '2', '157');
INSERT INTO `oj_school` VALUES ('1442', '山东特殊教育职业学院', 'shandongteshujiaoyuzhiyexueyuan', '2', '148');
INSERT INTO `oj_school` VALUES ('1443', '烟台黄金职业学院', 'yantaihuangjinzhiyexueyuan', '2', '153');
INSERT INTO `oj_school` VALUES ('1444', '华北水利水电大学', 'huabeishuilishuidiandaxue', '1', '166');
INSERT INTO `oj_school` VALUES ('1445', '郑州大学', 'zhengzhoudaxue', '1', '166');
INSERT INTO `oj_school` VALUES ('1446', '河南理工大学', 'henanligongdaxue', '1', '173');
INSERT INTO `oj_school` VALUES ('1447', '郑州轻工业学院', 'zhengzhouqinggongyexueyuan', '1', '166');
INSERT INTO `oj_school` VALUES ('1448', '河南工业大学', 'henangongyedaxue', '1', '166');
INSERT INTO `oj_school` VALUES ('1449', '河南科技大学', 'henankejidaxue', '1', '168');
INSERT INTO `oj_school` VALUES ('1450', '中原工学院', 'zhongyuangongxueyuan', '1', '166');
INSERT INTO `oj_school` VALUES ('1451', '河南农业大学', 'henannongyedaxue', '1', '166');
INSERT INTO `oj_school` VALUES ('1452', '河南科技学院', 'henankejixueyuan', '1', '172');
INSERT INTO `oj_school` VALUES ('1453', '河南牧业经济学院', 'henanmuyejingjixueyuan', '1', '166');
INSERT INTO `oj_school` VALUES ('1454', '河南中医药大学', 'henanzhongyiyaodaxue', '1', '166');
INSERT INTO `oj_school` VALUES ('1455', '新乡医学院', 'xinxiangyixueyuan', '1', '172');
INSERT INTO `oj_school` VALUES ('1456', '河南大学', 'henandaxue', '1', '167');
INSERT INTO `oj_school` VALUES ('1457', '河南师范大学', 'henanshifandaxue', '1', '172');
INSERT INTO `oj_school` VALUES ('1458', '信阳师范学院', 'xinyangshifanxueyuan', '1', '180');
INSERT INTO `oj_school` VALUES ('1459', '周口师范学院', 'zhoukoushifanxueyuan', '1', '181');
INSERT INTO `oj_school` VALUES ('1460', '安阳师范学院', 'anyangshifanxueyuan', '1', '170');
INSERT INTO `oj_school` VALUES ('1461', '许昌学院', 'xuchangxueyuan', '1', '175');
INSERT INTO `oj_school` VALUES ('1462', '南阳师范学院', 'nanyangshifanxueyuan', '1', '178');
INSERT INTO `oj_school` VALUES ('1463', '洛阳师范学院', 'luoyangshifanxueyuan', '1', '168');
INSERT INTO `oj_school` VALUES ('1464', '商丘师范学院', 'shangqiushifanxueyuan', '1', '179');
INSERT INTO `oj_school` VALUES ('1465', '河南财经政法大学', 'henancaijingzhengfadaxue', '1', '166');
INSERT INTO `oj_school` VALUES ('1466', '郑州航空工业管理学院', 'zhengzhouhangkonggongyeguanlixueyuan', '1', '166');
INSERT INTO `oj_school` VALUES ('1467', '黄淮学院', 'huanghuaixueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('1468', '平顶山学院', 'pingdingshanxueyuan', '1', '169');
INSERT INTO `oj_school` VALUES ('1469', '郑州工程技术学院', 'zhengzhougongchengjishuxueyuan', '1', '166');
INSERT INTO `oj_school` VALUES ('1470', '洛阳理工学院', 'luoyangligongxueyuan', '1', '168');
INSERT INTO `oj_school` VALUES ('1471', '新乡学院', 'xinxiangxueyuan', '1', '172');
INSERT INTO `oj_school` VALUES ('1472', '信阳农林学院', 'xinyangnonglinxueyuan', '1', '180');
INSERT INTO `oj_school` VALUES ('1473', '河南工学院', 'henangongxueyuan', '1', '172');
INSERT INTO `oj_school` VALUES ('1474', '安阳工学院', 'anyanggongxueyuan', '1', '170');
INSERT INTO `oj_school` VALUES ('1475', '河南工程学院', 'henangongchengxueyuan', '1', '166');
INSERT INTO `oj_school` VALUES ('1476', '河南财政金融学院', 'henancaizhengjinrongxueyuan', '1', '166');
INSERT INTO `oj_school` VALUES ('1477', '南阳理工学院', 'nanyangligongxueyuan', '1', '178');
INSERT INTO `oj_school` VALUES ('1478', '河南城建学院', 'henanchengjianxueyuan', '1', '169');
INSERT INTO `oj_school` VALUES ('1479', '河南警察学院', 'henanjingchaxueyuan', '1', '166');
INSERT INTO `oj_school` VALUES ('1480', '黄河科技学院', 'huanghekejixueyuan', '1', '166');
INSERT INTO `oj_school` VALUES ('1481', '铁道警察学院', 'tiedaojingchaxueyuan', '1', '166');
INSERT INTO `oj_school` VALUES ('1482', '郑州科技学院', 'zhengzhoukejixueyuan', '1', '166');
INSERT INTO `oj_school` VALUES ('1483', '郑州工业应用技术学院', 'zhengzhougongyeyingyongjishuxueyuan', '1', '166');
INSERT INTO `oj_school` VALUES ('1484', '郑州师范学院', 'zhengzhoushifanxueyuan', '1', '166');
INSERT INTO `oj_school` VALUES ('1485', '郑州财经学院', 'zhengzhoucaijingxueyuan', '1', '166');
INSERT INTO `oj_school` VALUES ('1486', '黄河交通学院', 'huanghejiaotongxueyuan', '1', '173');
INSERT INTO `oj_school` VALUES ('1487', '商丘工学院', 'shangqiugongxueyuan', '1', '179');
INSERT INTO `oj_school` VALUES ('1488', '河南大学民生学院', 'henandaxueminshengxueyuan', '1', '167');
INSERT INTO `oj_school` VALUES ('1489', '河南师范大学新联学院', 'henanshifandaxuexinlianxueyuan', '1', '166');
INSERT INTO `oj_school` VALUES ('1490', '信阳学院', 'xinyangxueyuan', '1', '180');
INSERT INTO `oj_school` VALUES ('1491', '安阳学院', 'anyangxueyuan', '1', '170');
INSERT INTO `oj_school` VALUES ('1492', '新乡医学院三全学院', 'xinxiangyixueyuansanquanxueyuan', '1', '172');
INSERT INTO `oj_school` VALUES ('1493', '河南科技学院新科学院', 'henankejixueyuanxinkexueyuan', '1', '172');
INSERT INTO `oj_school` VALUES ('1494', '郑州工商学院', 'zhengzhougongshangxueyuan', '1', '166');
INSERT INTO `oj_school` VALUES ('1495', '中原工学院信息商务学院', 'zhongyuangongxueyuanxinxishangwuxueyuan', '1', '166');
INSERT INTO `oj_school` VALUES ('1496', '商丘学院', 'shangqiuxueyuan', '1', '179');
INSERT INTO `oj_school` VALUES ('1497', '郑州成功财经学院', 'zhengzhouchenggongcaijingxueyuan', '1', '166');
INSERT INTO `oj_school` VALUES ('1498', '郑州升达经贸管理学院', 'zhengzhoushengdajingmaoguanlixueyuan', '1', '166');
INSERT INTO `oj_school` VALUES ('1499', '河南职业技术学院', 'henanzhiyejishuxueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1500', '漯河职业技术学院', 'luohezhiyejishuxueyuan', '2', '176');
INSERT INTO `oj_school` VALUES ('1501', '三门峡职业技术学院', 'sanmenxiazhiyejishuxueyuan', '2', '177');
INSERT INTO `oj_school` VALUES ('1502', '郑州铁路职业技术学院', 'zhengzhoutieluzhiyejishuxueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1503', '开封大学', 'kaifengdaxue', '2', '167');
INSERT INTO `oj_school` VALUES ('1504', '焦作大学', 'jiaozuodaxue', '2', '173');
INSERT INTO `oj_school` VALUES ('1505', '濮阳职业技术学院', 'puyangzhiyejishuxueyuan', '2', '174');
INSERT INTO `oj_school` VALUES ('1506', '郑州电力高等专科学校', 'zhengzhoudianligaodengzhuankexuexiao', '2', '166');
INSERT INTO `oj_school` VALUES ('1507', '黄河水利职业技术学院', 'huangheshuilizhiyejishuxueyuan', '2', '167');
INSERT INTO `oj_school` VALUES ('1508', '许昌职业技术学院', 'xuchangzhiyejishuxueyuan', '2', '175');
INSERT INTO `oj_school` VALUES ('1509', '河南工业和信息化职业学院', 'henangongyehexinxihuazhiyexueyuan', '2', '173');
INSERT INTO `oj_school` VALUES ('1510', '河南水利与环境职业学院', 'henanshuiliyuhuanjingzhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1511', '商丘职业技术学院', 'shangqiuzhiyejishuxueyuan', '2', '179');
INSERT INTO `oj_school` VALUES ('1512', '平顶山工业职业技术学院', 'pingdingshangongyezhiyejishuxueyuan', '2', '169');
INSERT INTO `oj_school` VALUES ('1513', '周口职业技术学院', 'zhoukouzhiyejishuxueyuan', '2', '181');
INSERT INTO `oj_school` VALUES ('1514', '济源职业技术学院', 'jiyuanzhiyejishuxueyuan', '2', '183');
INSERT INTO `oj_school` VALUES ('1515', '河南司法警官职业学院', 'henansifajingguanzhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1516', '鹤壁职业技术学院', 'hebizhiyejishuxueyuan', '2', '171');
INSERT INTO `oj_school` VALUES ('1517', '河南工业职业技术学院', 'henangongyezhiyejishuxueyuan', '2', '178');
INSERT INTO `oj_school` VALUES ('1518', '郑州澍青医学高等专科学校', 'zhengzhoushuqingyixuegaodengzhuankexuexiao', '2', '166');
INSERT INTO `oj_school` VALUES ('1519', '焦作师范高等专科学校', 'jiaozuoshifangaodengzhuankexuexiao', '2', '173');
INSERT INTO `oj_school` VALUES ('1520', '河南检察职业学院', 'henanjianchazhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1521', '河南质量工程职业学院', 'henanzhilianggongchengzhiyexueyuan', '2', '169');
INSERT INTO `oj_school` VALUES ('1522', '郑州信息科技职业学院', 'zhengzhouxinxikejizhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1523', '漯河医学高等专科学校', 'luoheyixuegaodengzhuankexuexiao', '2', '176');
INSERT INTO `oj_school` VALUES ('1524', '南阳医学高等专科学校', 'nanyangyixuegaodengzhuankexuexiao', '2', '178');
INSERT INTO `oj_school` VALUES ('1525', '商丘医学高等专科学校', 'shangqiuyixuegaodengzhuankexuexiao', '2', '179');
INSERT INTO `oj_school` VALUES ('1526', '郑州电子信息职业技术学院', 'zhengzhoudianzixinxizhiyejishuxueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1527', '信阳职业技术学院', 'xinyangzhiyejishuxueyuan', '2', '180');
INSERT INTO `oj_school` VALUES ('1528', '嵩山少林武术职业学院', 'songshanshaolinwushuzhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1529', '郑州工业安全职业学院', 'zhengzhougongyeanquanzhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1530', '永城职业学院', 'yongchengzhiyexueyuan', '2', '179');
INSERT INTO `oj_school` VALUES ('1531', '河南经贸职业学院', 'henanjingmaozhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1532', '河南交通职业技术学院', 'henanjiaotongzhiyejishuxueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1533', '河南农业职业学院', 'henannongyezhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1534', '郑州旅游职业学院', 'zhengzhoulvyouzhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1535', '郑州职业技术学院', 'zhengzhouzhiyejishuxueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1536', '河南信息统计职业学院', 'henanxinxitongjizhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1537', '河南林业职业学院', 'henanlinyezhiyexueyuan', '2', '168');
INSERT INTO `oj_school` VALUES ('1538', '河南工业贸易职业学院', 'henangongyemaoyizhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1539', '郑州电力职业技术学院', 'zhengzhoudianlizhiyejishuxueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1540', '周口科技职业学院', 'zhoukoukejizhiyexueyuan', '2', '181');
INSERT INTO `oj_school` VALUES ('1541', '河南建筑职业技术学院', 'henanjianzhuzhiyejishuxueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1542', '漯河食品职业学院', 'luoheshipinzhiyexueyuan', '2', '176');
INSERT INTO `oj_school` VALUES ('1543', '郑州城市职业学院', 'zhengzhouchengshizhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1544', '安阳职业技术学院', 'anyangzhiyejishuxueyuan', '2', '170');
INSERT INTO `oj_school` VALUES ('1545', '新乡职业技术学院', 'xinxiangzhiyejishuxueyuan', '2', '172');
INSERT INTO `oj_school` VALUES ('1546', '驻马店职业技术学院', 'zhumadianzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('1547', '焦作工贸职业学院', 'jiaozuogongmaozhiyexueyuan', '2', '173');
INSERT INTO `oj_school` VALUES ('1548', '许昌陶瓷职业学院', 'xuchangtaocizhiyexueyuan', '2', '175');
INSERT INTO `oj_school` VALUES ('1549', '郑州理工职业学院', 'zhengzhouligongzhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1550', '郑州信息工程职业学院', 'zhengzhouxinxigongchengzhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1551', '长垣烹饪职业技术学院', 'changyuanpengrenzhiyejishuxueyuan', '2', '172');
INSERT INTO `oj_school` VALUES ('1552', '开封文化艺术职业学院', 'kaifengwenhuayishuzhiyexueyuan', '2', '167');
INSERT INTO `oj_school` VALUES ('1553', '河南应用技术职业学院', 'henanyingyongjishuzhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1554', '河南艺术职业学院', 'henanyishuzhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1555', '河南机电职业学院', 'henanjidianzhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1556', '河南护理职业学院', 'henanhulizhiyexueyuan', '2', '170');
INSERT INTO `oj_school` VALUES ('1557', '许昌电气职业学院', 'xuchangdianqizhiyexueyuan', '2', '175');
INSERT INTO `oj_school` VALUES ('1558', '信阳涉外职业技术学院', 'xinyangshewaizhiyejishuxueyuan', '2', '180');
INSERT INTO `oj_school` VALUES ('1559', '鹤壁汽车工程职业学院', 'hebiqichegongchengzhiyexueyuan', '2', '171');
INSERT INTO `oj_school` VALUES ('1560', '南阳职业学院', 'nanyangzhiyexueyuan', '2', '178');
INSERT INTO `oj_school` VALUES ('1561', '郑州商贸旅游职业学院', 'zhengzhoushangmaolvyouzhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1562', '河南推拿职业学院', 'henantuinazhiyexueyuan', '2', '168');
INSERT INTO `oj_school` VALUES ('1563', '洛阳职业技术学院', 'luoyangzhiyejishuxueyuan', '2', '168');
INSERT INTO `oj_school` VALUES ('1564', '郑州幼儿师范高等专科学校', 'zhengzhouyouershifangaodengzhuankexuexiao', '2', '166');
INSERT INTO `oj_school` VALUES ('1565', '安阳幼儿师范高等专科学校', 'anyangyouershifangaodengzhuankexuexiao', '2', '170');
INSERT INTO `oj_school` VALUES ('1566', '郑州黄河护理职业学院', 'zhengzhouhuanghehulizhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1567', '河南医学高等专科学校', 'henanyixuegaodengzhuankexuexiao', '2', '166');
INSERT INTO `oj_school` VALUES ('1568', '郑州财税金融职业学院', 'zhengzhoucaishuijinrongzhiyexueyuan', '2', '166');
INSERT INTO `oj_school` VALUES ('1569', '南阳农业职业学院', 'nanyangnongyezhiyexueyuan', '2', '178');
INSERT INTO `oj_school` VALUES ('1570', '洛阳科技职业学院', 'luoyangkejizhiyexueyuan', '2', '168');
INSERT INTO `oj_school` VALUES ('1571', '鹤壁能源化工职业学院', 'hebinengyuanhuagongzhiyexueyuan', '2', '171');
INSERT INTO `oj_school` VALUES ('1572', '平顶山文化艺术职业学院', 'pingdingshanwenhuayishuzhiyexueyuan', '2', '169');
INSERT INTO `oj_school` VALUES ('1573', '武汉大学', 'wuhandaxue', '1', '186');
INSERT INTO `oj_school` VALUES ('1574', '华中科技大学', 'huazhongkejidaxue', '1', '186');
INSERT INTO `oj_school` VALUES ('1575', '武汉科技大学', 'wuhankejidaxue', '1', '186');
INSERT INTO `oj_school` VALUES ('1576', '长江大学', 'changjiangdaxue', '1', '194');
INSERT INTO `oj_school` VALUES ('1577', '武汉工程大学', 'wuhangongchengdaxue', '1', '186');
INSERT INTO `oj_school` VALUES ('1578', '中国地质大学(武汉)', 'zhongguodizhidaxuewuhan', '1', '186');
INSERT INTO `oj_school` VALUES ('1579', '武汉纺织大学', 'wuhanfangzhidaxue', '1', '186');
INSERT INTO `oj_school` VALUES ('1580', '武汉轻工大学', 'wuhanqinggongdaxue', '1', '186');
INSERT INTO `oj_school` VALUES ('1581', '武汉理工大学', 'wuhanligongdaxue', '1', '186');
INSERT INTO `oj_school` VALUES ('1582', '湖北工业大学', 'hubeigongyedaxue', '1', '186');
INSERT INTO `oj_school` VALUES ('1583', '华中农业大学', 'huazhongnongyedaxue', '1', '186');
INSERT INTO `oj_school` VALUES ('1584', '湖北中医药大学', 'hubeizhongyiyaodaxue', '1', '186');
INSERT INTO `oj_school` VALUES ('1585', '华中师范大学', 'huazhongshifandaxue', '1', '186');
INSERT INTO `oj_school` VALUES ('1586', '湖北大学', 'hubeidaxue', '1', '186');
INSERT INTO `oj_school` VALUES ('1587', '湖北师范大学', 'hubeishifandaxue', '1', '187');
INSERT INTO `oj_school` VALUES ('1588', '黄冈师范学院', 'huanggangshifanxueyuan', '1', '195');
INSERT INTO `oj_school` VALUES ('1589', '湖北民族学院', 'hubeiminzuxueyuan', '1', '197');
INSERT INTO `oj_school` VALUES ('1590', '汉江师范学院', 'hanjiangshifanxueyuan', '1', '188');
INSERT INTO `oj_school` VALUES ('1591', '湖北文理学院', 'hubeiwenlixueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('1592', '中南财经政法大学', 'zhongnancaijingzhengfadaxue', '1', '186');
INSERT INTO `oj_school` VALUES ('1593', '武汉体育学院', 'wuhantiyuxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1594', '湖北美术学院', 'hubeimeishuxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1595', '中南民族大学', 'zhongnanminzudaxue', '1', '186');
INSERT INTO `oj_school` VALUES ('1596', '湖北汽车工业学院', 'hubeiqichegongyexueyuan', '1', '188');
INSERT INTO `oj_school` VALUES ('1597', '湖北工程学院', 'hubeigongchengxueyuan', '1', '193');
INSERT INTO `oj_school` VALUES ('1598', '湖北理工学院', 'hubeiligongxueyuan', '1', '187');
INSERT INTO `oj_school` VALUES ('1599', '湖北科技学院', 'hubeikejixueyuan', '1', '196');
INSERT INTO `oj_school` VALUES ('1600', '湖北医药学院', 'hubeiyiyaoxueyuan', '1', '188');
INSERT INTO `oj_school` VALUES ('1601', '江汉大学', 'jianghandaxue', '1', '186');
INSERT INTO `oj_school` VALUES ('1602', '三峡大学', 'sanxiadaxue', '1', '189');
INSERT INTO `oj_school` VALUES ('1603', '湖北警官学院', 'hubeijingguanxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1604', '荆楚理工学院', 'jingchuligongxueyuan', '1', '192');
INSERT INTO `oj_school` VALUES ('1605', '武汉音乐学院', 'wuhanyinlexueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1606', '湖北经济学院', 'hubeijingjixueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1607', '武汉商学院', 'wuhanshangxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1608', '武汉东湖学院', 'wuhandonghuxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1609', '汉口学院', 'hankouxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1610', '武昌首义学院', 'wuchangshouyixueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1611', '武昌理工学院', 'wuchangligongxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1612', '武汉生物工程学院', 'wuhanshengwugongchengxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1613', '武汉晴川学院', 'wuhanqingchuanxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1614', '湖北大学知行学院', 'hubeidaxuezhixingxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1615', '武汉科技大学城市学院', 'wuhankejidaxuechengshixueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1616', '三峡大学科技学院', 'sanxiadaxuekejixueyuan', '1', '189');
INSERT INTO `oj_school` VALUES ('1617', '江汉大学文理学院', 'jianghandaxuewenlixueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1618', '湖北工业大学工程技术学院', 'hubeigongyedaxuegongchengjishuxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1619', '武汉工程大学邮电与信息工程学院', 'wuhangongchengdaxueyoudianyuxinxigongchengxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1620', '武汉纺织大学外经贸学院', 'wuhanfangzhidaxuewaijingmaoxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1621', '武昌工学院', 'wuchanggongxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1622', '武汉工商学院', 'wuhangongshangxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1623', '长江大学工程技术学院', 'changjiangdaxuegongchengjishuxueyuan', '1', '194');
INSERT INTO `oj_school` VALUES ('1624', '长江大学文理学院', 'changjiangdaxuewenlixueyuan', '1', '194');
INSERT INTO `oj_school` VALUES ('1625', '湖北商贸学院', 'hubeishangmaoxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1626', '湖北汽车工业学院科技学院', 'hubeiqichegongyexueyuankejixueyuan', '1', '188');
INSERT INTO `oj_school` VALUES ('1627', '湖北医药学院药护学院', 'hubeiyiyaoxueyuanyaohuxueyuan', '1', '188');
INSERT INTO `oj_school` VALUES ('1628', '湖北民族学院科技学院', 'hubeiminzuxueyuankejixueyuan', '1', '197');
INSERT INTO `oj_school` VALUES ('1629', '湖北经济学院法商学院', 'hubeijingjixueyuanfashangxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1630', '武汉体育学院体育科技学院', 'wuhantiyuxueyuantiyukejixueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1631', '湖北师范大学文理学院', 'hubeishifandaxuewenlixueyuan', '1', '187');
INSERT INTO `oj_school` VALUES ('1632', '湖北文理学院理工学院', 'hubeiwenlixueyuanligongxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('1633', '湖北工程学院新技术学院', 'hubeigongchengxueyuanxinjishuxueyuan', '1', '193');
INSERT INTO `oj_school` VALUES ('1634', '文华学院', 'wenhuaxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1635', '武汉学院', 'wuhanxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1636', '武汉工程科技学院', 'wuhangongchengkejixueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1637', '武汉华夏理工学院', 'wuhanhuaxialigongxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1638', '武汉传媒学院', 'wuhanchuanmeixueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1639', '武汉设计工程学院', 'wuhanshejigongchengxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1640', '湖北第二师范学院', 'hubeidiershifanxueyuan', '1', '186');
INSERT INTO `oj_school` VALUES ('1641', '武汉职业技术学院', 'wuhanzhiyejishuxueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1642', '黄冈职业技术学院', 'huanggangzhiyejishuxueyuan', '2', '195');
INSERT INTO `oj_school` VALUES ('1643', '长江职业学院', 'changjiangzhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1644', '荆州理工职业学院', 'jingzhouligongzhiyexueyuan', '2', '194');
INSERT INTO `oj_school` VALUES ('1645', '湖北工业职业技术学院', 'hubeigongyezhiyejishuxueyuan', '2', '188');
INSERT INTO `oj_school` VALUES ('1646', '鄂州职业大学', 'ezhouzhiyedaxue', '2', '191');
INSERT INTO `oj_school` VALUES ('1647', '武汉城市职业学院', 'wuhanchengshizhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1648', '湖北职业技术学院', 'hubeizhiyejishuxueyuan', '2', '193');
INSERT INTO `oj_school` VALUES ('1649', '武汉船舶职业技术学院', 'wuhanchuanbozhiyejishuxueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1650', '恩施职业技术学院', 'enshizhiyejishuxueyuan', '2', '197');
INSERT INTO `oj_school` VALUES ('1651', '襄阳职业技术学院', 'xiangyangzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('1652', '武汉工贸职业学院', 'wuhangongmaozhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1653', '荆州职业技术学院', 'jingzhouzhiyejishuxueyuan', '2', '194');
INSERT INTO `oj_school` VALUES ('1654', '武汉工程职业技术学院', 'wuhangongchengzhiyejishuxueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1655', '仙桃职业学院', 'xiantaozhiyexueyuan', '2', '198');
INSERT INTO `oj_school` VALUES ('1656', '湖北轻工职业技术学院', 'hubeiqinggongzhiyejishuxueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1657', '湖北交通职业技术学院', 'hubeijiaotongzhiyejishuxueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1658', '湖北中医药高等专科学校', 'hubeizhongyiyaogaodengzhuankexuexiao', '2', '194');
INSERT INTO `oj_school` VALUES ('1659', '武汉航海职业技术学院', 'wuhanhanghaizhiyejishuxueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1660', '武汉铁路职业技术学院', 'wuhantieluzhiyejishuxueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1661', '武汉软件工程职业学院', 'wuhanruanjiangongchengzhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1662', '湖北三峡职业技术学院', 'hubeisanxiazhiyejishuxueyuan', '2', '189');
INSERT INTO `oj_school` VALUES ('1663', '随州职业技术学院', 'suizhouzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('1664', '武汉电力职业技术学院', 'wuhandianlizhiyejishuxueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1665', '湖北水利水电职业技术学院', 'hubeishuilishuidianzhiyejishuxueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1666', '湖北城市建设职业技术学院', 'hubeichengshijianshezhiyejishuxueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1667', '武汉警官职业学院', 'wuhanjingguanzhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1668', '湖北生物科技职业学院', 'hubeishengwukejizhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1669', '湖北开放职业学院', 'hubeikaifangzhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1670', '武汉科技职业学院', 'wuhankejizhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1671', '武汉外语外事职业学院', 'wuhanwaiyuwaishizhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1672', '武汉信息传播职业技术学院', 'wuhanxinxichuanbozhiyejishuxueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1673', '武昌职业学院', 'wuchangzhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1674', '武汉商贸职业学院', 'wuhanshangmaozhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1675', '湖北艺术职业学院', 'hubeiyishuzhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1676', '武汉交通职业学院', 'wuhanjiaotongzhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1677', '咸宁职业技术学院', 'xianningzhiyejishuxueyuan', '2', '196');
INSERT INTO `oj_school` VALUES ('1678', '长江工程职业技术学院', 'changjianggongchengzhiyejishuxueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1679', '江汉艺术职业学院', 'jianghanyishuzhiyexueyuan', '2', '199');
INSERT INTO `oj_school` VALUES ('1680', '武汉工业职业技术学院', 'wuhangongyezhiyejishuxueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1681', '武汉民政职业学院', 'wuhanminzhengzhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1682', '鄂东职业技术学院', 'edongzhiyejishuxueyuan', '2', '195');
INSERT INTO `oj_school` VALUES ('1683', '湖北财税职业学院', 'hubeicaishuizhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1684', '黄冈科技职业学院', 'huanggangkejizhiyexueyuan', '2', '195');
INSERT INTO `oj_school` VALUES ('1685', '湖北国土资源职业学院', 'hubeiguotuziyuanzhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1686', '湖北生态工程职业技术学院', 'hubeishengtaigongchengzhiyejishuxueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1687', '三峡电力职业学院', 'sanxiadianlizhiyexueyuan', '2', '189');
INSERT INTO `oj_school` VALUES ('1688', '湖北科技职业学院', 'hubeikejizhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1689', '湖北青年职业学院', 'hubeiqingnianzhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1690', '湖北工程职业学院', 'hubeigongchengzhiyexueyuan', '2', '187');
INSERT INTO `oj_school` VALUES ('1691', '三峡旅游职业技术学院', 'sanxialvyouzhiyejishuxueyuan', '2', '189');
INSERT INTO `oj_school` VALUES ('1692', '天门职业学院', 'tianmenzhiyexueyuan', '2', '200');
INSERT INTO `oj_school` VALUES ('1693', '湖北体育职业学院', 'hubeitiyuzhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1694', '襄阳汽车职业技术学院', 'xiangyangqichezhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('1695', '湖北幼儿师范高等专科学校', 'hubeiyouershifangaodengzhuankexuexiao', '2', '186');
INSERT INTO `oj_school` VALUES ('1696', '湖北铁道运输职业学院', 'hubeitiedaoyunshuzhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1697', '武汉海事职业学院', 'wuhanhaishizhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1698', '武当职业学院', 'wudangzhiyexueyuan', '2', '188');
INSERT INTO `oj_school` VALUES ('1699', '荆门职业学院', 'jingmenzhiyexueyuan', '2', '192');
INSERT INTO `oj_school` VALUES ('1700', '武汉铁路桥梁职业学院', 'wuhantieluqiaoliangzhiyexueyuan', '2', '186');
INSERT INTO `oj_school` VALUES ('1701', '湘潭大学', 'xiangtandaxue', '1', '206');
INSERT INTO `oj_school` VALUES ('1702', '吉首大学', 'jishoudaxue', '1', '217');
INSERT INTO `oj_school` VALUES ('1703', '湖南大学', 'hunandaxue', '1', '204');
INSERT INTO `oj_school` VALUES ('1704', '中南大学', 'zhongnandaxue', '1', '204');
INSERT INTO `oj_school` VALUES ('1705', '湖南科技大学', 'hunankejidaxue', '1', '206');
INSERT INTO `oj_school` VALUES ('1706', '长沙理工大学', 'changshaligongdaxue', '1', '204');
INSERT INTO `oj_school` VALUES ('1707', '湖南农业大学', 'hunannongyedaxue', '1', '204');
INSERT INTO `oj_school` VALUES ('1708', '中南林业科技大学', 'zhongnanlinyekejidaxue', '1', '204');
INSERT INTO `oj_school` VALUES ('1709', '湖南中医药大学', 'hunanzhongyiyaodaxue', '1', '204');
INSERT INTO `oj_school` VALUES ('1710', '湖南师范大学', 'hunanshifandaxue', '1', '204');
INSERT INTO `oj_school` VALUES ('1711', '湖南理工学院', 'hunanligongxueyuan', '1', '209');
INSERT INTO `oj_school` VALUES ('1712', '湘南学院', 'xiangnanxueyuan', '1', '213');
INSERT INTO `oj_school` VALUES ('1713', '衡阳师范学院', 'hengyangshifanxueyuan', '1', '207');
INSERT INTO `oj_school` VALUES ('1714', '邵阳学院', 'shaoyangxueyuan', '1', '208');
INSERT INTO `oj_school` VALUES ('1715', '怀化学院', 'huaihuaxueyuan', '1', '215');
INSERT INTO `oj_school` VALUES ('1716', '湖南文理学院', 'hunanwenlixueyuan', '1', '210');
INSERT INTO `oj_school` VALUES ('1717', '湖南科技学院', 'hunankejixueyuan', '1', '214');
INSERT INTO `oj_school` VALUES ('1718', '湖南人文科技学院', 'hunanrenwenkejixueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('1719', '湖南商学院', 'hunanshangxueyuan', '1', '204');
INSERT INTO `oj_school` VALUES ('1720', '南华大学', 'nanhuadaxue', '1', '207');
INSERT INTO `oj_school` VALUES ('1721', '长沙医学院', 'changshayixueyuan', '1', '204');
INSERT INTO `oj_school` VALUES ('1722', '长沙学院', 'changshaxueyuan', '1', '204');
INSERT INTO `oj_school` VALUES ('1723', '湖南工程学院', 'hunangongchengxueyuan', '1', '206');
INSERT INTO `oj_school` VALUES ('1724', '湖南城市学院', 'hunanchengshixueyuan', '1', '212');
INSERT INTO `oj_school` VALUES ('1725', '湖南工学院', 'hunangongxueyuan', '1', '207');
INSERT INTO `oj_school` VALUES ('1726', '湖南财政经济学院', 'hunancaizhengjingjixueyuan', '1', '204');
INSERT INTO `oj_school` VALUES ('1727', '湖南警察学院', 'hunanjingchaxueyuan', '1', '204');
INSERT INTO `oj_school` VALUES ('1728', '湖南工业大学', 'hunangongyedaxue', '1', '205');
INSERT INTO `oj_school` VALUES ('1729', '湖南女子学院', 'hunannvzixueyuan', '1', '204');
INSERT INTO `oj_school` VALUES ('1730', '湖南第一师范学院', 'hunandiyishifanxueyuan', '1', '204');
INSERT INTO `oj_school` VALUES ('1731', '湖南医药学院', 'hunanyiyaoxueyuan', '1', '215');
INSERT INTO `oj_school` VALUES ('1732', '湖南涉外经济学院', 'hunanshewaijingjixueyuan', '1', '204');
INSERT INTO `oj_school` VALUES ('1733', '湘潭大学兴湘学院', 'xiangtandaxuexingxiangxueyuan', '1', '206');
INSERT INTO `oj_school` VALUES ('1734', '湖南工业大学科技学院', 'hunangongyedaxuekejixueyuan', '1', '205');
INSERT INTO `oj_school` VALUES ('1735', '湖南科技大学潇湘学院', 'hunankejidaxuexiaoxiangxueyuan', '1', '206');
INSERT INTO `oj_school` VALUES ('1736', '南华大学船山学院', 'nanhuadaxuechuanshanxueyuan', '1', '207');
INSERT INTO `oj_school` VALUES ('1737', '湖南商学院北津学院', 'hunanshangxueyuanbeijinxueyuan', '1', '204');
INSERT INTO `oj_school` VALUES ('1738', '湖南师范大学树达学院', 'hunanshifandaxueshudaxueyuan', '1', '204');
INSERT INTO `oj_school` VALUES ('1739', '湖南农业大学东方科技学院', 'hunannongyedaxuedongfangkejixueyuan', '1', '204');
INSERT INTO `oj_school` VALUES ('1740', '中南林业科技大学涉外学院', 'zhongnanlinyekejidaxueshewaixueyuan', '1', '204');
INSERT INTO `oj_school` VALUES ('1741', '湖南文理学院芙蓉学院', 'hunanwenlixueyuanfurongxueyuan', '1', '210');
INSERT INTO `oj_school` VALUES ('1742', '湖南理工学院南湖学院', 'hunanligongxueyuannanhuxueyuan', '1', '209');
INSERT INTO `oj_school` VALUES ('1743', '衡阳师范学院南岳学院', 'hengyangshifanxueyuannanyuexueyuan', '1', '207');
INSERT INTO `oj_school` VALUES ('1744', '湖南工程学院应用技术学院', 'hunangongchengxueyuanyingyongjishuxueyuan', '1', '206');
INSERT INTO `oj_school` VALUES ('1745', '湖南中医药大学湘杏学院', 'hunanzhongyiyaodaxuexiangxingxueyuan', '1', '204');
INSERT INTO `oj_school` VALUES ('1746', '吉首大学张家界学院', 'jishoudaxuezhangjiajiexueyuan', '1', '211');
INSERT INTO `oj_school` VALUES ('1747', '长沙理工大学城南学院', 'changshaligongdaxuechengnanxueyuan', '1', '204');
INSERT INTO `oj_school` VALUES ('1748', '长沙师范学院', 'changshashifanxueyuan', '1', '204');
INSERT INTO `oj_school` VALUES ('1749', '湖南应用技术学院', 'hunanyingyongjishuxueyuan', '1', '210');
INSERT INTO `oj_school` VALUES ('1750', '湖南信息学院', 'hunanxinxixueyuan', '1', '204');
INSERT INTO `oj_school` VALUES ('1751', '湖南交通工程学院', 'hunanjiaotonggongchengxueyuan', '1', '207');
INSERT INTO `oj_school` VALUES ('1752', '长沙民政职业技术学院', 'changshaminzhengzhiyejishuxueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1753', '湖南工业职业技术学院', 'hunangongyezhiyejishuxueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1754', '株洲师范高等专科学校', 'zhuzhoushifangaodengzhuankexuexiao', '2', '205');
INSERT INTO `oj_school` VALUES ('1755', '湖南信息职业技术学院', 'hunanxinxizhiyejishuxueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1756', '湖南税务高等专科学校', 'hunanshuiwugaodengzhuankexuexiao', '2', '204');
INSERT INTO `oj_school` VALUES ('1757', '湖南冶金职业技术学院', 'hunanyejinzhiyejishuxueyuan', '2', '205');
INSERT INTO `oj_school` VALUES ('1758', '长沙航空职业技术学院', 'changshahangkongzhiyejishuxueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1759', '湖南大众传媒职业技术学院', 'hunandazhongchuanmeizhiyejishuxueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1760', '永州职业技术学院', 'yongzhouzhiyejishuxueyuan', '2', '214');
INSERT INTO `oj_school` VALUES ('1761', '湖南铁道职业技术学院', 'hunantiedaozhiyejishuxueyuan', '2', '205');
INSERT INTO `oj_school` VALUES ('1762', '湖南科技职业学院', 'hunankejizhiyexueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1763', '湖南生物机电职业技术学院', 'hunanshengwujidianzhiyejishuxueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1764', '湖南交通职业技术学院', 'hunanjiaotongzhiyejishuxueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1765', '湖南商务职业技术学院', 'hunanshangwuzhiyejishuxueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1766', '湖南体育职业学院', 'hunantiyuzhiyexueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1767', '湖南工程职业技术学院', 'hunangongchengzhiyejishuxueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1768', '保险职业学院', 'baoxianzhiyexueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1769', '湖南外贸职业学院', 'hunanwaimaozhiyexueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1770', '湖南网络工程职业学院', 'hunanwangluogongchengzhiyexueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1771', '邵阳职业技术学院', 'shaoyangzhiyejishuxueyuan', '2', '208');
INSERT INTO `oj_school` VALUES ('1772', '湖南司法警官职业学院', 'hunansifajingguanzhiyexueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1773', '长沙商贸旅游职业技术学院', 'changshashangmaolvyouzhiyejishuxueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1774', '湖南环境生物职业技术学院', 'hunanhuanjingshengwuzhiyejishuxueyuan', '2', '207');
INSERT INTO `oj_school` VALUES ('1775', '湖南邮电职业技术学院', 'hunanyoudianzhiyejishuxueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1776', '湘潭医卫职业技术学院', 'xiangtanyiweizhiyejishuxueyuan', '2', '206');
INSERT INTO `oj_school` VALUES ('1777', '郴州职业技术学院', 'chenzhouzhiyejishuxueyuan', '2', '213');
INSERT INTO `oj_school` VALUES ('1778', '娄底职业技术学院', 'loudizhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('1779', '张家界航空工业职业技术学院', 'zhangjiajiehangkonggongyezhiyejishuxueyuan', '2', '211');
INSERT INTO `oj_school` VALUES ('1780', '长沙环境保护职业技术学院', 'changshahuanjingbaohuzhiyejishuxueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1781', '湖南艺术职业学院', 'hunanyishuzhiyexueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1782', '湖南机电职业技术学院', 'hunanjidianzhiyejishuxueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1783', '长沙职业技术学院', 'changshazhiyejishuxueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1784', '怀化职业技术学院', 'huaihuazhiyejishuxueyuan', '2', '215');
INSERT INTO `oj_school` VALUES ('1785', '岳阳职业技术学院', 'yueyangzhiyejishuxueyuan', '2', '209');
INSERT INTO `oj_school` VALUES ('1786', '常德职业技术学院', 'changdezhiyejishuxueyuan', '2', '210');
INSERT INTO `oj_school` VALUES ('1787', '长沙南方职业学院', 'changshananfangzhiyexueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1788', '潇湘职业学院', 'xiaoxiangzhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('1789', '湖南化工职业技术学院', 'hunanhuagongzhiyejishuxueyuan', '2', '205');
INSERT INTO `oj_school` VALUES ('1790', '湖南城建职业技术学院', 'hunanchengjianzhiyejishuxueyuan', '2', '206');
INSERT INTO `oj_school` VALUES ('1791', '湖南石油化工职业技术学院', 'hunanshiyouhuagongzhiyejishuxueyuan', '2', '209');
INSERT INTO `oj_school` VALUES ('1792', '湖南中医药高等专科学校', 'hunanzhongyiyaogaodengzhuankexuexiao', '2', '205');
INSERT INTO `oj_school` VALUES ('1793', '湖南民族职业学院', 'hunanminzuzhiyexueyuan', '2', '209');
INSERT INTO `oj_school` VALUES ('1794', '湘西民族职业技术学院', 'xiangximinzuzhiyejishuxueyuan', '2', '217');
INSERT INTO `oj_school` VALUES ('1795', '湖南财经工业职业技术学院', 'hunancaijinggongyezhiyejishuxueyuan', '2', '207');
INSERT INTO `oj_school` VALUES ('1796', '益阳职业技术学院', 'yiyangzhiyejishuxueyuan', '2', '212');
INSERT INTO `oj_school` VALUES ('1797', '湖南工艺美术职业学院', 'hunangongyimeishuzhiyexueyuan', '2', '212');
INSERT INTO `oj_school` VALUES ('1798', '湖南九嶷职业技术学院', 'hunanjiuyizhiyejishuxueyuan', '2', '214');
INSERT INTO `oj_school` VALUES ('1799', '湖南理工职业技术学院', 'hunanligongzhiyejishuxueyuan', '2', '206');
INSERT INTO `oj_school` VALUES ('1800', '湖南软件职业学院', 'hunanruanjianzhiyexueyuan', '2', '206');
INSERT INTO `oj_school` VALUES ('1801', '湖南汽车工程职业学院', 'hunanqichegongchengzhiyexueyuan', '2', '205');
INSERT INTO `oj_school` VALUES ('1802', '长沙电力职业技术学院', 'changshadianlizhiyejishuxueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1803', '湖南水利水电职业技术学院', 'hunanshuilishuidianzhiyejishuxueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1804', '湖南现代物流职业技术学院', 'hunanxiandaiwuliuzhiyejishuxueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1805', '湖南高速铁路职业技术学院', 'hunangaosutieluzhiyejishuxueyuan', '2', '207');
INSERT INTO `oj_school` VALUES ('1806', '湖南铁路科技职业技术学院', 'hunantielukejizhiyejishuxueyuan', '2', '205');
INSERT INTO `oj_school` VALUES ('1807', '湖南安全技术职业学院', 'hunananquanjishuzhiyexueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1808', '湖南电气职业技术学院', 'hunandianqizhiyejishuxueyuan', '2', '206');
INSERT INTO `oj_school` VALUES ('1809', '湖南外国语职业学院', 'hunanwaiguoyuzhiyexueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1810', '益阳医学高等专科学校', 'yiyangyixuegaodengzhuankexuexiao', '2', '212');
INSERT INTO `oj_school` VALUES ('1811', '湖南都市职业学院', 'hunandushizhiyexueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1812', '湖南电子科技职业学院', 'hunandianzikejizhiyexueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1813', '湖南国防工业职业技术学院', 'hunanguofanggongyezhiyejishuxueyuan', '2', '206');
INSERT INTO `oj_school` VALUES ('1814', '湖南高尔夫旅游职业学院', 'hunangaoerfulvyouzhiyexueyuan', '2', '210');
INSERT INTO `oj_school` VALUES ('1815', '湖南工商职业学院', 'hunangongshangzhiyexueyuan', '2', '207');
INSERT INTO `oj_school` VALUES ('1816', '湖南三一工业职业技术学院', 'hunansanyigongyezhiyejishuxueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1817', '长沙卫生职业学院', 'changshaweishengzhiyexueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1818', '湖南食品药品职业学院', 'hunanshipinyaopinzhiyexueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1819', '湖南有色金属职业技术学院', 'hunanyousejinshuzhiyejishuxueyuan', '2', '205');
INSERT INTO `oj_school` VALUES ('1820', '湖南吉利汽车职业技术学院', 'hunanjiliqichezhiyejishuxueyuan', '2', '206');
INSERT INTO `oj_school` VALUES ('1821', '湖南幼儿师范高等专科学校', 'hunanyouershifangaodengzhuankexuexiao', '2', '210');
INSERT INTO `oj_school` VALUES ('1822', '湘南幼儿师范高等专科学校', 'xiangnanyouershifangaodengzhuankexuexiao', '2', '213');
INSERT INTO `oj_school` VALUES ('1823', '湖南劳动人事职业学院', 'hunanlaodongrenshizhiyexueyuan', '2', '204');
INSERT INTO `oj_school` VALUES ('1824', '中山大学', 'zhongshandaxue', '1', '219');
INSERT INTO `oj_school` VALUES ('1825', '暨南大学', 'jinandaxue', '1', '219');
INSERT INTO `oj_school` VALUES ('1826', '汕头大学', 'shantoudaxue', '1', '223');
INSERT INTO `oj_school` VALUES ('1827', '华南理工大学', 'huananligongdaxue', '1', '219');
INSERT INTO `oj_school` VALUES ('1828', '华南农业大学', 'huanannongyedaxue', '1', '219');
INSERT INTO `oj_school` VALUES ('1829', '广东海洋大学', 'guangdonghaiyangdaxue', '1', '226');
INSERT INTO `oj_school` VALUES ('1830', '广州医科大学', 'guangzhouyikedaxue', '1', '219');
INSERT INTO `oj_school` VALUES ('1831', '广东医科大学', 'guangdongyikedaxue', '1', '226');
INSERT INTO `oj_school` VALUES ('1832', '广州中医药大学', 'guangzhouzhongyiyaodaxue', '1', '219');
INSERT INTO `oj_school` VALUES ('1833', '广东药科大学', 'guangdongyaokedaxue', '1', '219');
INSERT INTO `oj_school` VALUES ('1834', '华南师范大学', 'huananshifandaxue', '1', '219');
INSERT INTO `oj_school` VALUES ('1835', '韶关学院', 'shaoguanxueyuan', '1', '220');
INSERT INTO `oj_school` VALUES ('1836', '惠州学院', 'huizhouxueyuan', '1', '229');
INSERT INTO `oj_school` VALUES ('1837', '韩山师范学院', 'hanshanshifanxueyuan', '1', '235');
INSERT INTO `oj_school` VALUES ('1838', '岭南师范学院', 'lingnanshifanxueyuan', '1', '226');
INSERT INTO `oj_school` VALUES ('1839', '肇庆学院', 'zhaoqingxueyuan', '1', '228');
INSERT INTO `oj_school` VALUES ('1840', '嘉应学院', 'jiayingxueyuan', '1', '230');
INSERT INTO `oj_school` VALUES ('1841', '广州体育学院', 'guangzhoutiyuxueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1842', '广州美术学院', 'guangzhoumeishuxueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1843', '星海音乐学院', 'xinghaiyinlexueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1844', '广东技术师范学院', 'guangdongjishushifanxueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1845', '深圳大学', 'shenzhendaxue', '1', '221');
INSERT INTO `oj_school` VALUES ('1846', '广东财经大学', 'guangdongcaijingdaxue', '1', '219');
INSERT INTO `oj_school` VALUES ('1847', '广东白云学院', 'guangdongbaiyunxueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1848', '广州大学', 'guangzhoudaxue', '1', '219');
INSERT INTO `oj_school` VALUES ('1849', '广州航海学院', 'guangzhouhanghaixueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1850', '广东警官学院', 'guangdongjingguanxueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1851', '仲恺农业工程学院', 'zhongkainongyegongchengxueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1852', '五邑大学', 'wuyidaxue', '1', '225');
INSERT INTO `oj_school` VALUES ('1853', '广东金融学院', 'guangdongjinrongxueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1854', '电子科技大学中山学院', 'dianzikejidaxuezhongshanxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('1855', '广东石油化工学院', 'guangdongshiyouhuagongxueyuan', '1', '227');
INSERT INTO `oj_school` VALUES ('1856', '东莞理工学院', 'dongwanligongxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('1857', '广东工业大学', 'guangdonggongyedaxue', '1', '219');
INSERT INTO `oj_school` VALUES ('1858', '广东外语外贸大学', 'guangdongwaiyuwaimaodaxue', '1', '219');
INSERT INTO `oj_school` VALUES ('1859', '佛山科学技术学院', 'foshankexuejishuxueyuan', '1', '224');
INSERT INTO `oj_school` VALUES ('1860', '广东培正学院', 'guangdongpeizhengxueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1861', '南方医科大学', 'nanfangyikedaxue', '1', '219');
INSERT INTO `oj_school` VALUES ('1862', '广东东软学院', 'guangdongdongruanxueyuan', '1', '224');
INSERT INTO `oj_school` VALUES ('1863', '华南理工大学广州学院', 'huananligongdaxueguangzhouxueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1864', '广州大学华软软件学院', 'guangzhoudaxuehuaruanruanjianxueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1865', '中山大学南方学院', 'zhongshandaxuenanfangxueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1866', '广东外语外贸大学南国商学院', 'guangdongwaiyuwaimaodaxuenanguoshangxueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1867', '广东财经大学华商学院', 'guangdongcaijingdaxuehuashangxueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1868', '广东海洋大学寸金学院', 'guangdonghaiyangdaxuecunjinxueyuan', '1', '226');
INSERT INTO `oj_school` VALUES ('1869', '华南农业大学珠江学院', 'huanannongyedaxuezhujiangxueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1870', '广东技术师范学院天河学院', 'guangdongjishushifanxueyuantianhexueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1871', '北京师范大学珠海分校', 'beijingshifandaxuezhuhaifenxiao', '1', '222');
INSERT INTO `oj_school` VALUES ('1872', '广东工业大学华立学院', 'guangdonggongyedaxuehualixueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1873', '广州大学松田学院', 'guangzhoudaxuesongtianxueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1874', '广州商学院', 'guangzhoushangxueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1875', '北京理工大学珠海学院', 'beijingligongdaxuezhuhaixueyuan', '1', '222');
INSERT INTO `oj_school` VALUES ('1876', '吉林大学珠海学院', 'jilindaxuezhuhaixueyuan', '1', '222');
INSERT INTO `oj_school` VALUES ('1877', '广州工商学院', 'guangzhougongshangxueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1878', '广东科技学院', 'guangdongkejixueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('1879', '广东理工学院', 'guangdongligongxueyuan', '1', '228');
INSERT INTO `oj_school` VALUES ('1880', '东莞理工学院城市学院', 'dongwanligongxueyuanchengshixueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('1881', '中山大学新华学院', 'zhongshandaxuexinhuaxueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1882', '广东第二师范学院', 'guangdongdiershifanxueyuan', '1', '219');
INSERT INTO `oj_school` VALUES ('1883', '南方科技大学', 'nanfangkejidaxue', '1', '221');
INSERT INTO `oj_school` VALUES ('1884', '北京师范大学-香港浸会大学联合国际学院', 'beijingshifandaxuexianggangjinhuidaxuelianheguojix', '1', '222');
INSERT INTO `oj_school` VALUES ('1885', '香港中文大学（深圳）', 'xianggangzhongwendaxueshenzhen', '1', '221');
INSERT INTO `oj_school` VALUES ('1886', '顺德职业技术学院', 'shundezhiyejishuxueyuan', '2', '224');
INSERT INTO `oj_school` VALUES ('1887', '广东轻工职业技术学院', 'guangdongqinggongzhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1888', '广东交通职业技术学院', 'guangdongjiaotongzhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1889', '广东水利电力职业技术学院', 'guangdongshuilidianlizhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1890', '潮汕职业技术学院', 'chaoshanzhiyejishuxueyuan', '2', '236');
INSERT INTO `oj_school` VALUES ('1891', '深圳职业技术学院', 'shenzhenzhiyejishuxueyuan', '2', '221');
INSERT INTO `oj_school` VALUES ('1892', '民办南华工商学院', 'minbannanhuagongshangxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1893', '私立华联学院', 'silihualianxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1894', '广州民航职业技术学院', 'guangzhouminhangzhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1895', '广州番禺职业技术学院', 'guangzhoufanyuzhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1896', '广东松山职业技术学院', 'guangdongsongshanzhiyejishuxueyuan', '2', '220');
INSERT INTO `oj_school` VALUES ('1897', '广东农工商职业技术学院', 'guangdongnonggongshangzhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1898', '广东新安职业技术学院', 'guangdongxinanzhiyejishuxueyuan', '2', '221');
INSERT INTO `oj_school` VALUES ('1899', '佛山职业技术学院', 'foshanzhiyejishuxueyuan', '2', '224');
INSERT INTO `oj_school` VALUES ('1900', '广东科学技术职业学院', 'guangdongkexuejishuzhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1901', '广东食品药品职业学院', 'guangdongshipinyaopinzhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1902', '广州康大职业技术学院', 'guangzhoukangdazhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1903', '珠海艺术职业学院', 'zhuhaiyishuzhiyexueyuan', '2', '222');
INSERT INTO `oj_school` VALUES ('1904', '广东行政职业学院', 'guangdongxingzhengzhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1905', '广东体育职业技术学院', 'guangdongtiyuzhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1906', '广东职业技术学院', 'guangdongzhiyejishuxueyuan', '2', '224');
INSERT INTO `oj_school` VALUES ('1907', '广东建设职业技术学院', 'guangdongjianshezhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1908', '广东女子职业技术学院', 'guangdongnvzizhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1909', '广东机电职业技术学院', 'guangdongjidianzhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1910', '广东岭南职业技术学院', 'guangdonglingnanzhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1911', '汕尾职业技术学院', 'shanweizhiyejishuxueyuan', '2', '231');
INSERT INTO `oj_school` VALUES ('1912', '罗定职业技术学院', 'luodingzhiyejishuxueyuan', '2', '237');
INSERT INTO `oj_school` VALUES ('1913', '阳江职业技术学院', 'yangjiangzhiyejishuxueyuan', '2', '233');
INSERT INTO `oj_school` VALUES ('1914', '河源职业技术学院', 'heyuanzhiyejishuxueyuan', '2', '232');
INSERT INTO `oj_school` VALUES ('1915', '广东邮电职业技术学院', 'guangdongyoudianzhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1916', '汕头职业技术学院', 'shantouzhiyejishuxueyuan', '2', '223');
INSERT INTO `oj_school` VALUES ('1917', '揭阳职业技术学院', 'jieyangzhiyejishuxueyuan', '2', '236');
INSERT INTO `oj_school` VALUES ('1918', '深圳信息职业技术学院', 'shenzhenxinxizhiyejishuxueyuan', '2', '221');
INSERT INTO `oj_school` VALUES ('1919', '清远职业技术学院', 'qingyuanzhiyejishuxueyuan', '2', '234');
INSERT INTO `oj_school` VALUES ('1920', '广东工贸职业技术学院', 'guangdonggongmaozhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1921', '广东司法警官职业学院', 'guangdongsifajingguanzhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1922', '广东亚视演艺职业学院', 'guangdongyashiyanyizhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('1923', '广东省外语艺术职业学院', 'guangdongshengwaiyuyishuzhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1924', '广东文艺职业学院', 'guangdongwenyizhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1925', '广州体育职业技术学院', 'guangzhoutiyuzhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1926', '广州工程技术职业学院', 'guangzhougongchengjishuzhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1927', '中山火炬职业技术学院', 'zhongshanhuojuzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('1928', '江门职业技术学院', 'jiangmenzhiyejishuxueyuan', '2', '225');
INSERT INTO `oj_school` VALUES ('1929', '茂名职业技术学院', 'maomingzhiyejishuxueyuan', '2', '227');
INSERT INTO `oj_school` VALUES ('1930', '珠海城市职业技术学院', 'zhuhaichengshizhiyejishuxueyuan', '2', '222');
INSERT INTO `oj_school` VALUES ('1931', '广州涉外经济职业技术学院', 'guangzhoushewaijingjizhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1932', '广州南洋理工职业学院', 'guangzhounanyangligongzhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1933', '广州科技职业技术学院', 'guangzhoukejizhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1934', '惠州经济职业技术学院', 'huizhoujingjizhiyejishuxueyuan', '2', '229');
INSERT INTO `oj_school` VALUES ('1935', '广东工商职业学院', 'guangdonggongshangzhiyexueyuan', '2', '228');
INSERT INTO `oj_school` VALUES ('1936', '肇庆医学高等专科学校', 'zhaoqingyixuegaodengzhuankexuexiao', '2', '228');
INSERT INTO `oj_school` VALUES ('1937', '广州现代信息工程职业技术学院', 'guangzhouxiandaixinxigongchengzhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1938', '广东理工职业学院', 'guangdongligongzhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1939', '广州华南商贸职业学院', 'guangzhouhuananshangmaozhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1940', '广州华立科技职业学院', 'guangzhouhualikejizhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1941', '广州城市职业学院', 'guangzhouchengshizhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1942', '广东工程职业技术学院', 'guangdonggongchengzhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1943', '广州铁路职业技术学院', 'guangzhoutieluzhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1944', '广东科贸职业学院', 'guangdongkemaozhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1945', '广州科技贸易职业学院', 'guangzhoukejimaoyizhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1946', '中山职业技术学院', 'zhongshanzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('1947', '广州珠江职业技术学院', 'guangzhouzhujiangzhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1948', '广州松田职业学院', 'guangzhousongtianzhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1949', '广东文理职业学院', 'guangdongwenlizhiyexueyuan', '2', '226');
INSERT INTO `oj_school` VALUES ('1950', '广州城建职业学院', 'guangzhouchengjianzhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1951', '东莞职业技术学院', 'dongwanzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('1952', '广东南方职业学院', 'guangdongnanfangzhiyexueyuan', '2', '225');
INSERT INTO `oj_school` VALUES ('1953', '广州华商职业学院', 'guangzhouhuashangzhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1954', '广州华夏职业学院', 'guangzhouhuaxiazhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1955', '广东环境保护工程职业学院', 'guangdonghuanjingbaohugongchengzhiyexueyuan', '2', '224');
INSERT INTO `oj_school` VALUES ('1956', '广东青年职业学院', 'guangdongqingnianzhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1957', '广州东华职业学院', 'guangzhoudonghuazhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1958', '广东创新科技职业学院', 'guangdongchuangxinkejizhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('1959', '广东舞蹈戏剧职业学院', 'guangdongwudaoxijuzhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1960', '惠州卫生职业技术学院', 'huizhouweishengzhiyejishuxueyuan', '2', '229');
INSERT INTO `oj_school` VALUES ('1961', '广东信息工程职业学院', 'guangdongxinxigongchengzhiyexueyuan', '2', '228');
INSERT INTO `oj_school` VALUES ('1962', '广东生态工程职业学院', 'guangdongshengtaigongchengzhiyexueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1963', '惠州城市职业学院', 'huizhouchengshizhiyexueyuan', '2', '229');
INSERT INTO `oj_school` VALUES ('1964', '广东碧桂园职业学院', 'guangdongbiguiyuanzhiyexueyuan', '2', '234');
INSERT INTO `oj_school` VALUES ('1965', '公安边防部队高等专科学校', 'gonganbianfangbuduigaodengzhuankexuexiao', '2', '219');
INSERT INTO `oj_school` VALUES ('1966', '广东茂名健康职业学院', 'guangdongmaomingjiankangzhiyexueyuan', '2', '227');
INSERT INTO `oj_school` VALUES ('1967', '广东酒店管理职业技术学院', 'guangdongjiudianguanlizhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('1968', '广东茂名幼儿师范专科学校', 'guangdongmaomingyouershifanzhuankexuexiao', '2', '227');
INSERT INTO `oj_school` VALUES ('1969', '广州卫生职业技术学院', 'guangzhouweishengzhiyejishuxueyuan', '2', '219');
INSERT INTO `oj_school` VALUES ('1970', '湛江幼儿师范专科学校', 'zhanjiangyouershifanzhuankexuexiao', '2', '226');
INSERT INTO `oj_school` VALUES ('1971', '广西大学', 'guangxidaxue', '1', '239');
INSERT INTO `oj_school` VALUES ('1972', '广西科技大学', 'guangxikejidaxue', '1', '240');
INSERT INTO `oj_school` VALUES ('1973', '桂林电子科技大学', 'guilindianzikejidaxue', '1', '241');
INSERT INTO `oj_school` VALUES ('1974', '桂林理工大学', 'guilinligongdaxue', '1', '241');
INSERT INTO `oj_school` VALUES ('1975', '广西医科大学', 'guangxiyikedaxue', '1', '239');
INSERT INTO `oj_school` VALUES ('1976', '右江民族医学院', 'youjiangminzuyixueyuan', '1', '251');
INSERT INTO `oj_school` VALUES ('1977', '广西中医药大学', 'guangxizhongyiyaodaxue', '1', '239');
INSERT INTO `oj_school` VALUES ('1978', '桂林医学院', 'guilinyixueyuan', '1', '241');
INSERT INTO `oj_school` VALUES ('1979', '广西师范大学', 'guangxishifandaxue', '1', '241');
INSERT INTO `oj_school` VALUES ('1980', '广西师范学院', 'guangxishifanxueyuan', '1', '239');
INSERT INTO `oj_school` VALUES ('1981', '广西民族师范学院', 'guangximinzushifanxueyuan', '1', '248');
INSERT INTO `oj_school` VALUES ('1982', '河池学院', 'hechixueyuan', '1', '252');
INSERT INTO `oj_school` VALUES ('1983', '玉林师范学院', 'yulinshifanxueyuan', '1', '247');
INSERT INTO `oj_school` VALUES ('1984', '广西艺术学院', 'guangxiyishuxueyuan', '1', '239');
INSERT INTO `oj_school` VALUES ('1985', '广西民族大学', 'guangximinzudaxue', '1', '239');
INSERT INTO `oj_school` VALUES ('1986', '百色学院', 'baisexueyuan', '1', '251');
INSERT INTO `oj_school` VALUES ('1987', '梧州学院', 'wuzhouxueyuan', '1', '242');
INSERT INTO `oj_school` VALUES ('1988', '广西科技师范学院', 'guangxikejishifanxueyuan', '1', '249');
INSERT INTO `oj_school` VALUES ('1989', '广西财经学院', 'guangxicaijingxueyuan', '1', '239');
INSERT INTO `oj_school` VALUES ('1990', '南宁学院', 'nanningxueyuan', '1', '239');
INSERT INTO `oj_school` VALUES ('1991', '钦州学院', 'qinzhouxueyuan', '1', '245');
INSERT INTO `oj_school` VALUES ('1992', '桂林航天工业学院', 'guilinhangtiangongyexueyuan', '1', '241');
INSERT INTO `oj_school` VALUES ('1993', '桂林旅游学院', 'guilinlvyouxueyuan', '1', '241');
INSERT INTO `oj_school` VALUES ('1994', '贺州学院', 'hezhouxueyuan', '1', '250');
INSERT INTO `oj_school` VALUES ('1995', '广西警察学院', 'guangxijingchaxueyuan', '1', '239');
INSERT INTO `oj_school` VALUES ('1996', '北海艺术设计学院', 'beihaiyishushejixueyuan', '1', '243');
INSERT INTO `oj_school` VALUES ('1997', '广西大学行健文理学院', 'guangxidaxuexingjianwenlixueyuan', '1', '239');
INSERT INTO `oj_school` VALUES ('1998', '广西科技大学鹿山学院', 'guangxikejidaxuelushanxueyuan', '1', '240');
INSERT INTO `oj_school` VALUES ('1999', '广西民族大学相思湖学院', 'guangximinzudaxuexiangsihuxueyuan', '1', '239');
INSERT INTO `oj_school` VALUES ('2000', '广西师范大学漓江学院', 'guangxishifandaxuelijiangxueyuan', '1', '241');
INSERT INTO `oj_school` VALUES ('2001', '广西师范学院师园学院', 'guangxishifanxueyuanshiyuanxueyuan', '1', '239');
INSERT INTO `oj_school` VALUES ('2002', '广西中医药大学赛恩斯新医药学院', 'guangxizhongyiyaodaxuesaiensixinyiyaoxueyuan', '1', '239');
INSERT INTO `oj_school` VALUES ('2003', '桂林电子科技大学信息科技学院', 'guilindianzikejidaxuexinxikejixueyuan', '1', '241');
INSERT INTO `oj_school` VALUES ('2004', '桂林理工大学博文管理学院', 'guilinligongdaxuebowenguanlixueyuan', '1', '241');
INSERT INTO `oj_school` VALUES ('2005', '广西外国语学院', 'guangxiwaiguoyuxueyuan', '1', '239');
INSERT INTO `oj_school` VALUES ('2006', '北京航空航天大学北海学院', 'beijinghangkonghangtiandaxuebeihaixueyuan', '1', '243');
INSERT INTO `oj_school` VALUES ('2007', '广西机电职业技术学院', 'guangxijidianzhiyejishuxueyuan', '2', '239');
INSERT INTO `oj_school` VALUES ('2008', '广西体育高等专科学校', 'guangxitiyugaodengzhuankexuexiao', '2', '239');
INSERT INTO `oj_school` VALUES ('2009', '南宁职业技术学院', 'nanningzhiyejishuxueyuan', '2', '239');
INSERT INTO `oj_school` VALUES ('2010', '广西水利电力职业技术学院', 'guangxishuilidianlizhiyejishuxueyuan', '2', '239');
INSERT INTO `oj_school` VALUES ('2011', '桂林师范高等专科学校', 'guilinshifangaodengzhuankexuexiao', '2', '241');
INSERT INTO `oj_school` VALUES ('2012', '广西职业技术学院', 'guangxizhiyejishuxueyuan', '2', '239');
INSERT INTO `oj_school` VALUES ('2013', '柳州职业技术学院', 'liuzhouzhiyejishuxueyuan', '2', '240');
INSERT INTO `oj_school` VALUES ('2014', '广西生态工程职业技术学院', 'guangxishengtaigongchengzhiyejishuxueyuan', '2', '240');
INSERT INTO `oj_school` VALUES ('2015', '广西交通职业技术学院', 'guangxijiaotongzhiyejishuxueyuan', '2', '239');
INSERT INTO `oj_school` VALUES ('2016', '广西工业职业技术学院', 'guangxigongyezhiyejishuxueyuan', '2', '239');
INSERT INTO `oj_school` VALUES ('2017', '广西国际商务职业技术学院', 'guangxiguojishangwuzhiyejishuxueyuan', '2', '239');
INSERT INTO `oj_school` VALUES ('2018', '广西农业职业技术学院', 'guangxinongyezhiyejishuxueyuan', '2', '239');
INSERT INTO `oj_school` VALUES ('2019', '柳州铁道职业技术学院', 'liuzhoutiedaozhiyejishuxueyuan', '2', '240');
INSERT INTO `oj_school` VALUES ('2020', '广西建设职业技术学院', 'guangxijianshezhiyejishuxueyuan', '2', '239');
INSERT INTO `oj_school` VALUES ('2021', '广西现代职业技术学院', 'guangxixiandaizhiyejishuxueyuan', '2', '252');
INSERT INTO `oj_school` VALUES ('2022', '北海职业学院', 'beihaizhiyexueyuan', '2', '243');
INSERT INTO `oj_school` VALUES ('2023', '桂林山水职业学院', 'guilinshanshuizhiyexueyuan', '2', '241');
INSERT INTO `oj_school` VALUES ('2024', '广西经贸职业技术学院', 'guangxijingmaozhiyejishuxueyuan', '2', '239');
INSERT INTO `oj_school` VALUES ('2025', '广西工商职业技术学院', 'guangxigongshangzhiyejishuxueyuan', '2', '239');
INSERT INTO `oj_school` VALUES ('2026', '广西演艺职业学院', 'guangxiyanyizhiyexueyuan', '2', '239');
INSERT INTO `oj_school` VALUES ('2027', '广西电力职业技术学院', 'guangxidianlizhiyejishuxueyuan', '2', '239');
INSERT INTO `oj_school` VALUES ('2028', '广西城市职业学院', 'guangxichengshizhiyexueyuan', '2', '248');
INSERT INTO `oj_school` VALUES ('2029', '广西英华国际职业学院', 'guangxiyinghuaguojizhiyexueyuan', '2', '245');
INSERT INTO `oj_school` VALUES ('2030', '柳州城市职业学院', 'liuzhouchengshizhiyexueyuan', '2', '240');
INSERT INTO `oj_school` VALUES ('2031', '百色职业学院', 'baisezhiyexueyuan', '2', '251');
INSERT INTO `oj_school` VALUES ('2032', '广西工程职业学院', 'guangxigongchengzhiyexueyuan', '2', '251');
INSERT INTO `oj_school` VALUES ('2033', '广西理工职业技术学院', 'guangxiligongzhiyejishuxueyuan', '2', '248');
INSERT INTO `oj_school` VALUES ('2034', '梧州职业学院', 'wuzhouzhiyexueyuan', '2', '242');
INSERT INTO `oj_school` VALUES ('2035', '广西经济职业学院', 'guangxijingjizhiyexueyuan', '2', '239');
INSERT INTO `oj_school` VALUES ('2036', '广西幼儿师范高等专科学校', 'guangxiyouershifangaodengzhuankexuexiao', '2', '239');
INSERT INTO `oj_school` VALUES ('2037', '广西科技职业学院', 'guangxikejizhiyexueyuan', '2', '248');
INSERT INTO `oj_school` VALUES ('2038', '广西卫生职业技术学院', 'guangxiweishengzhiyejishuxueyuan', '2', '239');
INSERT INTO `oj_school` VALUES ('2039', '广西培贤国际职业学院', 'guangxipeixianguojizhiyexueyuan', '2', '251');
INSERT INTO `oj_school` VALUES ('2040', '广西金融职业技术学院', 'guangxijinrongzhiyejishuxueyuan', '2', '239');
INSERT INTO `oj_school` VALUES ('2041', '广西中远职业学院', 'guangxizhongyuanzhiyexueyuan', '2', '248');
INSERT INTO `oj_school` VALUES ('2042', '玉柴职业技术学院', 'yuchaizhiyejishuxueyuan', '2', '247');
INSERT INTO `oj_school` VALUES ('2043', '广西蓝天航空职业学院', 'guangxilantianhangkongzhiyexueyuan', '2', '249');
INSERT INTO `oj_school` VALUES ('2044', '海南大学', 'hainandaxue', '1', '272');
INSERT INTO `oj_school` VALUES ('2045', '海南热带海洋学院', 'hainanredaihaiyangxueyuan', '1', '273');
INSERT INTO `oj_school` VALUES ('2046', '海南师范大学', 'hainanshifandaxue', '1', '272');
INSERT INTO `oj_school` VALUES ('2047', '海南医学院', 'hainanyixueyuan', '1', '272');
INSERT INTO `oj_school` VALUES ('2048', '海口经济学院', 'haikoujingjixueyuan', '1', '272');
INSERT INTO `oj_school` VALUES ('2049', '琼台师范学院', 'qiongtaishifanxueyuan', '1', '272');
INSERT INTO `oj_school` VALUES ('2050', '三亚学院', 'sanyaxueyuan', '1', '273');
INSERT INTO `oj_school` VALUES ('2051', '海南职业技术学院', 'hainanzhiyejishuxueyuan', '2', '272');
INSERT INTO `oj_school` VALUES ('2052', '三亚城市职业学院', 'sanyachengshizhiyexueyuan', '2', '273');
INSERT INTO `oj_school` VALUES ('2053', '海南软件职业技术学院', 'hainanruanjianzhiyejishuxueyuan', '2', '254');
INSERT INTO `oj_school` VALUES ('2054', '海南政法职业学院', 'hainanzhengfazhiyexueyuan', '2', '272');
INSERT INTO `oj_school` VALUES ('2055', '海南外国语职业学院', 'hainanwaiguoyuzhiyexueyuan', '2', '257');
INSERT INTO `oj_school` VALUES ('2056', '海南经贸职业技术学院', 'hainanjingmaozhiyejishuxueyuan', '2', '272');
INSERT INTO `oj_school` VALUES ('2057', '海南工商职业学院', 'hainangongshangzhiyexueyuan', '2', '272');
INSERT INTO `oj_school` VALUES ('2058', '三亚航空旅游职业学院', 'sanyahangkonglvyouzhiyexueyuan', '2', '273');
INSERT INTO `oj_school` VALUES ('2059', '海南科技职业学院', 'hainankejizhiyexueyuan', '2', '272');
INSERT INTO `oj_school` VALUES ('2060', '三亚理工职业学院', 'sanyaligongzhiyexueyuan', '2', '273');
INSERT INTO `oj_school` VALUES ('2061', '海南体育职业技术学院', 'hainantiyuzhiyejishuxueyuan', '2', '272');
INSERT INTO `oj_school` VALUES ('2062', '重庆大学', 'zhongqingdaxue', '1', '274');
INSERT INTO `oj_school` VALUES ('2063', '重庆邮电大学', 'zhongqingyoudiandaxue', '1', '274');
INSERT INTO `oj_school` VALUES ('2064', '重庆交通大学', 'zhongqingjiaotongdaxue', '1', '274');
INSERT INTO `oj_school` VALUES ('2065', '重庆医科大学', 'zhongqingyikedaxue', '1', '274');
INSERT INTO `oj_school` VALUES ('2066', '西南大学', 'xinandaxue', '1', '274');
INSERT INTO `oj_school` VALUES ('2067', '重庆师范大学', 'zhongqingshifandaxue', '1', '274');
INSERT INTO `oj_school` VALUES ('2068', '重庆文理学院', 'zhongqingwenlixueyuan', '1', '274');
INSERT INTO `oj_school` VALUES ('2069', '重庆三峡学院', 'zhongqingsanxiaxueyuan', '1', '274');
INSERT INTO `oj_school` VALUES ('2070', '长江师范学院', 'changjiangshifanxueyuan', '1', '274');
INSERT INTO `oj_school` VALUES ('2071', '四川外国语大学', 'sichuanwaiguoyudaxue', '1', '274');
INSERT INTO `oj_school` VALUES ('2072', '西南政法大学', 'xinanzhengfadaxue', '1', '274');
INSERT INTO `oj_school` VALUES ('2073', '四川美术学院', 'sichuanmeishuxueyuan', '1', '274');
INSERT INTO `oj_school` VALUES ('2074', '重庆科技学院', 'zhongqingkejixueyuan', '1', '274');
INSERT INTO `oj_school` VALUES ('2075', '重庆理工大学', 'zhongqingligongdaxue', '1', '274');
INSERT INTO `oj_school` VALUES ('2076', '重庆工商大学', 'zhongqinggongshangdaxue', '1', '274');
INSERT INTO `oj_school` VALUES ('2077', '重庆工程学院', 'zhongqinggongchengxueyuan', '1', '274');
INSERT INTO `oj_school` VALUES ('2078', '重庆大学城市科技学院', 'zhongqingdaxuechengshikejixueyuan', '1', '274');
INSERT INTO `oj_school` VALUES ('2079', '重庆警察学院', 'zhongqingjingchaxueyuan', '1', '274');
INSERT INTO `oj_school` VALUES ('2080', '重庆人文科技学院', 'zhongqingrenwenkejixueyuan', '1', '274');
INSERT INTO `oj_school` VALUES ('2081', '四川外国语大学重庆南方翻译学院', 'sichuanwaiguoyudaxuezhongqingnanfangfanyixueyuan', '1', '274');
INSERT INTO `oj_school` VALUES ('2082', '重庆师范大学涉外商贸学院', 'zhongqingshifandaxueshewaishangmaoxueyuan', '1', '274');
INSERT INTO `oj_school` VALUES ('2083', '重庆工商大学融智学院', 'zhongqinggongshangdaxuerongzhixueyuan', '1', '274');
INSERT INTO `oj_school` VALUES ('2084', '重庆工商大学派斯学院', 'zhongqinggongshangdaxuepaisixueyuan', '1', '274');
INSERT INTO `oj_school` VALUES ('2085', '重庆邮电大学移通学院', 'zhongqingyoudiandaxueyitongxueyuan', '1', '274');
INSERT INTO `oj_school` VALUES ('2086', '重庆第二师范学院', 'zhongqingdiershifanxueyuan', '1', '274');
INSERT INTO `oj_school` VALUES ('2087', '重庆航天职业技术学院', 'zhongqinghangtianzhiyejishuxueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2088', '重庆电力高等专科学校', 'zhongqingdianligaodengzhuankexuexiao', '2', '274');
INSERT INTO `oj_school` VALUES ('2089', '重庆工业职业技术学院', 'zhongqinggongyezhiyejishuxueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2090', '重庆三峡职业学院', 'zhongqingsanxiazhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2091', '重庆工贸职业技术学院', 'zhongqinggongmaozhiyejishuxueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2092', '重庆机电职业技术学院', 'zhongqingjidianzhiyejishuxueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2093', '重庆电子工程职业学院', 'zhongqingdianzigongchengzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2094', '重庆海联职业技术学院', 'zhongqinghailianzhiyejishuxueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2095', '重庆信息技术职业学院', 'zhongqingxinxijishuzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2096', '重庆传媒职业学院', 'zhongqingchuanmeizhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2097', '重庆城市管理职业学院', 'zhongqingchengshiguanlizhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2098', '重庆工程职业技术学院', 'zhongqinggongchengzhiyejishuxueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2099', '重庆房地产职业学院', 'zhongqingfangdichanzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2100', '重庆城市职业学院', 'zhongqingchengshizhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2101', '重庆水利电力职业技术学院', 'zhongqingshuilidianlizhiyejishuxueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2102', '重庆工商职业学院', 'zhongqinggongshangzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2103', '重庆应用技术职业学院', 'zhongqingyingyongjishuzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2104', '重庆三峡医药高等专科学校', 'zhongqingsanxiayiyaogaodengzhuankexuexiao', '2', '274');
INSERT INTO `oj_school` VALUES ('2105', '重庆医药高等专科学校', 'zhongqingyiyaogaodengzhuankexuexiao', '2', '274');
INSERT INTO `oj_school` VALUES ('2106', '重庆青年职业技术学院', 'zhongqingqingnianzhiyejishuxueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2107', '重庆财经职业学院', 'zhongqingcaijingzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2108', '重庆科创职业学院', 'zhongqingkechuangzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2109', '重庆建筑工程职业学院', 'zhongqingjianzhugongchengzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2110', '重庆电讯职业学院', 'zhongqingdianxunzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2111', '重庆能源职业学院', 'zhongqingnengyuanzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2112', '重庆商务职业学院', 'zhongqingshangwuzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2113', '重庆交通职业学院', 'zhongqingjiaotongzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2114', '重庆化工职业学院', 'zhongqinghuagongzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2115', '重庆旅游职业学院', 'zhongqinglvyouzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2116', '重庆安全技术职业学院', 'zhongqinganquanjishuzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2117', '重庆公共运输职业学院', 'zhongqinggonggongyunshuzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2118', '重庆艺术工程职业学院', 'zhongqingyishugongchengzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2119', '重庆轻工职业学院', 'zhongqingqinggongzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2120', '重庆电信职业学院', 'zhongqingdianxinzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2121', '重庆经贸职业学院', 'zhongqingjingmaozhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2122', '重庆幼儿师范高等专科学校', 'zhongqingyouershifangaodengzhuankexuexiao', '2', '274');
INSERT INTO `oj_school` VALUES ('2123', '重庆文化艺术职业学院', 'zhongqingwenhuayishuzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2124', '重庆服装工程职业学院', 'zhongqingfuzhuanggongchengzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2125', '重庆资源与环境保护职业学院', 'zhongqingziyuanyuhuanjingbaohuzhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2126', '重庆护理职业学院', 'zhongqinghulizhiyexueyuan', '2', '274');
INSERT INTO `oj_school` VALUES ('2127', '四川大学', 'sichuandaxue', '1', '277');
INSERT INTO `oj_school` VALUES ('2128', '西南交通大学', 'xinanjiaotongdaxue', '1', '277');
INSERT INTO `oj_school` VALUES ('2129', '电子科技大学', 'dianzikejidaxue', '1', '277');
INSERT INTO `oj_school` VALUES ('2130', '西南石油大学', 'xinanshiyoudaxue', '1', '277');
INSERT INTO `oj_school` VALUES ('2131', '成都理工大学', 'chengduligongdaxue', '1', '277');
INSERT INTO `oj_school` VALUES ('2132', '西南科技大学', 'xinankejidaxue', '1', '282');
INSERT INTO `oj_school` VALUES ('2133', '成都信息工程大学', 'chengduxinxigongchengdaxue', '1', '277');
INSERT INTO `oj_school` VALUES ('2134', '四川理工学院', 'sichuanligongxueyuan', '1', '278');
INSERT INTO `oj_school` VALUES ('2135', '西华大学', 'xihuadaxue', '1', '277');
INSERT INTO `oj_school` VALUES ('2136', '中国民用航空飞行学院', 'zhongguominyonghangkongfeixingxueyuan', '1', '281');
INSERT INTO `oj_school` VALUES ('2137', '四川农业大学', 'sichuannongyedaxue', '1', '291');
INSERT INTO `oj_school` VALUES ('2138', '西昌学院', 'xichangxueyuan', '1', '294');
INSERT INTO `oj_school` VALUES ('2139', '西南医科大学', 'xinanyikedaxue', '1', '280');
INSERT INTO `oj_school` VALUES ('2140', '成都中医药大学', 'chengduzhongyiyaodaxue', '1', '277');
INSERT INTO `oj_school` VALUES ('2141', '川北医学院', 'chuanbeiyixueyuan', '1', '287');
INSERT INTO `oj_school` VALUES ('2142', '四川师范大学', 'sichuanshifandaxue', '1', '277');
INSERT INTO `oj_school` VALUES ('2143', '西华师范大学', 'xihuashifandaxue', '1', '287');
INSERT INTO `oj_school` VALUES ('2144', '绵阳师范学院', 'mianyangshifanxueyuan', '1', '282');
INSERT INTO `oj_school` VALUES ('2145', '内江师范学院', 'neijiangshifanxueyuan', '1', '285');
INSERT INTO `oj_school` VALUES ('2146', '宜宾学院', 'yibinxueyuan', '1', '288');
INSERT INTO `oj_school` VALUES ('2147', '四川文理学院', 'sichuanwenlixueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('2148', '阿坝师范学院', 'abashifanxueyuan', '1', '292');
INSERT INTO `oj_school` VALUES ('2149', '乐山师范学院', 'leshanshifanxueyuan', '1', '286');
INSERT INTO `oj_school` VALUES ('2150', '西南财经大学', 'xinancaijingdaxue', '1', '277');
INSERT INTO `oj_school` VALUES ('2151', '成都体育学院', 'chengdutiyuxueyuan', '1', '277');
INSERT INTO `oj_school` VALUES ('2152', '四川音乐学院', 'sichuanyinlexueyuan', '1', '277');
INSERT INTO `oj_school` VALUES ('2153', '西南民族大学', 'xinanminzudaxue', '1', '277');
INSERT INTO `oj_school` VALUES ('2154', '成都学院', 'chengduxueyuan', '1', '277');
INSERT INTO `oj_school` VALUES ('2155', '成都工业学院', 'chengdugongyexueyuan', '1', '277');
INSERT INTO `oj_school` VALUES ('2156', '攀枝花学院', 'panzhihuaxueyuan', '1', '279');
INSERT INTO `oj_school` VALUES ('2157', '四川旅游学院', 'sichuanlvyouxueyuan', '1', '277');
INSERT INTO `oj_school` VALUES ('2158', '四川民族学院', 'sichuanminzuxueyuan', '1', '293');
INSERT INTO `oj_school` VALUES ('2159', '四川警察学院', 'sichuanjingchaxueyuan', '1', '280');
INSERT INTO `oj_school` VALUES ('2160', '成都东软学院', 'chengdudongruanxueyuan', '1', '277');
INSERT INTO `oj_school` VALUES ('2161', '电子科技大学成都学院', 'dianzikejidaxuechengduxueyuan', '1', '277');
INSERT INTO `oj_school` VALUES ('2162', '成都理工大学工程技术学院', 'chengduligongdaxuegongchengjishuxueyuan', '1', '286');
INSERT INTO `oj_school` VALUES ('2163', '四川传媒学院', 'sichuanchuanmeixueyuan', '1', '277');
INSERT INTO `oj_school` VALUES ('2164', '成都信息工程大学银杏酒店管理学院', 'chengduxinxigongchengdaxueyinxingjiudianguanlixuey', '1', '277');
INSERT INTO `oj_school` VALUES ('2165', '成都文理学院', 'chengduwenlixueyuan', '1', '277');
INSERT INTO `oj_school` VALUES ('2166', '四川工商学院', 'sichuangongshangxueyuan', '1', '277');
INSERT INTO `oj_school` VALUES ('2167', '四川外国语大学成都学院', 'sichuanwaiguoyudaxuechengduxueyuan', '1', '277');
INSERT INTO `oj_school` VALUES ('2168', '成都医学院', 'chengduyixueyuan', '1', '277');
INSERT INTO `oj_school` VALUES ('2169', '四川工业科技学院', 'sichuangongyekejixueyuan', '1', '281');
INSERT INTO `oj_school` VALUES ('2170', '四川大学锦城学院', 'sichuandaxuejinchengxueyuan', '1', '277');
INSERT INTO `oj_school` VALUES ('2171', '西南财经大学天府学院', 'xinancaijingdaxuetianfuxueyuan', '1', '282');
INSERT INTO `oj_school` VALUES ('2172', '四川大学锦江学院', 'sichuandaxuejinjiangxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('2173', '四川文化艺术学院', 'sichuanwenhuayishuxueyuan', '1', '282');
INSERT INTO `oj_school` VALUES ('2174', '西南科技大学城市学院', 'xinankejidaxuechengshixueyuan', '1', '282');
INSERT INTO `oj_school` VALUES ('2175', '西南交通大学希望学院', 'xinanjiaotongdaxuexiwangxueyuan', '1', '287');
INSERT INTO `oj_school` VALUES ('2176', '成都师范学院', 'chengdushifanxueyuan', '1', '277');
INSERT INTO `oj_school` VALUES ('2177', '四川电影电视学院', 'sichuandianyingdianshixueyuan', '1', '277');
INSERT INTO `oj_school` VALUES ('2178', '成都纺织高等专科学校', 'chengdufangzhigaodengzhuankexuexiao', '2', '277');
INSERT INTO `oj_school` VALUES ('2179', '民办四川天一学院', 'minbansichuantianyixueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2180', '成都航空职业技术学院', 'chengduhangkongzhiyejishuxueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2181', '四川电力职业技术学院', 'sichuandianlizhiyejishuxueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2182', '成都职业技术学院', 'chengduzhiyejishuxueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2183', '四川化工职业技术学院', 'sichuanhuagongzhiyejishuxueyuan', '2', '280');
INSERT INTO `oj_school` VALUES ('2184', '四川水利职业技术学院', 'sichuanshuilizhiyejishuxueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2185', '南充职业技术学院', 'nanchongzhiyejishuxueyuan', '2', '287');
INSERT INTO `oj_school` VALUES ('2186', '内江职业技术学院', 'neijiangzhiyejishuxueyuan', '2', '285');
INSERT INTO `oj_school` VALUES ('2187', '四川航天职业技术学院', 'sichuanhangtianzhiyejishuxueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2188', '四川邮电职业技术学院', 'sichuanyoudianzhiyejishuxueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2189', '四川机电职业技术学院', 'sichuanjidianzhiyejishuxueyuan', '2', '279');
INSERT INTO `oj_school` VALUES ('2190', '绵阳职业技术学院', 'mianyangzhiyejishuxueyuan', '2', '282');
INSERT INTO `oj_school` VALUES ('2191', '四川交通职业技术学院', 'sichuanjiaotongzhiyejishuxueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2192', '四川工商职业技术学院', 'sichuangongshangzhiyejishuxueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2193', '四川工程职业技术学院', 'sichuangongchengzhiyejishuxueyuan', '2', '281');
INSERT INTO `oj_school` VALUES ('2194', '四川建筑职业技术学院', 'sichuanjianzhuzhiyejishuxueyuan', '2', '281');
INSERT INTO `oj_school` VALUES ('2195', '达州职业技术学院', 'dazhouzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2196', '四川托普信息技术职业学院', 'sichuantuopuxinxijishuzhiyexueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2197', '四川国际标榜职业学院', 'sichuanguojibiaobangzhiyexueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2198', '成都农业科技职业学院', 'chengdunongyekejizhiyexueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2199', '宜宾职业技术学院', 'yibinzhiyejishuxueyuan', '2', '288');
INSERT INTO `oj_school` VALUES ('2200', '泸州职业技术学院', 'luzhouzhiyejishuxueyuan', '2', '280');
INSERT INTO `oj_school` VALUES ('2201', '眉山职业技术学院', 'meishanzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2202', '成都艺术职业学院', 'chengduyishuzhiyexueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2203', '四川职业技术学院', 'sichuanzhiyejishuxueyuan', '2', '284');
INSERT INTO `oj_school` VALUES ('2204', '乐山职业技术学院', 'leshanzhiyejishuxueyuan', '2', '286');
INSERT INTO `oj_school` VALUES ('2205', '雅安职业技术学院', 'yaanzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2206', '四川商务职业学院', 'sichuanshangwuzhiyexueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2207', '四川司法警官职业学院', 'sichuansifajingguanzhiyexueyuan', '2', '281');
INSERT INTO `oj_school` VALUES ('2208', '广安职业技术学院', 'guanganzhiyejishuxueyuan', '2', '289');
INSERT INTO `oj_school` VALUES ('2209', '四川信息职业技术学院', 'sichuanxinxizhiyejishuxueyuan', '2', '283');
INSERT INTO `oj_school` VALUES ('2210', '四川文化传媒职业学院', 'sichuanwenhuachuanmeizhiyexueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2211', '四川华新现代职业学院', 'sichuanhuaxinxiandaizhiyexueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2212', '四川管理职业学院', 'sichuanguanlizhiyexueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2213', '四川艺术职业学院', 'sichuanyishuzhiyexueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2214', '四川中医药高等专科学校', 'sichuanzhongyiyaogaodengzhuankexuexiao', '2', '282');
INSERT INTO `oj_school` VALUES ('2215', '四川科技职业学院', 'sichuankejizhiyexueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2216', '四川文化产业职业学院', 'sichuanwenhuachanyezhiyexueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2217', '四川财经职业学院', 'sichuancaijingzhiyexueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2218', '四川城市职业学院', 'sichuanchengshizhiyexueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2219', '四川现代职业学院', 'sichuanxiandaizhiyexueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2220', '四川幼儿师范高等专科学校', 'sichuanyouershifangaodengzhuankexuexiao', '2', '282');
INSERT INTO `oj_school` VALUES ('2221', '四川长江职业学院', 'sichuanchangjiangzhiyexueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2222', '四川三河职业学院', 'sichuansanhezhiyexueyuan', '2', '280');
INSERT INTO `oj_school` VALUES ('2223', '川北幼儿师范高等专科学校', 'chuanbeiyouershifangaodengzhuankexuexiao', '2', '283');
INSERT INTO `oj_school` VALUES ('2224', '四川卫生康复职业学院', 'sichuanweishengkangfuzhiyexueyuan', '2', '278');
INSERT INTO `oj_school` VALUES ('2225', '四川汽车职业技术学院', 'sichuanqichezhiyejishuxueyuan', '2', '282');
INSERT INTO `oj_school` VALUES ('2226', '巴中职业技术学院', 'bazhongzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2227', '四川希望汽车职业学院', 'sichuanxiwangqichezhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2228', '四川电子机械职业技术学院', 'sichuandianzijixiezhiyejishuxueyuan', '2', '282');
INSERT INTO `oj_school` VALUES ('2229', '四川文轩职业学院', 'sichuanwenxuanzhiyexueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2230', '川南幼儿师范高等专科学校', 'chuannanyouershifangaodengzhuankexuexiao', '2', '285');
INSERT INTO `oj_school` VALUES ('2231', '四川护理职业学院', 'sichuanhulizhiyexueyuan', '2', '281');
INSERT INTO `oj_school` VALUES ('2232', '成都工业职业技术学院', 'chengdugongyezhiyejishuxueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2233', '四川西南航空职业学院', 'sichuanxinanhangkongzhiyexueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2234', '成都工贸职业技术学院', 'chengdugongmaozhiyejishuxueyuan', '2', '277');
INSERT INTO `oj_school` VALUES ('2235', '四川应用技术职业学院', 'sichuanyingyongjishuzhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2236', '贵州大学', 'guizhoudaxue', '1', '299');
INSERT INTO `oj_school` VALUES ('2237', '贵州医科大学', 'guizhouyikedaxue', '1', '299');
INSERT INTO `oj_school` VALUES ('2238', '遵义医学院', 'zunyiyixueyuan', '1', '301');
INSERT INTO `oj_school` VALUES ('2239', '贵阳中医学院', 'guiyangzhongyixueyuan', '1', '299');
INSERT INTO `oj_school` VALUES ('2240', '贵州师范大学', 'guizhoushifandaxue', '1', '299');
INSERT INTO `oj_school` VALUES ('2241', '遵义师范学院', 'zunyishifanxueyuan', '1', '301');
INSERT INTO `oj_school` VALUES ('2242', '铜仁学院', 'tongrenxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('2243', '兴义民族师范学院', 'xingyiminzushifanxueyuan', '1', '303');
INSERT INTO `oj_school` VALUES ('2244', '安顺学院', 'anshunxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('2245', '贵州工程应用技术学院', 'guizhougongchengyingyongjishuxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('2246', '凯里学院', 'kailixueyuan', '1', '306');
INSERT INTO `oj_school` VALUES ('2247', '黔南民族师范学院', 'qiannanminzushifanxueyuan', '1', '307');
INSERT INTO `oj_school` VALUES ('2248', '贵州财经大学', 'guizhoucaijingdaxue', '1', '299');
INSERT INTO `oj_school` VALUES ('2249', '贵州民族大学', 'guizhouminzudaxue', '1', '299');
INSERT INTO `oj_school` VALUES ('2250', '贵阳学院', 'guiyangxueyuan', '1', '299');
INSERT INTO `oj_school` VALUES ('2251', '六盘水师范学院', 'liupanshuishifanxueyuan', '1', '300');
INSERT INTO `oj_school` VALUES ('2252', '贵州商学院', 'guizhoushangxueyuan', '1', '299');
INSERT INTO `oj_school` VALUES ('2253', '贵阳中医学院时珍学院', 'guiyangzhongyixueyuanshizhenxueyuan', '1', '299');
INSERT INTO `oj_school` VALUES ('2254', '贵州财经大学商务学院', 'guizhoucaijingdaxueshangwuxueyuan', '1', '299');
INSERT INTO `oj_school` VALUES ('2255', '贵州大学科技学院', 'guizhoudaxuekejixueyuan', '1', '299');
INSERT INTO `oj_school` VALUES ('2256', '贵州大学明德学院', 'guizhoudaxuemingdexueyuan', '1', '299');
INSERT INTO `oj_school` VALUES ('2257', '贵州民族大学人文科技学院', 'guizhouminzudaxuerenwenkejixueyuan', '1', '299');
INSERT INTO `oj_school` VALUES ('2258', '贵州师范大学求是学院', 'guizhoushifandaxueqiushixueyuan', '1', '299');
INSERT INTO `oj_school` VALUES ('2259', '遵义医学院医学与科技学院', 'zunyiyixueyuanyixueyukejixueyuan', '1', '301');
INSERT INTO `oj_school` VALUES ('2260', '贵州医科大学神奇民族医药学院', 'guizhouyikedaxueshenqiminzuyiyaoxueyuan', '1', '299');
INSERT INTO `oj_school` VALUES ('2261', '贵州师范学院', 'guizhoushifanxueyuan', '1', '299');
INSERT INTO `oj_school` VALUES ('2262', '贵州理工学院', 'guizhouligongxueyuan', '1', '299');
INSERT INTO `oj_school` VALUES ('2263', '黔南民族医学高等专科学校', 'qiannanminzuyixuegaodengzhuankexuexiao', '2', '307');
INSERT INTO `oj_school` VALUES ('2264', '贵州警官职业学院', 'guizhoujingguanzhiyexueyuan', '2', '299');
INSERT INTO `oj_school` VALUES ('2265', '贵州交通职业技术学院', 'guizhoujiaotongzhiyejishuxueyuan', '2', '299');
INSERT INTO `oj_school` VALUES ('2266', '贵州航天职业技术学院', 'guizhouhangtianzhiyejishuxueyuan', '2', '301');
INSERT INTO `oj_school` VALUES ('2267', '贵州电子信息职业技术学院', 'guizhoudianzixinxizhiyejishuxueyuan', '2', '306');
INSERT INTO `oj_school` VALUES ('2268', '安顺职业技术学院', 'anshunzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2269', '黔东南民族职业技术学院', 'qiandongnanminzuzhiyejishuxueyuan', '2', '306');
INSERT INTO `oj_school` VALUES ('2270', '黔南民族职业技术学院', 'qiannanminzuzhiyejishuxueyuan', '2', '307');
INSERT INTO `oj_school` VALUES ('2271', '遵义职业技术学院', 'zunyizhiyejishuxueyuan', '2', '301');
INSERT INTO `oj_school` VALUES ('2272', '贵州城市职业学院', 'guizhouchengshizhiyexueyuan', '2', '299');
INSERT INTO `oj_school` VALUES ('2273', '贵州工业职业技术学院', 'guizhougongyezhiyejishuxueyuan', '2', '299');
INSERT INTO `oj_school` VALUES ('2274', '贵州电力职业技术学院', 'guizhoudianlizhiyejishuxueyuan', '2', '299');
INSERT INTO `oj_school` VALUES ('2275', '六盘水职业技术学院', 'liupanshuizhiyejishuxueyuan', '2', '300');
INSERT INTO `oj_school` VALUES ('2276', '铜仁职业技术学院', 'tongrenzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2277', '黔西南民族职业技术学院', 'qianxinanminzuzhiyejishuxueyuan', '2', '303');
INSERT INTO `oj_school` VALUES ('2278', '贵州轻工职业技术学院', 'guizhouqinggongzhiyejishuxueyuan', '2', '299');
INSERT INTO `oj_school` VALUES ('2279', '遵义医药高等专科学校', 'zunyiyiyaogaodengzhuankexuexiao', '2', '301');
INSERT INTO `oj_school` VALUES ('2280', '贵阳护理职业学院', 'guiyanghulizhiyexueyuan', '2', '299');
INSERT INTO `oj_school` VALUES ('2281', '贵阳职业技术学院', 'guiyangzhiyejishuxueyuan', '2', '299');
INSERT INTO `oj_school` VALUES ('2282', '毕节职业技术学院', 'bijiezhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2283', '贵州职业技术学院', 'guizhouzhiyejishuxueyuan', '2', '299');
INSERT INTO `oj_school` VALUES ('2284', '贵州盛华职业学院', 'guizhoushenghuazhiyexueyuan', '2', '307');
INSERT INTO `oj_school` VALUES ('2285', '贵州工商职业学院', 'guizhougongshangzhiyexueyuan', '2', '299');
INSERT INTO `oj_school` VALUES ('2286', '贵阳幼儿师范高等专科学校', 'guiyangyouershifangaodengzhuankexuexiao', '2', '299');
INSERT INTO `oj_school` VALUES ('2287', '铜仁幼儿师范高等专科学校', 'tongrenyouershifangaodengzhuankexuexiao', '2', '999');
INSERT INTO `oj_school` VALUES ('2288', '黔南民族幼儿师范高等专科学校', 'qiannanminzuyouershifangaodengzhuankexuexiao', '2', '307');
INSERT INTO `oj_school` VALUES ('2289', '毕节医学高等专科学校', 'bijieyixuegaodengzhuankexuexiao', '2', '999');
INSERT INTO `oj_school` VALUES ('2290', '贵州建设职业技术学院', 'guizhoujianshezhiyejishuxueyuan', '2', '299');
INSERT INTO `oj_school` VALUES ('2291', '毕节幼儿师范高等专科学校', 'bijieyouershifangaodengzhuankexuexiao', '2', '999');
INSERT INTO `oj_school` VALUES ('2292', '贵州农业职业学院', 'guizhounongyezhiyexueyuan', '2', '299');
INSERT INTO `oj_school` VALUES ('2293', '贵州工程职业学院', 'guizhougongchengzhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2294', '贵州工贸职业学院', 'guizhougongmaozhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2295', '贵州水利水电职业技术学院', 'guizhoushuilishuidianzhiyejishuxueyuan', '2', '299');
INSERT INTO `oj_school` VALUES ('2296', '贵州电子商务职业技术学院', 'guizhoudianzishangwuzhiyejishuxueyuan', '2', '299');
INSERT INTO `oj_school` VALUES ('2297', '贵州应用技术职业学院', 'guizhouyingyongjishuzhiyexueyuan', '2', '307');
INSERT INTO `oj_school` VALUES ('2298', '贵州电子科技职业学院', 'guizhoudianzikejizhiyexueyuan', '2', '299');
INSERT INTO `oj_school` VALUES ('2299', '贵州航空职业技术学院', 'guizhouhangkongzhiyejishuxueyuan', '2', '299');
INSERT INTO `oj_school` VALUES ('2300', '云南大学', 'yunnandaxue', '1', '309');
INSERT INTO `oj_school` VALUES ('2301', '昆明理工大学', 'kunmingligongdaxue', '1', '309');
INSERT INTO `oj_school` VALUES ('2302', '云南农业大学', 'yunnannongyedaxue', '1', '309');
INSERT INTO `oj_school` VALUES ('2303', '西南林业大学', 'xinanlinyedaxue', '1', '309');
INSERT INTO `oj_school` VALUES ('2304', '昆明医科大学', 'kunmingyikedaxue', '1', '309');
INSERT INTO `oj_school` VALUES ('2305', '大理大学', 'dalidaxue', '1', '318');
INSERT INTO `oj_school` VALUES ('2306', '云南中医学院', 'yunnanzhongyixueyuan', '1', '309');
INSERT INTO `oj_school` VALUES ('2307', '云南师范大学', 'yunnanshifandaxue', '1', '309');
INSERT INTO `oj_school` VALUES ('2308', '昭通学院', 'zhaotongxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('2309', '曲靖师范学院', 'qujingshifanxueyuan', '1', '310');
INSERT INTO `oj_school` VALUES ('2310', '普洱学院', 'puerxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('2311', '保山学院', 'baoshanxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('2312', '红河学院', 'honghexueyuan', '1', '314');
INSERT INTO `oj_school` VALUES ('2313', '云南财经大学', 'yunnancaijingdaxue', '1', '309');
INSERT INTO `oj_school` VALUES ('2314', '云南艺术学院', 'yunnanyishuxueyuan', '1', '309');
INSERT INTO `oj_school` VALUES ('2315', '云南民族大学', 'yunnanminzudaxue', '1', '309');
INSERT INTO `oj_school` VALUES ('2316', '玉溪师范学院', 'yuxishifanxueyuan', '1', '311');
INSERT INTO `oj_school` VALUES ('2317', '楚雄师范学院', 'chuxiongshifanxueyuan', '1', '313');
INSERT INTO `oj_school` VALUES ('2318', '云南警官学院', 'yunnanjingguanxueyuan', '1', '309');
INSERT INTO `oj_school` VALUES ('2319', '昆明学院', 'kunmingxueyuan', '1', '309');
INSERT INTO `oj_school` VALUES ('2320', '文山学院', 'wenshanxueyuan', '1', '315');
INSERT INTO `oj_school` VALUES ('2321', '云南经济管理学院', 'yunnanjingjiguanlixueyuan', '1', '309');
INSERT INTO `oj_school` VALUES ('2322', '云南大学滇池学院', 'yunnandaxuedianchixueyuan', '1', '309');
INSERT INTO `oj_school` VALUES ('2323', '云南大学旅游文化学院', 'yunnandaxuelvyouwenhuaxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('2324', '昆明理工大学津桥学院', 'kunmingligongdaxuejinqiaoxueyuan', '1', '309');
INSERT INTO `oj_school` VALUES ('2325', '云南师范大学商学院', 'yunnanshifandaxueshangxueyuan', '1', '309');
INSERT INTO `oj_school` VALUES ('2326', '云南师范大学文理学院', 'yunnanshifandaxuewenlixueyuan', '1', '309');
INSERT INTO `oj_school` VALUES ('2327', '昆明医科大学海源学院', 'kunmingyikedaxuehaiyuanxueyuan', '1', '309');
INSERT INTO `oj_school` VALUES ('2328', '云南艺术学院文华学院', 'yunnanyishuxueyuanwenhuaxueyuan', '1', '309');
INSERT INTO `oj_school` VALUES ('2329', '云南工商学院', 'yunnangongshangxueyuan', '1', '309');
INSERT INTO `oj_school` VALUES ('2330', '滇西科技师范学院', 'dianxikejishifanxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('2331', '昆明冶金高等专科学校', 'kunmingyejingaodengzhuankexuexiao', '2', '309');
INSERT INTO `oj_school` VALUES ('2332', '云南国土资源职业学院', 'yunnanguotuziyuanzhiyexueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2333', '云南交通职业技术学院', 'yunnanjiaotongzhiyejishuxueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2334', '昆明工业职业技术学院', 'kunminggongyezhiyejishuxueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2335', '云南农业职业技术学院', 'yunnannongyezhiyejishuxueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2336', '云南司法警官职业学院', 'yunnansifajingguanzhiyexueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2337', '云南文化艺术职业学院', 'yunnanwenhuayishuzhiyexueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2338', '云南体育运动职业技术学院', 'yunnantiyuyundongzhiyejishuxueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2339', '云南科技信息职业学院', 'yunnankejixinxizhiyexueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2340', '西双版纳职业技术学院', 'xishuangbannazhiyejishuxueyuan', '2', '317');
INSERT INTO `oj_school` VALUES ('2341', '昆明艺术职业学院', 'kunmingyishuzhiyexueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2342', '玉溪农业职业技术学院', 'yuxinongyezhiyejishuxueyuan', '2', '311');
INSERT INTO `oj_school` VALUES ('2343', '云南能源职业技术学院', 'yunnannengyuanzhiyejishuxueyuan', '2', '310');
INSERT INTO `oj_school` VALUES ('2344', '云南国防工业职业技术学院', 'yunnanguofanggongyezhiyejishuxueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2345', '云南机电职业技术学院', 'yunnanjidianzhiyejishuxueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2346', '云南林业职业技术学院', 'yunnanlinyezhiyejishuxueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2347', '云南城市建设职业学院', 'yunnanchengshijianshezhiyexueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2348', '云南工程职业学院', 'yunnangongchengzhiyexueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2349', '曲靖医学高等专科学校', 'qujingyixuegaodengzhuankexuexiao', '2', '310');
INSERT INTO `oj_school` VALUES ('2350', '楚雄医药高等专科学校', 'chuxiongyiyaogaodengzhuankexuexiao', '2', '313');
INSERT INTO `oj_school` VALUES ('2351', '保山中医药高等专科学校', 'baoshanzhongyiyaogaodengzhuankexuexiao', '2', '999');
INSERT INTO `oj_school` VALUES ('2352', '丽江师范高等专科学校', 'lijiangshifangaodengzhuankexuexiao', '2', '999');
INSERT INTO `oj_school` VALUES ('2353', '德宏师范高等专科学校', 'dehongshifangaodengzhuankexuexiao', '2', '320');
INSERT INTO `oj_school` VALUES ('2354', '云南新兴职业学院', 'yunnanxinxingzhiyexueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2355', '云南锡业职业技术学院', 'yunnanxiyezhiyejishuxueyuan', '2', '314');
INSERT INTO `oj_school` VALUES ('2356', '云南经贸外事职业学院', 'yunnanjingmaowaishizhiyexueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2357', '云南三鑫职业技术学院', 'yunnansanxinzhiyejishuxueyuan', '2', '315');
INSERT INTO `oj_school` VALUES ('2358', '德宏职业学院', 'dehongzhiyexueyuan', '2', '320');
INSERT INTO `oj_school` VALUES ('2359', '云南商务职业学院', 'yunnanshangwuzhiyexueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2360', '昆明卫生职业学院', 'kunmingweishengzhiyexueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2361', '云南现代职业技术学院', 'yunnanxiandaizhiyejishuxueyuan', '2', '313');
INSERT INTO `oj_school` VALUES ('2362', '云南旅游职业学院', 'yunnanlvyouzhiyexueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2363', '红河卫生职业学院', 'hongheweishengzhiyexueyuan', '2', '314');
INSERT INTO `oj_school` VALUES ('2364', '云南外事外语职业学院', 'yunnanwaishiwaiyuzhiyexueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2365', '大理农林职业技术学院', 'dalinonglinzhiyejishuxueyuan', '2', '318');
INSERT INTO `oj_school` VALUES ('2366', '公安消防部队高等专科学校', 'gonganxiaofangbuduigaodengzhuankexuexiao', '2', '309');
INSERT INTO `oj_school` VALUES ('2367', '云南财经职业学院', 'yunnancaijingzhiyexueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2368', '昆明铁道职业技术学院', 'kunmingtiedaozhiyejishuxueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2369', '昭通卫生职业学院', 'zhaotongweishengzhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2370', '大理护理职业学院', 'dalihulizhiyexueyuan', '2', '318');
INSERT INTO `oj_school` VALUES ('2371', '云南水利水电职业学院', 'yunnanshuilishuidianzhiyexueyuan', '2', '309');
INSERT INTO `oj_school` VALUES ('2372', '西藏大学', 'xicangdaxue', '1', '326');
INSERT INTO `oj_school` VALUES ('2373', '西藏民族大学', 'xicangminzudaxue', '1', '337');
INSERT INTO `oj_school` VALUES ('2374', '西藏藏医学院', 'xicangcangyixueyuan', '1', '326');
INSERT INTO `oj_school` VALUES ('2375', '西藏警官高等专科学校', 'xicangjingguangaodengzhuankexuexiao', '2', '326');
INSERT INTO `oj_school` VALUES ('2376', '拉萨师范高等专科学校', 'lasashifangaodengzhuankexuexiao', '2', '326');
INSERT INTO `oj_school` VALUES ('2377', '西藏职业技术学院', 'xicangzhiyejishuxueyuan', '2', '326');
INSERT INTO `oj_school` VALUES ('2378', '西北大学', 'xibeidaxue', '1', '334');
INSERT INTO `oj_school` VALUES ('2379', '西安交通大学', 'xianjiaotongdaxue', '1', '334');
INSERT INTO `oj_school` VALUES ('2380', '西北工业大学', 'xibeigongyedaxue', '1', '334');
INSERT INTO `oj_school` VALUES ('2381', '西安理工大学', 'xianligongdaxue', '1', '334');
INSERT INTO `oj_school` VALUES ('2382', '西安电子科技大学', 'xiandianzikejidaxue', '1', '334');
INSERT INTO `oj_school` VALUES ('2383', '西安工业大学', 'xiangongyedaxue', '1', '334');
INSERT INTO `oj_school` VALUES ('2384', '西安建筑科技大学', 'xianjianzhukejidaxue', '1', '334');
INSERT INTO `oj_school` VALUES ('2385', '西安科技大学', 'xiankejidaxue', '1', '334');
INSERT INTO `oj_school` VALUES ('2386', '西安石油大学', 'xianshiyoudaxue', '1', '334');
INSERT INTO `oj_school` VALUES ('2387', '陕西科技大学', 'shanxikejidaxue', '1', '334');
INSERT INTO `oj_school` VALUES ('2388', '西安工程大学', 'xiangongchengdaxue', '1', '334');
INSERT INTO `oj_school` VALUES ('2389', '长安大学', 'changandaxue', '1', '334');
INSERT INTO `oj_school` VALUES ('2390', '西北农林科技大学', 'xibeinonglinkejidaxue', '1', '337');
INSERT INTO `oj_school` VALUES ('2391', '陕西中医药大学', 'shanxizhongyiyaodaxue', '1', '337');
INSERT INTO `oj_school` VALUES ('2392', '陕西师范大学', 'shanxishifandaxue', '1', '334');
INSERT INTO `oj_school` VALUES ('2393', '延安大学', 'yanandaxue', '1', '339');
INSERT INTO `oj_school` VALUES ('2394', '陕西理工学院', 'shanxiligongxueyuan', '1', '340');
INSERT INTO `oj_school` VALUES ('2395', '宝鸡文理学院', 'baojiwenlixueyuan', '1', '336');
INSERT INTO `oj_school` VALUES ('2396', '咸阳师范学院', 'xianyangshifanxueyuan', '1', '337');
INSERT INTO `oj_school` VALUES ('2397', '渭南师范学院', 'weinanshifanxueyuan', '1', '338');
INSERT INTO `oj_school` VALUES ('2398', '西安外国语大学', 'xianwaiguoyudaxue', '1', '334');
INSERT INTO `oj_school` VALUES ('2399', '西北政法大学', 'xibeizhengfadaxue', '1', '334');
INSERT INTO `oj_school` VALUES ('2400', '西安体育学院', 'xiantiyuxueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2401', '西安音乐学院', 'xianyinlexueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2402', '西安美术学院', 'xianmeishuxueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2403', '西安文理学院', 'xianwenlixueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2404', '榆林学院', 'yulinxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('2405', '商洛学院', 'shangluoxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('2406', '安康学院', 'ankangxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('2407', '西安培华学院', 'xianpeihuaxueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2408', '西安财经学院', 'xiancaijingxueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2409', '西安邮电大学', 'xianyoudiandaxue', '1', '334');
INSERT INTO `oj_school` VALUES ('2410', '西安航空学院', 'xianhangkongxueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2411', '西安医学院', 'xianyixueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2412', '西安欧亚学院', 'xianouyaxueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2413', '西安外事学院', 'xianwaishixueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2414', '西安翻译学院', 'xianfanyixueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2415', '西京学院', 'xijingxueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2416', '西安思源学院', 'xiansiyuanxueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2417', '陕西国际商贸学院', 'shanxiguojishangmaoxueyuan', '1', '337');
INSERT INTO `oj_school` VALUES ('2418', '陕西服装工程学院', 'shanxifuzhuanggongchengxueyuan', '1', '337');
INSERT INTO `oj_school` VALUES ('2419', '西安交通工程学院', 'xianjiaotonggongchengxueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2420', '西安交通大学城市学院', 'xianjiaotongdaxuechengshixueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2421', '西北大学现代学院', 'xibeidaxuexiandaixueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2422', '西安建筑科技大学华清学院', 'xianjianzhukejidaxuehuaqingxueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2423', '西安财经学院行知学院', 'xiancaijingxueyuanxingzhixueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2424', '陕西科技大学镐京学院', 'shanxikejidaxuegaojingxueyuan', '1', '337');
INSERT INTO `oj_school` VALUES ('2425', '西安工业大学北方信息工程学院', 'xiangongyedaxuebeifangxinxigongchengxueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2426', '延安大学西安创新学院', 'yanandaxuexianchuangxinxueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2427', '西安电子科技大学长安学院', 'xiandianzikejidaxuechanganxueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2428', '西北工业大学明德学院', 'xibeigongyedaxuemingdexueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2429', '长安大学兴华学院', 'changandaxuexinghuaxueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2430', '西安理工大学高科学院', 'xianligongdaxuegaokexueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2431', '西安科技大学高新学院', 'xiankejidaxuegaoxinxueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2432', '陕西学前师范学院', 'shanxixueqianshifanxueyuan', '1', '334');
INSERT INTO `oj_school` VALUES ('2433', '陕西工业职业技术学院', 'shanxigongyezhiyejishuxueyuan', '2', '337');
INSERT INTO `oj_school` VALUES ('2434', '杨凌职业技术学院', 'yanglingzhiyejishuxueyuan', '2', '337');
INSERT INTO `oj_school` VALUES ('2435', '西安电力高等专科学校', 'xiandianligaodengzhuankexuexiao', '2', '334');
INSERT INTO `oj_school` VALUES ('2436', '陕西能源职业技术学院', 'shanxinengyuanzhiyejishuxueyuan', '2', '337');
INSERT INTO `oj_school` VALUES ('2437', '陕西国防工业职业技术学院', 'shanxiguofanggongyezhiyejishuxueyuan', '2', '334');
INSERT INTO `oj_school` VALUES ('2438', '西安航空职业技术学院', 'xianhangkongzhiyejishuxueyuan', '2', '334');
INSERT INTO `oj_school` VALUES ('2439', '陕西财经职业技术学院', 'shanxicaijingzhiyejishuxueyuan', '2', '337');
INSERT INTO `oj_school` VALUES ('2440', '陕西交通职业技术学院', 'shanxijiaotongzhiyejishuxueyuan', '2', '334');
INSERT INTO `oj_school` VALUES ('2441', '陕西职业技术学院', 'shanxizhiyejishuxueyuan', '2', '334');
INSERT INTO `oj_school` VALUES ('2442', '西安高新科技职业学院', 'xiangaoxinkejizhiyexueyuan', '2', '334');
INSERT INTO `oj_school` VALUES ('2443', '西安城市建设职业学院', 'xianchengshijianshezhiyexueyuan', '2', '334');
INSERT INTO `oj_school` VALUES ('2444', '陕西铁路工程职业技术学院', 'shanxitielugongchengzhiyejishuxueyuan', '2', '338');
INSERT INTO `oj_school` VALUES ('2445', '宝鸡职业技术学院', 'baojizhiyejishuxueyuan', '2', '336');
INSERT INTO `oj_school` VALUES ('2446', '陕西航空职业技术学院', 'shanxihangkongzhiyejishuxueyuan', '2', '340');
INSERT INTO `oj_school` VALUES ('2447', '陕西电子信息职业技术学院', 'shanxidianzixinxizhiyejishuxueyuan', '2', '334');
INSERT INTO `oj_school` VALUES ('2448', '陕西邮电职业技术学院', 'shanxiyoudianzhiyejishuxueyuan', '2', '337');
INSERT INTO `oj_school` VALUES ('2449', '西安海棠职业学院', 'xianhaitangzhiyexueyuan', '2', '334');
INSERT INTO `oj_school` VALUES ('2450', '西安汽车科技职业学院', 'xianqichekejizhiyexueyuan', '2', '334');
INSERT INTO `oj_school` VALUES ('2451', '西安东方亚太职业技术学院', 'xiandongfangyataizhiyejishuxueyuan', '2', '334');
INSERT INTO `oj_school` VALUES ('2452', '陕西警官职业学院', 'shanxijingguanzhiyexueyuan', '2', '334');
INSERT INTO `oj_school` VALUES ('2453', '陕西经济管理职业技术学院', 'shanxijingjiguanlizhiyejishuxueyuan', '2', '334');
INSERT INTO `oj_school` VALUES ('2454', '西安铁路职业技术学院', 'xiantieluzhiyejishuxueyuan', '2', '334');
INSERT INTO `oj_school` VALUES ('2455', '咸阳职业技术学院', 'xianyangzhiyejishuxueyuan', '2', '337');
INSERT INTO `oj_school` VALUES ('2456', '西安职业技术学院', 'xianzhiyejishuxueyuan', '2', '334');
INSERT INTO `oj_school` VALUES ('2457', '商洛职业技术学院', 'shangluozhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2458', '汉中职业技术学院', 'hanzhongzhiyejishuxueyuan', '2', '340');
INSERT INTO `oj_school` VALUES ('2459', '延安职业技术学院', 'yananzhiyejishuxueyuan', '2', '339');
INSERT INTO `oj_school` VALUES ('2460', '渭南职业技术学院', 'weinanzhiyejishuxueyuan', '2', '338');
INSERT INTO `oj_school` VALUES ('2461', '安康职业技术学院', 'ankangzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2462', '铜川职业技术学院', 'tongchuanzhiyejishuxueyuan', '2', '335');
INSERT INTO `oj_school` VALUES ('2463', '陕西青年职业学院', 'shanxiqingnianzhiyexueyuan', '2', '334');
INSERT INTO `oj_school` VALUES ('2464', '陕西工商职业学院', 'shanxigongshangzhiyexueyuan', '2', '334');
INSERT INTO `oj_school` VALUES ('2465', '陕西电子科技职业学院', 'shanxidianzikejizhiyexueyuan', '2', '334');
INSERT INTO `oj_school` VALUES ('2466', '陕西旅游烹饪职业学院', 'shanxilvyoupengrenzhiyexueyuan', '2', '334');
INSERT INTO `oj_school` VALUES ('2467', '西安医学高等专科学校', 'xianyixuegaodengzhuankexuexiao', '2', '334');
INSERT INTO `oj_school` VALUES ('2468', '榆林职业技术学院', 'yulinzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2469', '陕西艺术职业学院', 'shanxiyishuzhiyexueyuan', '2', '334');
INSERT INTO `oj_school` VALUES ('2470', '陕西机电职业技术学院', 'shanxijidianzhiyejishuxueyuan', '2', '336');
INSERT INTO `oj_school` VALUES ('2471', '兰州大学', 'lanzhoudaxue', '1', '345');
INSERT INTO `oj_school` VALUES ('2472', '兰州理工大学', 'lanzhouligongdaxue', '1', '345');
INSERT INTO `oj_school` VALUES ('2473', '兰州交通大学', 'lanzhoujiaotongdaxue', '1', '345');
INSERT INTO `oj_school` VALUES ('2474', '甘肃农业大学', 'gansunongyedaxue', '1', '345');
INSERT INTO `oj_school` VALUES ('2475', '甘肃中医药大学', 'gansuzhongyiyaodaxue', '1', '345');
INSERT INTO `oj_school` VALUES ('2476', '西北师范大学', 'xibeishifandaxue', '1', '345');
INSERT INTO `oj_school` VALUES ('2477', '兰州城市学院', 'lanzhouchengshixueyuan', '1', '345');
INSERT INTO `oj_school` VALUES ('2478', '陇东学院', 'longdongxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('2479', '天水师范学院', 'tianshuishifanxueyuan', '1', '349');
INSERT INTO `oj_school` VALUES ('2480', '河西学院', 'hexixueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('2481', '兰州财经大学', 'lanzhoucaijingdaxue', '1', '345');
INSERT INTO `oj_school` VALUES ('2482', '西北民族大学', 'xibeiminzudaxue', '1', '345');
INSERT INTO `oj_school` VALUES ('2483', '甘肃政法学院', 'gansuzhengfaxueyuan', '1', '345');
INSERT INTO `oj_school` VALUES ('2484', '甘肃民族师范学院', 'gansuminzushifanxueyuan', '1', '358');
INSERT INTO `oj_school` VALUES ('2485', '兰州文理学院', 'lanzhouwenlixueyuan', '1', '345');
INSERT INTO `oj_school` VALUES ('2486', '甘肃医学院', 'gansuyixueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('2487', '兰州工业学院', 'lanzhougongyexueyuan', '1', '345');
INSERT INTO `oj_school` VALUES ('2488', '西北师范大学知行学院', 'xibeishifandaxuezhixingxueyuan', '1', '345');
INSERT INTO `oj_school` VALUES ('2489', '兰州财经大学陇桥学院', 'lanzhoucaijingdaxuelongqiaoxueyuan', '1', '345');
INSERT INTO `oj_school` VALUES ('2490', '兰州财经大学长青学院', 'lanzhoucaijingdaxuechangqingxueyuan', '1', '345');
INSERT INTO `oj_school` VALUES ('2491', '兰州交通大学博文学院', 'lanzhoujiaotongdaxuebowenxueyuan', '1', '345');
INSERT INTO `oj_school` VALUES ('2492', '兰州理工大学技术工程学院', 'lanzhouligongdaxuejishugongchengxueyuan', '1', '345');
INSERT INTO `oj_school` VALUES ('2493', '兰州石化职业技术学院', 'lanzhoushihuazhiyejishuxueyuan', '2', '345');
INSERT INTO `oj_school` VALUES ('2494', '陇南师范高等专科学校', 'longnanshifangaodengzhuankexuexiao', '2', '999');
INSERT INTO `oj_school` VALUES ('2495', '定西师范高等专科学校', 'dingxishifangaodengzhuankexuexiao', '2', '999');
INSERT INTO `oj_school` VALUES ('2496', '甘肃建筑职业技术学院', 'gansujianzhuzhiyejishuxueyuan', '2', '345');
INSERT INTO `oj_school` VALUES ('2497', '酒泉职业技术学院', 'jiuquanzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2498', '兰州外语职业学院', 'lanzhouwaiyuzhiyexueyuan', '2', '345');
INSERT INTO `oj_school` VALUES ('2499', '兰州职业技术学院', 'lanzhouzhiyejishuxueyuan', '2', '345');
INSERT INTO `oj_school` VALUES ('2500', '甘肃警察职业学院', 'gansujingchazhiyexueyuan', '2', '345');
INSERT INTO `oj_school` VALUES ('2501', '甘肃林业职业技术学院', 'gansulinyezhiyejishuxueyuan', '2', '349');
INSERT INTO `oj_school` VALUES ('2502', '甘肃工业职业技术学院', 'gansugongyezhiyejishuxueyuan', '2', '349');
INSERT INTO `oj_school` VALUES ('2503', '武威职业学院', 'wuweizhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2504', '甘肃交通职业技术学院', 'gansujiaotongzhiyejishuxueyuan', '2', '345');
INSERT INTO `oj_school` VALUES ('2505', '兰州资源环境职业技术学院', 'lanzhouziyuanhuanjingzhiyejishuxueyuan', '2', '345');
INSERT INTO `oj_school` VALUES ('2506', '甘肃农业职业技术学院', 'gansunongyezhiyejishuxueyuan', '2', '345');
INSERT INTO `oj_school` VALUES ('2507', '甘肃畜牧工程职业技术学院', 'gansuxumugongchengzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2508', '甘肃钢铁职业技术学院', 'gansugangtiezhiyejishuxueyuan', '2', '346');
INSERT INTO `oj_school` VALUES ('2509', '甘肃机电职业技术学院', 'gansujidianzhiyejishuxueyuan', '2', '349');
INSERT INTO `oj_school` VALUES ('2510', '甘肃有色冶金职业技术学院', 'gansuyouseyejinzhiyejishuxueyuan', '2', '347');
INSERT INTO `oj_school` VALUES ('2511', '白银矿冶职业技术学院', 'baiyinkuangyezhiyejishuxueyuan', '2', '348');
INSERT INTO `oj_school` VALUES ('2512', '甘肃卫生职业学院', 'gansuweishengzhiyexueyuan', '2', '345');
INSERT INTO `oj_school` VALUES ('2513', '兰州科技职业学院', 'lanzhoukejizhiyexueyuan', '2', '345');
INSERT INTO `oj_school` VALUES ('2514', '庆阳职业技术学院', 'qingyangzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2515', '临夏现代职业学院', 'linxiaxiandaizhiyexueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2516', '甘肃能源化工职业学院', 'gansunengyuanhuagongzhiyexueyuan', '2', '345');
INSERT INTO `oj_school` VALUES ('2517', '兰州现代职业学院', 'lanzhouxiandaizhiyexueyuan', '2', '345');
INSERT INTO `oj_school` VALUES ('2518', '平凉职业技术学院', 'pingliangzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2519', '甘肃财贸职业学院', 'gansucaimaozhiyexueyuan', '2', '345');
INSERT INTO `oj_school` VALUES ('2520', '青海大学', 'qinghaidaxue', '1', '360');
INSERT INTO `oj_school` VALUES ('2521', '青海师范大学', 'qinghaishifandaxue', '1', '360');
INSERT INTO `oj_school` VALUES ('2522', '青海民族大学', 'qinghaiminzudaxue', '1', '360');
INSERT INTO `oj_school` VALUES ('2523', '青海大学昆仑学院', 'qinghaidaxuekunlunxueyuan', '1', '360');
INSERT INTO `oj_school` VALUES ('2524', '青海卫生职业技术学院', 'qinghaiweishengzhiyejishuxueyuan', '2', '360');
INSERT INTO `oj_school` VALUES ('2525', '青海警官职业学院', 'qinghaijingguanzhiyexueyuan', '2', '360');
INSERT INTO `oj_school` VALUES ('2526', '青海畜牧兽医职业技术学院', 'qinghaixumushouyizhiyejishuxueyuan', '2', '360');
INSERT INTO `oj_school` VALUES ('2527', '青海交通职业技术学院', 'qinghaijiaotongzhiyejishuxueyuan', '2', '360');
INSERT INTO `oj_school` VALUES ('2528', '青海建筑职业技术学院', 'qinghaijianzhuzhiyejishuxueyuan', '2', '360');
INSERT INTO `oj_school` VALUES ('2529', '西宁城市职业技术学院', 'xiningchengshizhiyejishuxueyuan', '2', '360');
INSERT INTO `oj_school` VALUES ('2530', '青海高等职业技术学院', 'qinghaigaodengzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2531', '青海柴达木职业技术学院', 'qinghaichaidamuzhiyejishuxueyuan', '2', '367');
INSERT INTO `oj_school` VALUES ('2532', '宁夏大学', 'ningxiadaxue', '1', '369');
INSERT INTO `oj_school` VALUES ('2533', '宁夏医科大学', 'ningxiayikedaxue', '1', '369');
INSERT INTO `oj_school` VALUES ('2534', '宁夏师范学院', 'ningxiashifanxueyuan', '1', '999');
INSERT INTO `oj_school` VALUES ('2535', '北方民族大学', 'beifangminzudaxue', '1', '369');
INSERT INTO `oj_school` VALUES ('2536', '宁夏理工学院', 'ningxialigongxueyuan', '1', '370');
INSERT INTO `oj_school` VALUES ('2537', '宁夏大学新华学院', 'ningxiadaxuexinhuaxueyuan', '1', '369');
INSERT INTO `oj_school` VALUES ('2538', '银川能源学院', 'yinchuannengyuanxueyuan', '1', '369');
INSERT INTO `oj_school` VALUES ('2539', '中国矿业大学银川学院', 'zhongguokuangyedaxueyinchuanxueyuan', '1', '369');
INSERT INTO `oj_school` VALUES ('2540', '宁夏民族职业技术学院', 'ningxiaminzuzhiyejishuxueyuan', '2', '371');
INSERT INTO `oj_school` VALUES ('2541', '宁夏工业职业学院', 'ningxiagongyezhiyexueyuan', '2', '369');
INSERT INTO `oj_school` VALUES ('2542', '宁夏职业技术学院', 'ningxiazhiyejishuxueyuan', '2', '369');
INSERT INTO `oj_school` VALUES ('2543', '宁夏工商职业技术学院', 'ningxiagongshangzhiyejishuxueyuan', '2', '369');
INSERT INTO `oj_school` VALUES ('2544', '宁夏财经职业技术学院', 'ningxiacaijingzhiyejishuxueyuan', '2', '369');
INSERT INTO `oj_school` VALUES ('2545', '宁夏司法警官职业学院', 'ningxiasifajingguanzhiyexueyuan', '2', '369');
INSERT INTO `oj_school` VALUES ('2546', '宁夏建设职业技术学院', 'ningxiajianshezhiyejishuxueyuan', '2', '369');
INSERT INTO `oj_school` VALUES ('2547', '宁夏葡萄酒与防沙治沙职业技术学院', 'ningxiaputaojiuyufangshazhishazhiyejishuxueyuan', '2', '369');
INSERT INTO `oj_school` VALUES ('2548', '宁夏幼儿师范高等专科学校', 'ningxiayouershifangaodengzhuankexuexiao', '2', '369');
INSERT INTO `oj_school` VALUES ('2549', '宁夏艺术职业学院', 'ningxiayishuzhiyexueyuan', '2', '369');
INSERT INTO `oj_school` VALUES ('2550', '新疆大学', 'xinjiangdaxue', '1', '375');
INSERT INTO `oj_school` VALUES ('2551', '塔里木大学', 'talimudaxue', '1', '390');
INSERT INTO `oj_school` VALUES ('2552', '新疆农业大学', 'xinjiangnongyedaxue', '1', '375');
INSERT INTO `oj_school` VALUES ('2553', '石河子大学', 'shihezidaxue', '1', '389');
INSERT INTO `oj_school` VALUES ('2554', '新疆医科大学', 'xinjiangyikedaxue', '1', '375');
INSERT INTO `oj_school` VALUES ('2555', '新疆师范大学', 'xinjiangshifandaxue', '1', '375');
INSERT INTO `oj_school` VALUES ('2556', '喀什大学', 'kashidaxue', '1', '384');
INSERT INTO `oj_school` VALUES ('2557', '伊犁师范学院', 'yilishifanxueyuan', '1', '386');
INSERT INTO `oj_school` VALUES ('2558', '新疆财经大学', 'xinjiangcaijingdaxue', '1', '375');
INSERT INTO `oj_school` VALUES ('2559', '新疆艺术学院', 'xinjiangyishuxueyuan', '1', '375');
INSERT INTO `oj_school` VALUES ('2560', '新疆工程学院', 'xinjianggongchengxueyuan', '1', '375');
INSERT INTO `oj_school` VALUES ('2561', '昌吉学院', 'changjixueyuan', '1', '379');
INSERT INTO `oj_school` VALUES ('2562', '新疆警察学院', 'xinjiangjingchaxueyuan', '1', '375');
INSERT INTO `oj_school` VALUES ('2563', '新疆大学科学技术学院', 'xinjiangdaxuekexuejishuxueyuan', '1', '375');
INSERT INTO `oj_school` VALUES ('2564', '新疆农业大学科学技术学院', 'xinjiangnongyedaxuekexuejishuxueyuan', '1', '375');
INSERT INTO `oj_school` VALUES ('2565', '新疆医科大学厚博学院', 'xinjiangyikedaxuehouboxueyuan', '1', '375');
INSERT INTO `oj_school` VALUES ('2566', '新疆财经大学商务学院', 'xinjiangcaijingdaxueshangwuxueyuan', '1', '375');
INSERT INTO `oj_school` VALUES ('2567', '石河子大学科技学院', 'shihezidaxuekejixueyuan', '1', '389');
INSERT INTO `oj_school` VALUES ('2568', '和田师范专科学校', 'hetianshifanzhuankexuexiao', '2', '385');
INSERT INTO `oj_school` VALUES ('2569', '新疆农业职业技术学院', 'xinjiangnongyezhiyejishuxueyuan', '2', '379');
INSERT INTO `oj_school` VALUES ('2570', '乌鲁木齐职业大学', 'wulumuqizhiyedaxue', '2', '375');
INSERT INTO `oj_school` VALUES ('2571', '新疆维吾尔医学专科学校', 'xinjiangweiwueryixuezhuankexuexiao', '2', '385');
INSERT INTO `oj_school` VALUES ('2572', '克拉玛依职业技术学院', 'kelamayizhiyejishuxueyuan', '2', '376');
INSERT INTO `oj_school` VALUES ('2573', '新疆机电职业技术学院', 'xinjiangjidianzhiyejishuxueyuan', '2', '375');
INSERT INTO `oj_school` VALUES ('2574', '新疆轻工职业技术学院', 'xinjiangqinggongzhiyejishuxueyuan', '2', '375');
INSERT INTO `oj_school` VALUES ('2575', '新疆能源职业技术学院', 'xinjiangnengyuanzhiyejishuxueyuan', '2', '375');
INSERT INTO `oj_school` VALUES ('2576', '昌吉职业技术学院', 'changjizhiyejishuxueyuan', '2', '379');
INSERT INTO `oj_school` VALUES ('2577', '伊犁职业技术学院', 'yilizhiyejishuxueyuan', '2', '386');
INSERT INTO `oj_school` VALUES ('2578', '阿克苏职业技术学院', 'akesuzhiyejishuxueyuan', '2', '382');
INSERT INTO `oj_school` VALUES ('2579', '巴音郭楞职业技术学院', 'bayinguolengzhiyejishuxueyuan', '2', '381');
INSERT INTO `oj_school` VALUES ('2580', '新疆建设职业技术学院', 'xinjiangjianshezhiyejishuxueyuan', '2', '375');
INSERT INTO `oj_school` VALUES ('2581', '新疆兵团警官高等专科学校', 'xinjiangbingtuanjingguangaodengzhuankexuexiao', '2', '392');
INSERT INTO `oj_school` VALUES ('2582', '新疆现代职业技术学院', 'xinjiangxiandaizhiyejishuxueyuan', '2', '375');
INSERT INTO `oj_school` VALUES ('2583', '新疆天山职业技术学院', 'xinjiangtianshanzhiyejishuxueyuan', '2', '375');
INSERT INTO `oj_school` VALUES ('2584', '新疆交通职业技术学院', 'xinjiangjiaotongzhiyejishuxueyuan', '2', '375');
INSERT INTO `oj_school` VALUES ('2585', '新疆石河子职业技术学院', 'xinjiangshihezizhiyejishuxueyuan', '2', '389');
INSERT INTO `oj_school` VALUES ('2586', '新疆职业大学', 'xinjiangzhiyedaxue', '2', '375');
INSERT INTO `oj_school` VALUES ('2587', '新疆体育职业技术学院', 'xinjiangtiyuzhiyejishuxueyuan', '2', '375');
INSERT INTO `oj_school` VALUES ('2588', '新疆应用职业技术学院', 'xinjiangyingyongzhiyejishuxueyuan', '2', '386');
INSERT INTO `oj_school` VALUES ('2589', '新疆师范高等专科学校', 'xinjiangshifangaodengzhuankexuexiao', '2', '375');
INSERT INTO `oj_school` VALUES ('2590', '新疆铁道职业技术学院', 'xinjiangtiedaozhiyejishuxueyuan', '2', '375');
INSERT INTO `oj_school` VALUES ('2591', '新疆生产建设兵团兴新职业技术学院', 'xinjiangshengchanjianshebingtuanxingxinzhiyejishux', '2', '375');
INSERT INTO `oj_school` VALUES ('2592', '哈密职业技术学院', 'hamizhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2593', '新疆科技职业技术学院', 'xinjiangkejizhiyejishuxueyuan', '2', '375');
INSERT INTO `oj_school` VALUES ('2594', '吐鲁番职业技术学院', 'tulufanzhiyejishuxueyuan', '2', '999');
INSERT INTO `oj_school` VALUES ('2595', '新疆工业职业技术学院', 'xinjianggongyezhiyejishuxueyuan', '2', '375');

-- ----------------------------
-- Table structure for oj_send
-- ----------------------------
DROP TABLE IF EXISTS `oj_send`;
CREATE TABLE `oj_send` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `company_id` int(11) unsigned NOT NULL COMMENT '企业id',
  `job_id` int(11) unsigned NOT NULL COMMENT '职位id',
  `send_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '投递类型0在线1附件',
  `state1` tinyint(4) NOT NULL DEFAULT '1' COMMENT '第一步状态0未完成1完成',
  `state1_time` int(11) NOT NULL COMMENT '第一步状态完成时间',
  `state2` tinyint(4) NOT NULL DEFAULT '0' COMMENT '第二步',
  `state2_time` int(11) NOT NULL,
  `state3` tinyint(4) NOT NULL DEFAULT '0' COMMENT '第三步',
  `state3_time` int(11) NOT NULL,
  `state4` tinyint(4) NOT NULL DEFAULT '0' COMMENT '第四步0未操作1面试-1不合格',
  `state4_time` int(11) NOT NULL,
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `read` int(4) NOT NULL DEFAULT '0' COMMENT '公司预览简历情况:0未读,1已读',
  `content` text NOT NULL COMMENT '公司发送内容',
  `audition_time` int(11) NOT NULL COMMENT '面试时间',
  `audition_linkman` varchar(20) NOT NULL COMMENT '面试联系人',
  `audition_linkphone` varchar(11) NOT NULL COMMENT '面试联系电话',
  `audition_address` varchar(50) NOT NULL COMMENT '面试地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='简历投递表';

-- ----------------------------
-- Records of oj_send
-- ----------------------------
INSERT INTO `oj_send` VALUES ('11', '1', '1', '1', '0', '1', '1416237749', '1', '1416238035', '2', '1416238044', '1', '1416238044', '0', '1', '', '1416322800', '2476786@qq.com', '18701500429', '菊花怪副队长');
INSERT INTO `oj_send` VALUES ('12', '1', '1', '2', '0', '1', '1416237760', '1', '1416238055', '2', '1416238059', '2', '1416238059', '0', '0', '非常荣幸收到你的简历，招聘方经过评估，认为你与该职位的条件不太匹配，无法进入面试阶段。\n\n相信更好的机会一定还在翘首期盼着你，赶快调整心态，做好充足的准备重新出发吧！', '0', '', '', '');
INSERT INTO `oj_send` VALUES ('13', '1', '1', '5', '0', '1', '1416237763', '1', '1416238062', '1', '1416238071', '1', '1416286314', '0', '0', '您的简历已通过我们的筛选，很高兴通知您参加我们的面试。', '1416369600', '2476786@qq.com', '18701500429', '广州天河维多利广场');
INSERT INTO `oj_send` VALUES ('16', '1', '1', '767', '0', '1', '1416286792', '1', '1416286808', '1', '1416286819', '0', '0', '0', '0', '', '0', '', '', '');
INSERT INTO `oj_send` VALUES ('17', '1', '173', '765', '0', '1', '1416291443', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '', '', '');
INSERT INTO `oj_send` VALUES ('18', '306', '15', '770', '0', '1', '1486976129', '1', '1486976295', '0', '0', '0', '0', '0', '1', '', '0', '', '', '');
INSERT INTO `oj_send` VALUES ('19', '315', '1', '767', '0', '1', '1486988288', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '', '', '');

-- ----------------------------
-- Table structure for oj_short_notice
-- ----------------------------
DROP TABLE IF EXISTS `oj_short_notice`;
CREATE TABLE `oj_short_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '短消息名称',
  `content` text NOT NULL COMMENT '消息内容',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示 0不显示 1显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oj_short_notice
-- ----------------------------
INSERT INTO `oj_short_notice` VALUES ('2', '春招已开始', '春季招聘已火热开始！快来看看吧！', '1489212721', '1');
INSERT INTO `oj_short_notice` VALUES ('3', '积分后即将开启', '积分功能即将开启！更多惊喜尽请期待！', '1489212745', '1');
INSERT INTO `oj_short_notice` VALUES ('4', '就业直达', '就业直达号~为您找到心仪的职位！', '1490777503', '1');

-- ----------------------------
-- Table structure for oj_show_works
-- ----------------------------
DROP TABLE IF EXISTS `oj_show_works`;
CREATE TABLE `oj_show_works` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `rid` int(11) unsigned NOT NULL COMMENT '简历id',
  `link` varchar(100) NOT NULL COMMENT '作品外连',
  `description` varchar(100) NOT NULL COMMENT '作品说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='作品展示表';

-- ----------------------------
-- Records of oj_show_works
-- ----------------------------
INSERT INTO `oj_show_works` VALUES ('1', '2', 'www.baidu.com', '百度');
INSERT INTO `oj_show_works` VALUES ('2', '1', 'www.baidu.com', '百度');
INSERT INTO `oj_show_works` VALUES ('3', '4', 'www.budaigu.com', '布袋谷');

-- ----------------------------
-- Table structure for oj_tag
-- ----------------------------
DROP TABLE IF EXISTS `oj_tag`;
CREATE TABLE `oj_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `name` varchar(11) NOT NULL COMMENT '标签名称',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态1开启0关闭',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '类别:0自定义1薪酬激励2员工福利3员工关怀4其他',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='公司标签表';

-- ----------------------------
-- Records of oj_tag
-- ----------------------------
INSERT INTO `oj_tag` VALUES ('1', '年终分红', '1', '1');
INSERT INTO `oj_tag` VALUES ('2', '绩效奖金', '1', '1');
INSERT INTO `oj_tag` VALUES ('3', '股票期权', '1', '1');
INSERT INTO `oj_tag` VALUES ('4', '专项奖金', '1', '1');
INSERT INTO `oj_tag` VALUES ('5', '年底双薪', '1', '1');
INSERT INTO `oj_tag` VALUES ('6', '五险一金', '1', '2');
INSERT INTO `oj_tag` VALUES ('7', '通讯津贴', '1', '2');
INSERT INTO `oj_tag` VALUES ('8', '交通补助', '1', '2');
INSERT INTO `oj_tag` VALUES ('9', '带薪年假', '1', '2');
INSERT INTO `oj_tag` VALUES ('10', '免费班车', '1', '3');
INSERT INTO `oj_tag` VALUES ('11', '节日礼物', '1', '3');
INSERT INTO `oj_tag` VALUES ('12', '年度旅游', '1', '3');
INSERT INTO `oj_tag` VALUES ('13', '弹性工作', '1', '3');
INSERT INTO `oj_tag` VALUES ('14', '定期体检', '1', '3');
INSERT INTO `oj_tag` VALUES ('15', '午餐津贴', '1', '3');
INSERT INTO `oj_tag` VALUES ('16', '岗位晋升', '1', '4');
INSERT INTO `oj_tag` VALUES ('17', '技能培训', '1', '4');
INSERT INTO `oj_tag` VALUES ('18', '管理规范', '1', '4');
INSERT INTO `oj_tag` VALUES ('19', '扁平管理', '1', '4');
INSERT INTO `oj_tag` VALUES ('20', '领导好', '1', '4');
INSERT INTO `oj_tag` VALUES ('21', '美女多', '1', '4');
INSERT INTO `oj_tag` VALUES ('22', '帅哥多', '1', '4');
INSERT INTO `oj_tag` VALUES ('31', '哈哈哈', '1', '0');
INSERT INTO `oj_tag` VALUES ('32', '嘻嘻嘻', '1', '0');
INSERT INTO `oj_tag` VALUES ('33', 'ko', '1', '0');
INSERT INTO `oj_tag` VALUES ('34', '宋小宝', '1', '0');
INSERT INTO `oj_tag` VALUES ('35', '明明', '1', '0');
INSERT INTO `oj_tag` VALUES ('36', '仔仔', '1', '0');
INSERT INTO `oj_tag` VALUES ('37', '高效团队', '1', '0');
INSERT INTO `oj_tag` VALUES ('38', '大量', '1', '0');

-- ----------------------------
-- Table structure for oj_team
-- ----------------------------
DROP TABLE IF EXISTS `oj_team`;
CREATE TABLE `oj_team` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'team_id',
  `company_id` int(11) unsigned NOT NULL COMMENT '企业id',
  `name` varchar(30) NOT NULL COMMENT '姓名',
  `position` varchar(30) NOT NULL COMMENT '职位',
  `weibo` varchar(50) NOT NULL COMMENT '微博',
  `desc` text NOT NULL COMMENT '简介',
  `image` varchar(255) NOT NULL COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='公司团队表';

-- ----------------------------
-- Records of oj_team
-- ----------------------------
INSERT INTO `oj_team` VALUES ('28', '1', '宋明伟', '创始人兼CEO', 'aaaaa', '神一样的男子', '/Uploads/Company/Team/1_myfilesT0.JPEG');
INSERT INTO `oj_team` VALUES ('30', '1', '仔仔', '白吃饱', '', '小吃货一枚', '/Uploads/Company/Team/1_myfilesT1.JPEG');

-- ----------------------------
-- Table structure for oj_trade
-- ----------------------------
DROP TABLE IF EXISTS `oj_trade`;
CREATE TABLE `oj_trade` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '行业id',
  `name` varchar(30) NOT NULL COMMENT '行业名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='行业领域表';

-- ----------------------------
-- Records of oj_trade
-- ----------------------------
INSERT INTO `oj_trade` VALUES ('1', '移动互联网');
INSERT INTO `oj_trade` VALUES ('2', '电子商务');
INSERT INTO `oj_trade` VALUES ('3', '社交');
INSERT INTO `oj_trade` VALUES ('4', '企业服务');
INSERT INTO `oj_trade` VALUES ('5', 'O2O');
INSERT INTO `oj_trade` VALUES ('6', '教育');
INSERT INTO `oj_trade` VALUES ('7', '文化艺术');
INSERT INTO `oj_trade` VALUES ('8', '游戏');
INSERT INTO `oj_trade` VALUES ('9', '在线旅游');
INSERT INTO `oj_trade` VALUES ('10', '金融互联网');
INSERT INTO `oj_trade` VALUES ('11', '健康医疗');
INSERT INTO `oj_trade` VALUES ('12', '生活服务');
INSERT INTO `oj_trade` VALUES ('13', '硬件');
INSERT INTO `oj_trade` VALUES ('14', '搜索');
INSERT INTO `oj_trade` VALUES ('15', '运动体育');
INSERT INTO `oj_trade` VALUES ('16', '云计算\\大数据');
INSERT INTO `oj_trade` VALUES ('17', '移动广告');
INSERT INTO `oj_trade` VALUES ('18', '社会化营销');
INSERT INTO `oj_trade` VALUES ('19', '视频多媒体');
INSERT INTO `oj_trade` VALUES ('20', '媒体');
INSERT INTO `oj_trade` VALUES ('21', '智能家居');
INSERT INTO `oj_trade` VALUES ('22', '智能电视');
INSERT INTO `oj_trade` VALUES ('23', '分类信息');
INSERT INTO `oj_trade` VALUES ('24', '招聘');

-- ----------------------------
-- Table structure for oj_uncheck
-- ----------------------------
DROP TABLE IF EXISTS `oj_uncheck`;
CREATE TABLE `oj_uncheck` (
  `un_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `com_id` int(11) NOT NULL COMMENT '公司id',
  `title` varchar(255) NOT NULL COMMENT '不通过标题',
  `content` text COMMENT '附加说明',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`un_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oj_uncheck
-- ----------------------------

-- ----------------------------
-- Table structure for oj_user
-- ----------------------------
DROP TABLE IF EXISTS `oj_user`;
CREATE TABLE `oj_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `com_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所创建的公司id 默认为0',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `oauth` varchar(10) NOT NULL DEFAULT '' COMMENT '授权来源',
  `unionid` varchar(100) NOT NULL DEFAULT '' COMMENT '微信关联后返回的标识',
  `openid` varchar(100) NOT NULL DEFAULT '' COMMENT '第三方唯一标识',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `head_pic` varchar(255) DEFAULT 'Uploads/Admin/Default/user_default_head_pic.png' COMMENT '用户头像',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别 0未填写 1男 2女',
  `tel` varchar(20) NOT NULL DEFAULT '',
  `entry_year` int(4) DEFAULT NULL COMMENT '入学年份 0未填写',
  `school` varchar(64) NOT NULL DEFAULT '' COMMENT '学校',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT '用于app 授权类似于session_id',
  `edu` tinyint(3) NOT NULL DEFAULT '0' COMMENT '学历 0未填写 1博士及以上 2硕士 3本科 4大专 5高中及以下 6不限',
  `major` varchar(64) NOT NULL DEFAULT '' COMMENT '专业',
  `is_complete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '信息是否完整 0不完整 1完整',
  `type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '个人1 企业2',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `login_time` int(11) NOT NULL DEFAULT '0' COMMENT '登录时间',
  `login_ip` varchar(20) NOT NULL DEFAULT '0' COMMENT '登陆ip',
  `share_times` int(11) unsigned NOT NULL DEFAULT '0',
  `collect_times` int(11) unsigned NOT NULL DEFAULT '0',
  `point` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `verify` varchar(32) NOT NULL DEFAULT '0' COMMENT '用户唯一验证',
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '-1禁用0未激活1正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=utf8 COMMENT='用户主表';

-- ----------------------------
-- Records of oj_user
-- ----------------------------
INSERT INTO `oj_user` VALUES ('307', '0', '23462252@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', '', '', '1', '', '2014', '', '', '3', '', '0', '1', '1416190421', '1416241987', '127.0.0.1', '10', '0', '0', '69aae4deb16f4bdb01a946caa72ab74d', '1');
INSERT INTO `oj_user` VALUES ('308', '0', '592107801@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', '', '', '1', '', '2014', '', '', '3', '', '0', '1', '1416234225', '1416241973', '127.0.0.1', '10', '0', '0', '9fd2a85a8820419e6464db5a0bce1288', '1');
INSERT INTO `oj_user` VALUES ('309', '0', '222228652@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', '', '', '1', '', '2014', '', '', '3', '', '0', '1', '1416236196', '1416241948', '127.0.0.1', '10', '0', '0', '2b932483e1a18639d72c845fd9ab2177', '-1');
INSERT INTO `oj_user` VALUES ('310', '0', '24733352@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', '', '', '1', '', '2014', '', '', '3', '', '0', '1', '1416236394', '1416241730', '127.0.0.1', '10', '0', '0', '9541fb21595652f4f239f18d27fcaada', '1');
INSERT INTO `oj_user` VALUES ('311', '0', '2474444652@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', '', '', '1', '', '2014', '', '', '3', '', '0', '1', '1416236521', '1416241691', '127.0.0.1', '10', '0', '0', 'fbfc617c996662c2819de4a68afae5f9', '1');
INSERT INTO `oj_user` VALUES ('315', '0', 'CS_MaleicAcid@163.com', '4297f44b13955235245b2497399d7a93', '', '', '', '', '', '', '1', '', '2014', '', '', '3', '', '0', '0', '1486987133', '1486993129', '127.0.0.1', '10', '0', '0', 'fbe2b64a17b87290e7d84683b3592d3a', '0');
INSERT INTO `oj_user` VALUES ('316', '0', '', '', 'qq', '', '95518457CABB3DF101B9EF9567A8F0F8', '', 'QQ用户pc', null, '1', '', '2014', '', '1ba34f3382cbdedcacc8f4449254fe57', '3', '', '0', '1', '1488205915', '1488350477', '0', '10', '0', '0', '0', '0');
INSERT INTO `oj_user` VALUES ('317', '0', '', '', 'qq', '', '83E37CE78A431AC5244DA4C598473EBC', '华罗庚', 'QQ用户wap', 'Uploads/Admin/UserHeadPic/2017-03-19/small_58ce89c1b354c.png', '1', '17321084831', '2015', '清华大学2125', '3d80ef2e34bd5447e2d4fcede9ebe5a3', '2', '凝聚态物', '0', '1', '1488206203', '1490715065', '0', '18', '16', '56', '0', '1');
INSERT INTO `oj_user` VALUES ('320', '0', '', '', 'weixin', '', 'o-FPs0OkI5aM-QQUr7Wpva7Yzmqo', '', '', 'Uploads/Admin/Default/user_default_head_pic.png', '1', '', '2014', '', '3759ef4fc9a4e6f6e8357a07999c7271', '3', '', '0', '1', '1488988503', '0', '0', '10', '0', '0', '0', '0');
INSERT INTO `oj_user` VALUES ('321', '0', '', '', 'weixin', '', 'o-FPs0GpotxaF7QpZ_oV5YWeJC14', '', '第三方用户', 'Uploads/Admin/Default/user_default_head_pic.png', '0', '', null, '', 'b00c8029ee99da4ab87c5eb9aa4cb5c0', '0', '', '0', '1', '1489251560', '0', '0', '10', '0', '0', '0', '0');
INSERT INTO `oj_user` VALUES ('322', '0', '', '', 'weixin', '', 'o-FPs0DOjptWtkSnd6mL2V9-DriI', '', '第三方用户', 'Uploads/Admin/Default/user_default_head_pic.png', '0', '', null, '', '4740ff0816658d7b931c9b2d30bdef56', '0', '', '0', '1', '1489297511', '0', '0', '10', '0', '0', '0', '-1');
INSERT INTO `oj_user` VALUES ('323', '0', '', '', 'weixin', '', 'o-FPs0KCg3HG7XTLceAU7WE47qsI', '', '第三方用户', 'Uploads/Admin/Default/user_default_head_pic.png', '0', '', null, '', '0696660303e72b30f3d0c732ec3fe4bc', '0', '', '0', '1', '1489299780', '0', '0', '10', '0', '0', '0', '0');
INSERT INTO `oj_user` VALUES ('324', '0', '', '', 'weixin', '', 'o-FPs0Cxph8aFOXULP2cgtdQZVkk', '', '第三方用户', 'Uploads/Admin/Default/user_default_head_pic.png', '0', '', null, '', '8ad8ba107f2a7de856bc2a05ca59b1b2', '0', '', '0', '1', '1489299800', '0', '0', '10', '0', '0', '0', '0');
INSERT INTO `oj_user` VALUES ('325', '0', '', '', 'weixin', 'on93psu59lHrPVcB9jb1WGGdsDXE', 'oNVBYwYsRzYOVzKvey6KuWcGrD50', '马来酸', '微信用户马来酸', 'Uploads/Admin/UserHeadPic/2017-03-17/small_58cb60f87f22f.png', '2', '17321084831', '2013', '清华北大258', 'bfcb7da54f6da843a88951d2ee8fe459', '3', '核物理', '0', '1', '1489305841', '1490709713', '0', '34', '3', '46', '0', '0');
INSERT INTO `oj_user` VALUES ('326', '0', '', '', 'qq', '', 'E52541A64545167144332D57B365B6E0', '123123', 'QQ用户', 'Uploads/Admin/Default/user_default_head_pic.png', '1', '15524871777', '2018', '12312312', 'ed502d40e581f1c4489eca1e2956c416', '1', '1231312', '0', '1', '1489315728', '1490660681', '0', '10', '0', '0', '0', '0');
INSERT INTO `oj_user` VALUES ('327', '0', '', '', 'weixin', 'on93pso4cwb52_R4ElqP8EpDALDk', '', '呜呜呜', '第三方用户', 'Uploads/Admin/UserHeadPic/2017-03-21/small_58d0b0b05fd4b.jpg', '1', '13056699958', '1994', '测试学校', '850d17471273133949f96a55c6d29856', '1', '测试专业1', '0', '1', '1489465213', '0', '0', '13', '2', '5', '0', '0');
INSERT INTO `oj_user` VALUES ('328', '0', '', '', 'weixin', 'on93pstvGBnJCHtrW3SkfNGa0MtQ', '', '', '第三方用户', 'Uploads/Admin/Default/user_default_head_pic.png', '1', '18616324120', '1989', '呵呵', 'f624d7ef8fc0acbea384ecd77f97dae5', '3', '呵呵', '0', '1', '1489476015', '0', '0', '10', '0', '0', '0', '0');
INSERT INTO `oj_user` VALUES ('330', '0', '', '', 'qq', '', 'B9EEB9034E4B326E0DD86327C8B0CD31', '', '第三方用户', 'Uploads/Admin/Default/user_default_head_pic.png', '0', '', null, '', '8ddf5df54bc4a7e68bf3454a154e454d', '0', '', '0', '1', '1489589964', '0', '0', '10', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('332', '0', '', '', 'weixin', 'on93psp7-O6v0pIFr6p11fF0Yrew', '', 'Gin', 'Gin', 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELyVQXEhptIWvHxF8guygyw3o7BTAgtlPDsicMSdk9YYXjiaEXrRC4o8iaTYkbibGDPMw8nIibh9FU4iaIQ/0', '1', '18521098018', '2003', '大连海事大学', 'c2b25baabaa0b8a7cc6d510325d5a0ca', '3', '航海技术', '0', '1', '1489621157', '0', '0', '11', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('333', '0', '', '', 'qq', '', '42F93D16AAE9875ECA6DDE8E9D52DBA2', '', '第三方用户', 'Uploads/Admin/Default/user_default_head_pic.png', '0', '', null, '', '4a3bb476ea123e8c6427c453d207c1f8', '0', '', '0', '1', '1489625617', '1489663018', '0', '10', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('334', '0', '', '', 'qq', '', '059DD407EEA6C4A4CC2B0B6A19AFD87D', '宋怡', '第三方用户', 'Uploads/Admin/UserHeadPic/2017-03-23/small_58d2a7bd3552d.JPG', '0', '15585290185', '2015', '上海建桥学院', 'd12f8a86981d1bb1f3bdf7db0f670e85', '3', '软件工程', '0', '1', '1489655176', '1490200473', '0', '10', '1', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('335', '0', '', '', 'weixin', 'on93psttsv-kKq1XYL1zd5t5OAEA', '', '   、terud alone', '   、terud alone', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJMLZR4pK19s7xwMuicPBMxHqdRHBo7FIrwlvx63FCdN62f7vALyQu8UkgRDKJcJicoSKnu10zYfPcQ/0', '2', '', null, '测试', 'e3ea37b44f32b7293f07f4552f11435c', '0', '', '0', '1', '1489662486', '0', '0', '10', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('336', '0', '', '', 'weixin', '', '', '', '第三方用户', 'Uploads/Admin/Default/user_default_head_pic.png', '0', '', null, '', '3391ca594a0b4e0a3af0dd56edb491a7', '0', '', '0', '1', '1489720371', '0', '0', '4', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('337', '0', '', '', 'weixin', '', '', '', '第三方用户', 'Uploads/Admin/Default/user_default_head_pic.png', '0', '', null, '', '9e02fb56025796c7793bcd32fe7d72c5', '0', '', '0', '1', '1489720444', '0', '0', '4', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('338', '0', '', '', 'weixin', '', '', '', '第三方用户', 'Uploads/Admin/Default/user_default_head_pic.png', '0', '', null, '', 'f6a1287f81b7f482ff2a65afa52c49e7', '0', '', '0', '1', '1489720535', '0', '0', '4', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('339', '0', '', '', 'weixin', '', '', '', '第三方用户', 'Uploads/Admin/Default/user_default_head_pic.png', '0', '', null, '', '387bc870aefb4f1037cd2051bfa6696b', '0', '', '0', '1', '1489720637', '0', '0', '4', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('340', '0', '', '', 'weixin', '', '', '', '第三方用户', 'Uploads/Admin/Default/user_default_head_pic.png', '0', '', null, '', '958bc069d2a704e84519c557a4768a46', '0', '', '0', '1', '1489720646', '0', '0', '4', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('341', '0', '', '', 'qq', '', 'EF3E9FC97CC76FDA1DF729F0A5A2E655', 'pan', '第三方用户', 'Uploads/Admin/Default/user_default_head_pic.png', '0', '', '2013', '上海', 'a83c6ed0d384b150d628e76c79dd7df0', '0', 'aa', '0', '1', '1489739206', '1490698954', '0', '4', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('342', '0', '', '', 'weixin', 'on93psqLvN6eWbv25NNYHU4Yopf0', 'oNVBYwZ4ak_hE46izAcAkqPA1pXI', '唐佳敏', '第三方用户', 'Uploads/Admin/Default/user_default_head_pic.png', '0', '', null, '', '40df07221c7bb461e983b49e6445e93c', '0', '', '0', '1', '1490074213', '1490074444', '0', '0', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('343', '0', '', '', 'weixin', 'on93pssL3GlFMZMHvn7-tgXdpdWE', '', '从前有座山', '从前有座山', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJqShLWHha13dIqRawl97Oal6AzHalJlU83N2qNiasUKq2rpM48pJr5wUxnP5Nv4Zt4A2YMLiatDvlw/0', '0', '', null, '', 'ccde535a58b0eadbeeba1f0845ed2473', '0', '', '0', '1', '1490096969', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('344', '0', '', '', 'weixin', 'on93psihuqH_jbQXg9SvAnkqXLNo', '', '测试', '测试', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJCnEwkGg0k9r9KWJn4g4T2jJt4HtRxs2oxiatAou7ycNMIDF6jrSgwmPnw0vyeJOlkSNduGc3ANBg/0', '0', '', null, '', '184b09ff5150c78b516df6aef34de205', '0', '', '0', '1', '1490097069', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('345', '0', '', '', 'qq', '', 'FB6C39B95F00697F43C6CC8BA6B13591', 'Gin', '第三方用户', 'Uploads/Admin/Default/user_default_head_pic.png', '1', '18521098018', null, '大连海事大学', '959c4421fdb1698dfd139ac85408bdf0', '3', '航海', '0', '1', '1490172889', '1490173055', '0', '0', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('346', '0', '', '', 'weixin', 'on93psmEaXRGyI061YKt_lOB2x-U', '', '82583', '82583', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJCnEwkGg0k9niaKiao9eZjQNuOKZ2LmrEc45IlJWicENMDE6zU7zsMR5IB8hwozpu7miaU4WNdvqkytg/0', '0', '', null, '', '911f44b4b2d735e6eb3ffbbaa924ba35', '0', '', '0', '1', '1490322683', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('347', '0', '', '', 'weixin', 'on93pspZa5IyVjbdHj0WzK4XGqQA', '', '王浩', '王浩', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIGDumd2Fd9bEJnw0eibqvjtkWzQlnqhyBicsPOjoLw37HaEyI4k0KBZL9R0yp84ciclHlQ2eAF28dhw/0', '1', '', '2003', '大连海事大学', '3a1c01d3b394dfd1ff16bc8ccdeaaf1f', '2', '计算机科学与技术', '0', '1', '1490335023', '0', '0', '0', '0', '0', '0', '-1');
INSERT INTO `oj_user` VALUES ('348', '0', '', '', 'weixin', 'on93psqv8nOoBJHPj70va4pCEZgo', '', '蝌蚪', '蝌蚪', 'http://wx.qlogo.cn/mmopen/vi_32/fpu0Ws3picyLciaUNZS9G3BDoUAkQqA0icv8lfz5sCsnT1VnsAzwZAvV8U1NdcSp7ia2fF0MsZLMPictejNCqJm4VaQ/0', '0', '', null, '', 'ec48de7fbcf6357d0c6711fc7d4c8384', '0', '', '0', '1', '1490335330', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('349', '0', '', '', 'weixin', 'on93psupJZ0Jqm-be3fY5cuqBI9s', '', 'HH', 'HH', 'http://wx.qlogo.cn/mmopen/vi_32/hyDzUytXJvY5wYSaOd43QDTymB0rbVT8HPJRaVj1icmBmSCOe0sVTFB4H7cfaQxAX6rpict75chhlomibmPUicMjYQ/0', '0', '', null, '', 'e2ce38e0aa1eb5b1f103abcdbe7a03b5', '0', '', '0', '1', '1490362788', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('350', '0', '', '', 'weixin', 'on93psrj9iBucD0T1p7gzTPgJJQg', '', '红茶奶盖要少糖、', '红茶奶盖要少糖、', 'Uploads/Admin/UserHeadPic/2017-03-25/small_58d647921df58.jpg', '2', '13942665367', '2014', '大连海事大学', 'a7340662274472bdd0e1e0492e86de01', '3', '计算机科学与技术', '0', '1', '1490437898', '0', '0', '0', '0', '1', '0', '1');
INSERT INTO `oj_user` VALUES ('351', '0', '', '', 'weixin', 'on93pstYz-XtuqsBr2SjL63DKk1o', '', '笑着吐泡泡', '笑着吐泡泡', 'Uploads/Admin/UserHeadPic/2017-03-28/small_58da4454d4c29.jpg', '2', '18940884139', '2014', '大连海事大学', '37cba7b11087e2e2b661ae98b3e12cd8', '3', '法学', '0', '1', '1490447078', '0', '0', '12', '7', '13', '0', '1');
INSERT INTO `oj_user` VALUES ('352', '0', '', '', 'weixin', 'on93psmAKvJssy47t7LTGpiclpVI', '', '程序测试号', '程序测试号', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKwZ4MXwL6dZWH4bHCXvHFM7VZD1Odu7083hMuvPKgI1key5pURkIfvky9J6T8icqZ8FbPibJ4duFbA/0', '0', '', null, '', '007e9f875f1dce236005acaac54b6184', '0', '', '0', '1', '1490611145', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('353', '0', '', '', 'weixin', 'on93psjazJK8jwkK88nRhu6nzWZI', '', '959。', '959。', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIaN8PM23YgDSWvDFzrcQpSjUUBKib32S4C1G9WMxVV2picUYzyzBq89MK0CIw6luicsK8eeHfPN6xNg/0', '0', '', null, '', '75fbf73134127349048140752308a1d8', '0', '', '0', '1', '1490625794', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('354', '0', '', '', 'weixin', 'on93pspTwBHTUzWHHWam8y8BCOjw', '', '侯登凯', '侯登凯', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erJHAtfH2MTzzlbKo0Sref7licUlBe53q9ac5r9vAdESGDQE7HX6Oh8wlZ3ZM2pB39nibpaLdicQM9cg/0', '1', '15524871777', '2016', '大连海事大学', '80834b69553194dd5420e741c7b1a623', '1', '交通运输', '0', '1', '1490659494', '0', '0', '2', '0', '4', '0', '1');
INSERT INTO `oj_user` VALUES ('355', '0', '', '', 'weixin', 'on93pshR8WLYb21om6Ddi-dDoaus', 'oNVBYwWZMj9D-jAHHvCjagBh8-uY', '宋怡', '第三方用户', 'Uploads/Admin/Default/user_default_head_pic.png', '2', '15585290185', '2014', '上海剑桥', 'e108fe44a0992079f74156c144c2af33', '3', '软件工程', '0', '1', '1490698379', '1490713687', '0', '1', '6', '11', '0', '1');
INSERT INTO `oj_user` VALUES ('356', '0', '', '', 'weixin', 'on93pskWPeYtLhy8_CIiS2MTG6-g', '', 'rdgztest_92741', 'rdgztest_92741', '', '0', '', null, '', 'd03e890a32bb0e52901409bc91f01080', '0', '', '0', '1', '1490770287', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('357', '0', '', '', 'weixin', 'on93pskFiNcngUwIISuPSWae40Hg', '', 'rdgztest_65542', 'rdgztest_65542', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJrBdOczez2ibW6OzH8ibHLrVDrXUyjHUZk1oaVwxD9Ldw6Be9LPXEy5UWV0DoYceR36IHVVjvWcFeg/0', '0', '', null, '', '7b911f9abd80cc1dd2198cbdb79c7459', '0', '', '0', '1', '1490770429', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `oj_user` VALUES ('358', '0', '', '', 'weixin', 'on93pslb2bqBy-sFkBiaxOKry8pQ', '', 'rdgztest_89160', 'rdgztest_89160', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJrBdOczez2ibdQNlLicUkF0cKh3qGHN9UwqRhxZNlWmAYO97lC2tIyibbGoAMlmeF2VuLqvTBkq6U4Q/0', '0', '', null, '', 'ba820af08bf9613ce36b7a92695aaa11', '0', '', '0', '1', '1490858989', '0', '0', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for oj_user_col
-- ----------------------------
DROP TABLE IF EXISTS `oj_user_col`;
CREATE TABLE `oj_user_col` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `job_id` int(11) NOT NULL COMMENT '职位id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oj_user_col
-- ----------------------------
INSERT INTO `oj_user_col` VALUES ('4', '1', '767');
INSERT INTO `oj_user_col` VALUES ('6', '1', '761');
INSERT INTO `oj_user_col` VALUES ('7', '1', '4');
INSERT INTO `oj_user_col` VALUES ('8', '1', '6');
INSERT INTO `oj_user_col` VALUES ('9', '1', '17');
INSERT INTO `oj_user_col` VALUES ('10', '1', '610');

-- ----------------------------
-- Table structure for oj_user_collect_job
-- ----------------------------
DROP TABLE IF EXISTS `oj_user_collect_job`;
CREATE TABLE `oj_user_collect_job` (
  `collect_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `job_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '职位id',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`collect_id`),
  KEY `user_id` (`user_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oj_user_collect_job
-- ----------------------------
INSERT INTO `oj_user_collect_job` VALUES ('41', '0', '770', '1488988503');
INSERT INTO `oj_user_collect_job` VALUES ('43', '327', '40', '1489251569');
INSERT INTO `oj_user_collect_job` VALUES ('44', '322', '4', '1489297596');
INSERT INTO `oj_user_collect_job` VALUES ('56', '328', '783', '1489561982');
INSERT INTO `oj_user_collect_job` VALUES ('59', '329', '783', '1489571009');
INSERT INTO `oj_user_collect_job` VALUES ('60', '331', '4', '1489621090');
INSERT INTO `oj_user_collect_job` VALUES ('63', '334', '801', '1489656086');
INSERT INTO `oj_user_collect_job` VALUES ('69', '334', '4', '1489707069');
INSERT INTO `oj_user_collect_job` VALUES ('71', '317', '23', '1489708908');
INSERT INTO `oj_user_collect_job` VALUES ('72', '317', '26', '1489708915');
INSERT INTO `oj_user_collect_job` VALUES ('74', '325', '4', '1489721200');
INSERT INTO `oj_user_collect_job` VALUES ('78', '341', '4', '1489707069');
INSERT INTO `oj_user_collect_job` VALUES ('79', '341', '801', '1489707622');
INSERT INTO `oj_user_collect_job` VALUES ('80', '341', '23', '1489708908');
INSERT INTO `oj_user_collect_job` VALUES ('81', '341', '26', '1489708915');
INSERT INTO `oj_user_collect_job` VALUES ('82', '341', '30', '1489748388');
INSERT INTO `oj_user_collect_job` VALUES ('88', '317', '12', '1489927667');
INSERT INTO `oj_user_collect_job` VALUES ('89', '317', '5', '1489927693');
INSERT INTO `oj_user_collect_job` VALUES ('96', '351', '814', '1490612135');
INSERT INTO `oj_user_collect_job` VALUES ('97', '325', '12', '1490624893');
INSERT INTO `oj_user_collect_job` VALUES ('98', '355', '12', '1490698932');
INSERT INTO `oj_user_collect_job` VALUES ('99', '351', '23', '1490699170');
INSERT INTO `oj_user_collect_job` VALUES ('100', '351', '6', '1490699177');
INSERT INTO `oj_user_collect_job` VALUES ('101', '351', '5', '1490699188');
INSERT INTO `oj_user_collect_job` VALUES ('104', '355', '17', '1490699527');
INSERT INTO `oj_user_collect_job` VALUES ('105', '355', '4', '1490699822');
INSERT INTO `oj_user_collect_job` VALUES ('106', '327', '816', '1490701301');
INSERT INTO `oj_user_collect_job` VALUES ('109', '317', '4', '1490705901');
INSERT INTO `oj_user_collect_job` VALUES ('110', '355', '819', '1490713862');

-- ----------------------------
-- Table structure for oj_user_send
-- ----------------------------
DROP TABLE IF EXISTS `oj_user_send`;
CREATE TABLE `oj_user_send` (
  `id` int(11) NOT NULL COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `job_id` int(11) NOT NULL COMMENT '职位id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oj_user_send
-- ----------------------------

-- ----------------------------
-- Table structure for oj_user_share_job
-- ----------------------------
DROP TABLE IF EXISTS `oj_user_share_job`;
CREATE TABLE `oj_user_share_job` (
  `share_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `job_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '职位id',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`share_id`),
  KEY `user_id` (`user_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oj_user_share_job
-- ----------------------------
INSERT INTO `oj_user_share_job` VALUES ('30', '317', '23', '1488356881');
INSERT INTO `oj_user_share_job` VALUES ('34', '317', '27', '1488379462');
INSERT INTO `oj_user_share_job` VALUES ('37', '317', '30', '1488629428');
INSERT INTO `oj_user_share_job` VALUES ('39', '327', '4', '1489680075');
INSERT INTO `oj_user_share_job` VALUES ('44', '341', '30', '1488629428');
INSERT INTO `oj_user_share_job` VALUES ('45', '341', '4', '1489680075');
INSERT INTO `oj_user_share_job` VALUES ('46', '341', '801', '1489707670');
INSERT INTO `oj_user_share_job` VALUES ('47', '341', '31', '1488629428');
INSERT INTO `oj_user_share_job` VALUES ('48', '341', '32', '1489680075');
INSERT INTO `oj_user_share_job` VALUES ('49', '341', '33', '1489707670');
INSERT INTO `oj_user_share_job` VALUES ('51', '341', '35', '1489680075');
INSERT INTO `oj_user_share_job` VALUES ('52', '341', '36', '1489707670');
INSERT INTO `oj_user_share_job` VALUES ('53', '341', '37', '1488629428');
INSERT INTO `oj_user_share_job` VALUES ('54', '341', '38', '1489680075');
INSERT INTO `oj_user_share_job` VALUES ('55', '341', '39', '1489707670');
INSERT INTO `oj_user_share_job` VALUES ('56', '317', '31', '1488629428');
INSERT INTO `oj_user_share_job` VALUES ('59', '317', '34', '1488629428');
INSERT INTO `oj_user_share_job` VALUES ('60', '317', '35', '1489680075');
INSERT INTO `oj_user_share_job` VALUES ('62', '317', '37', '1488629428');
INSERT INTO `oj_user_share_job` VALUES ('63', '317', '38', '1489680075');
INSERT INTO `oj_user_share_job` VALUES ('64', '317', '39', '1489707670');
INSERT INTO `oj_user_share_job` VALUES ('65', '341', '40', '1488629428');
INSERT INTO `oj_user_share_job` VALUES ('66', '341', '41', '1489680075');
INSERT INTO `oj_user_share_job` VALUES ('67', '341', '42', '1489707670');
INSERT INTO `oj_user_share_job` VALUES ('68', '341', '43', '1488629428');
INSERT INTO `oj_user_share_job` VALUES ('69', '341', '44', '1489680075');
INSERT INTO `oj_user_share_job` VALUES ('70', '341', '45', '1489707670');
INSERT INTO `oj_user_share_job` VALUES ('71', '341', '46', '1488629428');
INSERT INTO `oj_user_share_job` VALUES ('72', '341', '47', '1489680075');
INSERT INTO `oj_user_share_job` VALUES ('73', '341', '48', '1489707670');
INSERT INTO `oj_user_share_job` VALUES ('74', '332', '808', '1489851013');
INSERT INTO `oj_user_share_job` VALUES ('75', '329', '12', '1489852744');
INSERT INTO `oj_user_share_job` VALUES ('76', '329', '808', '1489921008');
INSERT INTO `oj_user_share_job` VALUES ('78', '317', '811', '1489929694');
INSERT INTO `oj_user_share_job` VALUES ('79', '317', '17', '1489934018');
INSERT INTO `oj_user_share_job` VALUES ('80', '317', '9', '1489934040');
INSERT INTO `oj_user_share_job` VALUES ('81', '329', '23', '1490200932');
INSERT INTO `oj_user_share_job` VALUES ('82', '331', '4', '1490335011');
INSERT INTO `oj_user_share_job` VALUES ('83', '331', '812', '1490335105');
INSERT INTO `oj_user_share_job` VALUES ('84', '332', '812', '1490335285');
INSERT INTO `oj_user_share_job` VALUES ('85', '331', '9', '1490437248');
INSERT INTO `oj_user_share_job` VALUES ('86', '351', '9', '1490451938');
INSERT INTO `oj_user_share_job` VALUES ('87', '351', '813', '1490453025');
INSERT INTO `oj_user_share_job` VALUES ('88', '327', '12', '1490576589');
INSERT INTO `oj_user_share_job` VALUES ('89', '329', '813', '1490576690');
INSERT INTO `oj_user_share_job` VALUES ('90', '331', '813', '1490576815');
INSERT INTO `oj_user_share_job` VALUES ('91', '351', '12', '1490590447');
INSERT INTO `oj_user_share_job` VALUES ('92', '351', '814', '1490611873');
INSERT INTO `oj_user_share_job` VALUES ('93', '331', '814', '1490612304');
INSERT INTO `oj_user_share_job` VALUES ('94', '329', '814', '1490615581');
INSERT INTO `oj_user_share_job` VALUES ('95', '327', '814', '1490615762');
INSERT INTO `oj_user_share_job` VALUES ('96', '325', '12', '1490624903');
INSERT INTO `oj_user_share_job` VALUES ('97', '325', '814', '1490625373');
INSERT INTO `oj_user_share_job` VALUES ('98', '325', '815', '1490625780');
INSERT INTO `oj_user_share_job` VALUES ('99', '327', '815', '1490626644');
INSERT INTO `oj_user_share_job` VALUES ('100', '325', '816', '1490627016');
INSERT INTO `oj_user_share_job` VALUES ('101', '329', '816', '1490631983');
INSERT INTO `oj_user_share_job` VALUES ('102', '354', '4', '1490692411');
INSERT INTO `oj_user_share_job` VALUES ('103', '355', '4', '1490698583');
INSERT INTO `oj_user_share_job` VALUES ('104', '325', '4', '1490709536');
INSERT INTO `oj_user_share_job` VALUES ('105', '354', '832', '1490841960');
