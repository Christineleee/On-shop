/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50740
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50740
 File Encoding         : 65001

 Date: 13/12/2023 22:30:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods`  (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double NOT NULL,
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`gid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES (1, '苹果iPhone 15 Pro', 9999, 'phone', 'Apple/苹果 iPhone 15 Pro 新款5G手机国行正品智能全网通手机', 4);
INSERT INTO `tb_goods` VALUES (2, '丽芝士威化饼干', 10, 'food', '丽芝士威化饼干印尼进口纳宝帝nabati芝士奶酪味零食休闲小吃食品', 9);
INSERT INTO `tb_goods` VALUES (3, '灰色长袖t恤打底杉上衣', 36, 'clothes', '森马集团GENIOLAMODE灰色长袖t恤男款国潮醒狮秋季男士打底杉上衣', 8);
INSERT INTO `tb_goods` VALUES (4, '洁柔抽纸', 18, 'daily', '【百亿补贴】洁柔抽纸油画可湿水纸巾加厚4层4包餐巾纸家用实惠装', 11);
INSERT INTO `tb_goods` VALUES (5, '手撕棒面包营养早餐', 10, 'food', '【整箱40根】手撕棒面包营养早餐奶香味原味奶香代餐面包棒', 5);
INSERT INTO `tb_goods` VALUES (6, '袜子', 10, 'clothes', '袜子女春秋袜子女韩版中筒春夏日系ins潮字母P运动休闲少女袜情侣', 20);
INSERT INTO `tb_goods` VALUES (7, '华为50Pro', 3088, 'phone', 'Huawei/华为50Pro 5G手机新款官方旗舰正品全网通拍照游戏手机', 7);

-- ----------------------------
-- Table structure for tb_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_item`;
CREATE TABLE `tb_item`  (
  `oid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gid` int(11) NOT NULL,
  `num` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`oid`, `gid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_item
-- ----------------------------
INSERT INTO `tb_item` VALUES ('2312053141', 5, 2);
INSERT INTO `tb_item` VALUES ('2312061272', 2, 2);
INSERT INTO `tb_item` VALUES ('2312066791', 1, 1);
INSERT INTO `tb_item` VALUES ('2312066791', 4, 2);
INSERT INTO `tb_item` VALUES ('2312077638', 1, 3);
INSERT INTO `tb_item` VALUES ('2312077638', 5, 2);
INSERT INTO `tb_item` VALUES ('2312083919', 2, 3);
INSERT INTO `tb_item` VALUES ('2312085613', 1, 1);
INSERT INTO `tb_item` VALUES ('2312132927', 1, 3);
INSERT INTO `tb_item` VALUES ('2312132927', 4, 5);
INSERT INTO `tb_item` VALUES ('2312135893', 5, 1);

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`  (
  `oid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `money` double NULL DEFAULT NULL,
  `receiver_address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiver_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiver_email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_state` int(11) NULL DEFAULT 0,
  `uid` int(11) NOT NULL,
  `time` datetime(0) NOT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('2312053141', 20, 'user1的地址1', 'user1', '2205777432@qq.com', 1, 2, '2023-12-06 16:25:05');
INSERT INTO `tb_order` VALUES ('2312061272', 20, 'user2的地址', 'user2', 'user2@qq.com', 1, 3, '2023-12-06 22:01:51');
INSERT INTO `tb_order` VALUES ('2312066791', 10035, 'user2的地址', 'user2', 'user2@qq.com', 1, 3, '2023-12-06 21:40:17');
INSERT INTO `tb_order` VALUES ('2312077638', 30017, '2205777432@qq.com', 'user1', 'user1@qq.com', 1, 2, '2023-12-07 11:49:08');
INSERT INTO `tb_order` VALUES ('2312083919', 30, 'test2的地址', 'test2', '2205777432@qq.com', 1, 7, '2023-12-08 18:30:34');
INSERT INTO `tb_order` VALUES ('2312085613', 9999, 'test2的地址', 'test2', 'test2@qq.com', 1, 7, '2023-12-08 19:13:46');
INSERT INTO `tb_order` VALUES ('2312132927', 30087, 'user1çå°å1', 'user1', 'user1@qq.com', 1, 2, '2023-12-13 19:13:03');
INSERT INTO `tb_order` VALUES ('2312135893', 10, 'user2的地址', 'user2', 'user2@qq.com', 1, 3, '2023-12-13 19:18:26');

-- ----------------------------
-- Table structure for tb_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_record`;
CREATE TABLE `tb_record`  (
  `uid` int(11) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gid` int(11) NOT NULL,
  `goodsname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `surf_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`, `gid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_record
-- ----------------------------
INSERT INTO `tb_record` VALUES (2, 'user1', 1, '苹果iPhone 15 Pro', '2023-12-06 21:11:54');
INSERT INTO `tb_record` VALUES (2, 'user1', 2, '丽芝士威化饼干', '2023-12-06 23:55:04');
INSERT INTO `tb_record` VALUES (2, 'user1', 4, '洁柔抽纸', '2023-12-06 21:12:08');
INSERT INTO `tb_record` VALUES (2, 'user1', 5, '手撕棒面包营养早餐', '2023-12-06 21:12:21');
INSERT INTO `tb_record` VALUES (3, 'user2', 1, '苹果iPhone 15 Pro', '2023-12-13 19:18:09');
INSERT INTO `tb_record` VALUES (3, 'user2', 2, '丽芝士威化饼干', '2023-12-06 22:11:07');
INSERT INTO `tb_record` VALUES (3, 'user2', 5, '手撕棒面包营养早餐', '2023-12-13 19:18:16');
INSERT INTO `tb_record` VALUES (7, 'test2', 1, '苹果iPhone 15 Pro', '2023-12-08 18:25:34');
INSERT INTO `tb_record` VALUES (7, 'test2', 2, '丽芝士威化饼干', '2023-12-08 18:20:52');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'admin', '11111', 'admin@qq.com', 'manager');
INSERT INTO `tb_user` VALUES (2, 'user1', '00001', 'user1@qq.com', 'customer');
INSERT INTO `tb_user` VALUES (3, 'user2', '00002', 'user2@qq.com', 'customer');

SET FOREIGN_KEY_CHECKS = 1;
