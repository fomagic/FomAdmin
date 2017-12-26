/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50635
Source Host           : 127.0.0.1:3306
Source Database       : fomagic

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

<<<<<<< HEAD
 Date: 26/12/2017 10:18:44
=======
Date: 2017-12-25 09:35:24
>>>>>>> 714ec94c3316540097fab052314506ee852d9106
*/

SET FOREIGN_KEY_CHECKS=0;

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
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;
=======
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COMMENT='菜单管理';
>>>>>>> 714ec94c3316540097fab052314506ee852d9106

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
<<<<<<< HEAD
BEGIN;
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'fa fa-cog', 0);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'fa fa-user', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'fa fa-user-secret', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'fa fa-th-list', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'druid/sql.html', NULL, 1, 'fa fa-bug', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'sys/job', NULL, 1, 'fa fa-tasks', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'fa fa-sun-o', 6);
INSERT INTO `sys_menu` VALUES (28, 1, '系统日志', 'sys/log', 'sys:log:list', 1, 'fa fa-file-text-o', 7);
INSERT INTO `sys_menu` VALUES (29, 1, '文件上传', 'sys/oss', 'sys:oss:all', 1, 'fa fa-file-image-o', 6);
COMMIT;
=======
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', '', '', '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'modules/sys/user.html', '', '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'modules/sys/role.html', '', '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', '', '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', '', '1', 'fa fa-bug', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'modules/job/schedule.html', '', '1', 'fa fa-tasks', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', '', 'sys:schedule:list,sys:schedule:info', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', '', 'sys:schedule:save', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', '', 'sys:schedule:update', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', '', 'sys:schedule:delete', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', '', 'sys:schedule:pause', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', '', 'sys:schedule:resume', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', '', 'sys:schedule:run', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', '', 'sys:schedule:log', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', '', 'sys:user:list,sys:user:info', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', '', 'sys:user:save,sys:role:select', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', '', 'sys:user:update,sys:role:select', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', '', 'sys:user:delete', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', '', 'sys:role:list,sys:role:info', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', '', 'sys:role:save,sys:menu:list', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', '', 'sys:role:update,sys:menu:list', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', '', 'sys:role:delete', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', '', 'sys:menu:list,sys:menu:info', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', '', 'sys:menu:save,sys:menu:select', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', '', 'sys:menu:update,sys:menu:select', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', '', 'sys:menu:delete', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'modules/sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'modules/oss/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6');
>>>>>>> 714ec94c3316540097fab052314506ee852d9106

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
<<<<<<< HEAD
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
=======
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员测试', '管理员添加测试', '1', '2017-11-16 12:50:46');
>>>>>>> 714ec94c3316540097fab052314506ee852d9106

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
<<<<<<< HEAD
=======

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
>>>>>>> 714ec94c3316540097fab052314506ee852d9106

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
<<<<<<< HEAD
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
=======
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户';
>>>>>>> 714ec94c3316540097fab052314506ee852d9106

-- ----------------------------
-- Records of sys_user
-- ----------------------------
<<<<<<< HEAD
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', 'ef338e79bc415c99e7383b82f44db35e', '4s3X1Auhexa8TJQGD/CeHw==', 'magic@qqq.com', '1234', '1', 1, '2017-11-11 11:11:11');
COMMIT;
=======
INSERT INTO `sys_user` VALUES ('1', 'magic', '3d19491d6fc5645c243b8fa78b770444', 'magic', 'magic@qq.com', '', '1', '1', '2017-11-16 12:49:13');
>>>>>>> 714ec94c3316540097fab052314506ee852d9106

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

<<<<<<< HEAD
SET FOREIGN_KEY_CHECKS = 1;
=======
-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
>>>>>>> 714ec94c3316540097fab052314506ee852d9106
