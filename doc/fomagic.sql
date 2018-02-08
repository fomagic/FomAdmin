/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50635
Source Host           : 127.0.0.1:3306
Source Database       : fomagic

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2018-02-08 16:56:03
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'test', 'fomagic', '0 0/1 * * * ?', '1', '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `schedule_job` VALUES ('2', 'testTask', 'test2', '', '0 0/1 * * * ?', '1', '无参数测试', '2018-01-02 14:44:34');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '测试', 'ok', '111', '0', '0:0:0:0', '2018-01-02 17:53:02');
INSERT INTO `sys_log` VALUES ('2', 'admin', '登录后台', 'com.fomagic.module.sys.controller.SysLoginController.sysIndex()', '{\"menuList\":[{\"icon\":\"fa fa-cog\",\"list\":[{\"icon\":\"fa fa-user\",\"menuId\":2,\"name\":\"管理员列表\",\"orderNum\":1,\"parentId\":1,\"type\":1,\"url\":\"sys/user\"},{\"icon\":\"fa fa-user-secret\",\"menuId\":3,\"name\":\"角色管理\",\"orderNum\":2,\"parentId\":1,\"type\":1,\"url\":\"sys/role\"},{\"icon\":\"fa fa-th-list\",\"menuId\":4,\"name\":\"菜单管理\",\"orderNum\":3,\"parentId\":1,\"type\":1,\"url\":\"sys/menu\"},{\"icon\":\"fa fa-bug\",\"menuId\":5,\"name\":\"SQL监控\",\"orderNum\":4,\"parentId\":1,\"type\":1,\"url\":\"druid/sql.html\"},{\"icon\":\"fa fa-tasks\",\"menuId\":6,\"name\":\"定时任务\",\"orderNum\":5,\"parentId\":1,\"type\":1,\"url\":\"sys/schedule\"},{\"icon\":\"fa fa-sun-o\",\"menuId\":27,\"name\":\"参数管理\",\"orderNum\":6,\"parentId\":1,\"perms\":\"sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete\",\"type\":1,\"url\":\"sys/config\"},{\"icon\":\"fa fa-file-image-o\",\"menuId\":29,\"name\":\"文件上传\",\"orderNum\":6,\"parentId\":1,\"perms\":\"sys:oss:all\",\"type\":1,\"url\":\"sys/oss\"},{\"icon\":\"fa fa-file-text-o\",\"menuId\":28,\"name\":\"系统日志\",\"orderNum\":7,\"parentId\":1,\"perms\":\"sys:log:list\",\"type\":1,\"url\":\"sys/log\"}],\"menuId\":1,\"name\":\"系统管理\",\"orderNum\":0,\"parentId\":0,\"type\":0}],\"sysUser\":{\"createTime\":1510369871000,\"createUserId\":1,\"email\":\"magic@qqq.com\",\"mobile\":\"1234\",\"password\":\"ef338e79bc415c99e7383b82f44db35e\",\"salt\":\"4s3X1Auhexa8TJQGD/CeHw==\",\"status\":1,\"userId\":1,\"userName\":\"admin\"}}', '31', '0:0:0:0:0:0:0:1', '2018-01-02 18:54:22');
INSERT INTO `sys_log` VALUES ('3', 'admin', '登录后台', 'com.fomagic.module.sys.controller.SysLoginController.sysIndex()', '{\"menuList\":[{\"icon\":\"fa fa-cog\",\"list\":[{\"icon\":\"fa fa-user\",\"menuId\":2,\"name\":\"管理员列表\",\"orderNum\":1,\"parentId\":1,\"type\":1,\"url\":\"sys/user\"},{\"icon\":\"fa fa-user-secret\",\"menuId\":3,\"name\":\"角色管理\",\"orderNum\":2,\"parentId\":1,\"type\":1,\"url\":\"sys/role\"},{\"icon\":\"fa fa-th-list\",\"menuId\":4,\"name\":\"菜单管理\",\"orderNum\":3,\"parentId\":1,\"type\":1,\"url\":\"sys/menu\"},{\"icon\":\"fa fa-bug\",\"menuId\":5,\"name\":\"SQL监控\",\"orderNum\":4,\"parentId\":1,\"type\":1,\"url\":\"druid/sql.html\"},{\"icon\":\"fa fa-tasks\",\"menuId\":6,\"name\":\"定时任务\",\"orderNum\":5,\"parentId\":1,\"type\":1,\"url\":\"sys/schedule\"},{\"icon\":\"fa fa-sun-o\",\"menuId\":27,\"name\":\"参数管理\",\"orderNum\":6,\"parentId\":1,\"perms\":\"sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete\",\"type\":1,\"url\":\"sys/config\"},{\"icon\":\"fa fa-file-image-o\",\"menuId\":29,\"name\":\"文件上传\",\"orderNum\":6,\"parentId\":1,\"perms\":\"sys:oss:all\",\"type\":1,\"url\":\"sys/oss\"},{\"icon\":\"fa fa-file-text-o\",\"menuId\":28,\"name\":\"系统日志\",\"orderNum\":7,\"parentId\":1,\"perms\":\"sys:log:list\",\"type\":1,\"url\":\"sys/log\"}],\"menuId\":1,\"name\":\"系统管理\",\"orderNum\":0,\"parentId\":0,\"type\":0}],\"sysUser\":{\"createTime\":1510369871000,\"createUserId\":1,\"email\":\"magic@qqq.com\",\"mobile\":\"1234\",\"password\":\"ef338e79bc415c99e7383b82f44db35e\",\"salt\":\"4s3X1Auhexa8TJQGD/CeHw==\",\"status\":1,\"userId\":1,\"userName\":\"admin\"}}', '57', '0:0:0:0:0:0:0:1', '2018-01-02 18:55:14');
INSERT INTO `sys_log` VALUES ('4', 'admin', '登录后台', 'com.fomagic.module.sys.controller.SysLoginController.sysIndex()', '{\"menuList\":[{\"icon\":\"fa fa-cog\",\"list\":[{\"icon\":\"fa fa-user\",\"menuId\":2,\"name\":\"管理员列表\",\"orderNum\":1,\"parentId\":1,\"type\":1,\"url\":\"sys/user\"},{\"icon\":\"fa fa-user-secret\",\"menuId\":3,\"name\":\"角色管理\",\"orderNum\":2,\"parentId\":1,\"type\":1,\"url\":\"sys/role\"},{\"icon\":\"fa fa-th-list\",\"menuId\":4,\"name\":\"菜单管理\",\"orderNum\":3,\"parentId\":1,\"type\":1,\"url\":\"sys/menu\"},{\"icon\":\"fa fa-bug\",\"menuId\":5,\"name\":\"SQL监控\",\"orderNum\":4,\"parentId\":1,\"type\":1,\"url\":\"druid/sql.html\"},{\"icon\":\"fa fa-tasks\",\"menuId\":6,\"name\":\"定时任务\",\"orderNum\":5,\"parentId\":1,\"type\":1,\"url\":\"sys/schedule\"},{\"icon\":\"fa fa-sun-o\",\"menuId\":27,\"name\":\"参数管理\",\"orderNum\":6,\"parentId\":1,\"perms\":\"sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete\",\"type\":1,\"url\":\"sys/config\"},{\"icon\":\"fa fa-file-image-o\",\"menuId\":29,\"name\":\"文件上传\",\"orderNum\":6,\"parentId\":1,\"perms\":\"sys:oss:all\",\"type\":1,\"url\":\"sys/oss\"},{\"icon\":\"fa fa-file-text-o\",\"menuId\":28,\"name\":\"系统日志\",\"orderNum\":7,\"parentId\":1,\"perms\":\"sys:log:list\",\"type\":1,\"url\":\"sys/log\"}],\"menuId\":1,\"name\":\"系统管理\",\"orderNum\":0,\"parentId\":0,\"type\":0}],\"sysUser\":{\"createTime\":1510369871000,\"createUserId\":1,\"email\":\"magic@qqq.com\",\"mobile\":\"1234\",\"password\":\"ef338e79bc415c99e7383b82f44db35e\",\"salt\":\"4s3X1Auhexa8TJQGD/CeHw==\",\"status\":1,\"userId\":1,\"userName\":\"admin\"}}', '19', '192.168.1.103', '2018-01-02 19:13:52');
INSERT INTO `sys_log` VALUES ('5', 'admin', '登录后台', 'com.fomagic.module.sys.controller.SysLoginController.sysIndex()', '{\"menuList\":[{\"icon\":\"fa fa-cog\",\"list\":[{\"icon\":\"fa fa-user\",\"menuId\":2,\"name\":\"管理员列表\",\"orderNum\":1,\"parentId\":1,\"type\":1,\"url\":\"sys/user\"},{\"icon\":\"fa fa-user-secret\",\"menuId\":3,\"name\":\"角色管理\",\"orderNum\":2,\"parentId\":1,\"type\":1,\"url\":\"sys/role\"},{\"icon\":\"fa fa-th-list\",\"menuId\":4,\"name\":\"菜单管理\",\"orderNum\":3,\"parentId\":1,\"type\":1,\"url\":\"sys/menu\"},{\"icon\":\"fa fa-bug\",\"menuId\":5,\"name\":\"SQL监控\",\"orderNum\":4,\"parentId\":1,\"type\":1,\"url\":\"druid/sql.html\"},{\"icon\":\"fa fa-tasks\",\"menuId\":6,\"name\":\"定时任务\",\"orderNum\":5,\"parentId\":1,\"type\":1,\"url\":\"sys/schedule\"},{\"icon\":\"fa fa-sun-o\",\"menuId\":27,\"name\":\"参数管理\",\"orderNum\":6,\"parentId\":1,\"perms\":\"sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete\",\"type\":1,\"url\":\"sys/config\"},{\"icon\":\"fa fa-file-image-o\",\"menuId\":29,\"name\":\"文件上传\",\"orderNum\":6,\"parentId\":1,\"perms\":\"sys:oss:all\",\"type\":1,\"url\":\"sys/oss\"},{\"icon\":\"fa fa-file-text-o\",\"menuId\":28,\"name\":\"系统日志\",\"orderNum\":7,\"parentId\":1,\"perms\":\"sys:log:list\",\"type\":1,\"url\":\"sys/log\"}],\"menuId\":1,\"name\":\"系统管理\",\"orderNum\":0,\"parentId\":0,\"type\":0}],\"sysUser\":{\"createTime\":1510369871000,\"createUserId\":1,\"email\":\"magic@qqq.com\",\"mobile\":\"1234\",\"password\":\"ef338e79bc415c99e7383b82f44db35e\",\"salt\":\"4s3X1Auhexa8TJQGD/CeHw==\",\"status\":1,\"userId\":1,\"userName\":\"admin\"}}', '14', '0:0:0:0:0:0:0:1', '2018-01-03 10:50:20');
INSERT INTO `sys_log` VALUES ('6', 'admin', '登录后台', 'com.fomagic.module.sys.controller.SysLoginController.sysIndex()', '{\"menuList\":[{\"icon\":\"fa fa-cog\",\"list\":[{\"icon\":\"fa fa-user\",\"menuId\":2,\"name\":\"管理员列表\",\"orderNum\":1,\"parentId\":1,\"type\":1,\"url\":\"sys/user\"},{\"icon\":\"fa fa-user-secret\",\"menuId\":3,\"name\":\"角色管理\",\"orderNum\":2,\"parentId\":1,\"type\":1,\"url\":\"sys/role\"},{\"icon\":\"fa fa-th-list\",\"menuId\":4,\"name\":\"菜单管理\",\"orderNum\":3,\"parentId\":1,\"type\":1,\"url\":\"sys/menu\"},{\"icon\":\"fa fa-bug\",\"menuId\":5,\"name\":\"SQL监控\",\"orderNum\":4,\"parentId\":1,\"type\":1,\"url\":\"druid/sql.html\"},{\"icon\":\"fa fa-tasks\",\"menuId\":6,\"name\":\"定时任务\",\"orderNum\":5,\"parentId\":1,\"type\":1,\"url\":\"sys/schedule\"},{\"icon\":\"fa fa-sun-o\",\"menuId\":27,\"name\":\"参数管理\",\"orderNum\":6,\"parentId\":1,\"perms\":\"sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete\",\"type\":1,\"url\":\"sys/config\"},{\"icon\":\"fa fa-file-image-o\",\"menuId\":29,\"name\":\"文件上传\",\"orderNum\":6,\"parentId\":1,\"perms\":\"sys:oss:all\",\"type\":1,\"url\":\"sys/oss\"},{\"icon\":\"fa fa-file-text-o\",\"menuId\":28,\"name\":\"系统日志\",\"orderNum\":7,\"parentId\":1,\"perms\":\"sys:log:list\",\"type\":1,\"url\":\"sys/log\"}],\"menuId\":1,\"name\":\"系统管理\",\"orderNum\":0,\"parentId\":0,\"type\":0}],\"sysUser\":{\"createTime\":1510369871000,\"createUserId\":1,\"email\":\"magic@qqq.com\",\"mobile\":\"1234\",\"password\":\"ef338e79bc415c99e7383b82f44db35e\",\"salt\":\"4s3X1Auhexa8TJQGD/CeHw==\",\"status\":1,\"userId\":1,\"userName\":\"admin\"}}', '21', '0:0:0:0:0:0:0:1', '2018-01-03 10:51:04');
INSERT INTO `sys_log` VALUES ('7', 'admin', '删除菜单', 'com.fomagic.module.sys.controller.SysMenuController.deleteMenu()', '10001', '48', '0:0:0:0:0:0:0:1', '2018-01-03 11:12:07');
INSERT INTO `sys_log` VALUES ('8', 'admin', '删除菜单', 'com.fomagic.module.sys.controller.SysMenuController.deleteMenu()', '30', '0', '0:0:0:0:0:0:0:1', '2018-01-30 10:32:35');
INSERT INTO `sys_log` VALUES ('9', 'admin', '删除菜单', 'com.fomagic.module.sys.controller.SysMenuController.deleteMenu()', '30', '0', '0:0:0:0:0:0:0:1', '2018-02-08 16:52:17');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '平台管理员', '平台管理员', '1', '2018-01-26 18:47:34');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` int(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` int(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('4', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('5', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('6', '1', '18');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统管理员或用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'ef338e79bc415c99e7383b82f44db35e', '4s3X1Auhexa8TJQGD/CeHw==', 'magic@qqq.com', '1234', '1', '1', '2017-11-11 11:11:11');
INSERT INTO `sys_user` VALUES ('2', 'asd', '721ae1dfb3dedadc6af82fc28f3c7289', 'g3N4nLg3jcBgrk4jEt1IJA==', 'asd', '1111', '1', '1', '2018-01-26 18:47:48');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户与角色的对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '2', '1');
