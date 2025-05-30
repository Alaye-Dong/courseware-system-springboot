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

 Date: 30/05/2025 09:26:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_subject
-- ----------------------------
DROP TABLE IF EXISTS `t_subject`;
CREATE TABLE `t_subject`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `subject_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '科目名称',
  `creator_id` int NOT NULL COMMENT '创建人ID，关联 t_user.id',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态: 1-启用/正常, 0-禁用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `creator_id`(`creator_id` ASC) USING BTREE,
  CONSTRAINT `t_subject_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '科目管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_subject
-- ----------------------------
INSERT INTO `t_subject` VALUES (1, '科目一', 1, 1);
INSERT INTO `t_subject` VALUES (2, '语文', 1, 0);
INSERT INTO `t_subject` VALUES (3, '数学', 1, 1);
INSERT INTO `t_subject` VALUES (4, '英语', 2, 1);
INSERT INTO `t_subject` VALUES (5, '物理', 2, 1);
INSERT INTO `t_subject` VALUES (6, '化学', 3, 1);
INSERT INTO `t_subject` VALUES (7, '生物', 3, 1);
INSERT INTO `t_subject` VALUES (8, '历史', 1, 1);
INSERT INTO `t_subject` VALUES (9, '地理', 2, 0);
INSERT INTO `t_subject` VALUES (10, '政治', 3, 1);
INSERT INTO `t_subject` VALUES (11, '信息技术', 1, 1);
INSERT INTO `t_subject` VALUES (12, '添加测试', 1, 1);
INSERT INTO `t_subject` VALUES (13, '科目测试测试', 1, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'zhangsan', '123456', '张三', '1', '江西省南昌市', '131', '3', '2025-05-28', '1');
INSERT INTO `t_user` VALUES (2, 'lisi', '123456', '李四', '1', '江苏省南京市', '13200000001', '3', '1999-05-12', '1');
INSERT INTO `t_user` VALUES (3, 'wangwu', '123456', '王五', '2', '北京市海淀区', '13300000002', '3', '2001-03-18', '1');
INSERT INTO `t_user` VALUES (68, 'zhaoliu', '123456', '赵六', '2', '广东省深圳市', '13400000003', '2', '1998-11-25', '1');
INSERT INTO `t_user` VALUES (69, 'chenqi', '123456', '陈七', '2', '浙江省杭州市', '13500000004', '3', '2002-07-08', '1');
INSERT INTO `t_user` VALUES (70, 'sunba', '123456', '孙八', '1', '湖南省长沙市', '13600000005', '3', '2000-09-01', '1');
INSERT INTO `t_user` VALUES (71, 'zhoujiu', '123456', '周九', '2', '四川省成都市', '13700000006', '2', '1997-12-30', '1');
INSERT INTO `t_user` VALUES (72, 'wushili', '123456', '吴十', '1', '山东省济南市', '13800000007', '3', '2003-04-15', '1');
INSERT INTO `t_user` VALUES (73, 'zhengshi', '123456', '郑十', '2', '福建省厦门市', '13900000008', '2', '1996-02-20', '1');
INSERT INTO `t_user` VALUES (74, 'liuyi', '123456', '刘一', '1', '湖北省武汉市', '14000000009', '3', '1995-08-08', '1');

SET FOREIGN_KEY_CHECKS = 1;
