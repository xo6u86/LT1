/*
Navicat MySQL Data Transfer

Source Server         : LocalHost
Source Server Version : 50402
Source Host           : localhost:3306
Source Database       : l1jdb_tw

Target Server Type    : MYSQL
Target Server Version : 50402
File Encoding         : 65001

Date: 2009-10-13 13:07:14
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `beginner`
-- ----------------------------
DROP TABLE IF EXISTS `beginner`;
CREATE TABLE `beginner` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(6) NOT NULL DEFAULT '0',
  `count` int(10) NOT NULL DEFAULT '0',
  `charge_count` int(10) NOT NULL DEFAULT '0',
  `enchantlvl` int(6) NOT NULL DEFAULT '0',
  `item_name` varchar(50) NOT NULL DEFAULT '',
  `activate` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of beginner
-- ----------------------------
INSERT INTO `beginner` VALUES ('1', '40005', '1', '0', '0', '蠟燭', 'A');
INSERT INTO `beginner` VALUES ('2', '40005', '1', '0', '0', '蠟燭', 'A');
INSERT INTO `beginner` VALUES ('3', '40641', '1', '0', '0', '說話卷軸', 'A');
INSERT INTO `beginner` VALUES ('4', '35', '1', '0', '0', '象牙塔單手劍', 'K');
INSERT INTO `beginner` VALUES ('5', '48', '1', '0', '0', '象牙塔雙手劍', 'K');
INSERT INTO `beginner` VALUES ('6', '147', '1', '0', '0', '象牙塔斧頭', 'K');
INSERT INTO `beginner` VALUES ('7', '105', '1', '0', '0', '象牙塔長矛', 'K');
INSERT INTO `beginner` VALUES ('8', '174', '1', '0', '0', '象牙塔石弓', 'K');
INSERT INTO `beginner` VALUES ('9', '7', '1', '0', '0', '象牙塔短劍', 'K');
INSERT INTO `beginner` VALUES ('10', '49550', '1', '0', '0', '象牙塔箭筒', 'K');
INSERT INTO `beginner` VALUES ('11', '35', '1', '0', '0', '象牙塔單手劍', 'P');
INSERT INTO `beginner` VALUES ('12', '48', '1', '0', '0', '象牙塔雙手劍', 'P');
INSERT INTO `beginner` VALUES ('13', '147', '1', '0', '0', '象牙塔斧頭', 'P');
INSERT INTO `beginner` VALUES ('14', '7', '1', '0', '0', '象牙塔短劍', 'P');
INSERT INTO `beginner` VALUES ('15', '35', '1', '0', '0', '象牙塔單手劍', 'E');
INSERT INTO `beginner` VALUES ('16', '175', '1', '0', '0', '象牙塔長弓', 'E');
INSERT INTO `beginner` VALUES ('17', '174', '1', '0', '0', '象牙塔石弓', 'E');
INSERT INTO `beginner` VALUES ('18', '7', '1', '0', '0', '象牙塔短劍', 'E');
INSERT INTO `beginner` VALUES ('19', '49550', '1', '0', '0', '象牙塔箭筒', 'E');
INSERT INTO `beginner` VALUES ('20', '35', '1', '0', '0', '象牙塔單手劍', 'W');
INSERT INTO `beginner` VALUES ('21', '224', '1', '0', '0', '象牙塔魔杖', 'W');
INSERT INTO `beginner` VALUES ('22', '7', '1', '0', '0', '象牙塔短劍', 'W');
INSERT INTO `beginner` VALUES ('23', '35', '1', '0', '0', '象牙塔單手劍', 'D');
INSERT INTO `beginner` VALUES ('24', '174', '1', '0', '0', '象牙塔石弓', 'D');
INSERT INTO `beginner` VALUES ('25', '73', '1', '0', '0', '象牙塔雙刀', 'D');
INSERT INTO `beginner` VALUES ('26', '156', '1', '0', '0', '象牙塔鋼爪', 'D');
INSERT INTO `beginner` VALUES ('27', '7', '1', '0', '0', '象牙塔短劍', 'D');
INSERT INTO `beginner` VALUES ('28', '49550', '1', '0', '0', '象牙塔箭筒', 'D');
INSERT INTO `beginner` VALUES ('29', '35', '1', '0', '0', '象牙塔單手劍', 'R');
INSERT INTO `beginner` VALUES ('30', '48', '1', '0', '0', '象牙塔雙手劍', 'R');
INSERT INTO `beginner` VALUES ('31', '147', '1', '0', '0', '象牙塔斧頭', 'R');
INSERT INTO `beginner` VALUES ('32', '147', '1', '0', '0', '象牙塔斧頭', 'I');
INSERT INTO `beginner` VALUES ('33', '174', '1', '0', '0', '象牙塔石弓', 'I');
INSERT INTO `beginner` VALUES ('34', '224', '1', '0', '0', '象牙塔魔杖', 'I');
INSERT INTO `beginner` VALUES ('35', '49550', '1', '0', '0', '象牙塔箭筒', 'I');