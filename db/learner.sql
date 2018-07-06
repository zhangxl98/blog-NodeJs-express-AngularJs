/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50703
 Source Host           : localhost:3306
 Source Schema         : learner

 Target Server Type    : MySQL
 Target Server Version : 50703
 File Encoding         : 65001

 Date: 06/07/2018 20:40:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aboutus_table
-- ----------------------------
DROP TABLE IF EXISTS `aboutus_table`;
CREATE TABLE `aboutus_table`  (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pic_src` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `href` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for admin_table
-- ----------------------------
DROP TABLE IF EXISTS `admin_table`;
CREATE TABLE `admin_table`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for banner_table
-- ----------------------------
DROP TABLE IF EXISTS `banner_table`;
CREATE TABLE `banner_table`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `href` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for blog_table
-- ----------------------------
DROP TABLE IF EXISTS `blog_table`;
CREATE TABLE `blog_table`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pic_src` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `big_pic_src` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `summary` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `post_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `author` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `n_view` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for contact_table
-- ----------------------------
DROP TABLE IF EXISTS `contact_table`;
CREATE TABLE `contact_table`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `street` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fax` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `weibo` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `wechat` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for custom_evaluation_table
-- ----------------------------
DROP TABLE IF EXISTS `custom_evaluation_table`;
CREATE TABLE `custom_evaluation_table`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `src` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for intro_table
-- ----------------------------
DROP TABLE IF EXISTS `intro_table`;
CREATE TABLE `intro_table`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `href` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for msg_table
-- ----------------------------
DROP TABLE IF EXISTS `msg_table`;
CREATE TABLE `msg_table`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subject` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for news_table
-- ----------------------------
DROP TABLE IF EXISTS `news_table`;
CREATE TABLE `news_table`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `summary` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ico_src` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `big_pic_src` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
