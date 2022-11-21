/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : schoolshoping

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 11/12/2021 21:06:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` VALUES (17, 'mine_balance', '提现明细', NULL, NULL, 'MineBalance', 'crud', 'com.shoping.project.shop', 'shop', 'balance', '提现明细', 'shoping', '0', '/', NULL, 'admin', '2021-12-11 16:23:59', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` VALUES (200, '17', 'uuid', '主键', 'bigint(20)', 'Long', 'uuid', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-11 16:23:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (201, '17', 'price', '提现金额', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-12-11 16:23:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (202, '17', 'user_id', '提现账号', 'bigint(20)', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-12-11 16:23:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (203, '17', 'status', '状态', 'varchar(20)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2021-12-11 16:23:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (204, '17', 'id_card', '账号', 'varchar(50)', 'String', 'idCard', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-12-11 16:23:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (205, '17', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2021-12-11 16:23:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (206, '17', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2021-12-11 16:23:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (207, '17', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2021-12-11 16:23:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (208, '17', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2021-12-11 16:23:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (209, '17', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2021-12-11 16:23:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (210, '17', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 11, 'admin', '2021-12-11 16:23:59', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for mine_address
-- ----------------------------
DROP TABLE IF EXISTS `mine_address`;
CREATE TABLE `mine_address` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` varchar(50) DEFAULT NULL COMMENT '订单id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(200) DEFAULT NULL COMMENT '名称',
  `postal_code` varchar(255) DEFAULT NULL COMMENT '邮编',
  `province_name` varchar(255) DEFAULT NULL COMMENT '国标收货地址第一级地址',
  `city_name` varchar(255) DEFAULT NULL COMMENT '国标收货地址第二级地址',
  `county_name` varchar(255) DEFAULT NULL COMMENT '国标收货地址第三级地址',
  `detail_info` varchar(255) DEFAULT NULL COMMENT '详细收货地址信息',
  `national_code` varchar(255) DEFAULT NULL COMMENT '收货地址国家码',
  `tel_number` varchar(50) DEFAULT NULL COMMENT '收货人手机号码',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='订单地址';

-- ----------------------------
-- Records of mine_address
-- ----------------------------
BEGIN;
INSERT INTO `mine_address` VALUES (1, 'b1098fad4bf94c6489046e8a2fa8fabc', 4, '张三', NULL, '广东省', '广州市', '海珠区', '新港中路397号', '510000', '020-81167888', '', NULL);
INSERT INTO `mine_address` VALUES (2, 'b67bfd08a2214541a84172e43d02d88c', 4, '张三', NULL, '广东省', '广州市', '海珠区', '新港中路397号', '510000', '020-81167888', '', NULL);
INSERT INTO `mine_address` VALUES (3, '72ac2949bfe34700bb1580b0d69fd1ab', 4, '张三', NULL, '广东省', '广州市', '海珠区', '新港中路397号', '510000', '020-81167888', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for mine_balance
-- ----------------------------
DROP TABLE IF EXISTS `mine_balance`;
CREATE TABLE `mine_balance` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `price` decimal(10,2) DEFAULT NULL COMMENT '提现金额',
  `user_id` bigint(20) DEFAULT NULL COMMENT '提现账号',
  `status` varchar(20) DEFAULT NULL COMMENT '状态',
  `id_card` varchar(50) DEFAULT NULL COMMENT '账号',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='提现明细';

-- ----------------------------
-- Records of mine_balance
-- ----------------------------
BEGIN;
INSERT INTO `mine_balance` VALUES (1, 5.00, 4, '20', NULL, '0', '', '2021-12-11 17:00:03', '', '2021-12-11 17:11:25', '');
COMMIT;

-- ----------------------------
-- Table structure for mine_banner
-- ----------------------------
DROP TABLE IF EXISTS `mine_banner`;
CREATE TABLE `mine_banner` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `url` varchar(300) DEFAULT NULL COMMENT '图片地址',
  `goods_id` varchar(50) DEFAULT NULL COMMENT '关联商品id',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='轮播图';

-- ----------------------------
-- Records of mine_banner
-- ----------------------------
BEGIN;
INSERT INTO `mine_banner` VALUES (1, '22', '/profile/upload/2021/12/07/ca806ca4-d25d-482a-a630-4c51e546868f.jpg', '1', '0', 'admin', '2021-12-07 21:46:00', '', NULL, '');
INSERT INTO `mine_banner` VALUES (2, '33', '/profile/upload/2021/12/07/a1af759a-d320-4f6e-98d7-78e4c0d6709b.jpg', '1', '0', 'admin', '2021-12-07 21:46:11', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for mine_cart
-- ----------------------------
DROP TABLE IF EXISTS `mine_cart`;
CREATE TABLE `mine_cart` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Records of mine_cart
-- ----------------------------
BEGIN;
INSERT INTO `mine_cart` VALUES (5, 7, 4, '0', '4', '2021-12-11 11:22:26', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for mine_collect
-- ----------------------------
DROP TABLE IF EXISTS `mine_collect`;
CREATE TABLE `mine_collect` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='商品收藏';

-- ----------------------------
-- Records of mine_collect
-- ----------------------------
BEGIN;
INSERT INTO `mine_collect` VALUES (1, 1, 2, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (2, 2, 2, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (3, 2, 1, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (4, 1, 1, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (18, 3, 1, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (19, 4, 1, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (20, 7, 1, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (21, 4, 2, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (22, 6, 2, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (23, 7, 2, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (24, 3, 3, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (25, 6, 3, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (26, 1, 3, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (27, 7, 5, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (28, 2, 5, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (32, 1, 5, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (33, 1, 5, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (34, 1, 5, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (35, 1, 5, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (36, 1, 1, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (37, 1, 5, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (38, 2, 5, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (39, 5, 5, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (40, 8, 5, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (41, 2, 5, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (42, 2, 1, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (43, 4, 1, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (44, 4, 1, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (45, 1, 5, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (46, 2, 4, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (47, 3, 4, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (49, 4, 1, '0', '', NULL, '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (51, 7, 6, '0', '6', '2021-11-20 21:49:08', '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (52, 6, 6, '0', '6', '2021-11-21 08:19:33', '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (53, 14, 6, '0', '6', '2021-11-21 16:34:07', '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (55, 6, 4, '0', '4', '2021-12-07 23:06:54', '', NULL, NULL);
INSERT INTO `mine_collect` VALUES (56, 7, 4, '0', '4', '2021-12-11 08:12:42', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for mine_comment
-- ----------------------------
DROP TABLE IF EXISTS `mine_comment`;
CREATE TABLE `mine_comment` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` bigint(30) DEFAULT NULL COMMENT '商品id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `content` varchar(2000) DEFAULT NULL COMMENT '评论内容',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
-- Records of mine_comment
-- ----------------------------
BEGIN;
INSERT INTO `mine_comment` VALUES (1, 7, 4, 'nice', '2', '1', '2021-11-20 15:44:27', '1', NULL, NULL);
INSERT INTO `mine_comment` VALUES (2, 7, 4, '好极了', '0', '1', '2021-11-20 15:44:27', '1', NULL, NULL);
INSERT INTO `mine_comment` VALUES (3, 7, 4, '真好', '0', '1', '2021-11-20 15:44:27', '1', NULL, NULL);
INSERT INTO `mine_comment` VALUES (4, 2, 4, '非常好', '2', '6', '2021-11-20 22:10:44', '', NULL, NULL);
INSERT INTO `mine_comment` VALUES (5, 6, 4, '123123', '2', '6', '2021-11-20 22:11:42', '', NULL, NULL);
INSERT INTO `mine_comment` VALUES (6, 4, 4, '123412342314', '0', '6', '2021-11-21 08:19:05', '', NULL, NULL);
INSERT INTO `mine_comment` VALUES (7, 4, 4, '123123123', '2', '6', '2021-11-21 08:19:10', '', NULL, NULL);
INSERT INTO `mine_comment` VALUES (8, 7, 4, '444', '0', '4', '2021-12-11 11:16:00', '', NULL, NULL);
INSERT INTO `mine_comment` VALUES (9, 6, 4, '评论3333', '0', '4', '2021-12-11 11:17:15', '', NULL, NULL);
INSERT INTO `mine_comment` VALUES (10, 7, 4, '评论55555', '0', '4', '2021-12-11 11:17:15', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for mine_goods
-- ----------------------------
DROP TABLE IF EXISTS `mine_goods`;
CREATE TABLE `mine_goods` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_id` bigint(20) DEFAULT NULL COMMENT '类型',
  `title` varchar(200) DEFAULT NULL COMMENT '名称',
  `url` varchar(300) DEFAULT NULL COMMENT '封面地址',
  `cost_price` decimal(10,2) DEFAULT NULL COMMENT '原价',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `stock` int(20) DEFAULT NULL COMMENT '库存',
  `content` text COMMENT '内容',
  `index_status` char(1) DEFAULT NULL COMMENT '推荐首页(0 推荐 1不推荐)',
  `state` varchar(30) DEFAULT NULL COMMENT '状态\n10 正常\n20 下架',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='商品';

-- ----------------------------
-- Records of mine_goods
-- ----------------------------
BEGIN;
INSERT INTO `mine_goods` VALUES (1, 18, '华为电视', '/profile/upload/2021/12/07/42da00f6-a5f5-4dbf-b58a-e5180aedea04.jpg', 5555.00, 222.00, 4, '<p><img style=\"width: 100%;\" src=\"/profile/upload/2021/12/07/c74bead3-dd99-4800-8b0f-76bebb5746e1.png\"></p><div id=\"state\">\r\n                            <strong>权利声明：</strong><br>京东上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是京东重要的经营资源，未经许可，禁止非法转载使用。\r\n                            <p><b>注：</b>本站商品信息均来自于合作方，其真实性、准确性和合法性由信息拥有者（合作方）负责。本站不提供任何保证，并不承担任何法律责任。</p>\r\n                                                        <br>\r\n                            <strong>价格说明：</strong><br>\r\n                            <p><b>京东价：</b>京东价为商品的销售价，是您最终决定是否购买商品的依据。</p>\r\n                            <p><b>划线价：</b>商品展示的划横线价格为参考价，并非原价，该价格可能是品牌专柜标价、商品吊牌价或由品牌供应商提供的正品零售价（如厂商指导价、建议零售价等）或其他真实有依据的价格；由于地区、时间的差异性和市场行情波动，品牌专柜标价、商品吊牌价等可能会与您购物时展示的不一致，该价格仅供您参考。</p>\r\n                            <p><b>折扣：</b>如无特殊说明，折扣指销售商在原价、或划线价（如品牌专柜标价、商品吊牌价、厂商指导价、厂商建议零售价）等某一价格基础上计算出的优惠比例或优惠金额；如有疑问，您可在购买前联系销售商进行咨询。</p>\r\n                            <p><b>异常问题：</b>商品促销信息以商品详情页“促销”栏中的信息为准；商品的具体售价以订单结算页价格为准；如您发现活动商品售价或促销信息有异常，建议购买前先联系销售商咨询。</p>\r\n\r\n                                                        <br>\r\n                            <strong>能效标识说明：</strong><br>\r\n                            <p>根据国家相关能效标识法规和标准的要求，京东自营在售商品的能效标识图样，将会逐步替换为新版能源效率标识贴；受能效标识标准变化影响，部分产品的新版和旧版能效标识，在能效等级、测试值等方面会有差异，但产品实际性能完全一样，并不影响购买和使用，加贴新版或旧版能效标识的商品会随机发放，请您放心购买；如有疑问，请在购买前通过咚咚或来电咨询。</p>\r\n                                                    </div>', '0', '10', '0', 'admin', '2021-12-07 21:45:11', 'admin', '2021-12-07 21:45:52', NULL);
INSERT INTO `mine_goods` VALUES (2, 20, '海信 Vidda EA43S 2022款 43英寸 金属全面屏电视 超薄电视 智慧屏 1G+8G 游戏液晶电视以旧换新 43V1G-J ', '/profile/upload/2021/12/07/5d0d7c54-7013-481e-a31a-42f9c882bb59.jpg', 3333.00, 22222.00, 444, '<div data-tab=\"item\" class=\"hide\" style=\"display: block;\">\r\n                                                <div class=\"Ptable\">\r\n            <div class=\"Ptable-item\">\r\n        <h3>核心参数</h3>\r\n        <dl><dl class=\"clearfix\" style=\"margin:0\"><dt>CPU核心数</dt><dd>四核</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>存储内存</dt><dd>8GB</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>CPU架构</dt><dd>四核A53</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>系统</dt><dd>Android</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>WIFI频段</dt><dd>2.4G</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>运行内存/RAM</dt><dd>1GB</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>背光方式</dt><dd>直下式/DLED</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>GPU</dt><dd class=\"Ptable-tips\">\r\n                    \r\n                    \r\n                  <br></dd><dd>2核G31</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>语音控制</dt><dd>人工智能语音</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>智能语音助手</dt><dd>海信小聚</dd></dl></dl>\r\n      </div>\r\n                <div class=\"Ptable-item\">\r\n        <h3>外观设计</h3>\r\n        <dl><dl class=\"clearfix\" style=\"margin:0\"><dt>安装孔距</dt><dd>100*100mm</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>边框材质</dt><dd>金属</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>底座材质</dt><dd>塑料</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>屏占比</dt><dd>97%&gt;N≥95%</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>机身最薄处</dt><dd>7.7mm</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>单屏重量</dt><dd>6.2kg</dd></dl></dl>\r\n      </div>\r\n                <div class=\"Ptable-item\">\r\n        <h3>端口参数</h3>\r\n        <dl><dl class=\"clearfix\" style=\"margin:0\"><dt>HDMI2.0接口数</dt><dd>无</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>光纤音频输出</dt><dd>不支持光纤音频输出</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>USB2.0接口数</dt><dd>2个</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>RBG接口</dt><dd>不支持RBG接口</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>USB3.0接口数</dt><dd>无</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>数字RF接口</dt><dd>支持数字RF接口</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>HDMI1.4接口数</dt><dd>2个</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>HDMI1.3接口数</dt><dd>无</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>HDMI(ARC)接口</dt><dd>有</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>模拟RF接口</dt><dd>支持模拟RF接口</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>DP接口</dt><dd>无</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>HDMI2.1接口数</dt><dd>无</dd></dl></dl>\r\n      </div>\r\n                <div class=\"Ptable-item\">\r\n        <h3>规格参数</h3>\r\n        <dl><dl class=\"clearfix\" style=\"margin:0\"><dt>含底座重量</dt><dd>6.3kg</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>含底座尺寸</dt><dd>宽964mm；高609mm；厚182mm</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>单屏尺寸</dt><dd>宽964mm；高561mm；厚81mm</dd></dl></dl>\r\n      </div>\r\n                <div class=\"Ptable-item\">\r\n        <h3>显示参数</h3>\r\n        <dl><dl class=\"clearfix\" style=\"margin:0\"><dt>亮度</dt><dd class=\"Ptable-tips\">\r\n                    \r\n                    \r\n                  <br></dd><dd>200-300尼特</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>屏幕比例</dt><dd>16:9</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>刷屏率</dt><dd>60Hz</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>屏幕分辨率</dt><dd>全高清</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>支持格式（高清）</dt><dd>1080p</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>响应时间</dt><dd>10ms</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>屏幕尺寸</dt><dd>43英寸</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>HDR显示</dt><dd>不支持HDR</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>色域值</dt><dd>100%</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>对比度</dt><dd>1200(TYP)</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>色域标准</dt><dd>BT.709</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>VRR可变刷新率</dt><dd>不支持VRR可变刷新率</dd></dl></dl>\r\n      </div>\r\n                <div class=\"Ptable-item\">\r\n        <h3>音频参数</h3>\r\n        <dl><dl class=\"clearfix\" style=\"margin:0\"><dt>音响功率</dt><dd>14W</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>独立音响</dt><dd>无</dd></dl></dl>\r\n      </div>\r\n                <div class=\"Ptable-item\">\r\n        <h3>主体参数</h3>\r\n        <dl><dl class=\"clearfix\" style=\"margin:0\"><dt>认证型号</dt><dd class=\"Ptable-tips\">\r\n                    \r\n                    \r\n                  <br></dd><dd>43V1G-J</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>型号</dt><dd>43V1G-J</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>类型</dt><dd>教育电视；体育电视；游戏电视；音乐电视；护眼电视；京品电视；智能电视</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>护眼电视</dt><dd>护眼电视</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>上市时间</dt><dd>2021-10</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>显示类型</dt><dd>LED显示</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>摄像头</dt><dd>无摄像头</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>是否触摸屏</dt><dd>非触摸屏</dd></dl></dl>\r\n      </div>\r\n                <div class=\"Ptable-item\">\r\n        <h3>网络参数</h3>\r\n        <dl><dl class=\"clearfix\" style=\"margin:0\"><dt>连接方式</dt><dd>无线/有线</dd></dl></dl>\r\n      </div>\r\n                <div class=\"Ptable-item\">\r\n        <h3>功耗参数</h3>\r\n        <dl><dl class=\"clearfix\" style=\"margin:0\"><dt>工作电压</dt><dd>220V</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>待机功率</dt><dd>0.5W</dd></dl><dl class=\"clearfix\" style=\"margin:0\"><dt>电源功率</dt><dd>65W</dd></dl></dl>\r\n      </div>\r\n      </div>\r\n                                                <div class=\"package-list\">\r\n                            <h3>包装清单</h3>\r\n                            <p>说明书、遥控器、螺钉、底座、7号电池</p>\r\n                        </div>\r\n                    </div><br>核心参数<br><br>CPU核心数<br>&nbsp;&nbsp;&nbsp; 四核<br><br>存储内存<br>&nbsp;&nbsp;&nbsp; 8GB<br><br>CPU架构<br>&nbsp;&nbsp;&nbsp; 四核A53<br><br>系统<br>&nbsp;&nbsp;&nbsp; Android<br><br>WIFI频段<br>&nbsp;&nbsp;&nbsp; 2.4G<br><br>运行内存/RAM<br>&nbsp;&nbsp;&nbsp; 1GB<br><br>背光方式<br>&nbsp;&nbsp;&nbsp; 直下式/DLED<br><br>GPU<br>&nbsp;&nbsp;&nbsp; 2核G31<br><br>语音控制<br>&nbsp;&nbsp;&nbsp; 人工智能语音<br><br>智能语音助手<br>&nbsp;&nbsp;&nbsp; 海信小聚<br><br>外观设计<br><br>安装孔距<br>&nbsp;&nbsp;&nbsp; 100*100mm<br><br>边框材质<br>&nbsp;&nbsp;&nbsp; 金属<br><br>底座材质<br>&nbsp;&nbsp;&nbsp; 塑料<br><br>屏占比<br>&nbsp;&nbsp;&nbsp; 97%&gt;N≥95%<br><br>机身最薄处<br>&nbsp;&nbsp;&nbsp; 7.7mm<br><br>单屏重量<br>&nbsp;&nbsp;&nbsp; 6.2kg<br><br>端口参数<br><br>HDMI2.0接口数<br>&nbsp;&nbsp;&nbsp; 无<br><br>光纤音频输出<br>&nbsp;&nbsp;&nbsp; 不支持光纤音频输出<br><br>USB2.0接口数<br>&nbsp;&nbsp;&nbsp; 2个<br><br>RBG接口<br>&nbsp;&nbsp;&nbsp; 不支持RBG接口<br><br>USB3.0接口数<br>&nbsp;&nbsp;&nbsp; 无<br><br>数字RF接口<br>&nbsp;&nbsp;&nbsp; 支持数字RF接口<br><br>HDMI1.4接口数<br>&nbsp;&nbsp;&nbsp; 2个<br><br>HDMI1.3接口数<br>&nbsp;&nbsp;&nbsp; 无<br><br>HDMI(ARC)接口<br>&nbsp;&nbsp;&nbsp; 有<br><br>模拟RF接口<br>&nbsp;&nbsp;&nbsp; 支持模拟RF接口<br><br>DP接口<br>&nbsp;&nbsp;&nbsp; 无<br><br>HDMI2.1接口数<br>&nbsp;&nbsp;&nbsp; 无<br><br>规格参数<br><br>含底座重量<br>&nbsp;&nbsp;&nbsp; 6.3kg<br><br>含底座尺寸<br>&nbsp;&nbsp;&nbsp; 宽964mm；高609mm；厚182mm<br><br>单屏尺寸<br>&nbsp;&nbsp;&nbsp; 宽964mm；高561mm；厚81mm<br><br>显示参数<br><br>亮度<br>&nbsp;&nbsp;&nbsp; 200-300尼特<br><br>屏幕比例<br>&nbsp;&nbsp;&nbsp; 16:9<br><br>刷屏率<br>&nbsp;&nbsp;&nbsp; 60Hz<br><br>屏幕分辨率<br>&nbsp;&nbsp;&nbsp; 全高清<br><br>支持格式（高清）<br>&nbsp;&nbsp;&nbsp; 1080p<br><br>响应时间<br>&nbsp;&nbsp;&nbsp; 10ms<br><br>屏幕尺寸<br>&nbsp;&nbsp;&nbsp; 43英寸<br><br>HDR显示<br>&nbsp;&nbsp;&nbsp; 不支持HDR<br><br>色域值<br>&nbsp;&nbsp;&nbsp; 100%<br><br>对比度<br>&nbsp;&nbsp;&nbsp; 1200(TYP)<br><br>色域标准<br>&nbsp;&nbsp;&nbsp; BT.709<br><br>VRR可变刷新率<br>&nbsp;&nbsp;&nbsp; 不支持VRR可变刷新率<br><br>音频参数<br><br>音响功率<br>&nbsp;&nbsp;&nbsp; 14W<br><br>独立音响<br>&nbsp;&nbsp;&nbsp; 无<br><br>主体参数<br><br>认证型号<br>&nbsp;&nbsp;&nbsp; 43V1G-J<br><br>型号<br>&nbsp;&nbsp;&nbsp; 43V1G-J<br><br>类型<br>&nbsp;&nbsp;&nbsp; 教育电视；体育电视；游戏电视；音乐电视；护眼电视；京品电视；智能电视<br><br>护眼电视<br>&nbsp;&nbsp;&nbsp; 护眼电视<br><br>上市时间<br>&nbsp;&nbsp;&nbsp; 2021-10<br><br>显示类型<br>&nbsp;&nbsp;&nbsp; LED显示<br><br>摄像头<br>&nbsp;&nbsp;&nbsp; 无摄像头<br><br>是否触摸屏<br>&nbsp;&nbsp;&nbsp; 非触摸屏<br><br>网络参数<br><br>连接方式<br>&nbsp;&nbsp;&nbsp; 无线/有线<br><br>功耗参数<br><br>工作电压<br>&nbsp;&nbsp;&nbsp; 220V<br><br>待机功率<br>&nbsp;&nbsp;&nbsp; 0.5W<br><br>电源功率<br>&nbsp;&nbsp;&nbsp; 65W<br><br>包装清单<br><br>说明书、遥控器、螺钉、底座、7号电池<br><br>', '0', '10', '0', 'admin', '2021-12-07 22:08:49', '', NULL, NULL);
INSERT INTO `mine_goods` VALUES (3, 19, '三星（SAMSUNG）京品家电 65英寸 Q60T QLED全面屏 超薄超高清娱乐游戏智能电视机 液晶电视QA65Q60TAJXXZ ', '/profile/upload/2021/12/07/42f5d76b-a115-47a9-a5e3-35fe4d36e434.jpg', 44444.00, 444.00, 444, '<p><img style=\"width: 100%;\" src=\"/profile/upload/2021/12/07/aebc262d-ebd0-4e94-b642-09d94cc84eb7.png\"></p><p><br></p><p><br></p><div id=\"state\">\r\n                            <strong>权利声明：</strong><br>京东上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是京东重要的经营资源，未经许可，禁止非法转载使用。\r\n                            <p><b>注：</b>本站商品信息均来自于合作方，其真实性、准确性和合法性由信息拥有者（合作方）负责。本站不提供任何保证，并不承担任何法律责任。</p>\r\n                                                        <br>\r\n                            <strong>价格说明：</strong><br>\r\n                            <p><b>京东价：</b>京东价为商品的销售价，是您最终决定是否购买商品的依据。</p>\r\n                            <p><b>划线价：</b>商品展示的划横线价格为参考价，并非原价，该价格可能是品牌专柜标价、商品吊牌价或由品牌供应商提供的正品零售价（如厂商指导价、建议零售价等）或其他真实有依据的价格；由于地区、时间的差异性和市场行情波动，品牌专柜标价、商品吊牌价等可能会与您购物时展示的不一致，该价格仅供您参考。</p>\r\n                            <p><b>折扣：</b>如无特殊说明，折扣指销售商在原价、或划线价（如品牌专柜标价、商品吊牌价、厂商指导价、厂商建议零售价）等某一价格基础上计算出的优惠比例或优惠金额；如有疑问，您可在购买前联系销售商进行咨询。</p>\r\n                            <p><b>异常问题：</b>商品促销信息以商品详情页“促销”栏中的信息为准；商品的具体售价以订单结算页价格为准；如您发现活动商品售价或促销信息有异常，建议购买前先联系销售商咨询。</p>\r\n\r\n                                                        <br>\r\n                            <strong>能效标识说明：</strong><br>\r\n                            <p>根据国家相关能效标识法规和标准的要求，京东自营在售商品的能效标识图样，将会逐步替换为新版能源效率标识贴；受能效标识标准变化影响，部分产品的新版和旧版能效标识，在能效等级、测试值等方面会有差异，但产品实际性能完全一样，并不影响购买和使用，加贴新版或旧版能效标识的商品会随机发放，请您放心购买；如有疑问，请在购买前通过咚咚或来电咨询。</p>\r\n                                                    </div>', '0', '10', '0', 'admin', '2021-12-07 22:11:09', '', NULL, NULL);
INSERT INTO `mine_goods` VALUES (4, 19, 'NB 757-L400电视支架(32-70英寸)壁挂通用电视挂架旋转伸缩电视架小米荣耀智慧屏海信创维TCL三星索尼电视架 ', '/profile/upload/2021/12/07/f882e21b-9677-4d1f-b4d5-597c789e53e3.jpg', 444.00, 444.00, 444, '<p><img style=\"width: 1114.67px;\" src=\"/profile/upload/2021/12/07/37c917f2-9822-455b-abeb-3b4c6bfbce1f.png\"><br></p>', '0', '10', '0', 'admin', '2021-12-07 22:19:51', '', NULL, NULL);
INSERT INTO `mine_goods` VALUES (5, 22, '九阳电饭煲 家用电饭锅5L升大容量智能多功能煮饭锅5-6-8人JYF-50FS69-F ', '/profile/upload/2021/12/07/41ec31e8-1d9d-456f-bf28-07f3d0cbc93d.png', 0.00, 0.00, 0, '<p><img style=\"width: 790px;\" src=\"/profile/upload/2021/12/07/fffc08bc-04cc-454f-a7d0-6accbb453fa0.png\"></p><div id=\"state\">\r\n                            <strong>权利声明：</strong><br>京东上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是京东重要的经营资源，未经许可，禁止非法转载使用。\r\n                            <p><b>注：</b>本站商品信息均来自于合作方，其真实性、准确性和合法性由信息拥有者（合作方）负责。本站不提供任何保证，并不承担任何法律责任。</p>\r\n                                                        <br>\r\n                            <strong>价格说明：</strong><br>\r\n                            <p><b>京东价：</b>京东价为商品的销售价，是您最终决定是否购买商品的依据。</p>\r\n                            <p><b>划线价：</b>商品展示的划横线价格为参考价，并非原价，该价格可能是品牌专柜标价、商品吊牌价或由品牌供应商提供的正品零售价（如厂商指导价、建议零售价等）或其他真实有依据的价格；由于地区、时间的差异性和市场行情波动，品牌专柜标价、商品吊牌价等可能会与您购物时展示的不一致，该价格仅供您参考。</p>\r\n                            <p><b>折扣：</b>如无特殊说明，折扣指销售商在原价、或划线价（如品牌专柜标价、商品吊牌价、厂商指导价、厂商建议零售价）等某一价格基础上计算出的优惠比例或优惠金额；如有疑问，您可在购买前联系销售商进行咨询。</p>\r\n                            <p><b>异常问题：</b>商品促销信息以商品详情页“促销”栏中的信息为准；商品的具体售价以订单结算页价格为准；如您发现活动商品售价或促销信息有异常，建议购买前先联系销售商咨询。</p>\r\n\r\n                                                        <br>\r\n                            <strong>能效标识说明：</strong><br>\r\n                            <p>根据国家相关能效标识法规和标准的要求，京东自营在售商品的能效标识图样，将会逐步替换为新版能源效率标识贴；受能效标识标准变化影响，部分产品的新版和旧版能效标识，在能效等级、测试值等方面会有差异，但产品实际性能完全一样，并不影响购买和使用，加贴新版或旧版能效标识的商品会随机发放，请您放心购买；如有疑问，请在购买前通过咚咚或来电咨询。</p>\r\n                                                    </div>', '0', '10', '0', 'admin', '2021-12-07 22:21:14', '', NULL, NULL);
INSERT INTO `mine_goods` VALUES (6, 22, '美的（Midea）智能电饭煲电饭锅3-10人家用5L大容量预约气动涡轮防溢锅金属机身蒸米饭锅-WFS5017TM ', '/profile/upload/2021/12/07/420b0a6f-bd95-4519-8490-9b6285ff9f0c.jpg', 88.00, 888.00, 886, '<div id=\"state\">\r\n                            <strong>权利声明：</strong><br>京东上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是京东重要的经营资源，未经许可，禁止非法转载使用。\r\n                            <p><b>注：</b>本站商品信息均来自于合作方，其真实性、准确性和合法性由信息拥有者（合作方）负责。本站不提供任何保证，并不承担任何法律责任。</p>\r\n                                                        <br>\r\n                            <strong>价格说明：</strong><br>\r\n                            <p><b>京东价：</b>京东价为商品的销售价，是您最终决定是否购买商品的依据。</p>\r\n                            <p><b>划线价：</b>商品展示的划横线价格为参考价，并非原价，该价格可能是品牌专柜标价、商品吊牌价或由品牌供应商提供的正品零售价（如厂商指导价、建议零售价等）或其他真实有依据的价格；由于地区、时间的差异性和市场行情波动，品牌专柜标价、商品吊牌价等可能会与您购物时展示的不一致，该价格仅供您参考。</p>\r\n                            <p><b>折扣：</b>如无特殊说明，折扣指销售商在原价、或划线价（如品牌专柜标价、商品吊牌价、厂商指导价、厂商建议零售价）等某一价格基础上计算出的优惠比例或优惠金额；如有疑问，您可在购买前联系销售商进行咨询。</p>\r\n                            <p><b>异常问题：</b>商品促销信息以商品详情页“促销”栏中的信息为准；商品的具体售价以订单结算页价格为准；如您发现活动商品售价或促销信息有异常，建议购买前先联系销售商咨询。</p>\r\n\r\n                                                        <br>\r\n                            <strong>能效标识说明：</strong><br>\r\n                            <p>根据国家相关能效标识法规和标准的要求，京东自营在售商品的能效标识图样，将会逐步替换为新版能源效率标识贴；受能效标识标准变化影响，部分产品的新版和旧版能效标识，在能效等级、测试值等方面会有差异，但产品实际性能完全一样，并不影响购买和使用，加贴新版或旧版能效标识的商品会随机发放，请您放心购买；如有疑问，请在购买前通过咚咚或来电咨询。</p>\r\n                                                    </div>', '0', '10', '0', 'admin', '2021-12-07 22:21:41', '', NULL, NULL);
INSERT INTO `mine_goods` VALUES (7, 21, '先科（SAST）S1-6 定压吸顶喇叭音响 吊顶背景音乐公共广播 6英寸 ', '/profile/upload/2021/12/07/7cacb9de-dc35-408b-b5f3-13bbd992a5c7.jpg', 44.00, 4.00, 442, '<p>先科（SAST）S1-6 定压吸顶喇叭音响 吊顶背景音乐公共广播 6英寸                </p><p><img style=\"width: 750px;\" src=\"/profile/upload/2021/12/07/dd05044a-e5b9-4467-8975-6a7126e19349.png\"><br></p>', '0', '10', '0', 'admin', '2021-12-07 22:30:30', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for mine_order
-- ----------------------------
DROP TABLE IF EXISTS `mine_order`;
CREATE TABLE `mine_order` (
  `uuid` varchar(50) NOT NULL COMMENT '主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `order_code` varchar(50) DEFAULT NULL COMMENT '订单号',
  `price` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `pay_price` decimal(10,2) DEFAULT '0.00' COMMENT '实际支付金额',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `pay_status` varchar(20) DEFAULT NULL COMMENT '支付状态\n10 待支付\n20 支付失败\n30 支付成功\n40 已关闭\n50 取消',
  `bus_pay_no` varchar(50) DEFAULT NULL COMMENT '第三方支付订单号',
  `prepay_id` varchar(50) DEFAULT NULL COMMENT '预支付交易会话标识 ',
  `order_code_type` varchar(10) DEFAULT NULL COMMENT '订单编码类型\n1=订单类别头\n2=退货类别头\n3=退款类别头\n4=未付款重新支付别头',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `express_code` varchar(50) DEFAULT NULL COMMENT '快递单号',
  `receiving_date` datetime DEFAULT NULL COMMENT '收货时间',
  `delivery_date` datetime DEFAULT NULL COMMENT '发货时间',
  `comm_status` varchar(10) DEFAULT '0' COMMENT '评论状态0未评论 1已评论',
  `vip_user_id` bigint(20) DEFAULT NULL COMMENT '合伙人id',
  `vip_code` varchar(20) DEFAULT NULL COMMENT '折扣码',
  `discount` decimal(10,2) DEFAULT '0.00' COMMENT '折扣',
  `ratio` decimal(10,2) DEFAULT '0.00' COMMENT '提成比例',
  `comm_price` decimal(10,2) DEFAULT NULL COMMENT '提成金额',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单信息';

-- ----------------------------
-- Records of mine_order
-- ----------------------------
BEGIN;
INSERT INTO `mine_order` VALUES ('72ac2949bfe34700bb1580b0d69fd1ab', 4, '12021121115323132277779874362293', 88800.00, 79920.00, '2021-12-11 15:32:31', '30', NULL, NULL, '1', '0', '4', '2021-12-11 15:32:31', '', NULL, NULL, NULL, NULL, NULL, '0', 4, '123123', 90.00, 2.00, 15.98);
INSERT INTO `mine_order` VALUES ('b1098fad4bf94c6489046e8a2fa8fabc', 4, '12021121108395661977779509258630', 400.00, 400.00, '2021-12-11 08:39:57', '30', NULL, NULL, '1', '0', '4', '2021-12-11 08:39:57', '', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 0.00, 0.00, NULL);
INSERT INTO `mine_order` VALUES ('b67bfd08a2214541a84172e43d02d88c', 4, '12021121108404630977779742261058', 89200.00, 89200.00, '2021-12-11 08:40:46', '50', NULL, NULL, '1', '0', '4', '2021-12-11 08:40:46', '', '2021-12-11 11:17:15', NULL, '123123123', '2021-12-11 09:21:17', '2021-12-11 09:21:02', '1', NULL, NULL, 0.00, 0.00, NULL);
COMMIT;

-- ----------------------------
-- Table structure for mine_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `mine_order_detail`;
CREATE TABLE `mine_order_detail` (
  `uuid` varchar(50) NOT NULL COMMENT '主键',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `order_id` varchar(50) DEFAULT NULL COMMENT '订单id',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `num` int(10) DEFAULT NULL COMMENT '数量',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单详细';

-- ----------------------------
-- Records of mine_order_detail
-- ----------------------------
BEGIN;
INSERT INTO `mine_order_detail` VALUES ('242a5fb86bbe415aaa4ad0b4674b465d', 6, 4, '72ac2949bfe34700bb1580b0d69fd1ab', 888.00, 1, '4', '2021-12-11 15:32:31');
INSERT INTO `mine_order_detail` VALUES ('7707f62e0a1743e5929c18a22b21ab53', 6, 4, 'b67bfd08a2214541a84172e43d02d88c', 888.00, 1, '4', '2021-12-11 08:40:46');
INSERT INTO `mine_order_detail` VALUES ('8d213d7a5b4d434b86a8a53fde53ea06', 7, 4, 'b67bfd08a2214541a84172e43d02d88c', 4.00, 1, '4', '2021-12-11 08:40:46');
INSERT INTO `mine_order_detail` VALUES ('a3e0b344c00b40bcb5719fafcd0f2faa', 7, 4, 'b1098fad4bf94c6489046e8a2fa8fabc', 4.00, 1, '4', '2021-12-11 08:39:57');
COMMIT;

-- ----------------------------
-- Table structure for mine_partner_apply
-- ----------------------------
DROP TABLE IF EXISTS `mine_partner_apply`;
CREATE TABLE `mine_partner_apply` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `content` varchar(500) DEFAULT NULL COMMENT '申请理由',
  `phone_num` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `user_name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `discount` decimal(10,2) DEFAULT '0.00' COMMENT '折扣',
  `ratio` decimal(10,2) DEFAULT '0.00' COMMENT '提成比例',
  `status` varchar(20) DEFAULT NULL COMMENT '审核状态',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='合伙人申请记录';

-- ----------------------------
-- Records of mine_partner_apply
-- ----------------------------
BEGIN;
INSERT INTO `mine_partner_apply` VALUES (3, 4, '123', '123', '123', 90.00, 2.00, '20', '0', '', '2021-12-11 14:38:32', '', '2021-12-11 14:50:03', NULL);
COMMIT;

-- ----------------------------
-- Table structure for mine_type
-- ----------------------------
DROP TABLE IF EXISTS `mine_type`;
CREATE TABLE `mine_type` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `type_name` varchar(50) DEFAULT NULL COMMENT '标题',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `cover_img` varchar(300) DEFAULT NULL COMMENT '封面地址',
  `index_status` char(1) DEFAULT NULL COMMENT '推荐首页(0 推荐 1不推荐)',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='分类';

-- ----------------------------
-- Records of mine_type
-- ----------------------------
BEGIN;
INSERT INTO `mine_type` VALUES (14, 0, '0', '电脑', 1, '/profile/upload/2021/12/07/dd7d133b-999a-4512-b19f-098e08df13a3.jpg', '0', '0', '0', '', '2021-12-07 21:05:49', '', NULL, '');
INSERT INTO `mine_type` VALUES (15, 0, '0', '大家电', 2, '/profile/upload/2021/12/07/efcd2510-f5e5-4884-a637-bf02510b17e7.jpg', '0', '0', '0', '', '2021-12-07 21:11:33', '', NULL, '');
INSERT INTO `mine_type` VALUES (16, 0, '0', '小家电', 3, '/profile/upload/2021/12/07/df0e2b2c-7831-4010-a6f4-8ff062d616e7.jpg', '0', '0', '0', '', '2021-12-07 21:11:46', '', NULL, '');
INSERT INTO `mine_type` VALUES (17, 0, '0', '数码', 4, '/profile/upload/2021/12/07/bf2baf05-6d5b-4392-a6da-1972ad882e32.jpg', '0', '0', '0', '', '2021-12-07 21:12:08', '', NULL, '');
INSERT INTO `mine_type` VALUES (18, 14, '0,14', '组装电脑', 1, '/profile/upload/2021/12/07/f88754bd-fc1b-4f30-91f5-b25a30feb567.png', '0', '0', '0', '', '2021-12-07 21:12:32', '', NULL, '');
INSERT INTO `mine_type` VALUES (19, 14, '0,14', '教育电视', 2, '/profile/upload/2021/12/07/f709770d-84ed-4e70-bd37-ae4e511855a1.png', '0', '0', '0', '', '2021-12-07 21:12:54', '', NULL, '');
INSERT INTO `mine_type` VALUES (20, 15, '0,15', '4K电视', 1, '/profile/upload/2021/12/07/77231e4a-d636-42c6-93b4-01b7e1bf686d.jpg', '0', '0', '0', '', '2021-12-07 21:13:27', '', '2021-12-07 22:31:35', '');
INSERT INTO `mine_type` VALUES (21, 15, '0,15', '平板电视', 3, '/profile/upload/2021/12/07/ab159816-cecc-4d02-a00f-513f385f96ef.jpg', '0', '0', '0', '', '2021-12-07 22:03:36', '', NULL, '');
INSERT INTO `mine_type` VALUES (22, 16, '0,16', '电饭煲', 1, '/profile/upload/2021/12/07/74e1fc57-835d-407c-b3a6-ba100bc8ace7.jpg', '0', '0', '0', '', '2021-12-07 22:04:05', '', NULL, '');
INSERT INTO `mine_type` VALUES (23, 16, '0,16', '空气炸锅', 3, '/profile/upload/2021/12/07/851ae403-ee5f-4bff-a76c-418035e5ec42.png', '0', '0', '0', '', '2021-12-07 22:04:44', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-11-01 10:42:08', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-11-01 10:42:08', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-11-01 10:42:08', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-11-01 10:42:08', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2021-11-01 10:42:08', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2021-11-01 10:42:08', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2021-11-01 10:42:08', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2021-11-01 10:42:08', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2021-11-01 10:42:08', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2021-11-01 10:42:08', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'XXX科技', 0, '', '', '', '0', '0', 'admin', '2021-11-01 10:42:08', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '部门一', 1, '', '', '', '0', '0', 'admin', '2021-11-01 10:42:08', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '部门二', 2, '', '', '', '0', '0', 'admin', '2021-11-01 10:42:08', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 1, '正常', '10', 'goods_state', '', 'primary', 'Y', '0', 'admin', '2021-11-15 15:17:03', 'admin', '2021-11-15 15:17:52', '');
INSERT INTO `sys_dict_data` VALUES (31, 2, '下架', '20', 'goods_state', '', 'warning', 'Y', '0', 'admin', '2021-11-15 15:17:11', 'admin', '2021-11-15 15:17:41', '');
INSERT INTO `sys_dict_data` VALUES (32, 1, '推荐', '0', 'shop_index_status', NULL, 'primary', 'Y', '0', 'admin', '2021-11-18 21:37:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (33, 2, '不推荐', '1', 'shop_index_status', '', 'info', 'N', '0', 'admin', '2021-11-18 21:37:56', 'admin', '2021-11-18 21:38:16', '');
INSERT INTO `sys_dict_data` VALUES (34, 1, '待支付', '10', 'shop_pay_status', NULL, NULL, 'Y', '0', 'admin', '2021-12-03 10:19:58', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (35, 2, '支付失败', '20', 'shop_pay_status', NULL, NULL, 'Y', '0', 'admin', '2021-12-03 10:20:12', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (36, 3, '支付成功(待发货)', '30', 'shop_pay_status', NULL, NULL, 'Y', '0', 'admin', '2021-12-03 10:20:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (38, 5, '待收货', '40', 'shop_pay_status', NULL, NULL, 'Y', '0', 'admin', '2021-12-03 10:20:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (39, 6, '已完成', '50', 'shop_pay_status', NULL, NULL, 'Y', '0', 'admin', '2021-12-03 10:21:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (40, 7, '已关闭', '60', 'shop_pay_status', NULL, NULL, 'Y', '0', 'admin', '2021-12-03 10:21:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (41, 8, '取消', '70', 'shop_pay_status', NULL, NULL, 'Y', '0', 'admin', '2021-12-03 10:21:31', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (42, 1, '待审核', '10', 'apply_status', NULL, NULL, 'Y', '0', 'admin', '2021-12-11 13:32:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (43, 2, '通过', '20', 'apply_status', NULL, NULL, 'Y', '0', 'admin', '2021-12-11 13:32:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (44, 3, '未通过', '30', 'apply_status', NULL, NULL, 'Y', '0', 'admin', '2021-12-11 13:32:41', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '商品类型', 'goods_state', '0', 'admin', '2021-11-15 15:16:53', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (12, '推荐首页', 'shop_index_status', '0', 'admin', '2021-11-18 21:37:19', '', NULL, '推荐首页');
INSERT INTO `sys_dict_type` VALUES (13, '支付状态', 'shop_pay_status', '0', 'admin', '2021-12-03 10:15:01', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (14, '审核状态', 'apply_status', '0', 'admin', '2021-12-11 13:32:02', '', NULL, '审核状态');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-11-01 10:42:08', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-11-02 14:48:58');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-11-11 10:30:13');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '1', '密码输入错误1次', '2021-11-11 14:32:19');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '1', '密码输入错误2次', '2021-11-11 14:32:23');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-11-11 14:42:39');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-11-11 15:14:20');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-11-11 15:50:13');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-11-11 19:02:31');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-11-11 19:05:10');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-11-15 14:37:18');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-11-15 14:37:55');
INSERT INTO `sys_logininfor` VALUES (111, 'admimn', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '1', '用户不存在/密码错误', '2021-11-15 15:06:47');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-11-15 15:06:56');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-11-25 22:35:42');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-11-28 20:38:12');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-11-28 21:55:10');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-11-29 22:40:19');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-02 16:19:23');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-03 10:04:13');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-03 10:58:29');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-03 14:15:38');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-03 21:55:21');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '1', '验证码错误', '2021-12-03 23:01:51');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-03 23:01:54');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-03 23:24:57');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-03 23:47:09');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-04 14:03:37');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-07 21:02:56');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-07 21:17:02');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-11 08:02:10');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-11 08:05:49');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-11 08:38:17');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-11 08:39:17');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '1', '验证码错误', '2021-12-11 09:55:11');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-11 09:55:14');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-11 11:18:03');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-11 12:07:22');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '1', '验证码错误', '2021-12-11 13:20:47');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-11 13:20:50');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-11 13:36:36');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-11 14:21:54');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '1', '验证码错误', '2021-12-11 15:36:13');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-11 15:36:19');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-11 16:23:53');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', '0', '登录成功', '2021-12-11 17:10:02');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1094 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 99, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2021-11-01 10:42:08', 'admin', '2021-12-03 14:34:18', '系统管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2021-11-01 10:42:08', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2021-11-01 10:42:08', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2021-11-01 10:42:08', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2021-11-01 10:42:08', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2021-11-01 10:42:08', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2021-11-01 10:42:08', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2021-11-01 10:42:08', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1062, '商城管理', 0, 0, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-cart-arrow-down', 'admin', '2021-11-11 15:52:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1063, '类型管理', 1062, 100, '/shop/type', 'menuItem', 'C', '0', '1', 'shop:type:view', '#', 'admin', '2021-11-11 15:52:35', 'admin', '2021-11-11 15:54:23', '');
INSERT INTO `sys_menu` VALUES (1064, '待发货', 1079, 1, '/shop/order/30', 'menuItem', 'C', '0', '1', 'shop:order:view', '#', 'admin', '2021-11-11 15:53:15', 'admin', '2021-12-03 14:41:14', '');
INSERT INTO `sys_menu` VALUES (1065, '轮播图管理', 1062, 90, '/shop/banner', 'menuItem', 'C', '0', '1', 'shop:banner:view', '#', 'admin', '2021-11-11 15:53:30', 'admin', '2021-11-15 14:39:59', '');
INSERT INTO `sys_menu` VALUES (1066, '新增', 1063, 1, '#', 'menuItem', 'F', '0', '1', 'shop:type:add', '#', 'admin', '2021-11-11 15:55:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1067, '删除', 1063, 2, '#', 'menuItem', 'F', '0', '1', 'shop:type:remove', '#', 'admin', '2021-11-11 15:55:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1068, '修改', 1063, 3, '#', 'menuItem', 'F', '0', '1', 'shop:type:edit', '#', 'admin', '2021-11-11 15:56:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1069, '查询', 1063, 4, '#', 'menuItem', 'F', '0', '1', 'shop:type:list', '#', 'admin', '2021-11-11 15:56:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1070, '新增', 1065, 1, '#', 'menuItem', 'F', '0', '1', 'shop:banner:add', '#', 'admin', '2021-11-15 14:40:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1071, '删除', 1065, 2, '#', 'menuItem', 'F', '0', '1', 'shop:banner:remove', '#', 'admin', '2021-11-15 14:41:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1072, '修改', 1065, 3, '#', 'menuItem', 'F', '0', '1', 'shop:banner:edit', '#', 'admin', '2021-11-15 14:41:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1073, '查询', 1065, 4, '#', 'menuItem', 'F', '0', '1', 'shop:banner:list', '#', 'admin', '2021-11-15 14:41:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1074, '商品管理', 1062, 20, '/shop/goods', 'menuItem', 'C', '0', '1', 'shop:goods:view', '#', 'admin', '2021-11-15 14:42:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1075, '新增', 1074, 1, '#', 'menuItem', 'F', '0', '1', 'shop:goods:add', '#', 'admin', '2021-11-15 14:43:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1076, '删除', 1074, 2, '#', 'menuItem', 'F', '0', '1', 'shop:goods:remove', '#', 'admin', '2021-11-15 14:43:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1077, '修改', 1074, 3, '#', 'menuItem', 'F', '0', '1', 'shop:goods:edit', '#', 'admin', '2021-11-15 14:44:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1078, '查询', 1074, 4, '#', 'menuItem', 'F', '0', '1', 'shop:goods:list', '#', 'admin', '2021-11-15 14:44:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1079, '订单管理', 0, 1, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-sliders', 'admin', '2021-12-03 14:34:07', 'admin', '2021-12-03 14:42:37', '');
INSERT INTO `sys_menu` VALUES (1080, '待收货', 1079, 2, '/shop/order/40', 'menuItem', 'C', '0', '1', 'shop:order:view', '#', 'admin', '2021-12-03 14:41:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1081, '已完成', 1079, 5, '/shop/order/50', 'menuItem', 'C', '0', '1', 'shop:order:view', '#', 'admin', '2021-12-03 14:42:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1082, '发货', 1064, 1, '#', 'menuItem', 'F', '0', '1', 'shop:order:edit', '#', 'admin', '2021-12-03 14:44:15', 'admin', '2021-12-03 14:44:25', '');
INSERT INTO `sys_menu` VALUES (1083, '退款', 1064, 2, '#', 'menuItem', 'F', '0', '1', 'shop:order:refunds', '#', 'admin', '2021-12-03 23:03:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1085, '评论管理', 1079, 5, '/shop/comment', 'menuItem', 'C', '0', '1', 'shop:comment:view', '#', 'admin', '2021-12-11 09:57:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1086, '删除', 1085, 4, '#', 'menuItem', 'F', '0', '1', 'shop:comment:remove', '#', 'admin', '2021-12-11 09:58:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1087, '合伙人申请', 1062, 10, '/shop/apply', 'menuItem', 'C', '0', '1', 'shop:apply:view', '#', 'admin', '2021-12-11 13:26:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1088, '审核', 1087, 1, '#', 'menuItem', 'F', '0', '1', 'shop:apply:edit', '#', 'admin', '2021-12-11 13:26:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1089, '删除', 1087, 2, '#', 'menuItem', 'F', '0', '1', 'shop:apply:remove', '#', 'admin', '2021-12-11 13:27:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1090, '查询', 1087, 3, '#', 'menuItem', 'F', '0', '1', 'shop:apply:list', '#', 'admin', '2021-12-11 13:27:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1091, '提现审核', 1062, 5, '/shop/balance', 'menuItem', 'C', '0', '1', 'shop:balance:view', '#', 'admin', '2021-12-11 16:27:06', 'admin', '2021-12-11 16:29:25', '');
INSERT INTO `sys_menu` VALUES (1092, '审核', 1091, 2, '#', 'menuItem', 'F', '0', '1', 'shop:balance:edit', '#', 'admin', '2021-12-11 16:27:26', 'admin', '2021-12-11 16:29:37', '');
INSERT INTO `sys_menu` VALUES (1093, '查询', 1091, 1, '#', 'menuItem', 'F', '0', '1', 'shop:balance:list', '#', 'admin', '2021-12-11 16:27:38', 'admin', '2021-12-11 16:29:31', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` VALUES (1, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mine_ order,mine_goods,mine_cart,mine_order_detail,mine_address,mine_banner,mine_type\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-11 14:43:54');
INSERT INTO `sys_oper_log` VALUES (2, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"mine_ order,mine_address,mine_banner,mine_cart,mine_goods,mine_order_detail,mine_type\"]}', NULL, 0, NULL, '2021-11-11 14:44:03');
INSERT INTO `sys_oper_log` VALUES (3, '代码生成', 3, 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2,3,4,5,6,7\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-11 14:49:16');
INSERT INTO `sys_oper_log` VALUES (4, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mine_order\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-11 14:49:19');
INSERT INTO `sys_oper_log` VALUES (5, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/mine_order', '127.0.0.1', '内网IP', '\"mine_order\"', NULL, 0, NULL, '2021-11-11 14:49:21');
INSERT INTO `sys_oper_log` VALUES (6, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"商城管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-cart-arrow-down\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-11 15:52:07');
INSERT INTO `sys_oper_log` VALUES (7, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1062\"],\"menuType\":[\"C\"],\"menuName\":[\"类型管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"100\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-11 15:52:35');
INSERT INTO `sys_oper_log` VALUES (8, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1062\"],\"menuType\":[\"C\"],\"menuName\":[\"订单管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"10\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-11 15:53:15');
INSERT INTO `sys_oper_log` VALUES (9, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1062\"],\"menuType\":[\"C\"],\"menuName\":[\"轮播图管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"90\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-11 15:53:30');
INSERT INTO `sys_oper_log` VALUES (10, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1063\"],\"parentId\":[\"1062\"],\"menuType\":[\"C\"],\"menuName\":[\"类型管理\"],\"url\":[\"/shop/type\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:type:view\"],\"orderNum\":[\"100\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-11 15:54:23');
INSERT INTO `sys_oper_log` VALUES (11, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1063\"],\"menuType\":[\"F\"],\"menuName\":[\"新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:type:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-11 15:55:27');
INSERT INTO `sys_oper_log` VALUES (12, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1063\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:type:remove\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-11 15:55:44');
INSERT INTO `sys_oper_log` VALUES (13, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1063\"],\"menuType\":[\"F\"],\"menuName\":[\"修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:type:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-11 15:56:00');
INSERT INTO `sys_oper_log` VALUES (14, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1063\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:type:list\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-11 15:56:12');
INSERT INTO `sys_oper_log` VALUES (15, '类型', 1, 'com.ruoyi.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/shop/type/add', '127.0.0.1', '内网IP', '{\"title\":[\"3\"],\"remark\":[\"3\"]}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'uuid\' doesn\'t have a default value\n### The error may exist in file [/Users/ningtao/IdeaProjects/minemi/target/classes/mybatis/shop/MineTypeMapper.xml]\n### The error may involve com.ruoyi.project.shop.mapper.MineTypeMapper.insertMineType-Inline\n### The error occurred while setting parameters\n### SQL: insert into mine_type          ( title,                                                    create_time,                                       remark )           values ( ?,                                                    ?,                                       ? )\n### Cause: java.sql.SQLException: Field \'uuid\' doesn\'t have a default value\n; Field \'uuid\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'uuid\' doesn\'t have a default value', '2021-11-11 19:03:39');
INSERT INTO `sys_oper_log` VALUES (16, '类型', 1, 'com.ruoyi.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/shop/type/add', '127.0.0.1', '内网IP', '{\"title\":[\"3\"],\"remark\":[\"3\"]}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'uuid\' doesn\'t have a default value\n### The error may exist in file [/Users/ningtao/IdeaProjects/minemi/target/classes/mybatis/shop/MineTypeMapper.xml]\n### The error may involve com.ruoyi.project.shop.mapper.MineTypeMapper.insertMineType-Inline\n### The error occurred while setting parameters\n### SQL: insert into mine_type          ( title,                                                    create_time,                                       remark )           values ( ?,                                                    ?,                                       ? )\n### Cause: java.sql.SQLException: Field \'uuid\' doesn\'t have a default value\n; Field \'uuid\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'uuid\' doesn\'t have a default value', '2021-11-11 19:04:00');
INSERT INTO `sys_oper_log` VALUES (17, '类型', 1, 'com.ruoyi.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/shop/type/add', '127.0.0.1', '内网IP', '{\"title\":[\"3\"],\"remark\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-11 19:05:20');
INSERT INTO `sys_oper_log` VALUES (18, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1065\"],\"parentId\":[\"1062\"],\"menuType\":[\"C\"],\"menuName\":[\"轮播图管理\"],\"url\":[\"/shop/banner\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:banner:view\"],\"orderNum\":[\"90\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 14:39:59');
INSERT INTO `sys_oper_log` VALUES (19, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1065\"],\"menuType\":[\"F\"],\"menuName\":[\"新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:banner:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 14:40:32');
INSERT INTO `sys_oper_log` VALUES (20, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1065\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:banner:remove\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 14:41:13');
INSERT INTO `sys_oper_log` VALUES (21, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1065\"],\"menuType\":[\"F\"],\"menuName\":[\"修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:banner:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 14:41:26');
INSERT INTO `sys_oper_log` VALUES (22, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1065\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:banner:list\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 14:41:49');
INSERT INTO `sys_oper_log` VALUES (23, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"商品管理\"],\"url\":[\"/shop/goods\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:goods:view\"],\"orderNum\":[\"20\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 14:42:44');
INSERT INTO `sys_oper_log` VALUES (24, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1074\"],\"menuType\":[\"F\"],\"menuName\":[\"新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:goods:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 14:43:37');
INSERT INTO `sys_oper_log` VALUES (25, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1074\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:goods:remove\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 14:43:48');
INSERT INTO `sys_oper_log` VALUES (26, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1074\"],\"menuType\":[\"F\"],\"menuName\":[\"修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:goods:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 14:44:00');
INSERT INTO `sys_oper_log` VALUES (27, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1074\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:goods:list\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 14:44:14');
INSERT INTO `sys_oper_log` VALUES (28, '代码生成', 3, 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 14:46:32');
INSERT INTO `sys_oper_log` VALUES (29, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mine_type\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 14:46:35');
INSERT INTO `sys_oper_log` VALUES (30, '代码生成', 3, 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"9\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 14:47:04');
INSERT INTO `sys_oper_log` VALUES (31, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mine_type\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 14:47:07');
INSERT INTO `sys_oper_log` VALUES (32, '轮播图', 1, 'com.ruoyi.project.shop.controller.MineBannerController.addSave()', 'POST', 1, 'admin', '研发部门', '/shop/banner/add', '127.0.0.1', '内网IP', '{\"title\":[\"轮播图\"],\"goodsId\":[\"2\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 15:12:35');
INSERT INTO `sys_oper_log` VALUES (33, '轮播图', 2, 'com.ruoyi.project.shop.controller.MineBannerController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/banner/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"e955541d88044c0e83b8eda6270d1d7c\"],\"title\":[\"轮播图\"],\"goodsId\":[\"2\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 15:15:25');
INSERT INTO `sys_oper_log` VALUES (34, '轮播图', 2, 'com.ruoyi.project.shop.controller.MineBannerController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/banner/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"e955541d88044c0e83b8eda6270d1d7c\"],\"title\":[\"轮播图\"],\"goodsId\":[\"2\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 15:15:26');
INSERT INTO `sys_oper_log` VALUES (35, '轮播图', 2, 'com.ruoyi.project.shop.controller.MineBannerController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/banner/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"e955541d88044c0e83b8eda6270d1d7c\"],\"title\":[\"轮播图\"],\"goodsId\":[\"2\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 15:15:27');
INSERT INTO `sys_oper_log` VALUES (36, '轮播图', 2, 'com.ruoyi.project.shop.controller.MineBannerController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/banner/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"e955541d88044c0e83b8eda6270d1d7c\"],\"title\":[\"轮播图\"],\"goodsId\":[\"2\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 15:15:27');
INSERT INTO `sys_oper_log` VALUES (37, '轮播图', 2, 'com.ruoyi.project.shop.controller.MineBannerController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/banner/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"e955541d88044c0e83b8eda6270d1d7c\"],\"title\":[\"轮播图\"],\"goodsId\":[\"2\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 15:16:08');
INSERT INTO `sys_oper_log` VALUES (38, '轮播图', 3, 'com.ruoyi.project.shop.controller.MineBannerController.remove()', 'POST', 1, 'admin', '研发部门', '/shop/banner/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"e955541d88044c0e83b8eda6270d1d7c\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 15:16:11');
INSERT INTO `sys_oper_log` VALUES (39, '字典类型', 1, 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"商品类型\"],\"dictType\":[\"goods_state\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 15:16:53');
INSERT INTO `sys_oper_log` VALUES (40, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"正常\"],\"dictValue\":[\"10\"],\"dictType\":[\"goods_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 15:17:03');
INSERT INTO `sys_oper_log` VALUES (41, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"下架\"],\"dictValue\":[\"20\"],\"dictType\":[\"goods_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 15:17:11');
INSERT INTO `sys_oper_log` VALUES (42, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"31\"],\"dictLabel\":[\"下架\"],\"dictValue\":[\"20\"],\"dictType\":[\"goods_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 15:17:41');
INSERT INTO `sys_oper_log` VALUES (43, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"30\"],\"dictLabel\":[\"正常\"],\"dictValue\":[\"10\"],\"dictType\":[\"goods_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 15:17:48');
INSERT INTO `sys_oper_log` VALUES (44, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"30\"],\"dictLabel\":[\"正常\"],\"dictValue\":[\"10\"],\"dictType\":[\"goods_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 15:17:52');
INSERT INTO `sys_oper_log` VALUES (45, '类型', 2, 'com.ruoyi.project.shop.controller.MineTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/type/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"6b2783a81b4e43cd9f2b6dbde8afdc2a\"],\"title\":[\"类型一\"],\"status\":[\"0\"],\"remark\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 15:39:49');
INSERT INTO `sys_oper_log` VALUES (46, '类型', 1, 'com.ruoyi.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/shop/type/add', '127.0.0.1', '内网IP', '{\"title\":[\"类型2\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 15:40:14');
INSERT INTO `sys_oper_log` VALUES (47, '商品', 1, 'com.ruoyi.project.shop.controller.MineGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/shop/goods/add', '127.0.0.1', '内网IP', '{\"typeId\":[\"6b2783a81b4e43cd9f2b6dbde8afdc2a\"],\"state\":[\"10\"],\"title\":[\"商品1\"],\"costPrice\":[\"55\"],\"price\":[\"44\"],\"stock\":[\"55\"],\"content\":[\"<p>55555<img src=\\\"http://localhost:9011/profile/upload/2021/11/15/0d427a9d-0620-4db9-a380-a9accb694c67.png\\\" style=\\\"width: 38px;\\\"></p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 15:41:14');
INSERT INTO `sys_oper_log` VALUES (48, '商品', 1, 'com.ruoyi.project.shop.controller.MineGoodsController.addSave()', 'POST', 1, 'admin', '研发部门', '/shop/goods/add', '127.0.0.1', '内网IP', '{\"uuid\":[\"d1039364aaeb40bf811e3d8bd1544fbe\"],\"typeId\":[\"6b2783a81b4e43cd9f2b6dbde8afdc2a\"],\"state\":[\"10\"],\"title\":[\"商品1\"],\"costPrice\":[\"55.00\"],\"price\":[\"44.00\"],\"stock\":[\"55\"],\"content\":[\"<p>55555<img src=\\\"http://localhost:9011/profile/upload/2021/11/15/0d427a9d-0620-4db9-a380-a9accb694c67.png\\\" style=\\\"width: 38px;\\\"></p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 15:59:13');
INSERT INTO `sys_oper_log` VALUES (49, '商品', 2, 'com.ruoyi.project.shop.controller.MineGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/goods/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"198637de55c44bfd83880e9dbb662a34\"],\"typeId\":[\"6b2783a81b4e43cd9f2b6dbde8afdc2a\"],\"state\":[\"10\"],\"title\":[\"商品1\"],\"costPrice\":[\"55.00\"],\"price\":[\"44.00\"],\"stock\":[\"55\"],\"content\":[\"<p>55555<img src=\\\"http://localhost:9011/profile/upload/2021/11/15/0d427a9d-0620-4db9-a380-a9accb694c67.png\\\" style=\\\"width: 38px;\\\">3333333333333</p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 15:59:34');
INSERT INTO `sys_oper_log` VALUES (50, '商品', 2, 'com.ruoyi.project.shop.controller.MineGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/goods/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"d1039364aaeb40bf811e3d8bd1544fbe\"],\"typeId\":[\"6e5180586f614bb7a043468ab6cc4965\"],\"state\":[\"20\"],\"title\":[\"商品1\"],\"costPrice\":[\"55.00\"],\"price\":[\"44.00\"],\"stock\":[\"55\"],\"content\":[\"<p>55555<img src=\\\"http://localhost:9011/profile/upload/2021/11/15/0d427a9d-0620-4db9-a380-a9accb694c67.png\\\" style=\\\"width: 38px;\\\"></p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 15:59:43');
INSERT INTO `sys_oper_log` VALUES (51, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1064\"],\"parentId\":[\"1062\"],\"menuType\":[\"C\"],\"menuName\":[\"订单管理\"],\"url\":[\"/shop/order\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:order:view\"],\"orderNum\":[\"10\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-15 16:01:19');
INSERT INTO `sys_oper_log` VALUES (52, '商品', 2, 'com.handwork.project.shop.controller.MineGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/goods/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"198637de55c44bfd83880e9dbb662a34\"],\"typeId\":[\"6b2783a81b4e43cd9f2b6dbde8afdc2a\"],\"state\":[\"10\"],\"title\":[\"商品1\"],\"costPrice\":[\"55.00\"],\"price\":[\"44.00\"],\"stock\":[\"55\"],\"indexStatus\":[\"0\"],\"content\":[\"<p>55555<img src=\\\"http://localhost:9011/profile/upload/2021/11/15/0d427a9d-0620-4db9-a380-a9accb694c67.png\\\" style=\\\"width: 38px;\\\">3333333333333</p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-28 20:44:35');
INSERT INTO `sys_oper_log` VALUES (53, '商品', 2, 'com.handwork.project.shop.controller.MineGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/goods/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"2\"],\"typeId\":[\"6b2783a81b4e43cd9f2b6dbde8afdc2a\"],\"state\":[\"10\"],\"title\":[\"2\"],\"costPrice\":[\"2\"],\"price\":[\"4\"],\"stock\":[\"3\"],\"indexStatus\":[\"0\"],\"content\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-28 20:45:59');
INSERT INTO `sys_oper_log` VALUES (54, '商品', 2, 'com.handwork.project.shop.controller.MineGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/goods/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"d1039364aaeb40bf811e3d8bd1544fbe\"],\"typeId\":[\"6e5180586f614bb7a043468ab6cc4965\"],\"state\":[\"20\"],\"title\":[\"商品1\"],\"costPrice\":[\"55.00\"],\"price\":[\"44.00\"],\"stock\":[\"55\"],\"indexStatus\":[\"0\"],\"content\":[\"<p>55555<img src=\\\"http://localhost:9011/profile/upload/2021/11/15/0d427a9d-0620-4db9-a380-a9accb694c67.png\\\" style=\\\"width: 38px;\\\"></p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-28 20:46:59');
INSERT INTO `sys_oper_log` VALUES (55, '商品', 2, 'com.handwork.project.shop.controller.MineGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/goods/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"2\"],\"typeId\":[\"6b2783a81b4e43cd9f2b6dbde8afdc2a\"],\"state\":[\"10\"],\"title\":[\"2\"],\"costPrice\":[\"2.00\"],\"price\":[\"4.00\"],\"stock\":[\"3\"],\"indexStatus\":[\"0\"],\"content\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-28 20:47:20');
INSERT INTO `sys_oper_log` VALUES (56, '商品', 2, 'com.handwork.project.shop.controller.MineGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/goods/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"198637de55c44bfd83880e9dbb662a34\"],\"typeId\":[\"6b2783a81b4e43cd9f2b6dbde8afdc2a\"],\"state\":[\"10\"],\"title\":[\"商品1\"],\"costPrice\":[\"55.00\"],\"price\":[\"44.00\"],\"stock\":[\"55\"],\"indexStatus\":[\"0\"],\"content\":[\"<p>55555<img src=\\\"http://localhost:9011/profile/upload/2021/11/15/0d427a9d-0620-4db9-a380-a9accb694c67.png\\\" style=\\\"width: 38px;\\\">3333333333333</p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-28 20:47:29');
INSERT INTO `sys_oper_log` VALUES (57, '轮播图', 2, 'com.handwork.project.shop.controller.MineBannerController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/banner/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"e955541d88044c0e83b8eda6270d1d7c\"],\"title\":[\"轮播图\"],\"goodsId\":[\"198637de55c44bfd83880e9dbb662a34\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-28 20:48:42');
INSERT INTO `sys_oper_log` VALUES (58, '轮播图', 2, 'com.handwork.project.shop.controller.MineBannerController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/banner/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"e955541d88044c0e83b8eda6270d1d7c\"],\"title\":[\"轮播图\"],\"goodsId\":[\"2\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-28 20:51:17');
INSERT INTO `sys_oper_log` VALUES (59, '类型', 1, 'com.handwork.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/shop/type/add', '127.0.0.1', '内网IP', '{\"title\":[\"类型三\"],\"orderNum\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-28 20:51:51');
INSERT INTO `sys_oper_log` VALUES (60, '类型', 1, 'com.handwork.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/shop/type/add', '127.0.0.1', '内网IP', '{\"title\":[\"类型四\"],\"orderNum\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-28 20:52:04');
INSERT INTO `sys_oper_log` VALUES (61, '类型', 1, 'com.handwork.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/shop/type/add', '127.0.0.1', '内网IP', '{\"title\":[\"类型5️五\"],\"orderNum\":[\"5\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-28 20:52:24');
INSERT INTO `sys_oper_log` VALUES (62, '类型', 1, 'com.handwork.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/shop/type/add', '127.0.0.1', '内网IP', '{\"title\":[\"类型6\"],\"orderNum\":[\"6\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-28 20:52:39');
INSERT INTO `sys_oper_log` VALUES (63, '类型', 1, 'com.handwork.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/shop/type/add', '127.0.0.1', '内网IP', '{\"title\":[\"类型七\"],\"orderNum\":[\"7\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-28 20:52:53');
INSERT INTO `sys_oper_log` VALUES (64, '轮播图', 1, 'com.handwork.project.shop.controller.MineBannerController.addSave()', 'POST', 1, 'admin', '研发部门', '/shop/banner/add', '127.0.0.1', '内网IP', '{\"title\":[\"3\"],\"goodsId\":[\"2\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-28 21:02:37');
INSERT INTO `sys_oper_log` VALUES (65, '轮播图', 2, 'com.handwork.project.shop.controller.MineBannerController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/banner/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"e955541d88044c0e83b8eda6270d1d7c\"],\"title\":[\"轮播图\"],\"goodsId\":[\"198637de55c44bfd83880e9dbb662a34\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-28 21:02:43');
INSERT INTO `sys_oper_log` VALUES (66, '商品', 2, 'com.handwork.project.shop.controller.MineGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/goods/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"2\"],\"typeId\":[\"6b2783a81b4e43cd9f2b6dbde8afdc2a\"],\"state\":[\"10\"],\"title\":[\"2\"],\"costPrice\":[\"2.00\"],\"price\":[\"4.00\"],\"stock\":[\"3\"],\"indexStatus\":[\"0\"],\"content\":[\"<p>古者有云：庶人者，水也。水则载舟，水则覆舟。君舟民水的观点最早是孔子所提，荀子加以发展，现在也颇为学者引用。主要强调民心的重要性，得道者多助，失道者寡助也是同理。民可载舟亦能覆舟，民心所向，皆有其理。而我们党从最早提出的加强与群众的血肉联系到如今的为中国人民谋幸福，都是民心所愿，民意所现啊！<br><br>我们党致力于解决人民最需要、最迫切、最紧急的问题，从全方位多层次的角度为人民的幸福生活提供多重保障。在教育、就业、医疗卫生、社会保障等各个领域提出最贴合的方针政策，通过各方监督使得各项政策落到实处，通过各类项目的开展保障人民的需求都能得到解决。统筹城乡民生保障制度、完善城乡医疗养老制度、坚持双减利民教育政策，建立健全社会保障体系。<br><br>我国社会主要矛盾，已经转化为人民日益增长的美好生活需要和不平衡不充分的发展之间的矛盾。在保证人民最基本物质生存条件的同时也要关注人民丰富的精神文化需求，在互联网高速发展的新时代社会，通过公众号、短视频以及各类APP学习平台，可以让人民足不出户了解社会新闻实讯，跨越时空障碍了解学习兴趣所在。然而，互联网的发展也是利弊相存的，网络上的时空自由也带来了种种安全隐患，为了给人民提供一个安静干净的娱乐学习的网络空间，我们党也在不断提高对网络安全的治理和监督，更是不断推出新颖的方式宣传网络安全，预防网络诈骗。<br><br>保护好人民是基本，实现人民的幸福生活是目标，我们党始终关心关注事关人民的需求问题，国家面前无小事，人民亦是如此。</p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-28 21:58:32');
INSERT INTO `sys_oper_log` VALUES (67, '商品', 2, 'com.handwork.project.shop.controller.MineGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/goods/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"2\"],\"typeId\":[\"6b2783a81b4e43cd9f2b6dbde8afdc2a\"],\"state\":[\"10\"],\"title\":[\"2\"],\"costPrice\":[\"2.00\"],\"price\":[\"4.00\"],\"stock\":[\"3\"],\"indexStatus\":[\"0\"],\"content\":[\"<p>古者有云：庶人者，水也。水则载舟，水则覆舟。君舟民水的观点最早是孔子所提，荀子加以发展，现在也颇为学者引用。主要强调民心的重要性，得道者多助，失道者寡助也是同理。民可载舟亦能覆舟，民心所向，皆有其理。而我们党从最早提出的加强与群众的血肉联系到如今的为中国人民谋幸福，都是民心所愿，民意所现啊！<br><img style=\\\"width: 25%;\\\" src=\\\"/profile/upload/2021/11/28/dea8e6af-92a5-4fe1-987c-1720d4ad164f.png\\\"><br>我们党致力于解决人民最需要、最迫切、最紧急的问题，从全方位多层次的角度为人民的幸福生活提供多重保障。在教育、就业、医疗卫生、社会保障等各个领域提出最贴合的方针政策，通过各方监督使得各项政策落到实处，通过各类项目的开展保障人民的需求都能得到解决。统筹城乡民生保障制度、完善城乡医疗养老制度、坚持双减利民教育政策，建立健全社会保障体系。<br><br>我国社会主要矛盾，已经转化为人民日益增长的美好生活需要和不平衡不充分的发展之间的矛盾。在保证人民最基本物质生存条件的同时也要关注人民丰富的精神文化需求，在互联网高速发展的新时代社会，通过公众号、短视频以及各类APP学习平台，可以让人民足不出户了解社会新闻实讯，跨越时空障碍了解学习兴趣所在。然而，互联网的发展也是利弊相存的，网络上的时空自由也带来了种种安全隐患，为了给人民提供一个安静干净的娱乐学习的网络空间，我们党也在不断提高对网络安全的治理和监督，更是不断推出新颖的方式宣传网络安全，预防网络诈骗。<br><br>保护好人民是基本，实现人民的幸福生活是目标，我们党始终关心关注事关人民的需求问题，国家面前无小事，人民亦是如此。</p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-28 21:59:03');
INSERT INTO `sys_oper_log` VALUES (68, '商品', 2, 'com.handwork.project.shop.controller.MineGoodsController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/goods/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"2\"],\"typeId\":[\"6b2783a81b4e43cd9f2b6dbde8afdc2a\"],\"state\":[\"10\"],\"title\":[\"2\"],\"costPrice\":[\"2.00\"],\"price\":[\"4.00\"],\"stock\":[\"3\"],\"indexStatus\":[\"0\"],\"content\":[\"<p>古者有云：庶人者，水也。水则载舟，水则覆舟。君舟民水的观点最早是孔子所提，荀子加以发展，现在也颇为学者引用。主要强调民心的重要性，得道者多助，失道者寡助也是同理。民可载舟亦能覆舟，民心所向，皆有其理。而我们党从最早提出的加强与群众的血肉联系到如今的为中国人民谋幸福，都是民心所愿，民意所现啊！<br><img style=\\\"width: 25%;\\\" src=\\\"/profile/upload/2021/11/28/dea8e6af-92a5-4fe1-987c-1720d4ad164f.png\\\"></p><p><br></p><p><img style=\\\"width: 100%;\\\" src=\\\"/profile/upload/2021/11/28/4ab857c0-0db2-4a2f-a7e2-1de9d88d42d4.jpg\\\"><br>我们党致力于解决人民最需要、最迫切、最紧急的问题，从全方位多层次的角度为人民的幸福生活提供多重保障。在教育、就业、医疗卫生、社会保障等各个领域提出最贴合的方针政策，通过各方监督使得各项政策落到实处，通过各类项目的开展保障人民的需求都能得到解决。统筹城乡民生保障制度、完善城乡医疗养老制度、坚持双减利民教育政策，建立健全社会保障体系。<br><br>我国社会主要矛盾，已经转化为人民日益增长的美好生活需要和不平衡不充分的发展之间的矛盾。在保证人民最基本物质生存条件的同时也要关注人民丰富的精神文化需求，在互联网高速发展的新时代社会，通过公众号、短视频以及各类APP学习平台，可以让人民足不出户了解社会新闻实讯，跨越时空障碍了解学习兴趣所在。然而，互联网的发展也是利弊相存的，网络上的时空自由也带来了种种安全隐患，为了给人民提供一个安静干净的娱乐学习的网络空间，我们党也在不断提高对网络安全的治理和监督，更是不断推出新颖的方式宣传网络安全，预防网络诈骗。<br><br>保护好人民是基本，实现人民的幸福生活是目标，我们党始终关心关注事关人民的需求问题，国家面前无小事，人民亦是如此。</p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-11-28 21:59:22');
INSERT INTO `sys_oper_log` VALUES (69, '订单支付', 1, 'com.handwork.api.v1.pay.AppPayController.createOrder()', 'POST', 1, NULL, NULL, '/app/v1/pay/createOrder', '127.0.0.1', '内网IP', '{\"goodsStr\":[\"b0ea8664bdd44b468ef405e6fca25fe1@@@198637de55c44bfd83880e9dbb662a34@@@1###\"],\"userName\":[\"张三\"],\"postalCode\":[\"510000\"],\"provinceName\":[\"广东省\"],\"cityName\":[\"广州市\"],\"countyName\":[\"海珠区\"],\"detailInfo\":[\"新港中路397号\"],\"nationalCode\":[\"510000\"],\"telNumber\":[\"020-81167888\"]}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'goods_id = \'198637de55c44bfd83880e9dbb662a34\', \n         user_id = 1,\' at line 2\n### The error may exist in file [/Users/ningtao/IdeaProjects/handwork/target/classes/mybatis/shop/MineCartMapper.xml]\n### The error may involve com.handwork.project.shop.mapper.MineCartMapper.deleteMineCartByUuid-Inline\n### The error occurred while setting parameters\n### SQL: delete from mine_cart where 1=1          goods_id = ?,           user_id = ?,\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'goods_id = \'198637de55c44bfd83880e9dbb662a34\', \n         user_id = 1,\' at line 2\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'goods_id = \'198637de55c44bfd83880e9dbb662a34\', \n         user_id = 1,\' at line 2', '2021-12-02 16:37:47');
INSERT INTO `sys_oper_log` VALUES (70, '订单支付', 1, 'com.handwork.api.v1.pay.AppPayController.createOrder()', 'POST', 1, NULL, NULL, '/app/v1/pay/createOrder', '127.0.0.1', '内网IP', '{\"goodsStr\":[\"b0ea8664bdd44b468ef405e6fca25fe1@@@198637de55c44bfd83880e9dbb662a34@@@1###\"],\"userName\":[\"张三\"],\"postalCode\":[\"510000\"],\"provinceName\":[\"广东省\"],\"cityName\":[\"广州市\"],\"countyName\":[\"海珠区\"],\"detailInfo\":[\"新港中路397号\"],\"nationalCode\":[\"510000\"],\"telNumber\":[\"020-81167888\"]}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and goods_id = \'198637de55c44bfd83880e9dbb662a34\' \n         and user_id = 1\' at line 2\n### The error may exist in file [/Users/ningtao/IdeaProjects/handwork/target/classes/mybatis/shop/MineCartMapper.xml]\n### The error may involve com.handwork.project.shop.mapper.MineCartMapper.deleteMineCartByUuid-Inline\n### The error occurred while setting parameters\n### SQL: delete from mine_cart where 1=1 and          and goods_id = ?           and user_id = ?\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and goods_id = \'198637de55c44bfd83880e9dbb662a34\' \n         and user_id = 1\' at line 2\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and goods_id = \'198637de55c44bfd83880e9dbb662a34\' \n         and user_id = 1\' at line 2', '2021-12-02 16:39:30');
INSERT INTO `sys_oper_log` VALUES (71, '订单支付', 1, 'com.handwork.api.v1.pay.AppPayController.createOrder()', 'POST', 1, NULL, NULL, '/app/v1/pay/createOrder', '127.0.0.1', '内网IP', '{\"goodsStr\":[\"b0ea8664bdd44b468ef405e6fca25fe1@@@198637de55c44bfd83880e9dbb662a34@@@1###\"],\"userName\":[\"张三\"],\"postalCode\":[\"510000\"],\"provinceName\":[\"广东省\"],\"cityName\":[\"广州市\"],\"countyName\":[\"海珠区\"],\"detailInfo\":[\"新港中路397号\"],\"nationalCode\":[\"510000\"],\"telNumber\":[\"020-81167888\"]}', NULL, 1, 'Attempted read from closed stream.', '2021-12-02 16:41:15');
INSERT INTO `sys_oper_log` VALUES (72, '订单支付', 1, 'com.handwork.api.v1.pay.AppPayController.createOrder()', 'POST', 1, NULL, NULL, '/app/v1/pay/createOrder', '127.0.0.1', '内网IP', '{\"goodsStr\":[\"b0ea8664bdd44b468ef405e6fca25fe1@@@198637de55c44bfd83880e9dbb662a34@@@1###\"],\"userName\":[\"张三\"],\"postalCode\":[\"510000\"],\"provinceName\":[\"广东省\"],\"cityName\":[\"广州市\"],\"countyName\":[\"海珠区\"],\"detailInfo\":[\"新港中路397号\"],\"nationalCode\":[\"510000\"],\"telNumber\":[\"020-81167888\"]}', NULL, 1, 'Attempted read from closed stream.', '2021-12-02 16:59:51');
INSERT INTO `sys_oper_log` VALUES (73, '订单支付', 1, 'com.handwork.api.v1.pay.AppPayController.createOrder()', 'POST', 1, NULL, NULL, '/app/v1/pay/createOrder', '127.0.0.1', '内网IP', '{\"goodsStr\":[\"b0ea8664bdd44b468ef405e6fca25fe1@@@198637de55c44bfd83880e9dbb662a34@@@1###\"],\"userName\":[\"张三\"],\"postalCode\":[\"510000\"],\"provinceName\":[\"广东省\"],\"cityName\":[\"广州市\"],\"countyName\":[\"海珠区\"],\"detailInfo\":[\"新港中路397号\"],\"nationalCode\":[\"510000\"],\"telNumber\":[\"020-81167888\"]}', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"timeStamp\":\"1638435955613\",\"msg\":\"下单成功\",\"package\":\"prepay_id=wx02170556199087cc9f938bc8e98f820000\",\"code\":\"200\",\"paySign\":\"i0uBKPlwguMTFCYc1vCGYM/qBJURzcf8DUi2wZxPuF8J7Pl+wD0WoPw7EBPKIaf1826H/gGROC1tVWkYuXFRTTlDpGYAqqporS5LWEAzuBFNDY/ovdcSAvftVXuBu42DINmkEow+ySW7fB4wxQfUtckWn2+5rSYc/NRGXPnB/PmKaOQGUw/x5F+kmdGFP7SxUYMU6DHn4gyMaqY+kmX32/DA35yELkwNl+JxG8FX7lFMeJLLRJQ4XOL1wnE/Uk9RIhTGLwImCaz7abvng1F6Hr2HslsPsJDb1EyicNc0sYbsey354xqcdeUkxKsmoWDbydIyHptHene4WUSkh4oh+A==\",\"appId\":\"wx5e2cf3dafb843ebb\",\"signType\":\"RSA\",\"orderCode\":\"12021120217055561377779732639464\",\"nonceStr\":\"0f9484e9282b49398ba1e36c1a91e9e1\"}}', 0, NULL, '2021-12-02 17:05:56');
INSERT INTO `sys_oper_log` VALUES (74, '订单支付', 1, 'com.handwork.api.v1.pay.AppPayController.createOrder()', 'POST', 1, NULL, NULL, '/app/v1/pay/createOrder', '127.0.0.1', '内网IP', '{\"goodsStr\":[\"16edbc8c98ff4b4283e37e26613a3300@@@2@@@1###\"],\"userName\":[\"张三\"],\"postalCode\":[\"510000\"],\"provinceName\":[\"广东省\"],\"cityName\":[\"广州市\"],\"countyName\":[\"海珠区\"],\"detailInfo\":[\"新港中路397号\"],\"nationalCode\":[\"510000\"],\"telNumber\":[\"020-81167888\"]}', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"timeStamp\":\"1638436498318\",\"msg\":\"下单成功\",\"package\":\"prepay_id=wx021714588524519dda5aec07a2acc80000\",\"code\":\"200\",\"paySign\":\"iPSAGeGDTFMxF4vsR0Jvt4jJygMPtpUFARtCFqv19+QOHGTfv+NRIoCT8wnOzddYPShdOIR3PCIk6W8XzNyYF4uaQGNIS9MNZGXmy69QLkboG7XVkVkz1mB6OgbjPSRuDoeHCQS6rse7Ugkb3m0pTejCySiZfoNn42yzTX9rPjmd74/xriI8FLoQYR6yy6Ptzo6Y02ZrYBhph8VVMdw1be+7fWpYtT+zqm6MWZem7s5aDde8XTA66yl90S3xrSlGhwLoWm4a2di/4woNJT9Gu4y7RidSwMU8yA10p9kBxAe21vqRnCNWfDn40regTKi8wT6NdHz0QLZTGeyBDhMK3w==\",\"appId\":\"wx5e2cf3dafb843ebb\",\"signType\":\"RSA\",\"orderCode\":\"12021120217145831877779486121509\",\"nonceStr\":\"a5141ed5687a47e2ba5565f0ae3c15ed\"}}', 0, NULL, '2021-12-02 17:14:58');
INSERT INTO `sys_oper_log` VALUES (75, '字典类型', 1, 'com.handwork.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"支付状态\"],\"dictType\":[\"shop_pay_status\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 10:15:01');
INSERT INTO `sys_oper_log` VALUES (76, '字典数据', 1, 'com.handwork.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"待支付\"],\"dictValue\":[\"10\"],\"dictType\":[\"shop_pay_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 10:19:58');
INSERT INTO `sys_oper_log` VALUES (77, '字典数据', 1, 'com.handwork.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"支付失败\"],\"dictValue\":[\"20\"],\"dictType\":[\"shop_pay_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 10:20:12');
INSERT INTO `sys_oper_log` VALUES (78, '字典数据', 1, 'com.handwork.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"支付成功\"],\"dictValue\":[\"30\"],\"dictType\":[\"shop_pay_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 10:20:29');
INSERT INTO `sys_oper_log` VALUES (79, '字典数据', 1, 'com.handwork.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"待发货\"],\"dictValue\":[\"40\"],\"dictType\":[\"shop_pay_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 10:20:40');
INSERT INTO `sys_oper_log` VALUES (80, '字典数据', 1, 'com.handwork.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"待收货\"],\"dictValue\":[\"50\"],\"dictType\":[\"shop_pay_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 10:20:50');
INSERT INTO `sys_oper_log` VALUES (81, '字典数据', 1, 'com.handwork.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已完成\"],\"dictValue\":[\"60\"],\"dictType\":[\"shop_pay_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"6\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 10:21:08');
INSERT INTO `sys_oper_log` VALUES (82, '字典数据', 1, 'com.handwork.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已关闭\"],\"dictValue\":[\"70\"],\"dictType\":[\"shop_pay_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"7\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 10:21:23');
INSERT INTO `sys_oper_log` VALUES (83, '字典数据', 1, 'com.handwork.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"取消\"],\"dictValue\":[\"80\"],\"dictType\":[\"shop_pay_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"8\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 10:21:31');
INSERT INTO `sys_oper_log` VALUES (84, '菜单管理', 1, 'com.handwork.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"订单管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 14:34:08');
INSERT INTO `sys_oper_log` VALUES (85, '菜单管理', 2, 'com.handwork.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"99\"],\"icon\":[\"fa fa-gear\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 14:34:18');
INSERT INTO `sys_oper_log` VALUES (86, '菜单管理', 2, 'com.handwork.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 14:34:26');
INSERT INTO `sys_oper_log` VALUES (87, '菜单管理', 2, 'com.handwork.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"100\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 14:34:45');
INSERT INTO `sys_oper_log` VALUES (88, '菜单管理', 2, 'com.handwork.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"105\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 14:34:54');
INSERT INTO `sys_oper_log` VALUES (89, '菜单管理', 2, 'com.handwork.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1064\"],\"parentId\":[\"1079\"],\"menuType\":[\"C\"],\"menuName\":[\"待发货\"],\"url\":[\"/shop/order/30\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:order:view\"],\"orderNum\":[\"10\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 14:40:36');
INSERT INTO `sys_oper_log` VALUES (90, '菜单管理', 1, 'com.handwork.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1079\"],\"menuType\":[\"C\"],\"menuName\":[\"待收货\"],\"url\":[\"/shop/order/40\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:order:view\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 14:41:05');
INSERT INTO `sys_oper_log` VALUES (91, '菜单管理', 2, 'com.handwork.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1064\"],\"parentId\":[\"1079\"],\"menuType\":[\"C\"],\"menuName\":[\"待发货\"],\"url\":[\"/shop/order/30\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:order:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 14:41:14');
INSERT INTO `sys_oper_log` VALUES (92, '菜单管理', 1, 'com.handwork.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1079\"],\"menuType\":[\"C\"],\"menuName\":[\"已完成\"],\"url\":[\"/shop/order/50\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:order:view\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 14:42:01');
INSERT INTO `sys_oper_log` VALUES (93, '菜单管理', 2, 'com.handwork.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1079\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"订单管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-sliders\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 14:42:37');
INSERT INTO `sys_oper_log` VALUES (94, '菜单管理', 1, 'com.handwork.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1064\"],\"menuType\":[\"F\"],\"menuName\":[\"编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:order:edit\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 14:44:15');
INSERT INTO `sys_oper_log` VALUES (95, '菜单管理', 2, 'com.handwork.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1082\"],\"parentId\":[\"1064\"],\"menuType\":[\"F\"],\"menuName\":[\"发货\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:order:edit\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 14:44:25');
INSERT INTO `sys_oper_log` VALUES (96, '订单信息', 2, 'com.handwork.project.shop.controller.MineOrderController.editSave()', 'POST', 1, 'admin', '研发部门', '/shop/order/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"90947dd9872d4a829d213cebf2d88628\"],\"payStatus\":[\"40\"],\"expressCode\":[\"33333333333\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 15:04:31');
INSERT INTO `sys_oper_log` VALUES (97, '菜单管理', 1, 'com.handwork.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1064\"],\"menuType\":[\"F\"],\"menuName\":[\"退款\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:order:refunds\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 23:03:38');
INSERT INTO `sys_oper_log` VALUES (98, '菜单管理', 1, 'com.handwork.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1079\"],\"menuType\":[\"C\"],\"menuName\":[\"退款订单\"],\"url\":[\"/shop/order/70\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:order:view\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 23:27:16');
INSERT INTO `sys_oper_log` VALUES (99, '订单支付', 1, 'com.handwork.api.v1.pay.AppPayController.createOrder()', 'POST', 1, NULL, NULL, '/app/v1/pay/createOrder', '192.168.0.101', '内网IP', '{\"goodsStr\":[\"@@@2@@@undefined###\"],\"userName\":[\"仓鼠\"],\"postalCode\":[\"230031\"],\"provinceName\":[\"安徽省\"],\"cityName\":[\"合肥市\"],\"countyName\":[\"蜀山区\"],\"detailInfo\":[\"天鹅湖西路天鹅湖\"],\"nationalCode\":[\"340104\"],\"telNumber\":[\"15956956789\"]}', NULL, 1, '', '2021-12-03 23:32:08');
INSERT INTO `sys_oper_log` VALUES (100, '订单支付', 1, 'com.handwork.api.v1.pay.AppPayController.createOrder()', 'POST', 1, NULL, NULL, '/app/v1/pay/createOrder', '192.168.0.100', '内网IP', '{\"goodsStr\":[\"@@@2@@@1###\"],\"userName\":[\"张三\"],\"postalCode\":[\"510000\"],\"provinceName\":[\"广东省\"],\"cityName\":[\"广州市\"],\"countyName\":[\"海珠区\"],\"detailInfo\":[\"新港中路397号\"],\"nationalCode\":[\"510000\"],\"telNumber\":[\"020-81167888\"]}', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"timeStamp\":\"1638546379606\",\"msg\":\"下单成功\",\"package\":\"prepay_id=wx032346207691318e3bbaf003fb150f0000\",\"code\":\"200\",\"paySign\":\"NmcOCIOwIwGo6DFzSCe+9GrDkM4x5VoC7FMj2gtPd2CSyCvTtrlG/rvND+ugT3e/iachYKI5jjkVcyxoDbsdGP71G9PyhCF90iTHzEIPJrSBty0Uykn+y+suxSJgxH3M0EVGuFWp+I7C0blUqAHWNQQw2uXDHoWj5l1TZyXYmIU6c8GonU5iqPQdX1KE1S3MG5qafgK8Mha5Six9eQaQQusxHHrHdZPX7gh5fAE/s4PV1B7rxjJpBAQnNrS2h532e4BIxlSNROZSRo726lTn87NxfWrRsCVUnVzNn878Jpll/dV7TntYOhgMrUgIYLRuFmBgzZhUc2khgTu180hgXg==\",\"appId\":\"wx5e2cf3dafb843ebb\",\"signType\":\"RSA\",\"orderCode\":\"12021120323461960677779225270248\",\"nonceStr\":\"1113347835614309ba32b34d5f721eaf\"}}', 0, NULL, '2021-12-03 23:46:20');
INSERT INTO `sys_oper_log` VALUES (101, '订单退款', 2, 'com.handwork.project.shop.controller.MineOrderController.refunds()', 'POST', 1, 'admin', 'XXX科技', '/shop/order/refunds/20506dea9942468aa0d569bcc51f2017', '127.0.0.1', '内网IP', '{\"price\":[\"0.01\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-12-03 23:47:16');
INSERT INTO `sys_oper_log` VALUES (102, '订单退款', 2, 'com.handwork.project.shop.controller.MineOrderController.refunds()', 'POST', 1, 'admin', 'XXX科技', '/shop/order/refunds/20506dea9942468aa0d569bcc51f2017', '127.0.0.1', '内网IP', '{\"price\":[\"0.01\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-12-03 23:47:47');
INSERT INTO `sys_oper_log` VALUES (103, '订单退款', 2, 'com.handwork.project.shop.controller.MineOrderController.refunds()', 'POST', 1, 'admin', 'XXX科技', '/shop/order/refunds/20506dea9942468aa0d569bcc51f2017', '127.0.0.1', '内网IP', '{\"price\":[\"0.01\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-12-03 23:47:57');
INSERT INTO `sys_oper_log` VALUES (104, '订单退款', 2, 'com.handwork.project.shop.controller.MineOrderController.refunds()', 'POST', 1, 'admin', 'XXX科技', '/shop/order/refunds/20506dea9942468aa0d569bcc51f2017', '127.0.0.1', '内网IP', '{\"price\":[\"0.01\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-12-03 23:49:13');
INSERT INTO `sys_oper_log` VALUES (105, '订单退款', 2, 'com.handwork.project.shop.controller.MineOrderController.refunds()', 'POST', 1, 'admin', 'XXX科技', '/shop/order/refunds/20506dea9942468aa0d569bcc51f2017', '127.0.0.1', '内网IP', '{\"price\":[\"0.01\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-12-03 23:50:40');
INSERT INTO `sys_oper_log` VALUES (106, '订单退款', 2, 'com.handwork.project.shop.controller.MineOrderController.refunds()', 'POST', 1, 'admin', 'XXX科技', '/shop/order/refunds/20506dea9942468aa0d569bcc51f2017', '127.0.0.1', '内网IP', '{\"price\":[\"0.01\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-12-03 23:50:58');
INSERT INTO `sys_oper_log` VALUES (107, '订单退款', 2, 'com.handwork.project.shop.controller.MineOrderController.refunds()', 'POST', 1, 'admin', 'XXX科技', '/shop/order/refunds/20506dea9942468aa0d569bcc51f2017', '127.0.0.1', '内网IP', '{\"price\":[\"0.01\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-12-03 23:51:31');
INSERT INTO `sys_oper_log` VALUES (108, '订单退款', 2, 'com.handwork.project.shop.controller.MineOrderController.refunds()', 'POST', 1, 'admin', 'XXX科技', '/shop/order/refunds/20506dea9942468aa0d569bcc51f2017', '127.0.0.1', '内网IP', '{\"price\":[\"0.01\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-12-03 23:52:36');
INSERT INTO `sys_oper_log` VALUES (109, '订单退款', 2, 'com.handwork.project.shop.controller.MineOrderController.refunds()', 'POST', 1, 'admin', 'XXX科技', '/shop/order/refunds/20506dea9942468aa0d569bcc51f2017', '127.0.0.1', '内网IP', '{\"price\":[\"0.01\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-12-03 23:53:27');
INSERT INTO `sys_oper_log` VALUES (110, '订单退款', 2, 'com.handwork.project.shop.controller.MineOrderController.refunds()', 'POST', 1, 'admin', 'XXX科技', '/shop/order/refunds/20506dea9942468aa0d569bcc51f2017', '127.0.0.1', '内网IP', '{\"price\":[\"0.01\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-03 23:56:01');
INSERT INTO `sys_oper_log` VALUES (111, '订单支付', 1, 'com.handwork.api.v1.pay.AppPayController.createOrder()', 'POST', 1, NULL, NULL, '/app/v1/pay/createOrder', '192.168.0.101', '内网IP', '{\"goodsStr\":[\"@@@2@@@1###\"],\"userName\":[\"仓鼠\"],\"postalCode\":[\"230031\"],\"provinceName\":[\"安徽省\"],\"cityName\":[\"合肥市\"],\"countyName\":[\"蜀山区\"],\"detailInfo\":[\"天鹅湖西路天鹅湖\"],\"nationalCode\":[\"340104\"],\"telNumber\":[\"15956956789\"]}', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"timeStamp\":\"1638547313206\",\"msg\":\"下单成功\",\"package\":\"prepay_id=wx040001538109858b5b83f0b95269fc0000\",\"code\":\"200\",\"paySign\":\"Sn+toFtpbmmy4Jp4DmGXDCqvVmXuKHJDMN6Sxs0rhcBsXEXJndpOPR97gpz5t5iGjZqWpyOPFns+uk08kuSF2nG/ZriojKQEBnDOi5kLKhMJfVu/qOV+DafexAiEyLY/QNy5fVFPTfm8YEgs0/vg1vhRMItj/q+bc/7GbSSZtmnzxzea/ikOe6pEe9HEt829YVsOPAQtRyszT7sPo5CDAZ/xfcKdpFTwrLbqlKOcf+b0m5AD4KwjbNzoAhEOSnfKxCKkyH/Pyg3Nw0j2RHzhvw9yfUTK/wUMuScUaQXbPxfWkACMLUAQJMzHcqtTj+J8Yzu4E+y1jhCZXxt9YJfiqg==\",\"appId\":\"wx5e2cf3dafb843ebb\",\"signType\":\"RSA\",\"orderCode\":\"12021120400015320677779786457763\",\"nonceStr\":\"055777ee689d40bda4a75ed0e7ae65d6\"}}', 0, NULL, '2021-12-04 00:01:53');
INSERT INTO `sys_oper_log` VALUES (112, '订单退款', 2, 'com.handwork.project.shop.controller.MineOrderController.refunds()', 'POST', 1, 'admin', 'XXX科技', '/shop/order/refunds/003bc453a24c420fa6e273573e7f6d64', '127.0.0.1', '内网IP', '{\"price\":[\"0.01\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-04 00:02:30');
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 3, 'com.shoping.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', 'XXX科技', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-04 14:03:50');
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 6, 'com.shoping.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', 'XXX科技', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mine_collect,mine_comment,mine_type\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-04 14:04:22');
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 8, 'com.shoping.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', 'XXX科技', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"mine_collect,mine_comment,mine_type\"]}', NULL, 0, NULL, '2021-12-04 14:04:32');
INSERT INTO `sys_oper_log` VALUES (116, '分类', 1, 'com.shoping.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/type/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"typeName\":[\"电脑\"],\"orderNum\":[\"1\"],\"indexStatus\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 21:03:54');
INSERT INTO `sys_oper_log` VALUES (117, '分类', 1, 'com.shoping.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/type/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"typeName\":[\"电脑\"],\"orderNum\":[\"1\"],\"indexStatus\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 21:05:49');
INSERT INTO `sys_oper_log` VALUES (118, '分类', 1, 'com.shoping.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/type/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"typeName\":[\"大家电\"],\"orderNum\":[\"2\"],\"indexStatus\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 21:11:33');
INSERT INTO `sys_oper_log` VALUES (119, '分类', 1, 'com.shoping.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/type/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"typeName\":[\"小家电\"],\"orderNum\":[\"3\"],\"indexStatus\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 21:11:46');
INSERT INTO `sys_oper_log` VALUES (120, '分类', 1, 'com.shoping.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/type/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"typeName\":[\"数码\"],\"orderNum\":[\"4\"],\"indexStatus\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 21:12:07');
INSERT INTO `sys_oper_log` VALUES (121, '分类', 1, 'com.shoping.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/type/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"14\"],\"typeName\":[\"组装电脑\"],\"orderNum\":[\"1\"],\"indexStatus\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 21:12:31');
INSERT INTO `sys_oper_log` VALUES (122, '分类', 1, 'com.shoping.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/type/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"14\"],\"typeName\":[\"教育电视\"],\"orderNum\":[\"2\"],\"indexStatus\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 21:12:53');
INSERT INTO `sys_oper_log` VALUES (123, '分类', 1, 'com.shoping.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/type/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"15\"],\"typeName\":[\"4K电视\"],\"orderNum\":[\"1\"],\"indexStatus\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 21:13:27');
INSERT INTO `sys_oper_log` VALUES (124, '商品', 1, 'com.shoping.project.shop.controller.MineGoodsController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/goods/add', '127.0.0.1', '内网IP', '{\"typeId\":[\"19\"],\"typeName\":[\"教育电视\"],\"state\":[\"10\"],\"title\":[\"华为电视\"],\"costPrice\":[\"5555\"],\"price\":[\"222\"],\"stock\":[\"4\"],\"indexStatus\":[\"0\"],\"content\":[\"<p><img style=\\\"width: 100%;\\\" src=\\\"/profile/upload/2021/12/07/c74bead3-dd99-4800-8b0f-76bebb5746e1.png\\\"></p><div id=\\\"state\\\">\\r\\n                            <strong>权利声明：</strong><br>京东上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是京东重要的经营资源，未经许可，禁止非法转载使用。\\r\\n                            <p><b>注：</b>本站商品信息均来自于合作方，其真实性、准确性和合法性由信息拥有者（合作方）负责。本站不提供任何保证，并不承担任何法律责任。</p>\\r\\n                                                        <br>\\r\\n                            <strong>价格说明：</strong><br>\\r\\n                            <p><b>京东价：</b>京东价为商品的销售价，是您最终决定是否购买商品的依据。</p>\\r\\n                            <p><b>划线价：</b>商品展示的划横线价格为参考价，并非原价，该价格可能是品牌专柜标价、商品吊牌价或由品牌供应商提供的正品零售价（如厂商指导价、建议零售价等）或其他真实有依据的价格；由于地区、时间的差异性和市场行情波动，品牌专柜标价、商品吊牌价等可能会与您购物时展示的不一致，该价格仅供您参考。</p>\\r\\n                            <p><b>折扣：</b>如无特殊说明，折扣指销售商在原价、或划线价（如品牌专柜标价、商品吊牌价、厂商指导价、厂商建议零售价）等某一价格基础上计算出的优惠比例或优惠金额；如有疑问，您可在购买前联系销售商进行咨询。</p>\\r\\n                            <p><b>异常问题：</b>商品促销信息以商品详情页“促销”栏中的信息为准；商品的具体售价以订单结算页价格为准；如您发现活动商品售价或促销信息有异常，建议购买前先联系销售商咨询。</p>\\r\\n\\r\\n                                                        <br>\\r\\n                            <strong>能效标识说明：</strong><br>\\r\\n                            <p>根据国家相关能效标识法规和标准的要求，京东自营在售商品的能效标识图样，将会逐步替换为新版能源效率标识贴；受能效标识标准变化影响，部分产品的新版和旧版能效标识，在能效等级、测试值等方面会有差异，但产品实际性能完全一样，并不影响购买和使用，加贴新版或旧版能效标识的商品会随机发放，请您放心购买；如有疑问，请在购买前通过咚咚或来电咨询。</p>\\r\\n                                                    </div>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 21:45:10');
INSERT INTO `sys_oper_log` VALUES (125, '商品', 2, 'com.shoping.project.shop.controller.MineGoodsController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/goods/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"1\"],\"typeId\":[\"18\"],\"type.typeName\":[\"组装电脑\"],\"state\":[\"10\"],\"title\":[\"华为电视\"],\"costPrice\":[\"5555.00\"],\"price\":[\"222.00\"],\"stock\":[\"4\"],\"indexStatus\":[\"0\"],\"content\":[\"<p><img style=\\\"width: 100%;\\\" src=\\\"/profile/upload/2021/12/07/c74bead3-dd99-4800-8b0f-76bebb5746e1.png\\\"></p><div id=\\\"state\\\">\\r\\n                            <strong>权利声明：</strong><br>京东上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是京东重要的经营资源，未经许可，禁止非法转载使用。\\r\\n                            <p><b>注：</b>本站商品信息均来自于合作方，其真实性、准确性和合法性由信息拥有者（合作方）负责。本站不提供任何保证，并不承担任何法律责任。</p>\\r\\n                                                        <br>\\r\\n                            <strong>价格说明：</strong><br>\\r\\n                            <p><b>京东价：</b>京东价为商品的销售价，是您最终决定是否购买商品的依据。</p>\\r\\n                            <p><b>划线价：</b>商品展示的划横线价格为参考价，并非原价，该价格可能是品牌专柜标价、商品吊牌价或由品牌供应商提供的正品零售价（如厂商指导价、建议零售价等）或其他真实有依据的价格；由于地区、时间的差异性和市场行情波动，品牌专柜标价、商品吊牌价等可能会与您购物时展示的不一致，该价格仅供您参考。</p>\\r\\n                            <p><b>折扣：</b>如无特殊说明，折扣指销售商在原价、或划线价（如品牌专柜标价、商品吊牌价、厂商指导价、厂商建议零售价）等某一价格基础上计算出的优惠比例或优惠金额；如有疑问，您可在购买前联系销售商进行咨询。</p>\\r\\n                            <p><b>异常问题：</b>商品促销信息以商品详情页“促销”栏中的信息为准；商品的具体售价以订单结算页价格为准；如您发现活动商品售价或促销信息有异常，建议购买前先联系销售商咨询。</p>\\r\\n\\r\\n                                                        <br>\\r\\n                            <strong>能效标识说明：</strong><br>\\r\\n                            <p>根据国家相关能效标识法规和标准的要求，京东自营在售商品的能效标识图样，将会逐步替换为新版能源效率标识贴；受能效标识标准变化影响，部分产品的新版和旧版能效标识，在能效等级、测试值等方面会有差异，但产品实际性能完全一样，并不影响购买和使用，加贴新版或旧版能效标识的商品会随机发放，请您放心购买；如有疑问，请在购买前通过咚咚或来电咨询。</p>\\r\\n                                                    </div>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 21:45:52');
INSERT INTO `sys_oper_log` VALUES (126, '轮播图', 1, 'com.shoping.project.shop.controller.MineBannerController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/banner/add', '127.0.0.1', '内网IP', '{\"title\":[\"22\"],\"goodsId\":[\"1\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 21:46:00');
INSERT INTO `sys_oper_log` VALUES (127, '轮播图', 1, 'com.shoping.project.shop.controller.MineBannerController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/banner/add', '127.0.0.1', '内网IP', '{\"title\":[\"33\"],\"goodsId\":[\"1\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 21:46:11');
INSERT INTO `sys_oper_log` VALUES (128, '分类', 1, 'com.shoping.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/type/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"15\"],\"typeName\":[\"平板电视\"],\"orderNum\":[\"3\"],\"indexStatus\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 22:03:36');
INSERT INTO `sys_oper_log` VALUES (129, '分类', 1, 'com.shoping.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/type/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"16\"],\"typeName\":[\"电饭煲\"],\"orderNum\":[\"1\"],\"indexStatus\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 22:04:04');
INSERT INTO `sys_oper_log` VALUES (130, '分类', 1, 'com.shoping.project.shop.controller.MineTypeController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/type/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"16\"],\"typeName\":[\"空气炸锅\"],\"orderNum\":[\"3\"],\"indexStatus\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 22:04:44');
INSERT INTO `sys_oper_log` VALUES (131, '商品', 1, 'com.shoping.project.shop.controller.MineGoodsController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/goods/add', '127.0.0.1', '内网IP', '{\"typeId\":[\"20\"],\"typeName\":[\"4K电视\"],\"state\":[\"10\"],\"title\":[\"海信 Vidda EA43S 2022款 43英寸 金属全面屏电视 超薄电视 智慧屏 1G+8G 游戏液晶电视以旧换新 43V1G-J \"],\"costPrice\":[\"3333\"],\"price\":[\"22222\"],\"stock\":[\"444\"],\"indexStatus\":[\"0\"],\"content\":[\"<div data-tab=\\\"item\\\" class=\\\"hide\\\" style=\\\"display: block;\\\">\\r\\n                                                <div class=\\\"Ptable\\\">\\r\\n            <div class=\\\"Ptable-item\\\">\\r\\n        <h3>核心参数</h3>\\r\\n        <dl><dl class=\\\"clearfix\\\" style=\\\"margin:0\\\"><dt>CPU核心数</dt><dd>四核</dd></dl><dl class=\\\"clearfix\\\" style=\\\"margin:0\\\"><dt>存储内存</dt><dd>8GB</dd></dl><dl class=\\\"clearfix\\\" style=\\\"margin:0\\\"><dt>CPU架构</dt><dd>四核A53</dd></dl><dl class=\\\"clearfix\\\" style=\\\"margin:0\\\"><dt>系统</dt><dd>Android</dd></dl><dl class=\\\"clearfix\\\" style=\\\"margin:0\\\"><dt>WIFI频段</dt><dd>2.4G</dd></dl><dl class=\\\"clearfix\\\" style=\\\"margin:0\\\"><dt>运行内存/RAM</dt><dd>1GB</dd></dl><dl class=\\\"clearfix\\\" style=\\\"margin:0\\\"><dt>背光方式</dt><dd>直下式/DLED</dd></dl><dl class=\\\"clearfix\\\" style=\\\"margin:0\\\"><dt>GPU</dt><dd class=\\\"Ptable-tips\\\">\\r\\n                    \\r\\n                    \\r\\n                  <br></dd><dd>2核G31</dd></dl><dl class=\\\"clearfix\\\" style=\\\"margin:0\\\"><dt>语音控制</dt><dd>人工智能语音</dd></dl><dl class=\\\"clearfix\\\" style=\\\"margin:0\\\"><dt>智能语音助手</dt><dd>海信小聚</dd></dl></dl>\\r\\n      </div>\\r\\n                <div class=\\\"Ptable-item\\\">\\r\\n        <h3>外观设计</h3>\\r\\n        <dl><dl class=\\\"clearfix\\\" style=\\\"margin:0\\\"><dt>安装孔距</dt><dd>100*100mm</dd></dl><dl class=\\\"clearfix\\\" style=\\\"margin:0\\\"><dt>边框材质</dt><dd>金属</dd></dl><dl class=\\\"clearfix\\\" style=\\\"margin:0\\\"><dt>底座材质</dt><dd>塑料</dd></dl><dl class=\\\"clearfix\\\" style=\\\"margin:0\\\"><dt>屏占比</dt><dd>97%&gt;N≥95%</dd></dl><dl class=\\\"clearfix\\\" style=\\\"margin:0\\\"><dt>机身最薄处</dt><dd>7.7mm</dd></dl><dl class=\\\"clearfix\\\" style=\\\"margin:0\\\"><dt>单屏重量</dt><dd>6.2kg</dd></dl></dl>\\r\\n      </div>\\r\\n                <div class=\\\"Ptable-item\\\">\\r\\n        <h3>端口参数</h3>\\r\\n        <dl><dl class=\\\"clearfix\\\" style=\\\"margin:0\\\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 22:08:49');
INSERT INTO `sys_oper_log` VALUES (132, '商品', 1, 'com.shoping.project.shop.controller.MineGoodsController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/goods/add', '127.0.0.1', '内网IP', '{\"typeId\":[\"19\"],\"typeName\":[\"教育电视\"],\"state\":[\"10\"],\"title\":[\"三星（SAMSUNG）京品家电 65英寸 Q60T QLED全面屏 超薄超高清娱乐游戏智能电视机 液晶电视QA65Q60TAJXXZ \"],\"costPrice\":[\"44444\"],\"price\":[\"444\"],\"stock\":[\"444\"],\"indexStatus\":[\"0\"],\"content\":[\"<p><img style=\\\"width: 100%;\\\" src=\\\"/profile/upload/2021/12/07/aebc262d-ebd0-4e94-b642-09d94cc84eb7.png\\\"></p><p><br></p><p><br></p><div id=\\\"state\\\">\\r\\n                            <strong>权利声明：</strong><br>京东上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是京东重要的经营资源，未经许可，禁止非法转载使用。\\r\\n                            <p><b>注：</b>本站商品信息均来自于合作方，其真实性、准确性和合法性由信息拥有者（合作方）负责。本站不提供任何保证，并不承担任何法律责任。</p>\\r\\n                                                        <br>\\r\\n                            <strong>价格说明：</strong><br>\\r\\n                            <p><b>京东价：</b>京东价为商品的销售价，是您最终决定是否购买商品的依据。</p>\\r\\n                            <p><b>划线价：</b>商品展示的划横线价格为参考价，并非原价，该价格可能是品牌专柜标价、商品吊牌价或由品牌供应商提供的正品零售价（如厂商指导价、建议零售价等）或其他真实有依据的价格；由于地区、时间的差异性和市场行情波动，品牌专柜标价、商品吊牌价等可能会与您购物时展示的不一致，该价格仅供您参考。</p>\\r\\n                            <p><b>折扣：</b>如无特殊说明，折扣指销售商在原价、或划线价（如品牌专柜标价、商品吊牌价、厂商指导价、厂商建议零售价）等某一价格基础上计算出的优惠比例或优惠金额；如有疑问，您可在购买前联系销售商进行咨询。</p>\\r\\n                            <p><b>异常问题：</b>商品促销信息以商品详情页“促销”栏中的信息为准；商品的具体售价以订单结算页价格为准；如您发现活动商品售价或促销信息有异常，建议购买前先联系销售商咨询。</p>\\r\\n\\r\\n                                                        <br>\\r\\n                            <strong>能效标识说明：</strong><br>\\r\\n                            <p>根据国家相关能效标识法规和标准的要求，京东自营在售商品的能效标识图样，将会逐步替换为新版能源效率标识贴；受能效标识标准变化影响，部分产品的新版和旧版能效标识，在能效等级、测试值等方面会有差异，但产品实际性能完全一样，并不影响购买和使用，加贴新版或旧版能效标识的商品会随机发放，请您放心购买；如有疑问，请在购买前通过咚咚或来电咨询。</p>\\r\\n                                                    </div>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 22:11:08');
INSERT INTO `sys_oper_log` VALUES (133, '商品', 1, 'com.shoping.project.shop.controller.MineGoodsController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/goods/add', '127.0.0.1', '内网IP', '{\"typeId\":[\"19\"],\"typeName\":[\"教育电视\"],\"state\":[\"10\"],\"title\":[\"NB 757-L400电视支架(32-70英寸)壁挂通用电视挂架旋转伸缩电视架小米荣耀智慧屏海信创维TCL三星索尼电视架 \"],\"costPrice\":[\"444\"],\"price\":[\"0444\"],\"stock\":[\"444\"],\"indexStatus\":[\"0\"],\"content\":[\"<p><img style=\\\"width: 1114.67px;\\\" src=\\\"/profile/upload/2021/12/07/37c917f2-9822-455b-abeb-3b4c6bfbce1f.png\\\"><br></p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 22:19:50');
INSERT INTO `sys_oper_log` VALUES (134, '商品', 1, 'com.shoping.project.shop.controller.MineGoodsController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/goods/add', '127.0.0.1', '内网IP', '{\"typeId\":[\"22\"],\"typeName\":[\"电饭煲\"],\"state\":[\"10\"],\"title\":[\"九阳电饭煲 家用电饭锅5L升大容量智能多功能煮饭锅5-6-8人JYF-50FS69-F \"],\"costPrice\":[\"0\"],\"price\":[\"0\"],\"stock\":[\"0\"],\"indexStatus\":[\"0\"],\"content\":[\"<p><img style=\\\"width: 790px;\\\" src=\\\"/profile/upload/2021/12/07/fffc08bc-04cc-454f-a7d0-6accbb453fa0.png\\\"></p><div id=\\\"state\\\">\\r\\n                            <strong>权利声明：</strong><br>京东上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是京东重要的经营资源，未经许可，禁止非法转载使用。\\r\\n                            <p><b>注：</b>本站商品信息均来自于合作方，其真实性、准确性和合法性由信息拥有者（合作方）负责。本站不提供任何保证，并不承担任何法律责任。</p>\\r\\n                                                        <br>\\r\\n                            <strong>价格说明：</strong><br>\\r\\n                            <p><b>京东价：</b>京东价为商品的销售价，是您最终决定是否购买商品的依据。</p>\\r\\n                            <p><b>划线价：</b>商品展示的划横线价格为参考价，并非原价，该价格可能是品牌专柜标价、商品吊牌价或由品牌供应商提供的正品零售价（如厂商指导价、建议零售价等）或其他真实有依据的价格；由于地区、时间的差异性和市场行情波动，品牌专柜标价、商品吊牌价等可能会与您购物时展示的不一致，该价格仅供您参考。</p>\\r\\n                            <p><b>折扣：</b>如无特殊说明，折扣指销售商在原价、或划线价（如品牌专柜标价、商品吊牌价、厂商指导价、厂商建议零售价）等某一价格基础上计算出的优惠比例或优惠金额；如有疑问，您可在购买前联系销售商进行咨询。</p>\\r\\n                            <p><b>异常问题：</b>商品促销信息以商品详情页“促销”栏中的信息为准；商品的具体售价以订单结算页价格为准；如您发现活动商品售价或促销信息有异常，建议购买前先联系销售商咨询。</p>\\r\\n\\r\\n                                                        <br>\\r\\n                            <strong>能效标识说明：</strong><br>\\r\\n                            <p>根据国家相关能效标识法规和标准的要求，京东自营在售商品的能效标识图样，将会逐步替换为新版能源效率标识贴；受能效标识标准变化影响，部分产品的新版和旧版能效标识，在能效等级、测试值等方面会有差异，但产品实际性能完全一样，并不影响购买和使用，加贴新版或旧版能效标识的商品会随机发放，请您放心购买；如有疑问，请在购买前通过咚咚或来电咨询。</p>\\r\\n                                                    </div>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 22:21:13');
INSERT INTO `sys_oper_log` VALUES (135, '商品', 1, 'com.shoping.project.shop.controller.MineGoodsController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/goods/add', '127.0.0.1', '内网IP', '{\"typeId\":[\"22\"],\"typeName\":[\"电饭煲\"],\"state\":[\"10\"],\"title\":[\"美的（Midea）智能电饭煲电饭锅3-10人家用5L大容量预约气动涡轮防溢锅金属机身蒸米饭锅-WFS5017TM \"],\"costPrice\":[\"88\"],\"price\":[\"0888\"],\"stock\":[\"888\"],\"indexStatus\":[\"0\"],\"content\":[\"<div id=\\\"state\\\">\\r\\n                            <strong>权利声明：</strong><br>京东上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是京东重要的经营资源，未经许可，禁止非法转载使用。\\r\\n                            <p><b>注：</b>本站商品信息均来自于合作方，其真实性、准确性和合法性由信息拥有者（合作方）负责。本站不提供任何保证，并不承担任何法律责任。</p>\\r\\n                                                        <br>\\r\\n                            <strong>价格说明：</strong><br>\\r\\n                            <p><b>京东价：</b>京东价为商品的销售价，是您最终决定是否购买商品的依据。</p>\\r\\n                            <p><b>划线价：</b>商品展示的划横线价格为参考价，并非原价，该价格可能是品牌专柜标价、商品吊牌价或由品牌供应商提供的正品零售价（如厂商指导价、建议零售价等）或其他真实有依据的价格；由于地区、时间的差异性和市场行情波动，品牌专柜标价、商品吊牌价等可能会与您购物时展示的不一致，该价格仅供您参考。</p>\\r\\n                            <p><b>折扣：</b>如无特殊说明，折扣指销售商在原价、或划线价（如品牌专柜标价、商品吊牌价、厂商指导价、厂商建议零售价）等某一价格基础上计算出的优惠比例或优惠金额；如有疑问，您可在购买前联系销售商进行咨询。</p>\\r\\n                            <p><b>异常问题：</b>商品促销信息以商品详情页“促销”栏中的信息为准；商品的具体售价以订单结算页价格为准；如您发现活动商品售价或促销信息有异常，建议购买前先联系销售商咨询。</p>\\r\\n\\r\\n                                                        <br>\\r\\n                            <strong>能效标识说明：</strong><br>\\r\\n                            <p>根据国家相关能效标识法规和标准的要求，京东自营在售商品的能效标识图样，将会逐步替换为新版能源效率标识贴；受能效标识标准变化影响，部分产品的新版和旧版能效标识，在能效等级、测试值等方面会有差异，但产品实际性能完全一样，并不影响购买和使用，加贴新版或旧版能效标识的商品会随机发放，请您放心购买；如有疑问，请在购买前通过咚咚或来电咨询。</p>\\r\\n                                                    </div>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 22:21:41');
INSERT INTO `sys_oper_log` VALUES (136, '商品', 1, 'com.shoping.project.shop.controller.MineGoodsController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/goods/add', '127.0.0.1', '内网IP', '{\"typeId\":[\"21\"],\"typeName\":[\"平板电视\"],\"state\":[\"10\"],\"title\":[\"先科（SAST）S1-6 定压吸顶喇叭音响 吊顶背景音乐公共广播 6英寸 \"],\"costPrice\":[\"44\"],\"price\":[\"4\"],\"stock\":[\"444\"],\"indexStatus\":[\"0\"],\"content\":[\"<p>先科（SAST）S1-6 定压吸顶喇叭音响 吊顶背景音乐公共广播 6英寸                </p><p><img style=\\\"width: 750px;\\\" src=\\\"/profile/upload/2021/12/07/dd05044a-e5b9-4467-8975-6a7126e19349.png\\\"><br></p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 22:30:30');
INSERT INTO `sys_oper_log` VALUES (137, '分类', 2, 'com.shoping.project.shop.controller.MineTypeController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/type/edit', '127.0.0.1', '内网IP', '{\"typeId\":[\"20\"],\"parentId\":[\"15\"],\"parentName\":[\"大家电\"],\"typeName\":[\"4K电视\"],\"orderNum\":[\"1\"],\"indexStatus\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-07 22:31:34');
INSERT INTO `sys_oper_log` VALUES (138, '订单支付', 1, 'com.shoping.api.v1.pay.AppPayController.createOrder()', 'POST', 1, NULL, NULL, '/app/v1/pay/createOrder', '127.0.0.1', '内网IP', '{\"goodsStr\":[\"@@@7@@@1###\"],\"userName\":[\"张三\"],\"postalCode\":[\"510000\"],\"provinceName\":[\"广东省\"],\"cityName\":[\"广州市\"],\"countyName\":[\"海珠区\"],\"detailInfo\":[\"新港中路397号\"],\"nationalCode\":[\"510000\"],\"telNumber\":[\"020-81167888\"]}', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"timeStamp\":\"1639183196631\",\"msg\":\"下单成功\",\"package\":\"\",\"code\":\"200\",\"paySign\":\"\",\"appId\":\"\",\"signType\":\"RSA\",\"orderCode\":\"12021121108395661977779509258630\",\"nonceStr\":\"2ef3c959d8eb4059be9fe4de60c596d3\"}}', 0, NULL, '2021-12-11 08:39:56');
INSERT INTO `sys_oper_log` VALUES (139, '订单支付', 1, 'com.shoping.api.v1.pay.AppPayController.createOrder()', 'POST', 1, NULL, NULL, '/app/v1/pay/createOrder', '127.0.0.1', '内网IP', '{\"goodsStr\":[\"3@@@7@@@1###4@@@6@@@1###\"],\"userName\":[\"张三\"],\"postalCode\":[\"510000\"],\"provinceName\":[\"广东省\"],\"cityName\":[\"广州市\"],\"countyName\":[\"海珠区\"],\"detailInfo\":[\"新港中路397号\"],\"nationalCode\":[\"510000\"],\"telNumber\":[\"020-81167888\"]}', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"timeStamp\":\"1639183246309\",\"msg\":\"下单成功\",\"package\":\"\",\"code\":\"200\",\"paySign\":\"\",\"appId\":\"\",\"signType\":\"RSA\",\"orderCode\":\"12021121108404630977779742261058\",\"nonceStr\":\"c9473a2089e84f9ba0ba607485c478e7\"}}', 0, NULL, '2021-12-11 08:40:46');
INSERT INTO `sys_oper_log` VALUES (140, '订单支付', 1, 'com.shoping.api.v1.pay.AppPayController.createOrder()', 'POST', 1, NULL, NULL, '/app/v1/pay/createOrder', '127.0.0.1', '内网IP', '{\"goodsStr\":[\"@@@5@@@1###\"],\"userName\":[\"张三\"],\"postalCode\":[\"510000\"],\"provinceName\":[\"广东省\"],\"cityName\":[\"广州市\"],\"countyName\":[\"海珠区\"],\"detailInfo\":[\"新港中路397号\"],\"nationalCode\":[\"510000\"],\"telNumber\":[\"020-81167888\"]}', NULL, 1, '库存不足', '2021-12-11 09:10:43');
INSERT INTO `sys_oper_log` VALUES (141, '订单支付', 1, 'com.shoping.api.v1.pay.AppPayController.createOrder()', 'POST', 1, NULL, NULL, '/app/v1/pay/createOrder', '127.0.0.1', '内网IP', '{\"goodsStr\":[\"@@@5@@@1###\"],\"userName\":[\"张三\"],\"postalCode\":[\"510000\"],\"provinceName\":[\"广东省\"],\"cityName\":[\"广州市\"],\"countyName\":[\"海珠区\"],\"detailInfo\":[\"新港中路397号\"],\"nationalCode\":[\"510000\"],\"telNumber\":[\"020-81167888\"]}', NULL, 1, '库存不足', '2021-12-11 09:10:47');
INSERT INTO `sys_oper_log` VALUES (142, '订单支付', 1, 'com.shoping.api.v1.pay.AppPayController.createOrder()', 'POST', 1, NULL, NULL, '/app/v1/pay/createOrder', '127.0.0.1', '内网IP', '{\"goodsStr\":[\"@@@5@@@1###\"],\"userName\":[\"张三\"],\"postalCode\":[\"510000\"],\"provinceName\":[\"广东省\"],\"cityName\":[\"广州市\"],\"countyName\":[\"海珠区\"],\"detailInfo\":[\"新港中路397号\"],\"nationalCode\":[\"510000\"],\"telNumber\":[\"020-81167888\"]}', NULL, 1, '库存不足', '2021-12-11 09:11:22');
INSERT INTO `sys_oper_log` VALUES (143, '订单信息', 2, 'com.shoping.project.shop.controller.MineOrderController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/order/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"b67bfd08a2214541a84172e43d02d88c\"],\"payStatus\":[\"40\"],\"expressCode\":[\"123123123\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 09:21:02');
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 3, 'com.shoping.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', 'XXX科技', '/system/menu/remove/1084', '127.0.0.1', '内网IP', '1084', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 09:55:23');
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 1, 'com.shoping.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1079\"],\"menuType\":[\"C\"],\"menuName\":[\"评论管理\"],\"url\":[\"/shop/comment\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:comment:view\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 09:57:28');
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 1, 'com.shoping.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1085\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:comment:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 09:58:06');
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 3, 'com.shoping.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', 'XXX科技', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"11,12,13\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 13:22:22');
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 6, 'com.shoping.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', 'XXX科技', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mine_partner_apply\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 13:22:27');
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 8, 'com.shoping.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', 'XXX科技', '/tool/gen/download/mine_partner_apply', '127.0.0.1', '内网IP', '\"mine_partner_apply\"', NULL, 0, NULL, '2021-12-11 13:22:30');
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 1, 'com.shoping.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1062\"],\"menuType\":[\"C\"],\"menuName\":[\"合伙人申请\"],\"url\":[\"/shop/apply\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:apply:view\"],\"orderNum\":[\"10\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 13:26:26');
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 1, 'com.shoping.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1087\"],\"menuType\":[\"F\"],\"menuName\":[\"审核\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:apply:edit\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 13:26:54');
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 1, 'com.shoping.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1087\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:apply:remove\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 13:27:08');
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 1, 'com.shoping.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1087\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:apply:list\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 13:27:21');
INSERT INTO `sys_oper_log` VALUES (154, '字典类型', 1, 'com.shoping.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"审核状态\"],\"dictType\":[\"apply_status\"],\"status\":[\"0\"],\"remark\":[\"审核状态\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 13:32:02');
INSERT INTO `sys_oper_log` VALUES (155, '字典数据', 1, 'com.shoping.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"待审核\"],\"dictValue\":[\"10\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 13:32:14');
INSERT INTO `sys_oper_log` VALUES (156, '字典数据', 1, 'com.shoping.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"通过\"],\"dictValue\":[\"20\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 13:32:29');
INSERT INTO `sys_oper_log` VALUES (157, '字典数据', 1, 'com.shoping.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"未通过\"],\"dictValue\":[\"30\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 13:32:41');
INSERT INTO `sys_oper_log` VALUES (158, '合伙人申请记录', 2, 'com.shoping.project.shop.controller.MinePartnerApplyController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/apply/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"1\"],\"discount\":[\"12\"],\"ratio\":[\"0.03\"],\"status\":[\"20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 14:29:11');
INSERT INTO `sys_oper_log` VALUES (159, '合伙人申请记录', 2, 'com.shoping.project.shop.controller.MinePartnerApplyController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/apply/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"1\"],\"discount\":[\"12.00\"],\"ratio\":[\"0.03\"],\"status\":[\"30\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 14:32:39');
INSERT INTO `sys_oper_log` VALUES (160, '合伙人申请记录', 2, 'com.shoping.project.shop.controller.MinePartnerApplyController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/apply/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"3\"],\"discount\":[\"90.00\"],\"ratio\":[\"2.00\"],\"status\":[\"10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 14:38:52');
INSERT INTO `sys_oper_log` VALUES (161, '合伙人申请记录', 2, 'com.shoping.project.shop.controller.MinePartnerApplyController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/apply/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"3\"],\"discount\":[\"90.00\"],\"ratio\":[\"2.00\"],\"status\":[\"30\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 14:38:59');
INSERT INTO `sys_oper_log` VALUES (162, '合伙人申请记录', 2, 'com.shoping.project.shop.controller.MinePartnerApplyController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/apply/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"3\"],\"discount\":[\"90.00\"],\"ratio\":[\"2.00\"],\"status\":[\"20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 14:39:15');
INSERT INTO `sys_oper_log` VALUES (163, '合伙人申请记录', 2, 'com.shoping.project.shop.controller.MinePartnerApplyController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/apply/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"3\"],\"discount\":[\"90.00\"],\"ratio\":[\"2.00\"],\"status\":[\"20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 14:42:40');
INSERT INTO `sys_oper_log` VALUES (164, '合伙人申请记录', 2, 'com.shoping.project.shop.controller.MinePartnerApplyController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/apply/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"3\"],\"discount\":[\"90.00\"],\"ratio\":[\"2.00\"],\"status\":[\"20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 14:43:27');
INSERT INTO `sys_oper_log` VALUES (165, '合伙人申请记录', 2, 'com.shoping.project.shop.controller.MinePartnerApplyController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/apply/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"3\"],\"discount\":[\"90.00\"],\"ratio\":[\"2.00\"],\"status\":[\"30\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 14:43:43');
INSERT INTO `sys_oper_log` VALUES (166, '合伙人申请记录', 2, 'com.shoping.project.shop.controller.MinePartnerApplyController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/apply/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"3\"],\"discount\":[\"90.00\"],\"ratio\":[\"2.00\"],\"status\":[\"20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 14:44:16');
INSERT INTO `sys_oper_log` VALUES (167, '合伙人申请记录', 2, 'com.shoping.project.shop.controller.MinePartnerApplyController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/apply/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"3\"],\"discount\":[\"90.00\"],\"ratio\":[\"2.00\"],\"status\":[\"20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 14:45:23');
INSERT INTO `sys_oper_log` VALUES (168, '合伙人申请记录', 2, 'com.shoping.project.shop.controller.MinePartnerApplyController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/apply/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"3\"],\"discount\":[\"90.00\"],\"ratio\":[\"2.00\"],\"status\":[\"20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 14:46:29');
INSERT INTO `sys_oper_log` VALUES (169, '合伙人申请记录', 2, 'com.shoping.project.shop.controller.MinePartnerApplyController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/apply/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"3\"],\"discount\":[\"90.00\"],\"ratio\":[\"2.00\"],\"status\":[\"20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 14:47:21');
INSERT INTO `sys_oper_log` VALUES (170, '合伙人申请记录', 2, 'com.shoping.project.shop.controller.MinePartnerApplyController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/apply/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"3\"],\"discount\":[\"90.00\"],\"ratio\":[\"2.00\"],\"status\":[\"20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 14:49:25');
INSERT INTO `sys_oper_log` VALUES (171, '合伙人申请记录', 2, 'com.shoping.project.shop.controller.MinePartnerApplyController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/apply/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"3\"],\"userId\":[\"4\"],\"discount\":[\"90.00\"],\"ratio\":[\"2.00\"],\"status\":[\"20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 14:50:03');
INSERT INTO `sys_oper_log` VALUES (172, '代码生成', 6, 'com.shoping.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', 'XXX科技', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mine_order\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 15:04:19');
INSERT INTO `sys_oper_log` VALUES (173, '订单支付', 1, 'com.shoping.api.v1.pay.AppPayController.createOrder()', 'POST', 1, NULL, NULL, '/app/v1/pay/createOrder', '127.0.0.1', '内网IP', '{\"vipcode\":[\"2121212\"],\"goodsStr\":[\"@@@6@@@1###\"],\"userName\":[\"张三\"],\"postalCode\":[\"510000\"],\"provinceName\":[\"广东省\"],\"cityName\":[\"广州市\"],\"countyName\":[\"海珠区\"],\"detailInfo\":[\"新港中路397号\"],\"nationalCode\":[\"510000\"],\"telNumber\":[\"020-81167888\"]}', NULL, 1, '折扣码无效', '2021-12-11 15:14:41');
INSERT INTO `sys_oper_log` VALUES (174, '订单支付', 1, 'com.shoping.api.v1.pay.AppPayController.createOrder()', 'POST', 1, NULL, NULL, '/app/v1/pay/createOrder', '127.0.0.1', '内网IP', '{\"vipcode\":[\"123123\"],\"goodsStr\":[\"@@@6@@@1###\"],\"userName\":[\"张三\"],\"postalCode\":[\"510000\"],\"provinceName\":[\"广东省\"],\"cityName\":[\"广州市\"],\"countyName\":[\"海珠区\"],\"detailInfo\":[\"新港中路397号\"],\"nationalCode\":[\"510000\"],\"telNumber\":[\"020-81167888\"]}', NULL, 1, '折扣码无效', '2021-12-11 15:31:38');
INSERT INTO `sys_oper_log` VALUES (175, '订单支付', 1, 'com.shoping.api.v1.pay.AppPayController.createOrder()', 'POST', 1, NULL, NULL, '/app/v1/pay/createOrder', '127.0.0.1', '内网IP', '{\"vipcode\":[\"123123\"],\"goodsStr\":[\"@@@6@@@1###\"],\"userName\":[\"张三\"],\"postalCode\":[\"510000\"],\"provinceName\":[\"广东省\"],\"cityName\":[\"广州市\"],\"countyName\":[\"海珠区\"],\"detailInfo\":[\"新港中路397号\"],\"nationalCode\":[\"510000\"],\"telNumber\":[\"020-81167888\"]}', NULL, 1, '折扣码无效', '2021-12-11 15:31:59');
INSERT INTO `sys_oper_log` VALUES (176, '订单支付', 1, 'com.shoping.api.v1.pay.AppPayController.createOrder()', 'POST', 1, NULL, NULL, '/app/v1/pay/createOrder', '127.0.0.1', '内网IP', '{\"vipcode\":[\"123123\"],\"goodsStr\":[\"@@@6@@@1###\"],\"userName\":[\"张三\"],\"postalCode\":[\"510000\"],\"provinceName\":[\"广东省\"],\"cityName\":[\"广州市\"],\"countyName\":[\"海珠区\"],\"detailInfo\":[\"新港中路397号\"],\"nationalCode\":[\"510000\"],\"telNumber\":[\"020-81167888\"]}', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"timeStamp\":\"1639207951323\",\"msg\":\"下单成功\",\"package\":\"\",\"code\":\"200\",\"paySign\":\"\",\"appId\":\"\",\"signType\":\"RSA\",\"orderCode\":\"12021121115323132277779874362293\",\"nonceStr\":\"6765d1cbb8a847bd8d67626738e16772\"}}', 0, NULL, '2021-12-11 15:32:31');
INSERT INTO `sys_oper_log` VALUES (177, '代码生成', 6, 'com.shoping.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', 'XXX科技', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mine_balance\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 16:11:15');
INSERT INTO `sys_oper_log` VALUES (178, '代码生成', 8, 'com.shoping.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', 'XXX科技', '/tool/gen/download/mine_balance', '127.0.0.1', '内网IP', '\"mine_balance\"', NULL, 0, NULL, '2021-12-11 16:11:19');
INSERT INTO `sys_oper_log` VALUES (179, '代码生成', 3, 'com.shoping.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', 'XXX科技', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"16,15,14\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 16:23:57');
INSERT INTO `sys_oper_log` VALUES (180, '代码生成', 6, 'com.shoping.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', 'XXX科技', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"mine_balance\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 16:23:59');
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 1, 'com.shoping.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1062\"],\"menuType\":[\"C\"],\"menuName\":[\"提现审核\"],\"url\":[\"/shop/apply\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:apply:view\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 16:27:06');
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 1, 'com.shoping.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1091\"],\"menuType\":[\"F\"],\"menuName\":[\"审核\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:apply:edit\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 16:27:26');
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 1, 'com.shoping.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', 'XXX科技', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1091\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:apply:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 16:27:38');
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 2, 'com.shoping.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1091\"],\"parentId\":[\"1062\"],\"menuType\":[\"C\"],\"menuName\":[\"提现审核\"],\"url\":[\"/shop/balance\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:balance:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 16:29:25');
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 2, 'com.shoping.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1093\"],\"parentId\":[\"1091\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:balance:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 16:29:31');
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 2, 'com.shoping.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1092\"],\"parentId\":[\"1091\"],\"menuType\":[\"F\"],\"menuName\":[\"审核\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"shop:balance:edit\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 16:29:37');
INSERT INTO `sys_oper_log` VALUES (187, '提现明细', 2, 'com.shoping.project.shop.controller.MineBalanceController.editSave()', 'POST', 1, 'admin', 'XXX科技', '/shop/balance/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"1\"],\"status\":[\"20\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-12-11 17:11:25');
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-11-01 10:42:08', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-11-01 10:42:08', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2021-11-01 10:42:08', '', NULL, '普通角色');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) DEFAULT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户  02 合伙人）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(500) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `open_id` varchar(100) DEFAULT NULL COMMENT '微信openid',
  `city` varchar(100) DEFAULT NULL COMMENT '用户所在城市',
  `province` varchar(100) DEFAULT NULL COMMENT '用户所在省份',
  `country` varchar(100) DEFAULT NULL COMMENT '用户所在国家',
  `invite_code` varchar(20) DEFAULT NULL COMMENT '邀请码',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '管理员', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2021-12-11 17:10:02', '2021-11-01 10:42:08', 'admin', '2021-11-01 10:42:08', '', '2021-12-11 17:10:02', '管理员', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (2, 100, 'ry', '测试', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2021-11-01 10:42:08', '2021-11-01 10:42:08', 'admin', '2021-11-01 10:42:08', '', NULL, '测试员', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (4, NULL, NULL, 'NING℃', '02', '', '', '0', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIEH8s4eeVqPDiaRArnrNqmu7ET6Bvgfrddciaia7QRiaG34zrIYwKicTJjZekoBwAdhTNXd5m3JvJpGzA/132', 'acf64a405db8982150e873a94519341f', '345314', '0', '0', '', NULL, NULL, '', '2021-12-07 22:33:47', '', '2021-12-11 14:50:03', NULL, 'oNR8t478kXjDElP-J2fVRY2jNVEM', '', '', '', '123123');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_online` VALUES ('0d38b51e-9771-4f91-9749-e17db395fa9a', 'admin', 'XXX科技', '127.0.0.1', '内网IP', 'Firefox 9', 'Mac OS X', 'on_line', '2021-12-11 17:09:54', '2021-12-11 17:15:22', 1800000);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
