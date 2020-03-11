-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.26 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  10.2.0.5704
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 air 的数据库结构
CREATE DATABASE IF NOT EXISTS `air` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `air`;

-- 导出  表 air.qrtz_blob_triggers 结构
CREATE TABLE IF NOT EXISTS `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  air.qrtz_blob_triggers 的数据：~0 rows (大约)
DELETE FROM `qrtz_blob_triggers`;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;

-- 导出  表 air.qrtz_calendars 结构
CREATE TABLE IF NOT EXISTS `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  air.qrtz_calendars 的数据：~0 rows (大约)
DELETE FROM `qrtz_calendars`;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;

-- 导出  表 air.qrtz_cron_triggers 结构
CREATE TABLE IF NOT EXISTS `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  air.qrtz_cron_triggers 的数据：~0 rows (大约)
DELETE FROM `qrtz_cron_triggers`;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_cron_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `CRON_EXPRESSION`, `TIME_ZONE_ID`) VALUES
	('quartzScheduler', 'com.air.modules.quartz.job.SampleJob', 'DEFAULT', '0/1 * * * * ?', 'Asia/Shanghai');
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;

-- 导出  表 air.qrtz_fired_triggers 结构
CREATE TABLE IF NOT EXISTS `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  air.qrtz_fired_triggers 的数据：~0 rows (大约)
DELETE FROM `qrtz_fired_triggers`;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;

-- 导出  表 air.qrtz_job_details 结构
CREATE TABLE IF NOT EXISTS `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  air.qrtz_job_details 的数据：~0 rows (大约)
DELETE FROM `qrtz_job_details`;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
INSERT INTO `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`, `DESCRIPTION`, `JOB_CLASS_NAME`, `IS_DURABLE`, `IS_NONCONCURRENT`, `IS_UPDATE_DATA`, `REQUESTS_RECOVERY`, `JOB_DATA`) VALUES
	('quartzScheduler', 'com.air.modules.quartz.job.SampleJob', 'DEFAULT', NULL, 'com.air.modules.quartz.job.SampleJob', '0', '0', '0', '0', _binary 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740009706172616D65746572707800);
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;

-- 导出  表 air.qrtz_locks 结构
CREATE TABLE IF NOT EXISTS `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  air.qrtz_locks 的数据：~0 rows (大约)
DELETE FROM `qrtz_locks`;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` (`SCHED_NAME`, `LOCK_NAME`) VALUES
	('quartzScheduler', 'TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;

-- 导出  表 air.qrtz_paused_trigger_grps 结构
CREATE TABLE IF NOT EXISTS `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  air.qrtz_paused_trigger_grps 的数据：~0 rows (大约)
DELETE FROM `qrtz_paused_trigger_grps`;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;

-- 导出  表 air.qrtz_scheduler_state 结构
CREATE TABLE IF NOT EXISTS `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  air.qrtz_scheduler_state 的数据：~0 rows (大约)
DELETE FROM `qrtz_scheduler_state`;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;

-- 导出  表 air.qrtz_simple_triggers 结构
CREATE TABLE IF NOT EXISTS `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  air.qrtz_simple_triggers 的数据：~0 rows (大约)
DELETE FROM `qrtz_simple_triggers`;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;

-- 导出  表 air.qrtz_simprop_triggers 结构
CREATE TABLE IF NOT EXISTS `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  air.qrtz_simprop_triggers 的数据：~0 rows (大约)
DELETE FROM `qrtz_simprop_triggers`;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;

-- 导出  表 air.qrtz_triggers 结构
CREATE TABLE IF NOT EXISTS `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  air.qrtz_triggers 的数据：~1 rows (大约)
DELETE FROM `qrtz_triggers`;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `JOB_NAME`, `JOB_GROUP`, `DESCRIPTION`, `NEXT_FIRE_TIME`, `PREV_FIRE_TIME`, `PRIORITY`, `TRIGGER_STATE`, `TRIGGER_TYPE`, `START_TIME`, `END_TIME`, `CALENDAR_NAME`, `MISFIRE_INSTR`, `JOB_DATA`) VALUES
	('quartzScheduler', 'com.air.modules.quartz.job.SampleJob', 'DEFAULT', 'com.air.modules.quartz.job.SampleJob', 'DEFAULT', NULL, 1550751226000, 1550751225000, 5, 'PAUSED', 'CRON', 1547697830000, 0, NULL, 0, _binary '');
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;

-- 导出  表 air.sys_announcement 结构
CREATE TABLE IF NOT EXISTS `sys_announcement` (
  `id` varchar(32) NOT NULL,
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `msg_content` text COMMENT '内容',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `sender` varchar(100) DEFAULT NULL COMMENT '发布人',
  `priority` varchar(255) DEFAULT NULL COMMENT '优先级（L低，M中，H高）',
  `msg_type` varchar(10) DEFAULT NULL COMMENT '通告对象类型（USER:指定用户，ALL:全体用户）',
  `send_status` varchar(10) DEFAULT NULL COMMENT '发布状态（0未发布，1已发布，2已撤销）',
  `send_time` datetime DEFAULT NULL COMMENT '发布时间',
  `cancel_time` datetime DEFAULT NULL COMMENT '撤销时间',
  `is_deleted` char(1) DEFAULT '0' COMMENT '删除状态（0，正常，1已删除）',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `user_ids` text COMMENT '指定用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统通告表';

-- 正在导出表  air.sys_announcement 的数据：~0 rows (大约)
DELETE FROM `sys_announcement`;
/*!40000 ALTER TABLE `sys_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_announcement` ENABLE KEYS */;

-- 导出  表 air.sys_announcement_send 结构
CREATE TABLE IF NOT EXISTS `sys_announcement_send` (
  `id` varchar(32) DEFAULT NULL,
  `annt_id` varchar(32) DEFAULT NULL COMMENT '通告ID',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户id',
  `read_flag` varchar(10) DEFAULT NULL COMMENT '阅读状态（0未读，1已读）',
  `read_time` datetime DEFAULT NULL COMMENT '阅读时间',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户通告阅读标记表';

-- 正在导出表  air.sys_announcement_send 的数据：~0 rows (大约)
DELETE FROM `sys_announcement_send`;
/*!40000 ALTER TABLE `sys_announcement_send` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_announcement_send` ENABLE KEYS */;

-- 导出  表 air.sys_dept 结构
CREATE TABLE IF NOT EXISTS `sys_dept` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父机构ID',
  `depart_name` varchar(100) NOT NULL COMMENT '机构/部门名称',
  `depart_name_en` varchar(500) DEFAULT NULL COMMENT '英文名',
  `depart_name_abbr` varchar(500) DEFAULT NULL COMMENT '缩写',
  `depart_order` int(11) DEFAULT '0' COMMENT '排序',
  `description` text COMMENT '描述',
  `org_type` varchar(10) DEFAULT NULL COMMENT '机构类型',
  `org_code` varchar(64) NOT NULL COMMENT '机构编码',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号',
  `fax` varchar(32) DEFAULT NULL COMMENT '传真',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `memo` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` varchar(10) DEFAULT NULL COMMENT '状态（1启用，0不启用）',
  `is_deleted` char(1) DEFAULT '0' COMMENT '删除状态（0，正常，1已删除）',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构表';

-- 正在导出表  air.sys_dept 的数据：~4 rows (大约)
DELETE FROM `sys_dept`;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` (`id`, `parent_id`, `depart_name`, `depart_name_en`, `depart_name_abbr`, `depart_order`, `description`, `org_type`, `org_code`, `mobile`, `fax`, `address`, `memo`, `status`, `is_deleted`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	('4f1765520d6346f9bd9c79e2479e5b12', 'c6d7cb4deeac411cb3384b1b31278596', '市场部', NULL, NULL, 0, NULL, '2', 'A01A03', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-20 17:15:34', NULL, NULL),
	('57197590443c44f083d42ae24ef26a2c', 'c6d7cb4deeac411cb3384b1b31278596', '研发部', NULL, NULL, 0, NULL, '2', 'A01A05', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-21 16:14:41', NULL, NULL),
	('67fc001af12a4f9b8458005d3f19934a', 'c6d7cb4deeac411cb3384b1b31278596', '财务部', NULL, NULL, 0, NULL, '2', 'A01A04', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-21 16:14:35', 'admin', '2019-02-25 12:49:41'),
	('c6d7cb4deeac411cb3384b1b31278596', '', 'XXX公司', NULL, NULL, 0, NULL, '1', 'A01', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-11 14:21:51', 'admin', '2019-02-18 23:17:33');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;

-- 导出  表 air.sys_dict 结构
CREATE TABLE IF NOT EXISTS `sys_dict` (
  `id` varchar(32) NOT NULL,
  `dict_name` varchar(255) DEFAULT NULL COMMENT '字典名称',
  `dict_code` varchar(255) DEFAULT NULL COMMENT '字典编码',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `is_deleted` char(1) DEFAULT '0' COMMENT '删除状态',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- 正在导出表  air.sys_dict 的数据：~2 rows (大约)
DELETE FROM `sys_dict`;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` (`id`, `dict_name`, `dict_code`, `description`, `is_deleted`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	('3d9a351be3436fbefb1307d4cfb49bf2', '性别', 'sex', NULL, '1', NULL, '2019-01-04 14:56:32', NULL, NULL),
	('6b78e3f59faec1a4750acff08030a79b', '用户类型', 'user_type', NULL, '1', NULL, '2019-01-04 14:59:01', NULL, NULL);
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;

-- 导出  表 air.sys_dict_item 结构
CREATE TABLE IF NOT EXISTS `sys_dict_item` (
  `id` varchar(255) NOT NULL,
  `dict_id` varchar(255) DEFAULT NULL COMMENT '字典id',
  `item_text` varchar(255) DEFAULT NULL COMMENT '字典项文本',
  `item_value` varchar(255) DEFAULT NULL COMMENT '字典项值',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `sort_order` decimal(10,2) DEFAULT NULL COMMENT '排序',
  `status` int(11) DEFAULT NULL COMMENT '状态（1启用 0不启用）',
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  air.sys_dict_item 的数据：~4 rows (大约)
DELETE FROM `sys_dict_item`;
/*!40000 ALTER TABLE `sys_dict_item` DISABLE KEYS */;
INSERT INTO `sys_dict_item` (`id`, `dict_id`, `item_text`, `item_value`, `description`, `sort_order`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	('5d84a8634c8fdfe96275385075b105c9', '3d9a351be3436fbefb1307d4cfb49bf2', '女', '2', NULL, 2.00, 1, NULL, '2019-01-04 14:56:56', NULL, '2019-01-04 17:38:12'),
	('700e9f030654f3f90e9ba76ab0713551', '6b78e3f59faec1a4750acff08030a79b', '333', '333', NULL, NULL, 1, 'admin', '2019-02-21 19:59:47', NULL, NULL),
	('b57f98b88363188daf38d42f25991956', '6b78e3f59faec1a4750acff08030a79b', '22', '222', NULL, NULL, 1, 'admin', '2019-02-21 19:59:43', NULL, NULL),
	('df168368dcef46cade2aadd80100d8aa', '3d9a351be3436fbefb1307d4cfb49bf2', '男', '1', NULL, 1.00, 1, NULL, '2019-01-04 14:56:49', 'admin', '2019-02-25 12:49:31');
/*!40000 ALTER TABLE `sys_dict_item` ENABLE KEYS */;

-- 导出  表 air.sys_log 结构
CREATE TABLE IF NOT EXISTS `sys_log` (
  `id` varchar(255) NOT NULL,
  `log_type` int(11) DEFAULT NULL COMMENT '日志类型（1登录日志，2操作日志）',
  `log_content` varchar(1000) DEFAULT NULL COMMENT '日志内容',
  `operate_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `userid` varchar(255) DEFAULT NULL COMMENT '操作用户账号',
  `username` varchar(255) DEFAULT NULL COMMENT '操作用户名称',
  `ip` varchar(255) DEFAULT NULL COMMENT 'IP',
  `method` varchar(500) DEFAULT NULL COMMENT '请求java方法',
  `request_url` varchar(255) DEFAULT NULL COMMENT '请求路径',
  `request_param` varchar(255) DEFAULT NULL COMMENT '请求参数',
  `request_type` varchar(255) DEFAULT NULL COMMENT '请求类型',
  `cost_time` bigint(20) DEFAULT NULL COMMENT '耗时',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统日志表';

-- 正在导出表  air.sys_log 的数据：3 rows
DELETE FROM `sys_log`;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` (`id`, `log_type`, `log_content`, `operate_type`, `userid`, `username`, `ip`, `method`, `request_url`, `request_param`, `request_type`, `cost_time`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	('7077446dd44070b37062014b51e4c3a2', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-02-06 23:58:40', NULL, NULL),
	('3f0e6aa8dcf601a265e0899bb25fd822', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-02-07 00:05:39', NULL, NULL),
	('18df649e65ef05f714a788968a64a983', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-02-07 00:13:11', NULL, NULL),
	('f155c92904e50de104d1ea865eead5a3', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-02-07 00:19:01', NULL, NULL),
	('04b4c8591f29fc12453aa39b5adc4696', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-02-07 00:19:17', NULL, NULL),
	('f887a983d340f8fb52ea678189221f99', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-02-07 00:35:26', NULL, NULL);
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;

-- 导出  表 air.sys_permission 结构
CREATE TABLE IF NOT EXISTS `sys_permission` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父id',
  `name` varchar(255) DEFAULT NULL COMMENT '菜单标题',
  `url` varchar(255) DEFAULT NULL COMMENT '路径',
  `component` varchar(255) DEFAULT NULL COMMENT '组件',
  `redirect` varchar(255) DEFAULT NULL COMMENT '一级菜单跳转地址',
  `menu_type` int(11) DEFAULT NULL COMMENT '菜单类型(0:一级菜单; 1:子菜单:2:按钮权限)',
  `perms` varchar(255) DEFAULT NULL COMMENT '菜单权限编码',
  `sort_no` double(3,2) DEFAULT NULL COMMENT '菜单排序',
  `always_show` int(3) DEFAULT NULL COMMENT '聚合子路由: 1是0否',
  `icon` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `is_leaf` int(2) DEFAULT NULL COMMENT '是否叶子节点:    1:是   0:不是',
  `hidden` int(2) DEFAULT '0' COMMENT '是否隐藏路由: 0否,1是',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` char(1) DEFAULT '0' COMMENT '删除状态 0正常 1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- 正在导出表  air.sys_permission 的数据：~17 rows (大约)
DELETE FROM `sys_permission`;
/*!40000 ALTER TABLE `sys_permission` DISABLE KEYS */;
INSERT INTO `sys_permission` (`id`, `parent_id`, `name`, `url`, `component`, `redirect`, `menu_type`, `perms`, `sort_no`, `always_show`, `icon`, `is_leaf`, `hidden`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `is_deleted`) VALUES
	('00a2a0ae65cdca5e93209cdbde97cbe6', '2e42e3835c2b44ec9f7bc26c146ee531', '成功', '/result/success', 'result/Success', NULL, 1, NULL, 1.00, NULL, NULL, 1, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, '0'),
	('13212d3416eb690c2e1d5033166ff47a', '2e42e3835c2b44ec9f7bc26c146ee531', '失败', '/result/fail', 'result/Error', NULL, 1, NULL, 2.00, NULL, NULL, 1, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, '0'),
	('2e42e3835c2b44ec9f7bc26c146ee531', NULL, '结果页', '/result', 'layouts/PageView', NULL, 0, NULL, 7.00, NULL, 'check-circle-o', 0, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, '0'),
	('3f915b2769fc80648e92d04e84ca059d', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '用户管理', '/isystem/user', 'system/UserList', NULL, 1, NULL, 1.00, 0, NULL, 1, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-01-23 11:52:22', '0'),
	('45c966826eeff4c99b8f8ebfe74511fc', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '部门管理', '/isystem/depart', 'system/DepartList', NULL, 1, NULL, 1.00, 0, NULL, 1, 0, NULL, 'admin', '2019-01-29 18:47:40', 'admin', '2019-01-29 18:51:29', '0'),
	('54dd5457a3190740005c1bfec55b1c34', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '菜单管理', '/isystem/permission', 'system/PermissionList', NULL, 1, NULL, 3.00, NULL, NULL, 1, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, '0'),
	('58857ff846e61794c69208e9d3a85466', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '日志管理', '/isystem/log', 'system/LogList', NULL, 1, NULL, 4.00, 0, 'question-circle', 1, 0, NULL, NULL, '2018-12-26 10:11:18', 'admin', '2019-02-19 16:38:58', '0'),
	('65a8f489f25a345836b7f44b1181197a', 'c65321e57b7949b7a975313220de0422', '403', '/exception/403', 'exception/403', NULL, 1, NULL, 1.00, NULL, NULL, 1, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, '0'),
	('9502685863ab87f0ad1134142788a385', '', '首页', '/dashboard/analysis', 'dashboard/Analysis', NULL, 0, NULL, 1.00, 0, 'bank', 1, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-02-22 12:40:02', '0'),
	('b1cb0a3fedf7ed0e4653cb5a229837ee', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '定时任务', '/isystem/QuartzJobList', 'system/QuartzJobList', NULL, 1, NULL, 5.00, NULL, NULL, 1, NULL, NULL, NULL, '2019-01-03 09:38:52', 'admin', '2019-01-19 14:08:59', '0'),
	('b4dfc7d5dd9e8d5b6dd6d4579b1aa559', 'c65321e57b7949b7a975313220de0422', '500', '/exception/500', 'exception/500', NULL, 1, NULL, 3.00, NULL, NULL, 1, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, '0'),
	('c65321e57b7949b7a975313220de0422', NULL, '异常页', '/exception', 'layouts/RouteView', NULL, 0, NULL, 8.00, NULL, 'warning', 0, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, '0'),
	('d2bbf9ebca5a8fa2e227af97d2da7548', 'c65321e57b7949b7a975313220de0422', '404', '/exception/404', 'exception/404', NULL, 1, NULL, 2.00, NULL, NULL, 1, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, '0'),
	('d7d6e2e4e2934f2c9385a623fd98c6f3', NULL, '系统管理', '/isystem', 'layouts/RouteView', NULL, 0, NULL, 1.00, 0, 'setting', 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-02-22 13:49:30', '0'),
	('e08cb190ef230d5d4f03824198773950', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '系统通告', '/isystem/annountCement', 'system/SysAnnouncementList', NULL, 1, 'annountCement', 6.00, NULL, '', 1, NULL, NULL, NULL, '2019-01-02 17:23:01', NULL, '2019-01-02 17:31:23', '0'),
	('e8af452d8948ea49d37c934f5100ae6a', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '角色管理', '/isystem/role', 'system/RoleList', NULL, 1, NULL, 2.00, NULL, NULL, 1, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, '0'),
	('f1cb187abf927c88b89470d08615f5ac', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '数据字典', '/isystem/dict', 'system/DictList', NULL, 1, NULL, 5.00, NULL, NULL, 1, NULL, NULL, NULL, '2018-12-28 13:54:43', NULL, '2018-12-28 15:37:54', '0');
/*!40000 ALTER TABLE `sys_permission` ENABLE KEYS */;

-- 导出  表 air.sys_quartz_job 结构
CREATE TABLE IF NOT EXISTS `sys_quartz_job` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `is_deleted` char(1) DEFAULT '0' COMMENT '删除状态',
  `update_by` varchar(255) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `job_class_name` varchar(255) DEFAULT NULL COMMENT '任务类名',
  `cron_expression` varchar(255) DEFAULT NULL COMMENT 'cron表达式',
  `parameter` varchar(255) DEFAULT NULL COMMENT '参数',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT NULL COMMENT '状态 0正常 -1停止',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  air.sys_quartz_job 的数据：2 rows
DELETE FROM `sys_quartz_job`;
/*!40000 ALTER TABLE `sys_quartz_job` DISABLE KEYS */;
INSERT INTO `sys_quartz_job` (`id`, `create_by`, `create_time`, `is_deleted`, `update_by`, `update_time`, `job_class_name`, `cron_expression`, `parameter`, `description`, `status`) VALUES
	('df26ecacf0f75d219d746750fe84bbee', NULL, NULL, '0', 'admin', '2019-01-19 15:09:41', 'com.air.modules.quartz.job.SampleParamJob', '0/1 * * * * ?', 'scott', '带参测试 后台将每隔1秒执行输出日志', -1),
	('58180f2a7c8cd36a121fd0fff3f02a36', NULL, NULL, '0', 'admin', '2019-01-19 15:09:44', 'com.air.modules.quartz.job.SampleJob', '0/1 * * * * ?', NULL, NULL, -1);
/*!40000 ALTER TABLE `sys_quartz_job` ENABLE KEYS */;

-- 导出  表 air.sys_role 结构
CREATE TABLE IF NOT EXISTS `sys_role` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(255) DEFAULT NULL COMMENT '角色编码',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- 正在导出表  air.sys_role 的数据：~3 rows (大约)
DELETE FROM `sys_role`;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`id`, `role_name`, `role_code`, `description`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	('e51758fa916c881624b046d26bd09230', '人力资源部', 'hr', NULL, 'admin', '2019-01-21 18:07:24', 'admin', '2019-02-25 12:50:57'),
	('ee8626f80f7c2619917b6236f3a7f02b', '临时角色', 'test', '这是新建的临时角色123', NULL, '2018-12-20 10:59:04', 'admin', '2019-02-19 15:08:37'),
	('f6817f48af4fb3af11b9e8bf182f618b', '管理员', 'admin', '管理员', NULL, '2018-12-21 18:03:39', 'admin', '2019-02-22 19:49:42');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

-- 导出  表 air.sys_role_permission 结构
CREATE TABLE IF NOT EXISTS `sys_role_permission` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色id',
  `permission_id` varchar(32) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- 正在导出表  air.sys_role_permission 的数据：~301 rows (大约)
DELETE FROM `sys_role_permission`;
/*!40000 ALTER TABLE `sys_role_permission` DISABLE KEYS */;
INSERT INTO `sys_role_permission` (`id`, `role_id`, `permission_id`) VALUES
	('00597d88ce793df4baa9e84a1584bb04', 'ee8626f80f7c2619917b6236f3a7f02b', '4148ec82b6acd69f470bea75fe41c357'),
	('00b0748f04d3ea52c8cfa179c1c9d384', '52b0cf022ac4187b2a70dfa4f8b2d940', 'd7d6e2e4e2934f2c9385a623fd98c6f3'),
	('0156071f9a513ecebe28d821cfe936a9', 'f6817f48af4fb3af11b9e8bf182f618b', 'd2bbf9ebca5a8fa2e227af97d2da7548'),
	('0243ce4bfcb4a1cbf8d88bcce5b423f6', 'f6817f48af4fb3af11b9e8bf182f618b', 'f23d9bfff4d9aa6b68569ba2cff38415'),
	('02fce9a21ba1b273a9be22e6d08aa888', 'ee8626f80f7c2619917b6236f3a7f02b', 'fedfbf4420536cacc0218557d263dfea'),
	('03e071916bac02c5e56892f5fff6fad4', 'ee8626f80f7c2619917b6236f3a7f02b', '45c966826eeff4c99b8f8ebfe74511fc'),
	('04a5e9edc188b4fb2d4d7c97433699ad', 'ee8626f80f7c2619917b6236f3a7f02b', '717f6bee46f44a3897eca9abd6e2ec44'),
	('050749293826f69e34e17ad9e881aeb5', 'ee8626f80f7c2619917b6236f3a7f02b', 'd2bbf9ebca5a8fa2e227af97d2da7548'),
	('073aca2db3df7032ff2a2367dfcb36be', 'f6817f48af4fb3af11b9e8bf182f618b', '418964ba087b90a84897b62474496b93'),
	('07def0a8f102a6088f5fdc5a7f2de13c', 'ee8626f80f7c2619917b6236f3a7f02b', '4f84f9400e5e92c95f05b554724c2b58'),
	('0a84e65fe004524ce1dcfbbc9c5d158d', 'ee8626f80f7c2619917b6236f3a7f02b', 'cc50656cf9ca528e6f2150eba4714ad2'),
	('0b59fa905bd7cd390c1716c7600fd8b6', 'e51758fa916c881624b046d26bd09230', '4148ec82b6acd69f470bea75fe41c357'),
	('0e01985969b267138ea79289f4d80992', 'f6817f48af4fb3af11b9e8bf182f618b', '13212d3416eb690c2e1d5033166ff47a'),
	('131ec4598bb76ca85c4bb4a903f17cec', 'ee8626f80f7c2619917b6236f3a7f02b', '3f915b2769fc80648e92d04e84ca059d'),
	('139f250153158eacc56d717800a744fe', 'ee8626f80f7c2619917b6236f3a7f02b', '882a73768cfd7f78f3a37584f7299656'),
	('14cf7edb826d41ada12c97fc43289dc4', 'ee8626f80f7c2619917b6236f3a7f02b', '7ac9eb9ccbde2f7a033cd4944272bf1e'),
	('1605b849beecfdb0364dbefa5fe14164', 'ee8626f80f7c2619917b6236f3a7f02b', '58857ff846e61794c69208e9d3a85466'),
	('17a3b2758daf79e3bf071c38c9f3fd72', 'ee8626f80f7c2619917b6236f3a7f02b', '2dbbafa22cda07fa5d169d741b81fe12'),
	('17ead5b7d97ed365398ab20009a69ea3', '52b0cf022ac4187b2a70dfa4f8b2d940', 'e08cb190ef230d5d4f03824198773950'),
	('1ac1688ef8456f384091a03d88a89ab1', '52b0cf022ac4187b2a70dfa4f8b2d940', '693ce69af3432bd00be13c3971a57961'),
	('1adc4cf29655e34e172227ed23f69456', 'ee8626f80f7c2619917b6236f3a7f02b', 'fb07ca05a3e13674dbf6d3245956da2e'),
	('1dd46063cefb13c1c0832328e755fdd6', 'ee8626f80f7c2619917b6236f3a7f02b', 'c6cf95444d80435eb37b2f9db3971ae6'),
	('1f2d90dddd4a541f6e5739eb696c43c5', 'f6817f48af4fb3af11b9e8bf182f618b', 'b3c824fc22bd953e2eb16ae6914ac8f9'),
	('1fe4d408b85f19618c15bcb768f0ec22', '1750a8fb3e6d90cb7957c02de1dc8e59', '9502685863ab87f0ad1134142788a385'),
	('20c5d914795847f1578a720407d45e01', 'f6817f48af4fb3af11b9e8bf182f618b', '58857ff846e61794c69208e9d3a85466'),
	('21843cd6bcce21a3be77c56357c9e15e', 'f6817f48af4fb3af11b9e8bf182f618b', '882a73768cfd7f78f3a37584f7299656'),
	('2339c57dd0e5ccb690d0b1cf59167e55', 'f6817f48af4fb3af11b9e8bf182f618b', '8f486c17bf7016301432019fdba7aed8'),
	('241681d67a51a30252f0fa39e0b6afeb', 'ee8626f80f7c2619917b6236f3a7f02b', 'f23d9bfff4d9aa6b68569ba2cff38415'),
	('248d288586c6ff3bd14381565df84163', '52b0cf022ac4187b2a70dfa4f8b2d940', '3f915b2769fc80648e92d04e84ca059d'),
	('26efbc128b53ec664d51cb123aa4af48', 'f6817f48af4fb3af11b9e8bf182f618b', 'b2fc6087dfb66fa4a9d0323b10143aad'),
	('2710a82c7aa13eec37cdc0666a249770', 'ee8626f80f7c2619917b6236f3a7f02b', 'f1cb187abf927c88b89470d08615f5ac'),
	('28d1a189ff4c3f2fafe72b9685e2419b', 'f6817f48af4fb3af11b9e8bf182f618b', 'a400e4f4d54f79bf5ce160ae432231af'),
	('28f53e49d49bd85e26b4c6fe8bc16882', 'f6817f48af4fb3af11b9e8bf182f618b', '9017fb8c7485d04c342e2396c481a045'),
	('2c462293cbb0eab7e8ae0a3600361b5f', '52b0cf022ac4187b2a70dfa4f8b2d940', '9502685863ab87f0ad1134142788a385'),
	('2dc5ffc63bd188ae5687522b6de3e645', 'ee8626f80f7c2619917b6236f3a7f02b', 'e5973686ed495c379d829ea8b2881fc6'),
	('2ecb2f5b5acdeb831c4b55b34563a638', 'ee8626f80f7c2619917b6236f3a7f02b', '6e73eb3c26099c191bf03852ee1310a1'),
	('2fdaed22dfa4c8d4629e44ef81688c6a', '52b0cf022ac4187b2a70dfa4f8b2d940', 'aedbf679b5773c1f25e9f7b10111da73'),
	('300c462b7fec09e2ff32574ef8b3f0bd', '52b0cf022ac4187b2a70dfa4f8b2d940', '2a470fc0c3954d9dbb61de6d80846549'),
	('3126647f19dce968218cfb02a16db559', 'e51758fa916c881624b046d26bd09230', '45c966826eeff4c99b8f8ebfe74511fc'),
	('35ac7cae648de39eb56213ca1b649713', '52b0cf022ac4187b2a70dfa4f8b2d940', 'b1cb0a3fedf7ed0e4653cb5a229837ee'),
	('3684f08c808866feabfa3d8954524f1c', 'f6817f48af4fb3af11b9e8bf182f618b', '05b3c82ddb2536a4a5ee1a4c46b5abef'),
	('37e471af5ee4521192dae98f949fe625', 'ee8626f80f7c2619917b6236f3a7f02b', '200006f0edf145a2b50eacca07585451'),
	('388657cba491daddde0f6651f101089a', 'ee8626f80f7c2619917b6236f3a7f02b', '277bfabef7d76e89b33062b16a9a5020'),
	('39e3af8b87c5729b082c64f0516ebc97', 'e51758fa916c881624b046d26bd09230', 'a400e4f4d54f79bf5ce160ae432231af'),
	('3bef3422fb97c2b51f4af97c6a497185', 'e51758fa916c881624b046d26bd09230', 'b4dfc7d5dd9e8d5b6dd6d4579b1aa559'),
	('3cd59ac3de34288a2558dbbfb71d12b1', 'ee8626f80f7c2619917b6236f3a7f02b', 'aedbf679b5773c1f25e9f7b10111da73'),
	('3da5a50baf32a65966b27fed94eb78ca', 'ee8626f80f7c2619917b6236f3a7f02b', 'e08cb190ef230d5d4f03824198773950'),
	('3e563751942b0879c88ca4de19757b50', '1750a8fb3e6d90cb7957c02de1dc8e59', '58857ff846e61794c69208e9d3a85466'),
	('406b325850d869ef3ca22451db3d69e2', 'ee8626f80f7c2619917b6236f3a7f02b', '4f66409ef3bbd69c1d80469d6e2a885e'),
	('412e2de37a35b3442d68db8dd2f3c190', '52b0cf022ac4187b2a70dfa4f8b2d940', 'f1cb187abf927c88b89470d08615f5ac'),
	('42538c6d8add1897482080420956fe79', 'ee8626f80f7c2619917b6236f3a7f02b', '4875ebe289344e14844d8e3ea1edd73f'),
	('4439453c41bb4cb39890ae0426be798f', 'ee8626f80f7c2619917b6236f3a7f02b', '2e42e3835c2b44ec9f7bc26c146ee531'),
	('4825c27d3e256fb4d50ab54cb76365ec', 'e51758fa916c881624b046d26bd09230', '13212d3416eb690c2e1d5033166ff47a'),
	('48a59d6192d6db2053341056a3b1d079', 'f6817f48af4fb3af11b9e8bf182f618b', '4875ebe289344e14844d8e3ea1edd73f'),
	('48ec3c2c2fc487e86078aaf4e14273be', 'f6817f48af4fb3af11b9e8bf182f618b', 'd7d6e2e4e2934f2c9385a623fd98c6f3'),
	('4a1f54fa08889ff9d63f83e01fbfb5ef', 'f6817f48af4fb3af11b9e8bf182f618b', '73678f9daa45ed17a3674131b03432fb'),
	('4b9eac9fd79a1ca63be34b2a6b640738', 'f6817f48af4fb3af11b9e8bf182f618b', '4f66409ef3bbd69c1d80469d6e2a885e'),
	('4e2dc0d9aabbaab34120febdd23241b8', 'f6817f48af4fb3af11b9e8bf182f618b', 'e08cb190ef230d5d4f03824198773950'),
	('50a5f72e811970d107c50ff43587bdfb', 'e51758fa916c881624b046d26bd09230', '3f915b2769fc80648e92d04e84ca059d'),
	('57c0b3a547b815ea3ec8e509b08948b3', '1750a8fb3e6d90cb7957c02de1dc8e59', '3f915b2769fc80648e92d04e84ca059d'),
	('58105249b395c46b45ab52050c54716b', 'ee8626f80f7c2619917b6236f3a7f02b', '13212d3416eb690c2e1d5033166ff47a'),
	('58f1d42a8477733f9a949ceca0599780', 'f6817f48af4fb3af11b9e8bf182f618b', '078f9558cdeab239aecb2bda1a8ed0d1'),
	('593ee05c4fe4645c7826b7d5e14f23ec', '52b0cf022ac4187b2a70dfa4f8b2d940', '8fb8172747a78756c11916216b8b8066'),
	('59c24cd9220fba3e6a7e5c0bc2c2bcb5', 'ee8626f80f7c2619917b6236f3a7f02b', '73678f9daa45ed17a3674131b03432fb'),
	('5a5ba1a8c862f161981ab8ca75bd8f54', 'f6817f48af4fb3af11b9e8bf182f618b', '8e8517f135e55f1ef9340a558c9367f1'),
	('5b7e0aa65d547bd9586a068525a82efa', 'f6817f48af4fb3af11b9e8bf182f618b', 'e3c13679c73a4f829bcff2aba8fd68b1'),
	('61ab8ca7bc9dcd63ee49e4298d5d3520', 'f6817f48af4fb3af11b9e8bf182f618b', '6531cf3421b1265aeeeabaab5e176e6d'),
	('633d508c336b3e20fbbe7b2e1db55631', 'f6817f48af4fb3af11b9e8bf182f618b', '200006f0edf145a2b50eacca07585451'),
	('66180a9104f7593a74c7cfd8da673db6', 'ee8626f80f7c2619917b6236f3a7f02b', 'c65321e57b7949b7a975313220de0422'),
	('6a4ecfd721814517205ef5be062dec0b', 'f6817f48af4fb3af11b9e8bf182f618b', 'e8af452d8948ea49d37c934f5100ae6a'),
	('6ba390047557a46a0c9fe33031a12fde', 'f6817f48af4fb3af11b9e8bf182f618b', 'e6bfd1fcabfd7942fdd05f076d1dad38'),
	('6bb48ab31621f9dadfc0bff52543516a', 'f6817f48af4fb3af11b9e8bf182f618b', 'c6cf95444d80435eb37b2f9db3971ae6'),
	('6bbc5e38cd1f62072ee89fddacd93b38', 'ee8626f80f7c2619917b6236f3a7f02b', 'b3c824fc22bd953e2eb16ae6914ac8f9'),
	('6c09b922b32679365627586284d7809e', 'f6817f48af4fb3af11b9e8bf182f618b', '9502685863ab87f0ad1134142788a385'),
	('6ece067b09cc2ec8536fde2a4b5abd19', 'ee8626f80f7c2619917b6236f3a7f02b', '8fb8172747a78756c11916216b8b8066'),
	('6f0bf59157b633ffe1ae2f2f22f65418', 'f6817f48af4fb3af11b9e8bf182f618b', 'a400e4f4d54f79bf5ce160a3432231af'),
	('6f8a3f1205caf521a5a7cbb9a60763f4', 'f6817f48af4fb3af11b9e8bf182f618b', 'de13e0f6328c069748de7399fcc1dbbd'),
	('701856cb1422173e171ed851c3cab1ee', 'ee8626f80f7c2619917b6236f3a7f02b', '05b3c82ddb2536a4a5ee1a4c46b5abef'),
	('717ea664474132c93cae847e1ffc5807', 'ee8626f80f7c2619917b6236f3a7f02b', 'a400e4f4d54f79bf5ce160ae432231af'),
	('74e999bf3b7f4f67ed51048f281b81bc', 'f6817f48af4fb3af11b9e8bf182f618b', '8fb8172747a78756c11916216b8b8066'),
	('75002588591820806', '16457350655250432', '5129710648430592'),
	('75002588604403712', '16457350655250432', '5129710648430593'),
	('75002588612792320', '16457350655250432', '40238597734928384'),
	('75002588625375232', '16457350655250432', '57009744761589760'),
	('75002588633763840', '16457350655250432', '16392452747300864'),
	('75002588637958144', '16457350655250432', '16392767785668608'),
	('75002588650541056', '16457350655250432', '16439068543946752'),
	('75a2852363236af7c35cb4b0ca583a78', 'f6817f48af4fb3af11b9e8bf182f618b', 'aedbf679b5773c1f25e9f7b10111da73'),
	('77277779875336192', '496138616573952', '5129710648430592'),
	('77277780043108352', '496138616573952', '5129710648430593'),
	('77277780055691264', '496138616573952', '15701400130424832'),
	('77277780064079872', '496138616573952', '16678126574637056'),
	('77277780072468480', '496138616573952', '15701915807518720'),
	('77277780076662784', '496138616573952', '15708892205944832'),
	('77277780085051392', '496138616573952', '16678447719911424'),
	('77277780089245696', '496138616573952', '25014528525733888'),
	('77277780097634304', '496138616573952', '56898976661639168'),
	('77277780135383040', '496138616573952', '40238597734928384'),
	('77277780139577344', '496138616573952', '45235621697949696'),
	('77277780147965952', '496138616573952', '45235787867885568'),
	('77277780156354560', '496138616573952', '45235939278065664'),
	('77277780164743168', '496138616573952', '43117268627886080'),
	('77277780168937472', '496138616573952', '45236734832676864'),
	('77277780181520384', '496138616573952', '45237010692050944'),
	('77277780189908992', '496138616573952', '45237170029465600'),
	('77277780198297600', '496138616573952', '57009544286441472'),
	('77277780206686208', '496138616573952', '57009744761589760'),
	('77277780215074816', '496138616573952', '57009981228060672'),
	('77277780219269120', '496138616573952', '56309618086776832'),
	('77277780227657728', '496138616573952', '57212882168844288'),
	('77277780236046336', '496138616573952', '61560041605435392'),
	('77277780244434944', '496138616573952', '61560275261722624'),
	('77277780257017856', '496138616573952', '61560480518377472'),
	('77277780265406464', '496138616573952', '44986029924421632'),
	('77277780324126720', '496138616573952', '45235228800716800'),
	('77277780332515328', '496138616573952', '45069342940860416'),
	('77277780340903937', '496138616573952', '5129710648430594'),
	('77277780349292544', '496138616573952', '16687383932047360'),
	('77277780357681152', '496138616573952', '16689632049631232'),
	('77277780366069760', '496138616573952', '16689745006432256'),
	('77277780370264064', '496138616573952', '16689883993083904'),
	('77277780374458369', '496138616573952', '16690313745666048'),
	('77277780387041280', '496138616573952', '5129710648430595'),
	('77277780395429888', '496138616573952', '16694861252005888'),
	('77277780403818496', '496138616573952', '16695107491205120'),
	('77277780412207104', '496138616573952', '16695243126607872'),
	('77277780420595712', '496138616573952', '75002207560273920'),
	('77277780428984320', '496138616573952', '76215889006956544'),
	('77277780433178624', '496138616573952', '76216071333351424'),
	('77277780441567232', '496138616573952', '76216264070008832'),
	('77277780449955840', '496138616573952', '76216459709124608'),
	('77277780458344448', '496138616573952', '76216594207870976'),
	('77277780466733056', '496138616573952', '76216702639017984'),
	('77277780475121664', '496138616573952', '58480609315524608'),
	('77277780483510272', '496138616573952', '61394706252173312'),
	('77277780491898880', '496138616573952', '61417744146370560'),
	('77277780496093184', '496138616573952', '76606430504816640'),
	('77277780504481792', '496138616573952', '76914082455752704'),
	('77277780508676097', '496138616573952', '76607201262702592'),
	('77277780517064704', '496138616573952', '39915540965232640'),
	('77277780525453312', '496138616573952', '41370251991977984'),
	('77277780538036224', '496138616573952', '45264987354042368'),
	('77277780546424832', '496138616573952', '45265487029866496'),
	('77277780554813440', '496138616573952', '45265762415284224'),
	('77277780559007744', '496138616573952', '45265886315024384'),
	('77277780567396352', '496138616573952', '45266070000373760'),
	('77277780571590656', '496138616573952', '41363147411427328'),
	('77277780579979264', '496138616573952', '41363537456533504'),
	('77277780588367872', '496138616573952', '41364927394353152'),
	('77277780596756480', '496138616573952', '41371711400054784'),
	('77277780605145088', '496138616573952', '41469219249852416'),
	('77277780613533696', '496138616573952', '39916171171991552'),
	('77277780621922304', '496138616573952', '39918482854252544'),
	('77277780630310912', '496138616573952', '41373430515240960'),
	('77277780718391296', '496138616573952', '41375330996326400'),
	('77277780722585600', '496138616573952', '63741744973352960'),
	('77277780730974208', '496138616573952', '42082442672082944'),
	('77277780739362816', '496138616573952', '41376192166629376'),
	('77277780747751424', '496138616573952', '41377034236071936'),
	('77277780756140032', '496138616573952', '56911328312299520'),
	('77277780764528640', '496138616573952', '41378916912336896'),
	('77277780768722944', '496138616573952', '63482475359244288'),
	('77277780772917249', '496138616573952', '64290663792906240'),
	('77277780785500160', '496138616573952', '66790433014943744'),
	('77277780789694464', '496138616573952', '42087054753927168'),
	('77277780798083072', '496138616573952', '67027338952445952'),
	('77277780806471680', '496138616573952', '67027909637836800'),
	('77277780810665985', '496138616573952', '67042515441684480'),
	('77277780823248896', '496138616573952', '67082402312228864'),
	('77277780827443200', '496138616573952', '16392452747300864'),
	('77277780835831808', '496138616573952', '16392767785668608'),
	('77277780840026112', '496138616573952', '16438800255291392'),
	('77277780844220417', '496138616573952', '16438962738434048'),
	('77277780852609024', '496138616573952', '16439068543946752'),
	('77277860062040064', '496138616573953', '5129710648430592'),
	('77277860070428672', '496138616573953', '5129710648430593'),
	('77277860078817280', '496138616573953', '40238597734928384'),
	('77277860091400192', '496138616573953', '43117268627886080'),
	('77277860099788800', '496138616573953', '57009744761589760'),
	('77277860112371712', '496138616573953', '56309618086776832'),
	('77277860120760320', '496138616573953', '44986029924421632'),
	('77277860129148928', '496138616573953', '5129710648430594'),
	('77277860141731840', '496138616573953', '5129710648430595'),
	('77277860150120448', '496138616573953', '75002207560273920'),
	('77277860158509056', '496138616573953', '58480609315524608'),
	('77277860162703360', '496138616573953', '76606430504816640'),
	('77277860171091968', '496138616573953', '76914082455752704'),
	('77277860179480576', '496138616573953', '76607201262702592'),
	('77277860187869184', '496138616573953', '39915540965232640'),
	('77277860196257792', '496138616573953', '41370251991977984'),
	('77277860204646400', '496138616573953', '41363147411427328'),
	('77277860208840704', '496138616573953', '41371711400054784'),
	('77277860213035009', '496138616573953', '39916171171991552'),
	('77277860221423616', '496138616573953', '39918482854252544'),
	('77277860225617920', '496138616573953', '41373430515240960'),
	('77277860234006528', '496138616573953', '41375330996326400'),
	('77277860242395136', '496138616573953', '63741744973352960'),
	('77277860250783744', '496138616573953', '42082442672082944'),
	('77277860254978048', '496138616573953', '41376192166629376'),
	('77277860263366656', '496138616573953', '41377034236071936'),
	('77277860271755264', '496138616573953', '56911328312299520'),
	('77277860313698304', '496138616573953', '41378916912336896'),
	('77277860322086912', '496138616573953', '63482475359244288'),
	('77277860326281216', '496138616573953', '64290663792906240'),
	('77277860334669824', '496138616573953', '66790433014943744'),
	('77277860343058432', '496138616573953', '42087054753927168'),
	('77277860347252736', '496138616573953', '67027338952445952'),
	('77277860351447041', '496138616573953', '67027909637836800'),
	('77277860359835648', '496138616573953', '67042515441684480'),
	('77277860364029952', '496138616573953', '67082402312228864'),
	('77277860368224256', '496138616573953', '16392452747300864'),
	('77277860372418560', '496138616573953', '16392767785668608'),
	('77277860376612865', '496138616573953', '16438800255291392'),
	('77277860385001472', '496138616573953', '16438962738434048'),
	('77277860389195776', '496138616573953', '16439068543946752'),
	('7a5d31ba48fe3fb1266bf186dc5f7ba7', '52b0cf022ac4187b2a70dfa4f8b2d940', '58857ff846e61794c69208e9d3a85466'),
	('7da0a684903280c9582fe3f0063a6b4a', 'f6817f48af4fb3af11b9e8bf182f618b', '08e6b9dc3c04489c8e1ff2ce6f105aa4'),
	('7de42bdc0b8c5446b7d428c66a7abc12', '52b0cf022ac4187b2a70dfa4f8b2d940', '54dd5457a3190740005c1bfec55b1c34'),
	('805818784d80e30d60d0bc19c85d6bfd', 'ee8626f80f7c2619917b6236f3a7f02b', 'd7d6e2e4e2934f2c9385a623fd98c6f3'),
	('8359760581bf3f3a8b17d2d3d813f988', 'e51758fa916c881624b046d26bd09230', 'fb367426764077dcf94640c843733985'),
	('848d2e5b9a81f46199bbf2026581718f', 'ee8626f80f7c2619917b6236f3a7f02b', '418964ba087b90a84897b62474496b93'),
	('848d34a47accfce4892be408de900181', 'f6817f48af4fb3af11b9e8bf182f618b', '6e73eb3c26099c191bf03852ee1310a1'),
	('8501e54beca4d97e9b637fbc8088c9dc', 'f6817f48af4fb3af11b9e8bf182f618b', '540a2936940846cb98114ffb0d145cb8'),
	('85035d45e89059e7eeec1c5ed4a503ad', 'f6817f48af4fb3af11b9e8bf182f618b', 'ec8d607d0156e198b11853760319c646'),
	('8677678f8d2f38b2511890cdac0eae0b', 'f6817f48af4fb3af11b9e8bf182f618b', '2a470fc0c3954d9dbb61de6d80846549'),
	('86a6b794496c82586dd2f7e160f0084b', 'f6817f48af4fb3af11b9e8bf182f618b', '0b6debda2d5a214aa81540971575a6b2'),
	('86d964c21192cb8aecfb6571a6478041', 'e51758fa916c881624b046d26bd09230', 'd7d6e2e4e2934f2c9385a623fd98c6f3'),
	('87a130cf99c9bb8d8504e2b4850e8f05', 'e51758fa916c881624b046d26bd09230', 'e8af452d8948ea49d37c934f5100ae6a'),
	('87d1fe4a702017386ba10b4ee8690f32', 'ee8626f80f7c2619917b6236f3a7f02b', 'fb367426764077dcf94640c843733985'),
	('88824681e84cbb11ee123460a9dd2be6', 'e51758fa916c881624b046d26bd09230', '58857ff846e61794c69208e9d3a85466'),
	('8885e0c7239d877a108e5e14913d02c9', 'f6817f48af4fb3af11b9e8bf182f618b', '277bfabef7d76e89b33062b16a9a5020'),
	('89309192c469ebe55cac2189dde81375', 'e51758fa916c881624b046d26bd09230', 'e08cb190ef230d5d4f03824198773950'),
	('8a60df8d8b4c9ee5fa63f48aeee3ec00', '1750a8fb3e6d90cb7957c02de1dc8e59', 'd7d6e2e4e2934f2c9385a623fd98c6f3'),
	('8a63af8ef2a4a1a641eb80d3e66140dd', 'f6817f48af4fb3af11b9e8bf182f618b', '9271af487e0184387c326383d655ca37'),
	('8b6309dac37f642e41073ecf9d5f8a4f', 'ee8626f80f7c2619917b6236f3a7f02b', 'b4dfc7d5dd9e8d5b6dd6d4579b1aa559'),
	('8ce1022dac4e558ff9694600515cf510', '1750a8fb3e6d90cb7957c02de1dc8e59', '08e6b9dc3c04489c8e1ff2ce6f105aa4'),
	('8d848ca7feec5b7ebb3ecb32b2c8857a', '52b0cf022ac4187b2a70dfa4f8b2d940', '4148ec82b6acd69f470bea75fe41c357'),
	('9264104cee9b10c96241d527b2d0346d', '1750a8fb3e6d90cb7957c02de1dc8e59', '54dd5457a3190740005c1bfec55b1c34'),
	('97bb13727b2faa5f7ab0f006a600ecb7', 'ee8626f80f7c2619917b6236f3a7f02b', '2a470fc0c3954d9dbb61de6d80846549'),
	('98943175f29f12ae88c6bc5991559058', 'f6817f48af4fb3af11b9e8bf182f618b', 'e5973686ed495c379d829ea8b2881fc6'),
	('99fd4a7aa629ab77c0265285f779cfc8', 'f6817f48af4fb3af11b9e8bf182f618b', '4148ec82b6acd69f470bea75fe41c357'),
	('9a7a8020c3c6544773239c21daebfbc8', 'ee8626f80f7c2619917b6236f3a7f02b', '540a2936940846cb98114ffb0d145cb8'),
	('9b3be7550e49dae4264d055b9578f937', 'e51758fa916c881624b046d26bd09230', '08e6b9dc3c04489c8e1ff2ce6f105aa4'),
	('9c4c310005bf9b3aa10d0855b851dd4a', 'f6817f48af4fb3af11b9e8bf182f618b', '45c966826eeff4c99b8f8ebfe74511fc'),
	('9deb6902c4dd2068cc36068d8f92b129', 'ee8626f80f7c2619917b6236f3a7f02b', 'ec8d607d0156e198b11853760319c646'),
	('9ea5c9a17bd0fe2998f8f5bf3ff03340', 'ee8626f80f7c2619917b6236f3a7f02b', '65a8f489f25a345836b7f44b1181197a'),
	('9eb1c9695038cb5821a373d0faf4893a', 'f6817f48af4fb3af11b9e8bf182f618b', '339329ed54cf255e1f9392e84f136901'),
	('9f3734bd5df9a10e94a61991c8e6385b', 'f6817f48af4fb3af11b9e8bf182f618b', 'b1cb0a3fedf7ed0e4653cb5a229837ee'),
	('9f8311ecccd44e079723098cf2ffe1cc', '1750a8fb3e6d90cb7957c02de1dc8e59', '693ce69af3432bd00be13c3971a57961'),
	('a3ad5828891623739f972adec7b72925', 'e51758fa916c881624b046d26bd09230', 'c65321e57b7949b7a975313220de0422'),
	('a4703e53d8a1ef028f5c1e989aa181ab', 'ee8626f80f7c2619917b6236f3a7f02b', '693ce69af3432bd00be13c3971a57961'),
	('abc615092450682973b97fdf1517d70a', 'ee8626f80f7c2619917b6236f3a7f02b', '078f9558cdeab239aecb2bda1a8ed0d1'),
	('ac3a3e4f965e26639ba2157f9c87510f', 'e51758fa916c881624b046d26bd09230', 'f1cb187abf927c88b89470d08615f5ac'),
	('ac68f782147d10e832361955799f797e', 'f6817f48af4fb3af11b9e8bf182f618b', 'ae4fed059f67086fd52a73d913cf473d'),
	('acf83ea75957c4479b2454184d43db25', 'f6817f48af4fb3af11b9e8bf182f618b', '54dd5457a3190740005c1bfec55b1c34'),
	('ad2aff227a7e5c77a28978d5ec0aacd1', 'f6817f48af4fb3af11b9e8bf182f618b', 'c65321e57b7949b7a975313220de0422'),
	('ada57af3189bbf6ca6403e399b57ddc8', 'f6817f48af4fb3af11b9e8bf182f618b', '5efbf11a764db7759c36c669a263f292'),
	('aefc8c22e061171806e59cd222f6b7e1', '52b0cf022ac4187b2a70dfa4f8b2d940', 'e8af452d8948ea49d37c934f5100ae6a'),
	('af984985ac4d9c506dd14b2852db8b46', 'e51758fa916c881624b046d26bd09230', '2a470fc0c3954d9dbb61de6d80846549'),
	('b10400742083ee1f54965e9a8bd66cf7', 'ee8626f80f7c2619917b6236f3a7f02b', '08e6b9dc3c04489c8e1ff2ce6f105aa4'),
	('b173f181712c97d9f4090bbe1c842b7d', 'f6817f48af4fb3af11b9e8bf182f618b', '7ac9eb9ccbde2f7a033cd4944272bf1e'),
	('b3bca65182c8e8e8962be046f92bb114', 'f6817f48af4fb3af11b9e8bf182f618b', 'b4dfc7d5dd9e8d5b6dd6d4579b1aa559'),
	('b44e8fcab5b56e31a518c03a7365e740', 'f6817f48af4fb3af11b9e8bf182f618b', 'd86f58e7ab516d3bc6bfb1fe10585f97'),
	('b5ac258a406d007eeda459bac92d2bdb', 'e51758fa916c881624b046d26bd09230', '8fb8172747a78756c11916216b8b8066'),
	('b5d8777b207bc8542c582d8c0181b026', 'f6817f48af4fb3af11b9e8bf182f618b', '6ad53fd1b220989a8b71ff482d683a5a'),
	('b6fd9f4c680916c50576089226c868bb', 'ee8626f80f7c2619917b6236f3a7f02b', 'e3c13679c73a4f829bcff2aba8fd68b1'),
	('b929baebd4f991007f3e9b39c570cacf', 'f6817f48af4fb3af11b9e8bf182f618b', '3eb07a99bd7dcea6d9bef40e37735c7f'),
	('bc933866f29c688d12ebcbc6ba380609', 'ee8626f80f7c2619917b6236f3a7f02b', 'e6bfd1fcabfd7942fdd05f076d1dad38'),
	('bcac0166161d3d02fa0797ef6989aa43', 'f6817f48af4fb3af11b9e8bf182f618b', 'fb367426764077dcf94640c843733985'),
	('bdc0b7f20bf0d4b7a0a23783cd430ca2', 'ee8626f80f7c2619917b6236f3a7f02b', 'de13e0f6328c069748de7399fcc1dbbd'),
	('c1899d05c0e53a6698c0a2671db4c8e2', 'ee8626f80f7c2619917b6236f3a7f02b', '54dd5457a3190740005c1bfec55b1c34'),
	('c41c0dbd1e7568b4334f4cee6f1f53b7', 'e51758fa916c881624b046d26bd09230', 'd2bbf9ebca5a8fa2e227af97d2da7548'),
	('c42611ea289f02e5e1d85aa84df6a215', 'f6817f48af4fb3af11b9e8bf182f618b', 'f1cb187abf927c88b89470d08615f5ac'),
	('c8a4552dd8f3bb64d8bfd1930631d592', 'f6817f48af4fb3af11b9e8bf182f618b', '2dbbafa22cda07fa5d169d741b81fe12'),
	('ca4dd892d770632a2bbf3b4174aef0fd', 'f6817f48af4fb3af11b9e8bf182f618b', 'fedfbf4420536cacc0218557d263dfea'),
	('cd2f88e859c11a292e8b5c8da8005b2f', 'ee8626f80f7c2619917b6236f3a7f02b', '6531cf3421b1265aeeeabaab5e176e6d'),
	('cd60279d117b4b0435c8c78a4bcadb83', 'e51758fa916c881624b046d26bd09230', 'b1cb0a3fedf7ed0e4653cb5a229837ee'),
	('d3fe195d59811531c05d31d8436f5c8b', '1750a8fb3e6d90cb7957c02de1dc8e59', 'e8af452d8948ea49d37c934f5100ae6a'),
	('d553ad49e741d6299acb3b295bcb209f', 'f6817f48af4fb3af11b9e8bf182f618b', '89d70d3c72ad5cc778f511f8ac9f3242'),
	('d633bcc436fc482a958deeb2a9e72438', 'f6817f48af4fb3af11b9e8bf182f618b', 'fb07ca05a3e13674dbf6d3245956da2e'),
	('d6d39c7f15c04e48d1f5ad4919c48bee', 'f6817f48af4fb3af11b9e8bf182f618b', '65a8f489f25a345836b7f44b1181197a'),
	('daa3ba8acc7d5ec69d022db6ad962131', 'f6817f48af4fb3af11b9e8bf182f618b', 'cc50656cf9ca528e6f2150eba4714ad2'),
	('e046676385b007df88f95650ea885828', 'f6817f48af4fb3af11b9e8bf182f618b', 'ceab6bab4aea3f155de638e737c808ee'),
	('e0ee13939a1707ff0ada050ee81a35f5', 'f6817f48af4fb3af11b9e8bf182f618b', '717f6bee46f44a3897eca9abd6e2ec44'),
	('e270ad76a1db8b6cb3352d77eff600f3', 'ee8626f80f7c2619917b6236f3a7f02b', '1367a93f2c410b169faa7abcbad2f77c'),
	('e27a125002fff5556ca7c8c58a41f495', 'ee8626f80f7c2619917b6236f3a7f02b', '00a2a0ae65cdca5e93209cdbde97cbe6'),
	('e28bbe8b7bea9946016fe9f26fd47941', 'ee8626f80f7c2619917b6236f3a7f02b', 'b1cb0a3fedf7ed0e4653cb5a229837ee'),
	('e3e922673f4289b18366bb51b6200f17', '52b0cf022ac4187b2a70dfa4f8b2d940', '45c966826eeff4c99b8f8ebfe74511fc'),
	('e424befcb56fe26109eb5825783aeae8', 'ee8626f80f7c2619917b6236f3a7f02b', 'd86f58e7ab516d3bc6bfb1fe10585f97'),
	('e6c4d984c59dbf02cbd53ff9b3592178', 'f6817f48af4fb3af11b9e8bf182f618b', '00a2a0ae65cdca5e93209cdbde97cbe6'),
	('e853cee937560cb4b68904d382c513fb', 'ee8626f80f7c2619917b6236f3a7f02b', 'ae4fed059f67086fd52a73d913cf473d'),
	('ec25a3f64638f1b58f42b6a3da708189', 'f6817f48af4fb3af11b9e8bf182f618b', '2e42e3835c2b44ec9f7bc26c146ee531'),
	('efed119ff9eb2e1ec9b8386aaf69584f', 'f6817f48af4fb3af11b9e8bf182f618b', '1367a93f2c410b169faa7abcbad2f77c'),
	('f041ba27d075dbe53cc4ad5132cfcd32', 'ee8626f80f7c2619917b6236f3a7f02b', '9502685863ab87f0ad1134142788a385'),
	('f112a2eac584acf623916e676dbb8280', 'e51758fa916c881624b046d26bd09230', '54dd5457a3190740005c1bfec55b1c34'),
	('f2742febef62f2c1f1fc05c7252451e3', 'ee8626f80f7c2619917b6236f3a7f02b', 'e8af452d8948ea49d37c934f5100ae6a'),
	('f27cc0a40bcfa7752238e4b1000519a7', 'f6817f48af4fb3af11b9e8bf182f618b', '3f915b2769fc80648e92d04e84ca059d'),
	('f7881a0cefda56b986578418ad940063', 'f6817f48af4fb3af11b9e8bf182f618b', '4f84f9400e5e92c95f05b554724c2b58'),
	('fa3a980e2e135462216af6188c535909', 'e51758fa916c881624b046d26bd09230', 'aedbf679b5773c1f25e9f7b10111da73'),
	('fe90569d40b7464335760bf17a6a8d32', 'e51758fa916c881624b046d26bd09230', '65a8f489f25a345836b7f44b1181197a'),
	('fed41a4671285efb266cd404f24dd378', '52b0cf022ac4187b2a70dfa4f8b2d940', '00a2a0ae65cdca5e93209cdbde97cbe6');
/*!40000 ALTER TABLE `sys_role_permission` ENABLE KEYS */;

-- 导出  表 air.sys_user 结构
CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `login_name` varchar(100) DEFAULT NULL COMMENT '登录账号',
  `username` varchar(255) DEFAULT NULL COMMENT '账号名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) DEFAULT NULL COMMENT 'md5密码盐',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` int(11) DEFAULT NULL COMMENT '性别（1：男 2：女）',
  `email` varchar(45) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) DEFAULT NULL COMMENT '电话',
  `status` int(11) DEFAULT NULL COMMENT '状态(1：正常  2：冻结 ）',
  `is_deleted` char(1) DEFAULT '0' COMMENT '删除状态（0，正常，1已删除）',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- 正在导出表  air.sys_user 的数据：~0 rows (大约)
DELETE FROM `sys_user`;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`id`, `login_name`, `username`, `password`, `salt`, `avatar`, `birthday`, `sex`, `email`, `phone`, `status`, `is_deleted`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	('e9ca23d68d884d4ebb19d07889727dae', 'admin', 'admin', '2f73e95a58d7f0be', 'TwzdfCqk', 'user/20200207/下载_1581005694330.jpg', '2018-12-05 00:00:00', 1, '11@qq.com', '15882188781', 1, '0', NULL, '2018-12-21 17:54:10', 'admin', '2020-02-07 00:17:52');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

-- 导出  表 air.sys_user_role 结构
CREATE TABLE IF NOT EXISTS `sys_user_role` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户id',
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- 正在导出表  air.sys_user_role 的数据：~0 rows (大约)
DELETE FROM `sys_user_role`;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES
	('007d3c216736fcf8ab9f0bb6aaa5b3b4', 'e9ca23d68d884d4ebb19d07889727dae', 'f6817f48af4fb3af11b9e8bf182f618b');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;

-- 导出  表 air.t_excel 结构
CREATE TABLE IF NOT EXISTS `t_excel` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `age` tinyint(3) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  air.t_excel 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `t_excel` DISABLE KEYS */;
INSERT INTO `t_excel` (`id`, `name`, `sex`, `age`, `address`, `update_time`, `create_time`) VALUES
	('1bc2a14743fae1e1c9c86fa4531821e2', '毛毛', '男', 22, '动物园1楼', NULL, '2020-03-11 15:52:48'),
	('e55bdb5c173d943af133246a50fa3c09', '哈利', '女', 30, '动物园2楼', NULL, '2020-03-11 15:52:48');
/*!40000 ALTER TABLE `t_excel` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
