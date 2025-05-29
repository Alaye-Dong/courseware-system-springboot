/*
 Navicat Premium Dump SQL

 Source Server         : MysqlDemo
 Source Server Type    : MySQL
 Source Server Version : 80403 (8.4.3)
 Source Host           : localhost:3306
 Source Schema         : practical-demo

 Target Server Type    : MySQL
 Target Server Version : 80403 (8.4.3)
 File Encoding         : 65001

 Date: 29/05/2025 16:47:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `realname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '2',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3',
  `birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `if_valid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'zhangsan', '123456', '张三', '1', '江西省南昌市', '131', '3', '2025-05-28', '1');
INSERT INTO `t_user` VALUES (66, 'lisi', '123456', '李四', '1', '江苏省南京市', '13200000001', '3', '1999-05-12', '1');
INSERT INTO `t_user` VALUES (67, 'wangwu', '123456', '王五', '2', '北京市海淀区', '13300000002', '3', '2001-03-18', '1');
INSERT INTO `t_user` VALUES (68, 'zhaoliu', '123456', '赵六', '2', '广东省深圳市', '13400000003', '2', '1998-11-25', '1');
INSERT INTO `t_user` VALUES (69, 'chenqi', '123456', '陈七', '2', '浙江省杭州市', '13500000004', '3', '2002-07-08', '1');
INSERT INTO `t_user` VALUES (70, 'sunba', '123456', '孙八', '1', '湖南省长沙市', '13600000005', '3', '2000-09-01', '1');
INSERT INTO `t_user` VALUES (71, 'zhoujiu', '123456', '周九', '2', '四川省成都市', '13700000006', '3', '1997-12-30', '1');
INSERT INTO `t_user` VALUES (72, 'wushili', '123456', '吴十', '1', '山东省济南市', '13800000007', '3', '2003-04-15', '1');
INSERT INTO `t_user` VALUES (73, 'zhengshi', '123456', '郑十', '2', '福建省厦门市', '13900000008', '2', '1996-02-20', '1');
INSERT INTO `t_user` VALUES (74, 'liuyi', '123456', '刘一', '1', '湖北省武汉市', '14000000009', '3', '1995-08-08', '1');
INSERT INTO `t_user` VALUES (75, 'yanger', '123456', '杨二', '2', '河北省石家庄市', '14100000010', '3', '2004-06-06', '1');

SET FOREIGN_KEY_CHECKS = 1;
