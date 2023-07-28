/*
 Navicat Premium Data Transfer

 Source Server         : nx_system
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : a_wx_shop

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 29/04/2022 18:31:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP DATABASE IF EXISTS `a_wx_shop`;
CREATE DATABASE `a_wx_shop`;
use `a_wx_shop`;

-- ----------------------------
-- Table structure for address_info
-- ----------------------------
DROP TABLE IF EXISTS `address_info`;
CREATE TABLE `address_info`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人',
  `phone` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `uid` int(9) NOT NULL COMMENT '用户',
  `createTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address_info
-- ----------------------------
INSERT INTO `address_info` VALUES (19, '1', '111', '111111', 23, '2021-10-31 01:00:25');
INSERT INTO `address_info` VALUES (21, '张三', '31131', '12313131', 34, '2021-10-31 22:40:34');
INSERT INTO `address_info` VALUES (26, '张三', '13123456789', '安徽省合肥市政务区湖畔春天6栋1506室', 34, '2022-04-29 00:22:42');
INSERT INTO `address_info` VALUES (27, '老王', '18876256732', '上海市浦东新区东方明珠405', 1, '2022-04-29 03:35:04');
INSERT INTO `address_info` VALUES (28, '张三', '18888888888', '安徽省合肥市蜀山区锦绣公园405', 2, '2022-04-29 16:57:41');
INSERT INTO `address_info` VALUES (29, '张三', '18888888888', '上海市浦东新区东方明珠509室', 2, '2022-04-29 18:14:21');

-- ----------------------------
-- Table structure for cart_info
-- ----------------------------
DROP TABLE IF EXISTS `cart_info`;
CREATE TABLE `cart_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `count` int(11) NOT NULL DEFAULT 0 COMMENT '数量',
  `goodsId` bigint(20) NOT NULL DEFAULT 0 COMMENT '所属商品',
  `userId` bigint(20) NOT NULL DEFAULT 0 COMMENT '所属用户',
  `createTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '购物车信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_info
-- ----------------------------
INSERT INTO `cart_info` VALUES (23, 1, 4, 34, '2022-04-29 01:20:05');

-- ----------------------------
-- Table structure for collect_info
-- ----------------------------
DROP TABLE IF EXISTS `collect_info`;
CREATE TABLE `collect_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL,
  `foreignId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collect_info
-- ----------------------------
INSERT INTO `collect_info` VALUES (1, 23, 3, 1);
INSERT INTO `collect_info` VALUES (6, 23, 3, 2);
INSERT INTO `collect_info` VALUES (7, 30, 3, 1);
INSERT INTO `collect_info` VALUES (8, 32, 3, 2);

-- ----------------------------
-- Table structure for comment_info
-- ----------------------------
DROP TABLE IF EXISTS `comment_info`;
CREATE TABLE `comment_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '评价内容',
  `goodsId` bigint(20) NOT NULL DEFAULT 0 COMMENT '所属商品',
  `userId` bigint(20) NOT NULL DEFAULT 0 COMMENT '评价人id',
  `level` int(11) NULL DEFAULT NULL COMMENT '用户等级',
  `createTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品评价表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_info
-- ----------------------------
INSERT INTO `comment_info` VALUES (1, '真的很好吃', 8, 2, NULL, '2022-04-29 17:02:47');
INSERT INTO `comment_info` VALUES (2, '这个是真的不错！', 4, 2, NULL, '2022-04-29 18:16:59');

-- ----------------------------
-- Table structure for goods_info
-- ----------------------------
DROP TABLE IF EXISTS `goods_info`;
CREATE TABLE `goods_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '商品描述',
  `price` double(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `discount` double(10, 2) NULL DEFAULT 1.00 COMMENT '商品折扣',
  `sales` int(11) NOT NULL DEFAULT 0 COMMENT '商品销量',
  `hot` int(11) NOT NULL DEFAULT 0 COMMENT '商品点赞数',
  `recommend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '否' COMMENT '是否是推荐',
  `count` int(11) NOT NULL DEFAULT 0 COMMENT '商品库存',
  `typeId` bigint(20) NOT NULL DEFAULT 0 COMMENT '所属类别',
  `fileIds` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品图片id，用英文逗号隔开',
  `userId` bigint(20) NOT NULL DEFAULT 0 COMMENT '评价人id',
  `level` int(11) NULL DEFAULT NULL COMMENT '用户等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_info
-- ----------------------------
INSERT INTO `goods_info` VALUES (1, '谷中宝缤纷水果酸奶果粒麦片', '使用开水冲泡，开袋宝藏满满，好吃到停不下嘴！！超多酸奶块和冻干草莓粒每一口都是满足！', 34.00, 0.80, 45, 524288, '是', 999, 1, '[32, 33, 34]', 1, NULL);
INSERT INTO `goods_info` VALUES (2, '欧扎克水果坚果即食麦片', '肖战粉丝小飞侠又来买欧扎克啦！麦片好吃不腻，整个身体都变得瘦瘦的', 34.00, 0.80, 23, 32768, '是', 999, 1, '[35, 37, 36]', 1, NULL);
INSERT INTO `goods_info` VALUES (3, '火腿午餐肉', '中粮梅林火腿午餐肉量贩装198g*6家庭箱装火锅方便速食夜宵伴侣', 79.90, 0.90, 32, 2048, '是', 999, 2, '[46]', 1, NULL);
INSERT INTO `goods_info` VALUES (4, '佛跳墙袋装1250g', '九里京正宗大鲍鱼即食捞饭原材料罐装加热佛跳墙袋装1250g，营养美味，晚餐首选！', 1299.00, 0.90, 1, 0, '否', 998, 3, '[43, 42]', 1, NULL);
INSERT INTO `goods_info` VALUES (6, '水果奶油蛋糕6寸', '作为午后甜点的必点之一，入口细腻柔滑，奶油不重，吃起来口感非常好，很适合作为午后甜点', 14.00, 0.90, 1, 0, '是', 999, 4, '[23]', 1, NULL);
INSERT INTO `goods_info` VALUES (7, '百草味开心果100g', '百草味开心果100g休闲小吃炒货坚果开心果手剥原色开心果零食', 9.90, 0.90, 0, 0, '是', 999, 6, '[38, 39]', 1, NULL);
INSERT INTO `goods_info` VALUES (8, '百草味菠萝干100g', '休闲零食酸甜菠萝圈凤梨干片蜜饯水果干果脯，在家或者在公司的完美零食', 10.90, 0.90, 1, 0, '是', 998, 6, '[29, 31, 30]', 1, NULL);
INSERT INTO `goods_info` VALUES (9, '百草味夏威夷果100g', '百草味夏威夷果，口感纯粹，味道好，香甜可口，是休闲坚果的首选之一', 10.90, 0.90, 0, 0, '是', 999, 5, '[40, 41]', 1, NULL);
INSERT INTO `goods_info` VALUES (10, '叮咚熊奶皮面包320g', '浓浓卡丝达酱在舌尖化开的醇香 每一口都奶香弥漫，一个奶皮面包一杯牛奶，满满蛋白质健康轻生活，年轻群体都爱吃~', 10.90, 0.90, 0, 0, '是', 999, 1, '[49, 47, 48]', 1, NULL);

-- ----------------------------
-- Table structure for nx_system_file_info
-- ----------------------------
DROP TABLE IF EXISTS `nx_system_file_info`;
CREATE TABLE `nx_system_file_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `originName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '原始文件名',
  `fileName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '存储文件名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文件信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nx_system_file_info
-- ----------------------------
INSERT INTO `nx_system_file_info` VALUES (12, 'iphone12.jpg', 'iphone121606791180182.jpg');
INSERT INTO `nx_system_file_info` VALUES (13, '牛仔外套.jpg', '牛仔外套1606791664516.jpg');
INSERT INTO `nx_system_file_info` VALUES (14, '女装.jpg', '女装1606791689058.jpg');
INSERT INTO `nx_system_file_info` VALUES (15, '华为Meta30.jpg', '华为Meta301606791754239.jpg');
INSERT INTO `nx_system_file_info` VALUES (16, '30950.jpg', '309501608444761955.jpg');
INSERT INTO `nx_system_file_info` VALUES (17, 'u=2669303306,338188050&fm=26&gp=0.jpg', 'u=2669303306,338188050&fm=26&gp=01608454963850.jpg');
INSERT INTO `nx_system_file_info` VALUES (18, 'u=1646342622,2222263206&fm=26&gp=0.jpg', 'u=1646342622,2222263206&fm=26&gp=01608454991319.jpg');
INSERT INTO `nx_system_file_info` VALUES (19, 'timg.jpg', 'timg1608455054164.jpg');
INSERT INTO `nx_system_file_info` VALUES (20, '1799.gif', '17991608457607178.gif');
INSERT INTO `nx_system_file_info` VALUES (21, 'v2-530577b3ffa1485ff1ca4ff7c16d360a_720w.jpg', 'v2-530577b3ffa1485ff1ca4ff7c16d360a_720w1616596274944.jpg');
INSERT INTO `nx_system_file_info` VALUES (22, 'ftq.png', 'ftq1616596454387.png');
INSERT INTO `nx_system_file_info` VALUES (23, '1.jpg', '11635692145594.jpg');
INSERT INTO `nx_system_file_info` VALUES (24, '1.jpg', '11635692618307.jpg');
INSERT INTO `nx_system_file_info` VALUES (25, 'n1.jpg', 'n11651222062202.jpg');
INSERT INTO `nx_system_file_info` VALUES (26, 'n2.jpg', 'n21651222224452.jpg');
INSERT INTO `nx_system_file_info` VALUES (27, '1.jpg', '11651222224452.jpg');
INSERT INTO `nx_system_file_info` VALUES (28, 'n1.jpg', 'n11651222224454.jpg');
INSERT INTO `nx_system_file_info` VALUES (29, 'n1.jpg', 'n11651222472457.jpg');
INSERT INTO `nx_system_file_info` VALUES (30, '1.jpg', '11651222472455.jpg');
INSERT INTO `nx_system_file_info` VALUES (31, '2.jpg', '21651222472455.jpg');
INSERT INTO `nx_system_file_info` VALUES (32, '2.jpg', '21651223228935.jpg');
INSERT INTO `nx_system_file_info` VALUES (33, '3.jpg', '31651223228938.jpg');
INSERT INTO `nx_system_file_info` VALUES (34, '1.jpg', '11651223228938.jpg');
INSERT INTO `nx_system_file_info` VALUES (35, '3.jpg', '31651223967308.jpg');
INSERT INTO `nx_system_file_info` VALUES (36, '1.jpg', '11651223967308.jpg');
INSERT INTO `nx_system_file_info` VALUES (37, '2.jpg', '21651223967309.jpg');
INSERT INTO `nx_system_file_info` VALUES (38, '3.jpg', '31651225014658.jpg');
INSERT INTO `nx_system_file_info` VALUES (39, '1.jpg', '11651225014656.jpg');
INSERT INTO `nx_system_file_info` VALUES (40, '2.jpg', '21651225302388.jpg');
INSERT INTO `nx_system_file_info` VALUES (41, '1.jpg', '11651225302391.jpg');
INSERT INTO `nx_system_file_info` VALUES (42, '1.jpg', '11651225652307.jpg');
INSERT INTO `nx_system_file_info` VALUES (43, '2.jpg', '21651225652307.jpg');
INSERT INTO `nx_system_file_info` VALUES (44, '2.jpg', '21651225865788.jpg');
INSERT INTO `nx_system_file_info` VALUES (45, '1.jpg', '11651225865788.jpg');
INSERT INTO `nx_system_file_info` VALUES (46, '1.jpg', '11651225896635.jpg');
INSERT INTO `nx_system_file_info` VALUES (47, '3.jpg', '31651227025801.jpg');
INSERT INTO `nx_system_file_info` VALUES (48, '2.jpg', '21651227025801.jpg');
INSERT INTO `nx_system_file_info` VALUES (49, '1.jpg', '11651227025801.jpg');

-- ----------------------------
-- Table structure for order_goods_rel
-- ----------------------------
DROP TABLE IF EXISTS `order_goods_rel`;
CREATE TABLE `order_goods_rel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `orderId` bigint(20) NULL DEFAULT NULL COMMENT '订单ID',
  `goodsId` bigint(20) NOT NULL DEFAULT 0 COMMENT '所属商品',
  `count` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单商品关系映射表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_goods_rel
-- ----------------------------
INSERT INTO `order_goods_rel` VALUES (1, 1, 1, 30);
INSERT INTO `order_goods_rel` VALUES (2, 2, 2, 10);
INSERT INTO `order_goods_rel` VALUES (3, 3, 3, 20);
INSERT INTO `order_goods_rel` VALUES (8, 6, 1, 2);
INSERT INTO `order_goods_rel` VALUES (9, 7, 3, 2);
INSERT INTO `order_goods_rel` VALUES (10, 8, 3, 2);
INSERT INTO `order_goods_rel` VALUES (11, 9, 1, 1);
INSERT INTO `order_goods_rel` VALUES (12, 10, 1, 1);
INSERT INTO `order_goods_rel` VALUES (13, 10, 2, 1);
INSERT INTO `order_goods_rel` VALUES (14, 10, 5, 1);
INSERT INTO `order_goods_rel` VALUES (15, 11, 3, 1);
INSERT INTO `order_goods_rel` VALUES (16, 12, 2, 1);
INSERT INTO `order_goods_rel` VALUES (17, 13, 3, 2);
INSERT INTO `order_goods_rel` VALUES (18, 14, 2, 1);
INSERT INTO `order_goods_rel` VALUES (19, 15, 2, 1);
INSERT INTO `order_goods_rel` VALUES (20, 16, 2, 1);
INSERT INTO `order_goods_rel` VALUES (21, 17, 2, 1);
INSERT INTO `order_goods_rel` VALUES (22, 18, 3, 1);
INSERT INTO `order_goods_rel` VALUES (23, 19, 1, 1);
INSERT INTO `order_goods_rel` VALUES (24, 20, 2, 1);
INSERT INTO `order_goods_rel` VALUES (27, 23, 2, 1);
INSERT INTO `order_goods_rel` VALUES (28, 23, 1, 1);
INSERT INTO `order_goods_rel` VALUES (29, 24, 2, 1);
INSERT INTO `order_goods_rel` VALUES (30, 24, 1, 1);
INSERT INTO `order_goods_rel` VALUES (33, 27, 1, 1);
INSERT INTO `order_goods_rel` VALUES (34, 28, 1, 1);
INSERT INTO `order_goods_rel` VALUES (35, 29, 1, 1);
INSERT INTO `order_goods_rel` VALUES (36, 30, 1, 1);
INSERT INTO `order_goods_rel` VALUES (37, 31, 1, 1);
INSERT INTO `order_goods_rel` VALUES (38, 32, 6, 1);
INSERT INTO `order_goods_rel` VALUES (39, 33, 8, 1);
INSERT INTO `order_goods_rel` VALUES (40, 34, 4, 1);

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `orderId` bigint(20) NULL DEFAULT NULL COMMENT '订单ID',
  `totalPrice` double(10, 2) NOT NULL DEFAULT 0.00 COMMENT '总价格',
  `userId` bigint(20) NOT NULL DEFAULT 0 COMMENT '所属用户',
  `createTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '未发货' COMMENT '订单状态',
  `addressId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品订单信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES (27, 342022042817511200, 27.20, 1, '2022-04-28 17:51:04', '已退款', 26);
INSERT INTO `order_info` VALUES (28, 342022042900026228, 27.20, 1, '2022-04-29 00:02:38', '申请退款中', 26);
INSERT INTO `order_info` VALUES (31, 12022042903365694, 27.20, 1, '2022-04-29 03:36:00', '待发货', 27);
INSERT INTO `order_info` VALUES (32, 12022042903406066, 90.00, 1, '2022-04-29 03:40:13', '待发货', 27);
INSERT INTO `order_info` VALUES (33, 22022042916573524, 9.81, 2, '2022-04-29 16:57:47', '已退款', 28);
INSERT INTO `order_info` VALUES (34, 22022042918148561, 1169.10, 2, '2022-04-29 18:14:37', '已完成', 29);

-- ----------------------------
-- Table structure for type_info
-- ----------------------------
DROP TABLE IF EXISTS `type_info`;
CREATE TABLE `type_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '类型描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type_info
-- ----------------------------
INSERT INTO `type_info` VALUES (1, '早餐特供', '这是早餐特供分类');
INSERT INTO `type_info` VALUES (2, '营养午餐', '这是营养午餐分类');
INSERT INTO `type_info` VALUES (3, '健康晚餐', '这是健康晚餐分类');
INSERT INTO `type_info` VALUES (4, '午后甜点', '这是午后甜点分类');
INSERT INTO `type_info` VALUES (5, '美味坚果', '这是美味坚果分类');
INSERT INTO `type_info` VALUES (6, '休闲零食', '这是休闲零食分类');
INSERT INTO `type_info` VALUES (7, '饮料专区', '这是饮料专区分类');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `nickName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生日',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `cardId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '身份证',
  `level` int(11) NOT NULL DEFAULT 1 COMMENT '权限等级',
  `account` double(10, 2) NULL DEFAULT NULL COMMENT '余额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '男', 22, NULL, '18843232356', '上海市', NULL, NULL, NULL, 1, 12.80);
INSERT INTO `user_info` VALUES (2, '张三', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 23, NULL, '18888888888', '安徽省合肥市蜀山区锦绣花园405', NULL, NULL, NULL, 3, 30.90);
INSERT INTO `user_info` VALUES (3, '李四', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 23, NULL, '18912345678', '上海市浦东新区外滩18号', NULL, NULL, NULL, 3, 0.00);

SET FOREIGN_KEY_CHECKS = 1;
