/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : bbs

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 21/01/2022 22:17:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for revet
-- ----------------------------
DROP TABLE IF EXISTS `revet`;
CREATE TABLE `revet`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_id` int(11) NOT NULL,
  `revet` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of revet
-- ----------------------------
INSERT INTO `revet` VALUES (1, 2, '123123', '111', '2022-01-19 20:34:35');
INSERT INTO `revet` VALUES (2, 2, '1231233', '111', '2022-01-19 20:34:39');
INSERT INTO `revet` VALUES (3, 2, '1231233', '111', '2022-01-19 20:34:40');
INSERT INTO `revet` VALUES (4, 2, '12314123123sdfsdfsdf', '111', '2022-01-19 20:41:24');
INSERT INTO `revet` VALUES (5, 2, '123123', '111', '2022-01-19 20:42:19');
INSERT INTO `revet` VALUES (6, 2, 'dgsdfsdf', '111', '2022-01-19 20:42:23');
INSERT INTO `revet` VALUES (7, 4, 'xcvefsdf', '111', '2022-01-19 20:42:59');
INSERT INTO `revet` VALUES (8, 5, 'sfsdfsdf', '2', '2022-01-21 21:01:06');
INSERT INTO `revet` VALUES (9, 5, 'gggg', '2', '2022-01-21 21:01:10');
INSERT INTO `revet` VALUES (10, 5, 'hsdfwerwqrwerwer', '2', '2022-01-21 21:01:14');
INSERT INTO `revet` VALUES (11, 5, '123123', '777', '2022-01-21 21:14:20');
INSERT INTO `revet` VALUES (12, 1, '33213', 'admin', '2022-01-21 21:39:49');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (6, 'hello', 'hellohellohello', 'admin', '2022-01-21 21:41:16');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '123', '123');
INSERT INTO `users` VALUES (2, '1234', '123');
INSERT INTO `users` VALUES (3, '12314', '123');
INSERT INTO `users` VALUES (4, '123144', '123');
INSERT INTO `users` VALUES (5, '3333', '123');
INSERT INTO `users` VALUES (6, '12345', '123');
INSERT INTO `users` VALUES (7, '111', '111');
INSERT INTO `users` VALUES (8, '222', '222');
INSERT INTO `users` VALUES (9, '2', '2');
INSERT INTO `users` VALUES (10, '777', '777');
INSERT INTO `users` VALUES (11, 'admin', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
