/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50635
Source Host           : 127.0.0.1:3306
Source Database       : fomagic

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2018-01-02 18:56:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'test', 'fomagic', '0 0/1 * * * ?', '0', '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `schedule_job` VALUES ('6', 'testTask', 'test2', '', '0 0/1 * * * ?', '0', '无参数测试', '2018-01-02 14:44:34');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'test', 'fomagic', '1', '11111', '1084', '2017-11-29 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'testTask', 'test', 'fomagic', '0', null, '1038', '2017-12-01 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'test', 'fomagic', '0', null, '1026', '2017-12-01 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('4', '6', 'testTask', 'test2', '', '0', null, '19', '2018-01-02 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'testTask', 'test', 'fomagic', '0', null, '1051', '2018-01-02 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('6', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 15:30:21');
INSERT INTO `schedule_job_log` VALUES ('7', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 15:32:00');
INSERT INTO `schedule_job_log` VALUES ('8', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 15:32:00');
INSERT INTO `schedule_job_log` VALUES ('9', '6', 'testTask', 'test2', '', '0', null, '6', '2018-01-02 15:33:00');
INSERT INTO `schedule_job_log` VALUES ('10', '1', 'testTask', 'test', 'fomagic', '0', null, '1040', '2018-01-02 15:33:00');
INSERT INTO `schedule_job_log` VALUES ('11', '6', 'testTask', 'test2', '', '0', null, '19', '2018-01-02 15:34:00');
INSERT INTO `schedule_job_log` VALUES ('12', '1', 'testTask', 'test', 'fomagic', '0', null, '1026', '2018-01-02 15:34:00');
INSERT INTO `schedule_job_log` VALUES ('13', '6', 'testTask', 'test2', '', '0', null, '8', '2018-01-02 15:35:00');
INSERT INTO `schedule_job_log` VALUES ('14', '1', 'testTask', 'test', 'fomagic', '0', null, '1020', '2018-01-02 15:35:00');
INSERT INTO `schedule_job_log` VALUES ('15', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 15:36:00');
INSERT INTO `schedule_job_log` VALUES ('16', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 15:36:00');
INSERT INTO `schedule_job_log` VALUES ('17', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 15:37:00');
INSERT INTO `schedule_job_log` VALUES ('18', '1', 'testTask', 'test', 'fomagic', '0', null, '1009', '2018-01-02 15:37:00');
INSERT INTO `schedule_job_log` VALUES ('19', '6', 'testTask', 'test2', '', '0', null, '3', '2018-01-02 15:38:00');
INSERT INTO `schedule_job_log` VALUES ('20', '1', 'testTask', 'test', 'fomagic', '0', null, '1014', '2018-01-02 15:38:00');
INSERT INTO `schedule_job_log` VALUES ('21', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 15:39:00');
INSERT INTO `schedule_job_log` VALUES ('22', '1', 'testTask', 'test', 'fomagic', '0', null, '1007', '2018-01-02 15:39:00');
INSERT INTO `schedule_job_log` VALUES ('23', '6', 'testTask', 'test2', '', '0', null, '2', '2018-01-02 15:40:00');
INSERT INTO `schedule_job_log` VALUES ('24', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 15:40:00');
INSERT INTO `schedule_job_log` VALUES ('25', '6', 'testTask', 'test2', '', '0', null, '3', '2018-01-02 15:41:00');
INSERT INTO `schedule_job_log` VALUES ('26', '1', 'testTask', 'test', 'fomagic', '0', null, '1008', '2018-01-02 15:41:00');
INSERT INTO `schedule_job_log` VALUES ('27', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 15:42:00');
INSERT INTO `schedule_job_log` VALUES ('28', '1', 'testTask', 'test', 'fomagic', '0', null, '1009', '2018-01-02 15:42:00');
INSERT INTO `schedule_job_log` VALUES ('29', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 15:43:00');
INSERT INTO `schedule_job_log` VALUES ('30', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 15:43:00');
INSERT INTO `schedule_job_log` VALUES ('31', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 15:44:00');
INSERT INTO `schedule_job_log` VALUES ('32', '1', 'testTask', 'test', 'fomagic', '0', null, '1012', '2018-01-02 15:44:00');
INSERT INTO `schedule_job_log` VALUES ('33', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 15:45:00');
INSERT INTO `schedule_job_log` VALUES ('34', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 15:45:00');
INSERT INTO `schedule_job_log` VALUES ('35', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 15:46:00');
INSERT INTO `schedule_job_log` VALUES ('36', '1', 'testTask', 'test', 'fomagic', '0', null, '1002', '2018-01-02 15:46:00');
INSERT INTO `schedule_job_log` VALUES ('37', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 15:47:00');
INSERT INTO `schedule_job_log` VALUES ('38', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 15:47:00');
INSERT INTO `schedule_job_log` VALUES ('39', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 15:48:00');
INSERT INTO `schedule_job_log` VALUES ('40', '1', 'testTask', 'test', 'fomagic', '0', null, '1038', '2018-01-02 15:48:00');
INSERT INTO `schedule_job_log` VALUES ('41', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 15:49:00');
INSERT INTO `schedule_job_log` VALUES ('42', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 15:49:00');
INSERT INTO `schedule_job_log` VALUES ('43', '6', 'testTask', 'test2', '', '0', null, '15', '2018-01-02 15:50:00');
INSERT INTO `schedule_job_log` VALUES ('44', '1', 'testTask', 'test', 'fomagic', '0', null, '1035', '2018-01-02 15:50:00');
INSERT INTO `schedule_job_log` VALUES ('45', '6', 'testTask', 'test2', '', '0', null, '7', '2018-01-02 15:51:00');
INSERT INTO `schedule_job_log` VALUES ('46', '1', 'testTask', 'test', 'fomagic', '0', null, '1033', '2018-01-02 15:51:00');
INSERT INTO `schedule_job_log` VALUES ('47', '6', 'testTask', 'test2', '', '0', null, '10', '2018-01-02 15:52:00');
INSERT INTO `schedule_job_log` VALUES ('48', '1', 'testTask', 'test', 'fomagic', '0', null, '1032', '2018-01-02 15:52:00');
INSERT INTO `schedule_job_log` VALUES ('49', '6', 'testTask', 'test2', '', '0', null, '7', '2018-01-02 15:53:00');
INSERT INTO `schedule_job_log` VALUES ('50', '1', 'testTask', 'test', 'fomagic', '0', null, '1041', '2018-01-02 15:53:00');
INSERT INTO `schedule_job_log` VALUES ('51', '6', 'testTask', 'test2', '', '0', null, '8', '2018-01-02 15:54:00');
INSERT INTO `schedule_job_log` VALUES ('52', '1', 'testTask', 'test', 'fomagic', '0', null, '1026', '2018-01-02 15:54:00');
INSERT INTO `schedule_job_log` VALUES ('53', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 15:55:00');
INSERT INTO `schedule_job_log` VALUES ('54', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 15:55:00');
INSERT INTO `schedule_job_log` VALUES ('55', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 15:56:00');
INSERT INTO `schedule_job_log` VALUES ('56', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 15:56:00');
INSERT INTO `schedule_job_log` VALUES ('57', '6', 'testTask', 'test2', '', '0', null, '10', '2018-01-02 15:57:00');
INSERT INTO `schedule_job_log` VALUES ('58', '1', 'testTask', 'test', 'fomagic', '0', null, '1061', '2018-01-02 15:57:00');
INSERT INTO `schedule_job_log` VALUES ('59', '6', 'testTask', 'test2', '', '0', null, '8', '2018-01-02 15:58:00');
INSERT INTO `schedule_job_log` VALUES ('60', '1', 'testTask', 'test', 'fomagic', '0', null, '1028', '2018-01-02 15:58:00');
INSERT INTO `schedule_job_log` VALUES ('61', '6', 'testTask', 'test2', '', '0', null, '3', '2018-01-02 15:59:00');
INSERT INTO `schedule_job_log` VALUES ('62', '1', 'testTask', 'test', 'fomagic', '0', null, '1006', '2018-01-02 15:59:00');
INSERT INTO `schedule_job_log` VALUES ('63', '6', 'testTask', 'test2', '', '0', null, '15', '2018-01-02 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('64', '1', 'testTask', 'test', 'fomagic', '0', null, '1067', '2018-01-02 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('65', '6', 'testTask', 'test2', '', '0', null, '6', '2018-01-02 16:01:00');
INSERT INTO `schedule_job_log` VALUES ('66', '1', 'testTask', 'test', 'fomagic', '0', null, '1033', '2018-01-02 16:01:00');
INSERT INTO `schedule_job_log` VALUES ('67', '6', 'testTask', 'test2', '', '0', null, '4', '2018-01-02 16:29:00');
INSERT INTO `schedule_job_log` VALUES ('68', '1', 'testTask', 'test', 'fomagic', '0', null, '1018', '2018-01-02 16:29:00');
INSERT INTO `schedule_job_log` VALUES ('69', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('70', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('71', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 16:31:00');
INSERT INTO `schedule_job_log` VALUES ('72', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 16:31:00');
INSERT INTO `schedule_job_log` VALUES ('73', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 16:32:00');
INSERT INTO `schedule_job_log` VALUES ('74', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 16:32:00');
INSERT INTO `schedule_job_log` VALUES ('75', '6', 'testTask', 'test2', '', '0', null, '2', '2018-01-02 16:33:00');
INSERT INTO `schedule_job_log` VALUES ('76', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 16:33:00');
INSERT INTO `schedule_job_log` VALUES ('77', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 16:34:00');
INSERT INTO `schedule_job_log` VALUES ('78', '1', 'testTask', 'test', 'fomagic', '0', null, '1007', '2018-01-02 16:34:00');
INSERT INTO `schedule_job_log` VALUES ('79', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 16:35:00');
INSERT INTO `schedule_job_log` VALUES ('80', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 16:35:00');
INSERT INTO `schedule_job_log` VALUES ('81', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 16:36:00');
INSERT INTO `schedule_job_log` VALUES ('82', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 16:36:00');
INSERT INTO `schedule_job_log` VALUES ('83', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 16:37:00');
INSERT INTO `schedule_job_log` VALUES ('84', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 16:37:00');
INSERT INTO `schedule_job_log` VALUES ('85', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 16:38:00');
INSERT INTO `schedule_job_log` VALUES ('86', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 16:38:00');
INSERT INTO `schedule_job_log` VALUES ('87', '6', 'testTask', 'test2', '', '0', null, '3', '2018-01-02 16:39:00');
INSERT INTO `schedule_job_log` VALUES ('88', '1', 'testTask', 'test', 'fomagic', '0', null, '1007', '2018-01-02 16:39:00');
INSERT INTO `schedule_job_log` VALUES ('89', '6', 'testTask', 'test2', '', '0', null, '4', '2018-01-02 16:40:00');
INSERT INTO `schedule_job_log` VALUES ('90', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 16:40:00');
INSERT INTO `schedule_job_log` VALUES ('91', '6', 'testTask', 'test2', '', '0', null, '22', '2018-01-02 16:42:00');
INSERT INTO `schedule_job_log` VALUES ('92', '1', 'testTask', 'test', 'fomagic', '0', null, '1053', '2018-01-02 16:42:00');
INSERT INTO `schedule_job_log` VALUES ('93', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 16:43:00');
INSERT INTO `schedule_job_log` VALUES ('94', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 16:43:00');
INSERT INTO `schedule_job_log` VALUES ('95', '6', 'testTask', 'test2', '', '0', null, '10', '2018-01-02 16:44:00');
INSERT INTO `schedule_job_log` VALUES ('96', '1', 'testTask', 'test', 'fomagic', '0', null, '1006', '2018-01-02 16:44:00');
INSERT INTO `schedule_job_log` VALUES ('97', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 16:45:00');
INSERT INTO `schedule_job_log` VALUES ('98', '1', 'testTask', 'test', 'fomagic', '0', null, '1007', '2018-01-02 16:45:00');
INSERT INTO `schedule_job_log` VALUES ('99', '6', 'testTask', 'test2', '', '0', null, '3', '2018-01-02 16:46:00');
INSERT INTO `schedule_job_log` VALUES ('100', '1', 'testTask', 'test', 'fomagic', '0', null, '1008', '2018-01-02 16:46:00');
INSERT INTO `schedule_job_log` VALUES ('101', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 16:47:00');
INSERT INTO `schedule_job_log` VALUES ('102', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 16:47:00');
INSERT INTO `schedule_job_log` VALUES ('103', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 16:48:00');
INSERT INTO `schedule_job_log` VALUES ('104', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 16:48:00');
INSERT INTO `schedule_job_log` VALUES ('105', '6', 'testTask', 'test2', '', '0', null, '12', '2018-01-02 16:49:00');
INSERT INTO `schedule_job_log` VALUES ('106', '1', 'testTask', 'test', 'fomagic', '0', null, '1034', '2018-01-02 16:49:00');
INSERT INTO `schedule_job_log` VALUES ('107', '6', 'testTask', 'test2', '', '0', null, '6', '2018-01-02 16:51:00');
INSERT INTO `schedule_job_log` VALUES ('108', '1', 'testTask', 'test', 'fomagic', '0', null, '1029', '2018-01-02 16:51:00');
INSERT INTO `schedule_job_log` VALUES ('109', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 16:52:00');
INSERT INTO `schedule_job_log` VALUES ('110', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 16:52:00');
INSERT INTO `schedule_job_log` VALUES ('111', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 16:53:00');
INSERT INTO `schedule_job_log` VALUES ('112', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 16:53:00');
INSERT INTO `schedule_job_log` VALUES ('113', '6', 'testTask', 'test2', '', '0', null, '2', '2018-01-02 16:54:00');
INSERT INTO `schedule_job_log` VALUES ('114', '1', 'testTask', 'test', 'fomagic', '0', null, '1012', '2018-01-02 16:54:00');
INSERT INTO `schedule_job_log` VALUES ('115', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 16:55:00');
INSERT INTO `schedule_job_log` VALUES ('116', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 16:55:00');
INSERT INTO `schedule_job_log` VALUES ('117', '6', 'testTask', 'test2', '', '0', null, '9', '2018-01-02 16:56:00');
INSERT INTO `schedule_job_log` VALUES ('118', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 16:56:00');
INSERT INTO `schedule_job_log` VALUES ('119', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 16:57:00');
INSERT INTO `schedule_job_log` VALUES ('120', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 16:57:00');
INSERT INTO `schedule_job_log` VALUES ('121', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 16:58:00');
INSERT INTO `schedule_job_log` VALUES ('122', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 16:58:00');
INSERT INTO `schedule_job_log` VALUES ('123', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 16:59:00');
INSERT INTO `schedule_job_log` VALUES ('124', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 16:59:00');
INSERT INTO `schedule_job_log` VALUES ('125', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('126', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('127', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:01:00');
INSERT INTO `schedule_job_log` VALUES ('128', '1', 'testTask', 'test', 'fomagic', '0', null, '1012', '2018-01-02 17:01:00');
INSERT INTO `schedule_job_log` VALUES ('129', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:02:00');
INSERT INTO `schedule_job_log` VALUES ('130', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 17:02:00');
INSERT INTO `schedule_job_log` VALUES ('131', '6', 'testTask', 'test2', '', '0', null, '9', '2018-01-02 17:03:00');
INSERT INTO `schedule_job_log` VALUES ('132', '1', 'testTask', 'test', 'fomagic', '0', null, '1010', '2018-01-02 17:03:00');
INSERT INTO `schedule_job_log` VALUES ('133', '6', 'testTask', 'test2', '', '0', null, '3', '2018-01-02 17:04:00');
INSERT INTO `schedule_job_log` VALUES ('134', '1', 'testTask', 'test', 'fomagic', '0', null, '1006', '2018-01-02 17:04:00');
INSERT INTO `schedule_job_log` VALUES ('135', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:05:00');
INSERT INTO `schedule_job_log` VALUES ('136', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 17:05:00');
INSERT INTO `schedule_job_log` VALUES ('137', '6', 'testTask', 'test2', '', '0', null, '4', '2018-01-02 17:06:00');
INSERT INTO `schedule_job_log` VALUES ('138', '1', 'testTask', 'test', 'fomagic', '0', null, '1006', '2018-01-02 17:06:00');
INSERT INTO `schedule_job_log` VALUES ('139', '6', 'testTask', 'test2', '', '0', null, '2', '2018-01-02 17:07:00');
INSERT INTO `schedule_job_log` VALUES ('140', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 17:07:00');
INSERT INTO `schedule_job_log` VALUES ('141', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:08:00');
INSERT INTO `schedule_job_log` VALUES ('142', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 17:08:00');
INSERT INTO `schedule_job_log` VALUES ('143', '6', 'testTask', 'test2', '', '0', null, '6', '2018-01-02 17:09:00');
INSERT INTO `schedule_job_log` VALUES ('144', '1', 'testTask', 'test', 'fomagic', '0', null, '1020', '2018-01-02 17:09:00');
INSERT INTO `schedule_job_log` VALUES ('145', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:10:00');
INSERT INTO `schedule_job_log` VALUES ('146', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 17:10:00');
INSERT INTO `schedule_job_log` VALUES ('147', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 17:11:00');
INSERT INTO `schedule_job_log` VALUES ('148', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 17:11:00');
INSERT INTO `schedule_job_log` VALUES ('149', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 17:12:00');
INSERT INTO `schedule_job_log` VALUES ('150', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 17:12:00');
INSERT INTO `schedule_job_log` VALUES ('151', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:13:00');
INSERT INTO `schedule_job_log` VALUES ('152', '1', 'testTask', 'test', 'fomagic', '0', null, '1001', '2018-01-02 17:13:00');
INSERT INTO `schedule_job_log` VALUES ('153', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 17:14:00');
INSERT INTO `schedule_job_log` VALUES ('154', '1', 'testTask', 'test', 'fomagic', '0', null, '1010', '2018-01-02 17:14:00');
INSERT INTO `schedule_job_log` VALUES ('155', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:15:00');
INSERT INTO `schedule_job_log` VALUES ('156', '1', 'testTask', 'test', 'fomagic', '0', null, '1010', '2018-01-02 17:15:00');
INSERT INTO `schedule_job_log` VALUES ('157', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:16:00');
INSERT INTO `schedule_job_log` VALUES ('158', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 17:16:00');
INSERT INTO `schedule_job_log` VALUES ('159', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:17:00');
INSERT INTO `schedule_job_log` VALUES ('160', '1', 'testTask', 'test', 'fomagic', '0', null, '1040', '2018-01-02 17:17:00');
INSERT INTO `schedule_job_log` VALUES ('161', '6', 'testTask', 'test2', '', '0', null, '2', '2018-01-02 17:18:00');
INSERT INTO `schedule_job_log` VALUES ('162', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 17:18:00');
INSERT INTO `schedule_job_log` VALUES ('163', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 17:19:00');
INSERT INTO `schedule_job_log` VALUES ('164', '1', 'testTask', 'test', 'fomagic', '0', null, '1006', '2018-01-02 17:19:00');
INSERT INTO `schedule_job_log` VALUES ('165', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:20:00');
INSERT INTO `schedule_job_log` VALUES ('166', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 17:20:00');
INSERT INTO `schedule_job_log` VALUES ('167', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:21:00');
INSERT INTO `schedule_job_log` VALUES ('168', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 17:21:00');
INSERT INTO `schedule_job_log` VALUES ('169', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:22:00');
INSERT INTO `schedule_job_log` VALUES ('170', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 17:22:00');
INSERT INTO `schedule_job_log` VALUES ('171', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:23:00');
INSERT INTO `schedule_job_log` VALUES ('172', '1', 'testTask', 'test', 'fomagic', '0', null, '1033', '2018-01-02 17:23:00');
INSERT INTO `schedule_job_log` VALUES ('173', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:24:00');
INSERT INTO `schedule_job_log` VALUES ('174', '1', 'testTask', 'test', 'fomagic', '0', null, '1006', '2018-01-02 17:24:00');
INSERT INTO `schedule_job_log` VALUES ('175', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:25:00');
INSERT INTO `schedule_job_log` VALUES ('176', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 17:25:00');
INSERT INTO `schedule_job_log` VALUES ('177', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 17:26:00');
INSERT INTO `schedule_job_log` VALUES ('178', '1', 'testTask', 'test', 'fomagic', '0', null, '1013', '2018-01-02 17:26:00');
INSERT INTO `schedule_job_log` VALUES ('179', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:27:00');
INSERT INTO `schedule_job_log` VALUES ('180', '1', 'testTask', 'test', 'fomagic', '0', null, '1010', '2018-01-02 17:27:00');
INSERT INTO `schedule_job_log` VALUES ('181', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:28:00');
INSERT INTO `schedule_job_log` VALUES ('182', '1', 'testTask', 'test', 'fomagic', '0', null, '1010', '2018-01-02 17:28:00');
INSERT INTO `schedule_job_log` VALUES ('183', '6', 'testTask', 'test2', '', '0', null, '2', '2018-01-02 17:29:00');
INSERT INTO `schedule_job_log` VALUES ('184', '1', 'testTask', 'test', 'fomagic', '0', null, '1023', '2018-01-02 17:29:00');
INSERT INTO `schedule_job_log` VALUES ('185', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('186', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('187', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:31:00');
INSERT INTO `schedule_job_log` VALUES ('188', '1', 'testTask', 'test', 'fomagic', '0', null, '1015', '2018-01-02 17:31:00');
INSERT INTO `schedule_job_log` VALUES ('189', '6', 'testTask', 'test2', '', '0', null, '2', '2018-01-02 17:32:00');
INSERT INTO `schedule_job_log` VALUES ('190', '1', 'testTask', 'test', 'fomagic', '0', null, '1008', '2018-01-02 17:32:00');
INSERT INTO `schedule_job_log` VALUES ('191', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:33:00');
INSERT INTO `schedule_job_log` VALUES ('192', '1', 'testTask', 'test', 'fomagic', '0', null, '1006', '2018-01-02 17:33:00');
INSERT INTO `schedule_job_log` VALUES ('193', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:34:00');
INSERT INTO `schedule_job_log` VALUES ('194', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 17:34:00');
INSERT INTO `schedule_job_log` VALUES ('195', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 17:35:00');
INSERT INTO `schedule_job_log` VALUES ('196', '1', 'testTask', 'test', 'fomagic', '0', null, '1006', '2018-01-02 17:35:00');
INSERT INTO `schedule_job_log` VALUES ('197', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:36:00');
INSERT INTO `schedule_job_log` VALUES ('198', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 17:36:00');
INSERT INTO `schedule_job_log` VALUES ('199', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:37:00');
INSERT INTO `schedule_job_log` VALUES ('200', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 17:37:00');
INSERT INTO `schedule_job_log` VALUES ('201', '6', 'testTask', 'test2', '', '0', null, '4', '2018-01-02 17:38:00');
INSERT INTO `schedule_job_log` VALUES ('202', '1', 'testTask', 'test', 'fomagic', '0', null, '1021', '2018-01-02 17:38:00');
INSERT INTO `schedule_job_log` VALUES ('203', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 17:39:00');
INSERT INTO `schedule_job_log` VALUES ('204', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 17:39:00');
INSERT INTO `schedule_job_log` VALUES ('205', '6', 'testTask', 'test2', '', '0', null, '8', '2018-01-02 17:40:00');
INSERT INTO `schedule_job_log` VALUES ('206', '1', 'testTask', 'test', 'fomagic', '0', null, '1009', '2018-01-02 17:40:00');
INSERT INTO `schedule_job_log` VALUES ('207', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 17:41:00');
INSERT INTO `schedule_job_log` VALUES ('208', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 17:41:00');
INSERT INTO `schedule_job_log` VALUES ('209', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:42:00');
INSERT INTO `schedule_job_log` VALUES ('210', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 17:42:00');
INSERT INTO `schedule_job_log` VALUES ('211', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:43:00');
INSERT INTO `schedule_job_log` VALUES ('212', '1', 'testTask', 'test', 'fomagic', '0', null, '1002', '2018-01-02 17:43:00');
INSERT INTO `schedule_job_log` VALUES ('213', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:44:00');
INSERT INTO `schedule_job_log` VALUES ('214', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 17:44:00');
INSERT INTO `schedule_job_log` VALUES ('215', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:45:00');
INSERT INTO `schedule_job_log` VALUES ('216', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 17:45:00');
INSERT INTO `schedule_job_log` VALUES ('217', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:46:00');
INSERT INTO `schedule_job_log` VALUES ('218', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 17:46:00');
INSERT INTO `schedule_job_log` VALUES ('219', '6', 'testTask', 'test2', '', '0', null, '2', '2018-01-02 17:47:00');
INSERT INTO `schedule_job_log` VALUES ('220', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 17:47:00');
INSERT INTO `schedule_job_log` VALUES ('221', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:48:00');
INSERT INTO `schedule_job_log` VALUES ('222', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 17:48:00');
INSERT INTO `schedule_job_log` VALUES ('223', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:49:00');
INSERT INTO `schedule_job_log` VALUES ('224', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 17:49:00');
INSERT INTO `schedule_job_log` VALUES ('225', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:50:00');
INSERT INTO `schedule_job_log` VALUES ('226', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 17:50:00');
INSERT INTO `schedule_job_log` VALUES ('227', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:51:00');
INSERT INTO `schedule_job_log` VALUES ('228', '1', 'testTask', 'test', 'fomagic', '0', null, '1008', '2018-01-02 17:51:00');
INSERT INTO `schedule_job_log` VALUES ('229', '6', 'testTask', 'test2', '', '0', null, '3', '2018-01-02 17:52:00');
INSERT INTO `schedule_job_log` VALUES ('230', '1', 'testTask', 'test', 'fomagic', '0', null, '1024', '2018-01-02 17:52:00');
INSERT INTO `schedule_job_log` VALUES ('231', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 17:53:00');
INSERT INTO `schedule_job_log` VALUES ('232', '1', 'testTask', 'test', 'fomagic', '0', null, '1008', '2018-01-02 17:53:00');
INSERT INTO `schedule_job_log` VALUES ('233', '6', 'testTask', 'test2', '', '0', null, '3', '2018-01-02 17:55:00');
INSERT INTO `schedule_job_log` VALUES ('234', '1', 'testTask', 'test', 'fomagic', '0', null, '1034', '2018-01-02 17:55:00');
INSERT INTO `schedule_job_log` VALUES ('235', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:56:00');
INSERT INTO `schedule_job_log` VALUES ('236', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 17:56:00');
INSERT INTO `schedule_job_log` VALUES ('237', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 17:57:00');
INSERT INTO `schedule_job_log` VALUES ('238', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 17:57:00');
INSERT INTO `schedule_job_log` VALUES ('239', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 17:58:00');
INSERT INTO `schedule_job_log` VALUES ('240', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 17:58:00');
INSERT INTO `schedule_job_log` VALUES ('241', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 17:59:00');
INSERT INTO `schedule_job_log` VALUES ('242', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 17:59:00');
INSERT INTO `schedule_job_log` VALUES ('243', '6', 'testTask', 'test2', '', '0', null, '10', '2018-01-02 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('244', '1', 'testTask', 'test', 'fomagic', '0', null, '1049', '2018-01-02 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('245', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 18:01:00');
INSERT INTO `schedule_job_log` VALUES ('246', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 18:01:00');
INSERT INTO `schedule_job_log` VALUES ('247', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 18:02:00');
INSERT INTO `schedule_job_log` VALUES ('248', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 18:02:00');
INSERT INTO `schedule_job_log` VALUES ('249', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 18:03:00');
INSERT INTO `schedule_job_log` VALUES ('250', '1', 'testTask', 'test', 'fomagic', '0', null, '1013', '2018-01-02 18:03:00');
INSERT INTO `schedule_job_log` VALUES ('251', '6', 'testTask', 'test2', '', '0', null, '7', '2018-01-02 18:04:00');
INSERT INTO `schedule_job_log` VALUES ('252', '1', 'testTask', 'test', 'fomagic', '0', null, '1011', '2018-01-02 18:04:00');
INSERT INTO `schedule_job_log` VALUES ('253', '6', 'testTask', 'test2', '', '0', null, '3', '2018-01-02 18:05:00');
INSERT INTO `schedule_job_log` VALUES ('254', '1', 'testTask', 'test', 'fomagic', '0', null, '1008', '2018-01-02 18:05:00');
INSERT INTO `schedule_job_log` VALUES ('255', '6', 'testTask', 'test2', '', '0', null, '5', '2018-01-02 18:06:00');
INSERT INTO `schedule_job_log` VALUES ('256', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 18:06:00');
INSERT INTO `schedule_job_log` VALUES ('257', '6', 'testTask', 'test2', '', '0', null, '7', '2018-01-02 18:07:00');
INSERT INTO `schedule_job_log` VALUES ('258', '1', 'testTask', 'test', 'fomagic', '0', null, '1020', '2018-01-02 18:07:00');
INSERT INTO `schedule_job_log` VALUES ('259', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 18:08:00');
INSERT INTO `schedule_job_log` VALUES ('260', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 18:08:00');
INSERT INTO `schedule_job_log` VALUES ('261', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 18:09:00');
INSERT INTO `schedule_job_log` VALUES ('262', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 18:09:00');
INSERT INTO `schedule_job_log` VALUES ('263', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 18:10:00');
INSERT INTO `schedule_job_log` VALUES ('264', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 18:10:00');
INSERT INTO `schedule_job_log` VALUES ('265', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 18:11:00');
INSERT INTO `schedule_job_log` VALUES ('266', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 18:11:00');
INSERT INTO `schedule_job_log` VALUES ('267', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 18:12:00');
INSERT INTO `schedule_job_log` VALUES ('268', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 18:12:00');
INSERT INTO `schedule_job_log` VALUES ('269', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 18:13:00');
INSERT INTO `schedule_job_log` VALUES ('270', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 18:13:00');
INSERT INTO `schedule_job_log` VALUES ('271', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 18:14:00');
INSERT INTO `schedule_job_log` VALUES ('272', '1', 'testTask', 'test', 'fomagic', '0', null, '1009', '2018-01-02 18:14:00');
INSERT INTO `schedule_job_log` VALUES ('273', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 18:15:00');
INSERT INTO `schedule_job_log` VALUES ('274', '1', 'testTask', 'test', 'fomagic', '0', null, '1015', '2018-01-02 18:15:00');
INSERT INTO `schedule_job_log` VALUES ('275', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 18:16:00');
INSERT INTO `schedule_job_log` VALUES ('276', '1', 'testTask', 'test', 'fomagic', '0', null, '1010', '2018-01-02 18:16:00');
INSERT INTO `schedule_job_log` VALUES ('277', '6', 'testTask', 'test2', '', '0', null, '2', '2018-01-02 18:17:00');
INSERT INTO `schedule_job_log` VALUES ('278', '1', 'testTask', 'test', 'fomagic', '0', null, '1009', '2018-01-02 18:17:00');
INSERT INTO `schedule_job_log` VALUES ('279', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 18:18:00');
INSERT INTO `schedule_job_log` VALUES ('280', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 18:18:00');
INSERT INTO `schedule_job_log` VALUES ('281', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 18:19:00');
INSERT INTO `schedule_job_log` VALUES ('282', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 18:19:00');
INSERT INTO `schedule_job_log` VALUES ('283', '6', 'testTask', 'test2', '', '0', null, '2', '2018-01-02 18:20:00');
INSERT INTO `schedule_job_log` VALUES ('284', '1', 'testTask', 'test', 'fomagic', '0', null, '1006', '2018-01-02 18:20:00');
INSERT INTO `schedule_job_log` VALUES ('285', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 18:21:00');
INSERT INTO `schedule_job_log` VALUES ('286', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 18:21:00');
INSERT INTO `schedule_job_log` VALUES ('287', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 18:22:00');
INSERT INTO `schedule_job_log` VALUES ('288', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 18:22:00');
INSERT INTO `schedule_job_log` VALUES ('289', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 18:23:00');
INSERT INTO `schedule_job_log` VALUES ('290', '1', 'testTask', 'test', 'fomagic', '0', null, '1007', '2018-01-02 18:23:00');
INSERT INTO `schedule_job_log` VALUES ('291', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 18:24:00');
INSERT INTO `schedule_job_log` VALUES ('292', '1', 'testTask', 'test', 'fomagic', '0', null, '1010', '2018-01-02 18:24:00');
INSERT INTO `schedule_job_log` VALUES ('293', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 18:25:00');
INSERT INTO `schedule_job_log` VALUES ('294', '1', 'testTask', 'test', 'fomagic', '0', null, '1007', '2018-01-02 18:25:00');
INSERT INTO `schedule_job_log` VALUES ('295', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 18:26:00');
INSERT INTO `schedule_job_log` VALUES ('296', '1', 'testTask', 'test', 'fomagic', '0', null, '1004', '2018-01-02 18:26:00');
INSERT INTO `schedule_job_log` VALUES ('297', '6', 'testTask', 'test2', '', '0', null, '7', '2018-01-02 18:27:00');
INSERT INTO `schedule_job_log` VALUES ('298', '1', 'testTask', 'test', 'fomagic', '0', null, '1024', '2018-01-02 18:27:00');
INSERT INTO `schedule_job_log` VALUES ('299', '6', 'testTask', 'test2', '', '0', null, '3', '2018-01-02 18:28:00');
INSERT INTO `schedule_job_log` VALUES ('300', '1', 'testTask', 'test', 'fomagic', '0', null, '1008', '2018-01-02 18:28:00');
INSERT INTO `schedule_job_log` VALUES ('301', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 18:29:00');
INSERT INTO `schedule_job_log` VALUES ('302', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 18:29:00');
INSERT INTO `schedule_job_log` VALUES ('303', '6', 'testTask', 'test2', '', '0', null, '2', '2018-01-02 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('304', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('305', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 18:31:00');
INSERT INTO `schedule_job_log` VALUES ('306', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 18:31:00');
INSERT INTO `schedule_job_log` VALUES ('307', '6', 'testTask', 'test2', '', '0', null, '9', '2018-01-02 18:40:00');
INSERT INTO `schedule_job_log` VALUES ('308', '1', 'testTask', 'test', 'fomagic', '0', null, '1040', '2018-01-02 18:40:00');
INSERT INTO `schedule_job_log` VALUES ('309', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 18:41:00');
INSERT INTO `schedule_job_log` VALUES ('310', '1', 'testTask', 'test', 'fomagic', '0', null, '1008', '2018-01-02 18:41:00');
INSERT INTO `schedule_job_log` VALUES ('311', '6', 'testTask', 'test2', '', '0', null, '15', '2018-01-02 18:42:00');
INSERT INTO `schedule_job_log` VALUES ('312', '1', 'testTask', 'test', 'fomagic', '0', null, '1038', '2018-01-02 18:42:00');
INSERT INTO `schedule_job_log` VALUES ('313', '6', 'testTask', 'test2', '', '0', null, '3', '2018-01-02 18:43:00');
INSERT INTO `schedule_job_log` VALUES ('314', '1', 'testTask', 'test', 'fomagic', '0', null, '1033', '2018-01-02 18:43:00');
INSERT INTO `schedule_job_log` VALUES ('315', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 18:44:00');
INSERT INTO `schedule_job_log` VALUES ('316', '1', 'testTask', 'test', 'fomagic', '0', null, '1007', '2018-01-02 18:44:00');
INSERT INTO `schedule_job_log` VALUES ('317', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 18:45:00');
INSERT INTO `schedule_job_log` VALUES ('318', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 18:45:00');
INSERT INTO `schedule_job_log` VALUES ('319', '6', 'testTask', 'test2', '', '0', null, '1', '2018-01-02 18:46:00');
INSERT INTO `schedule_job_log` VALUES ('320', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 18:46:00');
INSERT INTO `schedule_job_log` VALUES ('321', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 18:47:00');
INSERT INTO `schedule_job_log` VALUES ('322', '1', 'testTask', 'test', 'fomagic', '0', null, '1005', '2018-01-02 18:47:00');
INSERT INTO `schedule_job_log` VALUES ('323', '6', 'testTask', 'test2', '', '0', null, '0', '2018-01-02 18:48:00');
INSERT INTO `schedule_job_log` VALUES ('324', '1', 'testTask', 'test', 'fomagic', '0', null, '1003', '2018-01-02 18:48:00');
INSERT INTO `schedule_job_log` VALUES ('325', '6', 'testTask', 'test2', '', '0', null, '21', '2018-01-02 18:49:00');
INSERT INTO `schedule_job_log` VALUES ('326', '1', 'testTask', 'test', 'fomagic', '0', null, '1077', '2018-01-02 18:49:00');
INSERT INTO `schedule_job_log` VALUES ('327', '6', 'testTask', 'test2', '', '0', null, '10', '2018-01-02 18:51:00');
INSERT INTO `schedule_job_log` VALUES ('328', '1', 'testTask', 'test', 'fomagic', '0', null, '1038', '2018-01-02 18:51:00');
INSERT INTO `schedule_job_log` VALUES ('329', '6', 'testTask', 'test2', '', '0', null, '7', '2018-01-02 18:52:00');
INSERT INTO `schedule_job_log` VALUES ('330', '1', 'testTask', 'test', 'fomagic', '0', null, '1025', '2018-01-02 18:52:00');
INSERT INTO `schedule_job_log` VALUES ('331', '6', 'testTask', 'test2', '', '0', null, '31', '2018-01-02 18:53:00');
INSERT INTO `schedule_job_log` VALUES ('332', '1', 'testTask', 'test', 'fomagic', '0', null, '1055', '2018-01-02 18:53:00');
INSERT INTO `schedule_job_log` VALUES ('333', '6', 'testTask', 'test2', '', '0', null, '2', '2018-01-02 18:56:00');
INSERT INTO `schedule_job_log` VALUES ('334', '1', 'testTask', 'test', 'fomagic', '0', null, '1026', '2018-01-02 18:56:00');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '测试', 'ok', '111', '0', '0:0:0:0', '2018-01-02 17:53:02');
INSERT INTO `sys_log` VALUES ('2', 'admin', '登录后台', 'com.fomagic.module.sys.controller.SysLoginController.sysIndex()', '{\"menuList\":[{\"icon\":\"fa fa-cog\",\"list\":[{\"icon\":\"fa fa-user\",\"menuId\":2,\"name\":\"管理员列表\",\"orderNum\":1,\"parentId\":1,\"type\":1,\"url\":\"sys/user\"},{\"icon\":\"fa fa-user-secret\",\"menuId\":3,\"name\":\"角色管理\",\"orderNum\":2,\"parentId\":1,\"type\":1,\"url\":\"sys/role\"},{\"icon\":\"fa fa-th-list\",\"menuId\":4,\"name\":\"菜单管理\",\"orderNum\":3,\"parentId\":1,\"type\":1,\"url\":\"sys/menu\"},{\"icon\":\"fa fa-bug\",\"menuId\":5,\"name\":\"SQL监控\",\"orderNum\":4,\"parentId\":1,\"type\":1,\"url\":\"druid/sql.html\"},{\"icon\":\"fa fa-tasks\",\"menuId\":6,\"name\":\"定时任务\",\"orderNum\":5,\"parentId\":1,\"type\":1,\"url\":\"sys/schedule\"},{\"icon\":\"fa fa-sun-o\",\"menuId\":27,\"name\":\"参数管理\",\"orderNum\":6,\"parentId\":1,\"perms\":\"sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete\",\"type\":1,\"url\":\"sys/config\"},{\"icon\":\"fa fa-file-image-o\",\"menuId\":29,\"name\":\"文件上传\",\"orderNum\":6,\"parentId\":1,\"perms\":\"sys:oss:all\",\"type\":1,\"url\":\"sys/oss\"},{\"icon\":\"fa fa-file-text-o\",\"menuId\":28,\"name\":\"系统日志\",\"orderNum\":7,\"parentId\":1,\"perms\":\"sys:log:list\",\"type\":1,\"url\":\"sys/log\"}],\"menuId\":1,\"name\":\"系统管理\",\"orderNum\":0,\"parentId\":0,\"type\":0}],\"sysUser\":{\"createTime\":1510369871000,\"createUserId\":1,\"email\":\"magic@qqq.com\",\"mobile\":\"1234\",\"password\":\"ef338e79bc415c99e7383b82f44db35e\",\"salt\":\"4s3X1Auhexa8TJQGD/CeHw==\",\"status\":1,\"userId\":1,\"userName\":\"admin\"}}', '31', '0:0:0:0:0:0:0:1', '2018-01-02 18:54:22');
INSERT INTO `sys_log` VALUES ('3', 'admin', '登录后台', 'com.fomagic.module.sys.controller.SysLoginController.sysIndex()', '{\"menuList\":[{\"icon\":\"fa fa-cog\",\"list\":[{\"icon\":\"fa fa-user\",\"menuId\":2,\"name\":\"管理员列表\",\"orderNum\":1,\"parentId\":1,\"type\":1,\"url\":\"sys/user\"},{\"icon\":\"fa fa-user-secret\",\"menuId\":3,\"name\":\"角色管理\",\"orderNum\":2,\"parentId\":1,\"type\":1,\"url\":\"sys/role\"},{\"icon\":\"fa fa-th-list\",\"menuId\":4,\"name\":\"菜单管理\",\"orderNum\":3,\"parentId\":1,\"type\":1,\"url\":\"sys/menu\"},{\"icon\":\"fa fa-bug\",\"menuId\":5,\"name\":\"SQL监控\",\"orderNum\":4,\"parentId\":1,\"type\":1,\"url\":\"druid/sql.html\"},{\"icon\":\"fa fa-tasks\",\"menuId\":6,\"name\":\"定时任务\",\"orderNum\":5,\"parentId\":1,\"type\":1,\"url\":\"sys/schedule\"},{\"icon\":\"fa fa-sun-o\",\"menuId\":27,\"name\":\"参数管理\",\"orderNum\":6,\"parentId\":1,\"perms\":\"sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete\",\"type\":1,\"url\":\"sys/config\"},{\"icon\":\"fa fa-file-image-o\",\"menuId\":29,\"name\":\"文件上传\",\"orderNum\":6,\"parentId\":1,\"perms\":\"sys:oss:all\",\"type\":1,\"url\":\"sys/oss\"},{\"icon\":\"fa fa-file-text-o\",\"menuId\":28,\"name\":\"系统日志\",\"orderNum\":7,\"parentId\":1,\"perms\":\"sys:log:list\",\"type\":1,\"url\":\"sys/log\"}],\"menuId\":1,\"name\":\"系统管理\",\"orderNum\":0,\"parentId\":0,\"type\":0}],\"sysUser\":{\"createTime\":1510369871000,\"createUserId\":1,\"email\":\"magic@qqq.com\",\"mobile\":\"1234\",\"password\":\"ef338e79bc415c99e7383b82f44db35e\",\"salt\":\"4s3X1Auhexa8TJQGD/CeHw==\",\"status\":1,\"userId\":1,\"userName\":\"admin\"}}', '57', '0:0:0:0:0:0:0:1', '2018-01-02 18:55:14');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单url',
  `perms` varchar(500) DEFAULT NULL COMMENT '权限（多个逗号分隔，如：user:add,user:delete）',
  `type` int(11) DEFAULT NULL COMMENT '类型  0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'sys/user', null, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu', null, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'sys/schedule', null, '1', 'fa fa-tasks', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` VALUES ('28', '1', '系统日志', 'sys/log', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` VALUES ('29', '1', '文件上传', 'sys/oss', 'sys:oss:all', '1', 'fa fa-file-image-o', '6');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` int(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` int(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '用户密码',
  `salt` varchar(50) DEFAULT NULL COMMENT '盐值',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` varchar(4) DEFAULT NULL COMMENT '用户状态  0：禁用  1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统管理员或用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'ef338e79bc415c99e7383b82f44db35e', '4s3X1Auhexa8TJQGD/CeHw==', 'magic@qqq.com', '1234', '1', '1', '2017-11-11 11:11:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色的对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
