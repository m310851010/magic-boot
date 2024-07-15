/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80100
 Source Host           : localhost:3306
 Source Schema         : magic-boot

 Target Server Type    : MySQL
 Target Server Version : 80100
 File Encoding         : 65001

 Date: 15/07/2024 23:27:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for magic_backup_record_v2
-- ----------------------------
DROP TABLE IF EXISTS `magic_backup_record_v2`;
CREATE TABLE `magic_backup_record_v2`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '原对象ID',
  `create_date` bigint NOT NULL COMMENT '备份时间',
  `tag` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原名称',
  `content` blob NULL COMMENT '备份内容',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`, `create_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of magic_backup_record_v2
-- ----------------------------

-- ----------------------------
-- Table structure for sys_configure
-- ----------------------------
DROP TABLE IF EXISTS `sys_configure`;
CREATE TABLE `sys_configure`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `configure_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据值',
  `configure_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '键值',
  `configure_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `configure_condition` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '条件筛选',
  `configure_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '配置类型',
  `configure_desc_ribe` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '配置说明',
  `is_del` int NULL DEFAULT 0 COMMENT '删除标识：0未删除，1已删除',
  `create_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '配置中心' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_configure
-- ----------------------------
INSERT INTO `sys_configure` VALUES ('5646fe2ba5674a5e89e74fcd65e8c42d', '000000', 'default-password', '默认密码', NULL, '0', '默认密码，用于重置密码', 0, '1', '2022-05-21 12:41:51', '1', '2022-05-21 13:55:36', NULL);
INSERT INTO `sys_configure` VALUES ('a2cac5d9036b41ecaed4496b2f40085c', 'false', 'verification-code.enable', '是否验证“验证码”', '', '0', '1、开发模式下验证码可以不用输入，即可登录', 0, '1', '2022-05-21 11:29:24', '1', '2023-04-02 21:20:08', NULL);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `pid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '父id',
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标签',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '值',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `dict_type` int NULL DEFAULT NULL COMMENT '字典类型：0系统类，1业务类',
  `data_type` int NULL DEFAULT 0 COMMENT '数据类型,0:string 1: number',
  `status` int NULL DEFAULT 0 COMMENT '状态 0: 正常 1: 停用',
  `is_del` int NULL DEFAULT 0 COMMENT '删除标识：0未删除，1已删除',
  `ext_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '扩展JSON数据',
  `desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '0', '性别', 'SEX', 0, 1, 1, 0, 0, NULL, '', '1', '2022-03-28 21:57:05', '1', '2024-01-04 19:54:54');
INSERT INTO `sys_dict` VALUES ('10', '1', '男', '1', 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('11', '1', '女', '0', 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1742046021355180032', '4', '111', '111', 22, NULL, 0, 0, 1, NULL, NULL, '1', '2024-01-02 12:51:52', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1742052090781503488', 'ae9a2cd400264ff6bdc2f00b62d6e941', '是', '0', 1, NULL, 0, 0, 0, NULL, NULL, '1', '2024-01-02 13:15:59', '1', '2024-01-02 16:10:56');
INSERT INTO `sys_dict` VALUES ('1742056764452507648', '0', 'test', '是否登录', 1, 0, 0, 1, 0, NULL, NULL, '1', '2024-01-02 13:34:33', '1', '2024-01-02 14:48:09');
INSERT INTO `sys_dict` VALUES ('1742056935559139328', '1742056764452507648', 'test', 'test', 1, NULL, 0, 1, 1, NULL, NULL, '1', '2024-01-02 13:35:14', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1742118283743727616', 'ae9a2cd400264ff6bdc2f00b62d6e911', '系统', '0', 1, NULL, 0, 0, 0, '{\"clazz\": \"sys-avatar-color\"}', NULL, '1', '2024-01-02 17:39:00', '1', '2024-01-02 19:16:53');
INSERT INTO `sys_dict` VALUES ('1742118323174379520', 'ae9a2cd400264ff6bdc2f00b62d6e911', '业务', '1', 2, NULL, 0, 0, 0, '{\"clazz\": \"biz-avatar-color\"}', NULL, '1', '2024-01-02 17:39:10', '1', '2024-01-02 19:17:05');
INSERT INTO `sys_dict` VALUES ('1742143754359410688', '0', '状态', 'STATUS', 2, 0, 1, 0, 0, NULL, NULL, '1', '2024-01-02 19:20:13', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1742143865462329344', '1742143754359410688', '正常', '0', 1, NULL, 0, 0, 0, '{\"color\":\"success\"}', NULL, '1', '2024-01-02 19:20:40', '1', '2024-01-02 19:21:20');
INSERT INTO `sys_dict` VALUES ('1742143900107280384', '1742143754359410688', '停用', '1', 2, NULL, 0, 0, 0, '{\"color\":\"error\"}', NULL, '1', '2024-01-02 19:20:48', '1', '2024-01-02 19:21:29');
INSERT INTO `sys_dict` VALUES ('1742148747468607488', '0', '字典数据类型', 'DATA_TYPE', 10, 0, 1, 0, 0, NULL, NULL, '1', '2024-01-02 19:40:04', '1', '2024-01-02 19:40:27');
INSERT INTO `sys_dict` VALUES ('1742149014662549504', '1742148747468607488', '文本', '0', 1, NULL, 0, 0, 0, '{\"color\":\"success\"}', NULL, '1', '2024-01-02 19:41:07', '1', '2024-01-02 20:29:00');
INSERT INTO `sys_dict` VALUES ('1742149229515771904', '1742148747468607488', '数字', '1', 2, NULL, 0, 0, 0, '{\"color\":\"processing\"}', NULL, '1', '2024-01-02 19:41:59', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1742150713229840384', '0', '显示状态', 'SHOW_STATUS', 11, 0, 1, 0, 0, NULL, NULL, '1', '2024-01-02 19:47:52', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1742151457689440256', '1742150713229840384', '显示', '1', 1, NULL, 0, 0, 0, NULL, NULL, '1', '2024-01-02 19:50:50', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1742151498642624512', '1742150713229840384', '隐藏', '0', 2, NULL, 0, 0, 0, NULL, NULL, '1', '2024-01-02 19:51:00', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1742162050077036544', '0', 'test2', '2', 12, 1, 0, 0, 0, NULL, NULL, '1', '2024-01-02 20:32:55', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1742449831269502976', '0', '封禁时间', 'NO_LOGIN_TIME', 13, 0, 1, 0, 0, NULL, NULL, '1', '2024-01-03 15:36:28', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1742450129895559168', '1742449831269502976', '不封禁', '0', 1, NULL, 0, 0, 0, NULL, NULL, '1', '2024-01-03 15:37:39', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1742450173151416320', '1742449831269502976', '1分钟', '60', 2, NULL, 0, 0, 0, NULL, NULL, '1', '2024-01-03 15:37:49', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1742450217850114048', '1742449831269502976', '10分钟', '600', 3, NULL, 0, 0, 0, NULL, NULL, '1', '2024-01-03 15:38:00', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1742450336012046336', '1742449831269502976', '1小时', '18000', 4, NULL, 0, 0, 0, NULL, NULL, '1', '2024-01-03 15:38:28', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1742450617223352320', '1742449831269502976', '永久', '-1', 5, NULL, 0, 0, 0, NULL, NULL, '1', '2024-01-03 15:39:35', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('2', '0', '菜单类型', 'MENU_TYPE', 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '1', '2024-01-02 20:33:28');
INSERT INTO `sys_dict` VALUES ('20', '2', '目录', 'D', 0, 0, NULL, 0, 0, '{\"color\":\"blue\"}', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('21', '2', '菜单', 'M', 1, 0, NULL, 0, 0, '{\"color\":\"cyan\"}', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('22', '2', '按钮', 'B', 2, 0, NULL, 0, 0, '{\"color\":\"red\"}', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('3', '0', '权限范围', 'PERMISSION', 0, 0, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('31', '3', '全部数据权限', '0', 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('32', '3', '自定数据权限', '1', 1, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('33', '3', '本部门数据权限', '3', 2, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('34', '3', '本部门及以下数据权限', '2', 3, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('35', '3', '仅本人数据权限', '4', 4, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('4', '0', '组织机构类型', 'OFFICE_TYPE', 0, 0, 1, 0, 0, NULL, '', '1', '2021-04-22 21:30:30', '1', '2023-12-13 00:26:34');
INSERT INTO `sys_dict` VALUES ('41', '4', '公司', '1', 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('42', '4', '部门', '2', 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('ae9a2cd400264ff6bdc2f00b62d6e911', '0', '字典类型', 'DICT_TYPE', 9, 0, 1, 0, 0, NULL, '', NULL, NULL, '1', '2024-01-02 19:40:31');
INSERT INTO `sys_dict` VALUES ('ae9a2cd400264ff6bdc2f00b62d6e941', '0', '是否登录', 'IS_LOGIN', 0, 0, 0, 0, 0, NULL, '', NULL, NULL, '1', '2021-04-30 22:14:58');

-- ----------------------------
-- Table structure for sys_dict_items
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_items`;
CREATE TABLE `sys_dict_items`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '值',
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标签',
  `dict_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'sys_dict表id',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `is_del` int NULL DEFAULT 0 COMMENT '删除标识：0未删除，1已删除',
  `create_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_items
-- ----------------------------
INSERT INTO `sys_dict_items` VALUES ('0f91de6e8406d59762bebe5d2dfc9d36', '0', '不禁用', 'ae9a2cd400264ff6bdc2f00b62d6e941', 20, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_items` VALUES ('3e6e9e8fade54e9b9cdbee3fb3c69f11', '1', '男', '0da16e6dbc904a8dbcc3e3b15b0fdb11', 10, 0, '1', '2022-03-28 21:57:14', NULL, NULL, NULL);
INSERT INTO `sys_dict_items` VALUES ('457517be-5245-4d98-b9fa-8b6753a9cfc6', '2', '公司', '3c393981-9ddd-40b2-8c19-85f0a9d9a98f', 10, 0, '1', '2021-04-22 21:31:25', '1', '2022-02-05 15:36:15', '');
INSERT INTO `sys_dict_items` VALUES ('b928f5b1-07bd-4f09-9142-897c767c5303', '1', '部门', '3c393981-9ddd-40b2-8c19-85f0a9d9a98f', 0, 0, '1', '2021-04-22 21:31:18', '1', '2022-02-05 15:36:22', '');
INSERT INTO `sys_dict_items` VALUES ('c5cf8715a74537156ea29c8bbc622b05', '1', '禁用', 'ae9a2cd400264ff6bdc2f00b62d6e941', 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_items` VALUES ('c988b28d659d40fc93535947f28977d9', '0', '女', '0da16e6dbc904a8dbcc3e3b15b0fdb11', 20, 0, '1', '2022-03-28 21:57:19', NULL, NULL, NULL);
INSERT INTO `sys_dict_items` VALUES ('f764ba6a05ad4a9dad96bdc0995b83e3', 'test', 'test', 'ae9a2cd400264ff6bdc2f00b62d6e911', 10, 0, '1', '2023-04-04 10:11:16', NULL, NULL, NULL);
INSERT INTO `sys_dict_items` VALUES ('ze9a2cd400264ff6bdc2f00b62d6e910', '1', '业务类', 'ae9a2cd400264ff6bdc2f00b62d6e911', 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_items` VALUES ('ze9a2cd400264ff6bdc2f00b62d6e911', '0', '系统类', 'ae9a2cd400264ff6bdc2f00b62d6e911', 0, 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `engine` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '存储引擎, D:磁盘',
  `original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '原始文件名称,包含后缀',
  `url` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件相对路径',
  `biz_type` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '业务类型，D:头像 可自行扩展',
  `biz_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '业务id',
  `suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件后缀',
  `size` bigint NULL DEFAULT NULL COMMENT '文件大小kb',
  `storage_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '文件存储路径',
  `thumbnail` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片缩略图路径',
  `ext_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '扩展信息',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `is_del` int NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('1744037493226999808', 'D', '2d20e3566de34e5bab9abf510aa92a85.jpg', '/userfiles/D/20240108/b7586e20682a4f8289c74d79401135ca.jpg', 'D', '1', 'jpg', 91, '/Users/mdc/mb/userfiles/D/20240108/b7586e20682a4f8289c74d79401135ca.jpg', NULL, NULL, NULL, 0, '1', '2024-01-08 00:45:16', NULL, NULL);

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录账号',
  `fail_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '失败密码',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录类型（成功、失败）',
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '浏览器',
  `os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作系统',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地理位置',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'token',
  `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('1744347608316514304', 'admin', NULL, '成功', 'MSEdge', 'Windows 10 or Windows Server 2016', '内网IP', '0:0:0:0:0:0:0:1', 'K0_fZ7EEFWcpf3szT_mG1I97fmWdZLkAVu__', '2024-01-08 21:17:33');
INSERT INTO `sys_login_log` VALUES ('1745104298351661056', 'admin', NULL, '成功', 'MSEdge', 'Windows 10 or Windows Server 2016', '内网IP', '0:0:0:0:0:0:0:1', 'pH_CWZj16zuRoHa9T_l2bvPAQfuTfAtdjb__', '2024-01-10 23:24:22');
INSERT INTO `sys_login_log` VALUES ('1745108645579984896', 'admin', NULL, '成功', 'MSEdge', 'Windows 10 or Windows Server 2016', '内网IP', '0:0:0:0:0:0:0:1', 'UX_4KqQGBPYHHJhL3_JODTB4TJdgYUrACL__', '2024-01-10 23:41:38');
INSERT INTO `sys_login_log` VALUES ('1745109817653071872', 'admin', NULL, '成功', 'MSEdge', 'Windows 10 or Windows Server 2016', '内网IP', '0:0:0:0:0:0:0:1', 't0_KFRm9PiOz5OlJy_C0XgTad9ldEDdoqb__', '2024-01-10 23:46:17');
INSERT INTO `sys_login_log` VALUES ('1745109822161948672', 'admin', NULL, '成功', 'Firefox', 'Windows 10 or Windows Server 2016', '内网IP', '127.0.0.1', '9Y_HDbGmU7ftkzDWo_6eItC6jDcBwKlscG__', '2024-01-10 23:46:18');
INSERT INTO `sys_login_log` VALUES ('1745112975812988928', 'admin', NULL, '成功', 'MSEdge', 'Windows 10 or Windows Server 2016', '内网IP', '0:0:0:0:0:0:0:1', '7t_4cPrwBQNTYeqbt_QvJnCHAgd4njI1mS__', '2024-01-10 23:58:50');
INSERT INTO `sys_login_log` VALUES ('1745118837164085248', 'admin', NULL, '成功', 'MSEdge', 'Windows 10 or Windows Server 2016', '内网IP', '0:0:0:0:0:0:0:1', 'QL_evxIKIBHVNoaZ3_9wx2pbPpwUUQM6WA__', '2024-01-11 00:22:08');
INSERT INTO `sys_login_log` VALUES ('1745448722566877184', 'admin', NULL, '成功', 'MSEdge', 'Windows 10 or Windows Server 2016', '内网IP', '0:0:0:0:0:0:0:1', '8B_CgPaSQGzSihrWu_R93RPTMMHofd7GKM__', '2024-01-11 22:12:59');
INSERT INTO `sys_login_log` VALUES ('1745448722566877185', 'admin', NULL, '成功', 'MSEdge', 'Windows 10 or Windows Server 2016', '内网IP', '0:0:0:0:0:0:0:1', '8B_CgPaSQGzSihrWu_R93RPTMMHofd7GKM__', '2024-01-11 22:12:59');
INSERT INTO `sys_login_log` VALUES ('1745465534293610496', 'admin', NULL, '成功', 'MSEdge', 'Windows 10 or Windows Server 2016', '内网IP', '0:0:0:0:0:0:0:1', 'W9_EllnS6CcZxOmSZ_SkgPj7oKna3qaYUZ__', '2024-01-11 23:19:47');
INSERT INTO `sys_login_log` VALUES ('1745473268661489664', 'admin', NULL, '成功', 'Chrome', 'Windows 10 or Windows Server 2016', '内网IP', '0:0:0:0:0:0:0:1', '92_muAupQxVkE5eWt_I2k6vE6EJI6N8wOf__', '2024-01-11 23:50:31');
INSERT INTO `sys_login_log` VALUES ('1745483256343695360', 'admin', NULL, '成功', 'MSEdge', 'Windows 10 or Windows Server 2016', '内网IP', '0:0:0:0:0:0:0:1', 'pN_hV2634sGM74yDj_IJYK0QOhERPQXw0h__', '2024-01-12 00:30:12');
INSERT INTO `sys_login_log` VALUES ('1755576381430960128', 'admin', NULL, '成功', 'MSEdge', 'Windows 10 or Windows Server 2016', '内网IP', '0:0:0:0:0:0:0:1', 'W0_CQSSqNjNu0WASb_cMzSfQPYKICf9kcM__', '2024-02-08 20:56:41');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `pid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '父id',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图标',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单链接',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限码',
  `menu_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单类型,M:菜单 B:按钮 D:目录',
  `frame` int NULL DEFAULT 1 COMMENT '是否为外链 0是 1否',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `component_name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组件名称',
  `open_mode` int NULL DEFAULT NULL COMMENT '打开方式，0：iframe  1：新标签页',
  `is_show` int NULL DEFAULT NULL COMMENT '是否显示：1显示，0不显示',
  `keep_alive` int NULL DEFAULT 1 COMMENT '是否缓存：1缓存，0不缓存',
  `ext_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '扩展JSON数据',
  `is_del` int NULL DEFAULT 0 COMMENT '是否删除：0未删除，1已删除',
  `create_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('067343d790fd4d73b3e2ea5bb3d043f1', '99c6e9aeb6694c349f5db66e2516f069', '', '删除', NULL, NULL, 'code:gen:delete', 'B', 1, 30, '', NULL, 0, 0, NULL, 0, '1', '2022-03-27 22:25:27', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('06b8a427e4cd4c1ba11752070f565f20', 'b1851d1b13594e71840103c11a37a669', 'user-group', '用户管理', NULL, '/main/system/user', NULL, 'M', 1, 50, '', NULL, 1, 1, NULL, 0, NULL, NULL, '1', '2023-06-25 20:25:26');
INSERT INTO `sys_menu` VALUES ('06d8c9243e5e43bcbd1c24d10d02fbad', 'b198ae9fec6f4de8a44b7f6e097a44b3', NULL, '查看', NULL, NULL, 'data:test:view', 'B', 1, 10, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1009eed4f46141e3aca939490d68786a', '8009eed4f46141e3aca939490d68786a', NULL, '按钮', NULL, NULL, NULL, 'B', 1, 30, '', NULL, 0, 0, NULL, 0, '1', '2019-11-15 10:23:07', '1', '2023-05-31 15:28:31');
INSERT INTO `sys_menu` VALUES ('10fc3bdde0c642aea2af34d281a49cf9', 'b1851d1b13594e71840103c11a37a669', 'home', '测试数据', NULL, '/main/system/test', NULL, 'M', 1, 100, 'data-test-list', NULL, 1, 1, NULL, 0, '1', '2022-01-16 13:43:03', '1', '2023-05-31 15:28:41');
INSERT INTO `sys_menu` VALUES ('11ac1fc1d2864f079a48d29f82dbb820', '99c6e9aeb6694c349f5db66e2516f069', '', '执行生成', NULL, NULL, 'code:gen:execute', 'B', 1, 40, '', NULL, 0, 0, NULL, 0, '1', '2022-05-10 16:22:38', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1739991900896759808', '1739991773570273280', 'amazon', 'test', NULL, '/test', NULL, 'M', 1, NULL, NULL, 1, 1, 1, NULL, 0, '1', '2023-12-27 20:49:31', '1', '2023-12-27 21:05:55');
INSERT INTO `sys_menu` VALUES ('1739995427937325056', '1739991900896759808', NULL, 'ttt', '1111111', NULL, NULL, 'B', NULL, 10, NULL, NULL, 0, 1, NULL, 0, '1', '2023-12-27 21:03:32', '1', '2023-12-27 21:06:51');
INSERT INTO `sys_menu` VALUES ('1740043945494319104', '8e9455740091486c914495cfb0c7faa5', NULL, '未分配的用户列表', '未分配当前角色的用户列表', NULL, 'role:user:unallocated', 'B', NULL, 60, NULL, NULL, 0, 1, NULL, 0, '1', '2023-12-28 00:16:20', '1', '2023-12-28 01:06:43');
INSERT INTO `sys_menu` VALUES ('1740044350496313344', '8e9455740091486c914495cfb0c7faa5', NULL, '分配用户', NULL, NULL, 'role:user:allocate', 'B', NULL, 70, NULL, NULL, 0, 1, NULL, 0, '1', '2023-12-28 00:17:56', '1', '2023-12-28 01:06:54');
INSERT INTO `sys_menu` VALUES ('1740066017553551360', '8e9455740091486c914495cfb0c7faa5', NULL, '取消授权', NULL, NULL, 'role:user:cancel', 'B', NULL, NULL, NULL, NULL, 0, 1, NULL, 0, '1', '2023-12-28 01:44:02', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1740350681291821056', '8e9455740091486c914495cfb0c7faa5', NULL, '组织机构查询', NULL, NULL, 'role:office:list', 'B', NULL, 80, NULL, NULL, NULL, 1, NULL, 0, '1', '2023-12-28 20:35:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1740351741364408320', '8e9455740091486c914495cfb0c7faa5', NULL, '菜单查询', NULL, NULL, 'role:menu:list', 'B', NULL, 90, NULL, NULL, NULL, 1, NULL, 0, '1', '2023-12-28 20:39:24', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1740747658223554560', '8e9455740091486c914495cfb0c7faa5', NULL, '查询部门树结构-角色', NULL, NULL, 'role:office:tree', 'B', NULL, 100, NULL, NULL, NULL, 1, NULL, 0, '1', '2023-12-29 22:52:38', '1', '2023-12-29 23:08:04');
INSERT INTO `sys_menu` VALUES ('1740751453083013120', '06b8a427e4cd4c1ba11752070f565f20', NULL, '查询部门树结构-用户', NULL, NULL, 'user:office:tree', 'B', NULL, 70, NULL, NULL, NULL, 1, NULL, 0, '1', '2023-12-29 23:07:43', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1740755254728855552', '06b8a427e4cd4c1ba11752070f565f20', NULL, '获取角色列表', NULL, NULL, 'user:role:list', 'B', NULL, 80, NULL, NULL, NULL, 1, NULL, 0, '1', '2023-12-29 23:22:49', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1740759135730929664', '06b8a427e4cd4c1ba11752070f565f20', NULL, '修改', NULL, NULL, 'user:update', 'B', NULL, 11, NULL, NULL, NULL, 1, NULL, 0, '1', '2023-12-29 23:38:14', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1740759467622010880', '06b8a427e4cd4c1ba11752070f565f20', NULL, '重置密码', NULL, NULL, 'user:resetPassword', 'B', NULL, 90, NULL, NULL, NULL, 1, NULL, 0, '1', '2023-12-29 23:39:33', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1741151980400807936', '6f3594d0-5445-41e1-a13c-890a57485036', NULL, '修改', NULL, NULL, 'office:update', 'B', NULL, 11, NULL, NULL, NULL, 1, NULL, 0, '1', '2023-12-31 01:39:16', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1741801535966416896', '6f3594d0-5445-41e1-a13c-890a57485036', NULL, '用户列表-未添加', NULL, NULL, 'office:user:unadd', 'B', NULL, 50, NULL, NULL, NULL, 1, NULL, 0, '1', '2024-01-01 20:40:22', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1741801648935800832', '6f3594d0-5445-41e1-a13c-890a57485036', NULL, '添加用户', NULL, NULL, 'office:user:add', 'B', NULL, 60, NULL, NULL, NULL, 1, NULL, 0, '1', '2024-01-01 20:40:49', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1742066740973670400', 'c5f407478c4e4c9cbcdbee6389d2c909', NULL, '修改', NULL, NULL, 'dict:update', 'B', NULL, 11, NULL, NULL, NULL, 1, NULL, 0, '1', '2024-01-02 14:14:12', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1742193579557785600', '0', 'home', '首页', NULL, '/main/dashboard', NULL, 'M', 1, 0, NULL, NULL, 1, 1, NULL, 0, '1', '2024-01-02 22:38:12', '1', '2024-01-02 22:46:21');
INSERT INTO `sys_menu` VALUES ('1742907136557584384', '4a57f57fc7324c94b6390f1a2dd1f49a', 'fund-projection-screen', '系统监控', NULL, '/main/monitor/server', 'monitor:server:view', 'M', 1, 31, NULL, NULL, 1, 1, NULL, 0, '1', '2024-01-04 21:53:38', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('2664b76cb2904227bce5b0f7d1dd6e7b', '641253af-8ea1-4b5d-8bc3-a7165ef60ff2', '', '下拉框', NULL, '/examples/select-example', NULL, 'M', 1, 60, NULL, NULL, 1, 0, NULL, 0, '1', '2021-08-29 17:35:17', '1', '2022-01-21 21:57:29');
INSERT INTO `sys_menu` VALUES ('35e56d173b5f4e6790883572d3104137', '99c6e9aeb6694c349f5db66e2516f069', '', '生成', NULL, NULL, 'code:gen', 'B', 1, 20, '', NULL, 0, 0, NULL, 0, '1', '2022-03-18 08:07:03', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('36329aad6f8e444dae4338b2124da7ba', '28216291e6a84b14aefbad91ed2b0f34', NULL, '保存', NULL, NULL, 'data:test:save', 'B', 1, 20, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('39be13ef6f0745568c80bf35202ddb2b', 'b1851d1b13594e71840103c11a37a669', 'menu', '菜单管理', NULL, '/main/system/menu', NULL, 'M', 1, 10, '', NULL, 1, 1, NULL, 0, NULL, NULL, '1', '2023-06-25 20:10:13');
INSERT INTO `sys_menu` VALUES ('3a0e3107402449698d86ee3cbc5272c0', '4a57f57fc7324c94b6390f1a2dd1f49a', 'database', '数据库监控', NULL, '/main/monitor/druid', NULL, 'M', 1, 30, '', NULL, 1, 0, NULL, 0, '1', '2022-03-05 23:21:35', '1', '2023-05-31 15:28:58');
INSERT INTO `sys_menu` VALUES ('3ae3a47e3bf54bb682adb10b497e6183', 'b198ae9fec6f4de8a44b7f6e097a44b3', NULL, '保存', NULL, NULL, 'data:test:save', 'B', 1, 20, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('3cac94be259c48d4ae778a13ee8fab82', '116182d1349a464fa89e24ddb349fea9', NULL, '删除', NULL, NULL, 'data:test:delete', 'B', 1, 30, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('3da5882528b640478b6d64bcbc4d1795', '99c6e9aeb6694c349f5db66e2516f069', '', '保存', NULL, NULL, 'code:gen:save', 'B', 1, 10, '', NULL, 0, 0, NULL, 0, '1', '2022-03-18 08:03:08', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('3e14f782d4e14998bce4f9d35c032a95', '06b8a427e4cd4c1ba11752070f565f20', '', '修改状态', NULL, NULL, 'user:change:status', 'B', NULL, 40, '', NULL, 0, 0, NULL, 0, '1', '2022-05-09 21:43:06', '1', '2023-12-29 23:41:18');
INSERT INTO `sys_menu` VALUES ('414e5d31-fe05-4e69-9983-217c10b9740a', '39be13ef6f0745568c80bf35202ddb2b', '', '查看', NULL, NULL, 'menu:view', 'B', 1, 30, NULL, NULL, 0, 0, NULL, 0, '1', '2021-03-25 20:40:12', '1', '2022-02-05 22:02:57');
INSERT INTO `sys_menu` VALUES ('4526eb9c-4b7a-4945-bfa9-cddc01f36c22', '6f3594d0-5445-41e1-a13c-890a57485036', '', '保存', NULL, NULL, 'office:save', 'B', 1, 10, NULL, NULL, 0, 0, NULL, 0, '1', '2021-04-22 20:43:09', '1', '2022-02-05 22:04:03');
INSERT INTO `sys_menu` VALUES ('4807e74954c1443c811c701bacb878df', '116182d1349a464fa89e24ddb349fea9', NULL, '查看', NULL, NULL, 'data:test:view', 'B', 1, 10, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('4a57f57fc7324c94b6390f1a2dd1f49a', '0', 'diagnostics', '系统监控', NULL, '/main/monitor', NULL, 'D', NULL, 40, '', NULL, 1, 0, NULL, 0, '1', '2022-03-05 17:24:21', '1', '2024-01-05 22:12:22');
INSERT INTO `sys_menu` VALUES ('4fc65edbe0544c369b58fdfed1523537', '4a57f57fc7324c94b6390f1a2dd1f49a', 'profile', '操作日志', NULL, '/main/monitor/oper-log', NULL, 'M', 1, 10, '', NULL, 1, 1, NULL, 0, '1', '2022-03-05 17:24:45', '1', '2023-06-14 11:08:49');
INSERT INTO `sys_menu` VALUES ('5215c2511a1e4279a536ab663a344a37', '9de78e0a6042469c891af82fbc21ba90', NULL, '保存', NULL, NULL, 'component:save', 'B', 1, 10, NULL, NULL, 0, 0, NULL, 0, '1', '2022-03-04 21:51:32', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('52702cf956f847e8a2d045f66eb6bfee', 'fdbdcf8b8d674ae38154bc1e57498a91', '', '踢人', NULL, NULL, 'online:logout', 'B', 1, 10, '', NULL, 0, 0, NULL, 0, '1', '2022-03-16 08:16:35', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('546c874267514672844cd3a019e468f7', 'c5f407478c4e4c9cbcdbee6389d2c909', '', '删除', NULL, NULL, 'dict:delete', 'B', 1, 20, NULL, NULL, 0, 0, NULL, 0, '1', '2020-11-11 14:11:38', '1', '2021-04-30 21:37:22');
INSERT INTO `sys_menu` VALUES ('641253af-8ea1-4b5d-8bc3-a7165ef60ff2', '0', 'ant-design', '一些例子', NULL, '/examples', NULL, 'D', 1, 20, '', NULL, 1, 0, NULL, 0, '1', '2021-03-28 22:59:56', '1', '2023-06-25 20:31:26');
INSERT INTO `sys_menu` VALUES ('6762231e-4f30-4a6b-a94e-b185e99ed608', '6f3594d0-5445-41e1-a13c-890a57485036', '', '删除', NULL, NULL, 'office:delete', 'B', 1, 20, NULL, NULL, 0, 0, NULL, 0, '1', '2021-04-22 20:42:56', '1', '2022-02-05 22:04:07');
INSERT INTO `sys_menu` VALUES ('684723f4226948aba1661292961c8f71', '8e9455740091486c914495cfb0c7faa5', '', '删除', NULL, NULL, 'role:delete', 'B', 1, 20, NULL, NULL, 0, 0, NULL, 0, '1', '2020-11-11 13:59:45', '1', '2021-04-30 21:36:56');
INSERT INTO `sys_menu` VALUES ('6f3594d0-5445-41e1-a13c-890a57485036', 'b1851d1b13594e71840103c11a37a669', 'apartment', '组织机构', NULL, '/main/system/office', NULL, 'M', 1, 20, '', NULL, 1, 1, NULL, 0, '1', '2021-04-22 20:40:14', '1', '2023-06-25 20:12:59');
INSERT INTO `sys_menu` VALUES ('710c0a9195934e73b11123b62283fdc5', 'c5f407478c4e4c9cbcdbee6389d2c909', NULL, '查看', NULL, NULL, 'dict:view', 'B', 1, 30, NULL, NULL, 0, 0, NULL, 0, '1', '2022-02-05 22:05:51', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('713626516eaa4ba98c9daf55009b481e', '641253af-8ea1-4b5d-8bc3-a7165ef60ff2', '', '测试表单', NULL, '/examples/test-mb-form', NULL, 'M', 1, 80, NULL, NULL, 1, 0, NULL, 0, '1', '2022-03-15 07:51:25', '1', '2022-03-15 07:51:34');
INSERT INTO `sys_menu` VALUES ('7324ad98fb51462795750bcfc1b11be2', '06b8a427e4cd4c1ba11752070f565f20', NULL, '查看', NULL, NULL, 'user:view', 'B', 1, 30, NULL, NULL, 0, 0, NULL, 0, '1', '2022-02-05 22:05:18', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('74c852ea-be4b-4533-b146-cfbd776045d5', '641253af-8ea1-4b5d-8bc3-a7165ef60ff2', '', '富文本', NULL, '/examples/ueditor-example', NULL, 'M', 1, 30, NULL, NULL, 1, 0, NULL, 0, '1', '2021-05-16 15:25:52', '1', '2021-05-16 15:25:52');
INSERT INTO `sys_menu` VALUES ('7ad229f12c8f4b57bbb9349e2ffd8932', 'b1851d1b13594e71840103c11a37a669', 'setting-center', '配置中心', NULL, '/main/system/configure', NULL, 'M', 1, 110, '', NULL, 1, 1, NULL, 0, '1', '2022-05-21 18:32:26', '1', '2023-06-25 20:27:15');
INSERT INTO `sys_menu` VALUES ('7e9203fdb630434abf7542ff111bc369', '06b8a427e4cd4c1ba11752070f565f20', '', '导入预览', NULL, NULL, 'user:import:preview', 'B', 1, 60, '', NULL, 0, 0, NULL, 0, '1', '2022-05-09 21:43:28', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('7f20cb25f62e48c5ac5e986e3277956f', '06b8a427e4cd4c1ba11752070f565f20', '', '导入', NULL, NULL, 'user:import', 'B', 1, 50, '', NULL, 0, 0, NULL, 0, '1', '2022-05-09 21:43:18', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('8009eed4f46141e3aca939490d68786a', 'b1851d1b13594e71840103c11a37a669', 'border-outer', '区域管理', NULL, '/main/system/area', NULL, 'M', 1, 30, '', NULL, 0, 0, NULL, 0, '1', '2019-11-15 10:23:07', '1', '2023-12-25 19:55:46');
INSERT INTO `sys_menu` VALUES ('833b204d5f2c402190bfca677421cfeb', '39be13ef6f0745568c80bf35202ddb2b', '', '删除', NULL, NULL, 'menu:delete', 'B', 1, 20, NULL, NULL, 0, 0, NULL, 0, '1', '2020-11-11 11:06:05', '1', '2021-04-30 21:36:36');
INSERT INTO `sys_menu` VALUES ('8bf0ebc0098c4003b353d36bec3fff19', 'bf5c1e44546341de9acee52d148d5a76', NULL, '保存', NULL, NULL, 'data:test:save', 'B', 1, 20, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('8e9455740091486c914495cfb0c7faa5', 'b1851d1b13594e71840103c11a37a669', 'safety-certificate', '角色管理', NULL, '/main/system/role', NULL, 'M', 1, 40, '', NULL, 1, 1, NULL, 0, NULL, NULL, '1', '2023-06-25 20:25:22');
INSERT INTO `sys_menu` VALUES ('90c5d6263fa04b5db2a1b0a626409523', '28216291e6a84b14aefbad91ed2b0f34', NULL, '查看', NULL, NULL, 'data:test:view', 'B', 1, 10, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('91bdb7d742a64a8c8a8fdc6d3bb61581', '641253af-8ea1-4b5d-8bc3-a7165ef60ff2', '', '可编辑表格', NULL, '/examples/editor-table', NULL, 'M', 1, 40, NULL, NULL, 1, 0, NULL, 0, '1', '2021-06-13 12:53:11', '1', '2021-06-13 12:53:11');
INSERT INTO `sys_menu` VALUES ('9385945c7f5f476ab38885976907db2a', '641253af-8ea1-4b5d-8bc3-a7165ef60ff2', '', '测试外链', NULL, 'http://baidu.com', NULL, 'M', 1, 90, NULL, NULL, 1, 0, NULL, 0, '1', '2022-06-28 10:53:20', '1', '2023-04-27 18:52:30');
INSERT INTO `sys_menu` VALUES ('94071254597d4da286bb8112ad93f4ff', '8e9455740091486c914495cfb0c7faa5', '', '保存', NULL, NULL, 'role:save', 'B', 1, 10, NULL, NULL, 0, 0, NULL, 0, '1', '2020-11-11 13:59:27', '1', '2021-04-30 21:36:51');
INSERT INTO `sys_menu` VALUES ('98a47d57680f4759816028a035ccc7d3', '39be13ef6f0745568c80bf35202ddb2b', '', '是否显示/缓存', NULL, NULL, 'menu:change', 'B', 1, 60, '', NULL, 0, 0, NULL, 0, '1', '2022-05-09 21:41:37', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('99c6e9aeb6694c349f5db66e2516f069', 'd7f8d052d4864bd285c575c3cf2dce69', 'code', '代码生成', NULL, '/lowcode/code-gen-list', NULL, 'M', 1, 30, '', NULL, 1, 1, NULL, 0, '1', '2022-03-18 08:01:25', '1', '2022-04-04 00:48:32');
INSERT INTO `sys_menu` VALUES ('9fe1eaae168e4b719dc880f039ccd7b7', 'fdbdcf8b8d674ae38154bc1e57498a91', '', '查看', NULL, NULL, 'online:view', 'B', 1, 20, '', NULL, 0, 0, NULL, 1, '1', '2022-05-10 16:16:11', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('a224c0274f8e4ae6931e7deab75cd90b', '7ad229f12c8f4b57bbb9349e2ffd8932', '', '删除', NULL, NULL, 'configure:delete', 'B', 1, 30, '', NULL, 0, 0, NULL, 0, '1', '2022-05-21 18:34:48', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('a2c99f09bbe24cc1be6344fe99c8a612', '9de78e0a6042469c891af82fbc21ba90', NULL, '删除', NULL, NULL, 'component:delete', 'B', 1, 20, NULL, NULL, 0, 0, NULL, 0, '1', '2022-03-04 21:51:48', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('a5f2cb418ac348bca3d51b98958c4a80', '8e9455740091486c914495cfb0c7faa5', NULL, '查看', NULL, NULL, 'role:view', 'B', 1, 30, NULL, NULL, 0, 0, NULL, 0, '1', '2022-02-05 22:04:56', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('a7a7ba2e31504b27a02465ecf6e014c6', 'b198ae9fec6f4de8a44b7f6e097a44b3', NULL, '删除', NULL, NULL, 'data:test:delete', 'B', 1, 30, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('a9b57951790b423a91e8232aca514305', '7ad229f12c8f4b57bbb9349e2ffd8932', '', '保存', NULL, NULL, 'configure:save', 'B', 1, 20, '', NULL, 0, 0, NULL, 0, '1', '2022-05-21 18:34:38', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('b1851d1b13594e71840103c11a37a669', '0', 'setting', '系统设置', NULL, NULL, NULL, 'D', NULL, 10, NULL, NULL, 1, 0, NULL, 0, NULL, NULL, '1', '2023-12-31 13:45:34');
INSERT INTO `sys_menu` VALUES ('b353de07f3624b4fa1c6f8b1b1e80cad', 'c5f407478c4e4c9cbcdbee6389d2c909', '', '保存', NULL, NULL, 'dict:save', 'B', 1, 10, NULL, NULL, 0, 0, NULL, 0, '1', '2020-11-11 14:11:28', '1', '2021-04-30 21:37:14');
INSERT INTO `sys_menu` VALUES ('b5a77ce22eef40cba2eb1ca2794d9d8a', '6f3594d0-5445-41e1-a13c-890a57485036', NULL, '用户列表', NULL, NULL, 'office:user:list', 'B', 1, 40, NULL, NULL, 0, 0, NULL, 0, '1', '2022-02-04 17:44:08', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('bee5c6cb1b484133a4b8e72fe5c5eed0', '06b8a427e4cd4c1ba11752070f565f20', '', '保存', NULL, NULL, 'user:save', 'B', 1, 10, NULL, NULL, 0, 0, NULL, 0, '1', '2020-11-11 13:27:06', '1', '2021-04-30 21:37:01');
INSERT INTO `sys_menu` VALUES ('bf41ddc3ea314b158e21e4efc1ed5a25', '8e9455740091486c914495cfb0c7faa5', NULL, '权限', NULL, NULL, 'role:permission', 'B', 1, 40, NULL, NULL, 0, 0, NULL, 0, '1', '2022-01-11 20:31:02', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('c38e9fe9521a4294bda2ab6ed8273719', '116182d1349a464fa89e24ddb349fea9', NULL, '保存', NULL, NULL, 'data:test:save', 'B', 1, 20, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('c4352b75954a47de84cd896c6e2093b9', '99c6e9aeb6694c349f5db66e2516f069', '', '查看', NULL, NULL, 'code:gen:view', 'B', 1, 50, '', NULL, 0, 0, NULL, 0, '1', '2022-05-10 16:23:08', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('c50388914fab408c8b74f83d0d43e557', '641253af-8ea1-4b5d-8bc3-a7165ef60ff2', NULL, '测试列表', NULL, '/examples/test-mb-list', NULL, 'M', 1, 70, NULL, NULL, 1, 0, NULL, 0, '1', '2022-03-06 15:13:30', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('c5f407478c4e4c9cbcdbee6389d2c909', 'b1851d1b13594e71840103c11a37a669', 'dict', '数据字典', NULL, '/main/system/dic', NULL, 'M', 1, 60, '', NULL, 1, 1, NULL, 0, '1', '2019-11-15 10:22:28', '1', '2023-06-25 20:26:35');
INSERT INTO `sys_menu` VALUES ('c6e7b5866ce64bfdabeb5dd6342ca55f', '06b8a427e4cd4c1ba11752070f565f20', '', '删除', NULL, NULL, 'user:delete', 'B', 1, 20, NULL, NULL, 0, 0, NULL, 0, '1', '2020-11-11 13:27:22', '1', '2021-04-30 21:37:05');
INSERT INTO `sys_menu` VALUES ('c7445e2ac6144a15a76d723607fbfb9d', 'd7f8d052d4864bd285c575c3cf2dce69', 'api', '接口管理', NULL, '/lowcode/magic-editor', NULL, 'M', 1, 20, '', NULL, 1, 1, NULL, 0, '1', '2022-03-04 21:05:29', '1', '2023-04-27 18:51:42');
INSERT INTO `sys_menu` VALUES ('d346dfed451b44cbb4474f0b586c32f8', '28216291e6a84b14aefbad91ed2b0f34', NULL, '删除', NULL, NULL, 'data:test:delete', 'B', 1, 30, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('d7e5280a2a8f4fb3b9e2f4a3e3093a38', '39be13ef6f0745568c80bf35202ddb2b', '', '保存', NULL, NULL, 'menu:save', 'B', 1, 10, NULL, NULL, 0, 0, NULL, 0, '1', '2020-11-11 13:58:32', '1', '2021-04-30 21:36:28');
INSERT INTO `sys_menu` VALUES ('d7f8d052d4864bd285c575c3cf2dce69', '0', 'code', '低代码', NULL, '/lowcode', NULL, 'D', 1, 30, '', NULL, 1, 1, NULL, 0, '1', '2022-03-04 21:03:42', '1', '2023-06-25 20:31:30');
INSERT INTO `sys_menu` VALUES ('d9c32f7ed4c841cbb37eaff2624385bb', '6f3594d0-5445-41e1-a13c-890a57485036', NULL, '查看', NULL, NULL, 'office:view', 'B', 1, 30, NULL, NULL, 0, 0, NULL, 0, '1', '2022-02-05 22:04:25', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('dc332875-831e-4937-86ff-0c7420915ce9', '641253af-8ea1-4b5d-8bc3-a7165ef60ff2', 'account-book', '三级联动', NULL, '/examples/three-linkage', NULL, 'M', 1, 10, NULL, NULL, 1, 0, NULL, 0, '1', '2021-03-28 23:04:14', '1', '2023-12-25 19:56:06');
INSERT INTO `sys_menu` VALUES ('eee27ca353fb440aa5ac0bd7b38cad1d', '4a57f57fc7324c94b6390f1a2dd1f49a', 'login-log', '登录日志', NULL, '/main/monitor/login-log', NULL, 'M', 1, 20, '', NULL, 1, 1, NULL, 0, '1', '2022-03-05 17:25:05', '1', '2023-06-25 20:35:17');
INSERT INTO `sys_menu` VALUES ('ef2eeb351c9d421991514c7a205083d1', '7ad229f12c8f4b57bbb9349e2ffd8932', '', '查看', NULL, NULL, 'configure:view', 'B', 1, 10, '', NULL, 0, 0, NULL, 0, '1', '2022-05-21 18:34:29', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('f09410d5-5043-4164-9f68-8d135de71b29', '641253af-8ea1-4b5d-8bc3-a7165ef60ff2', '', '上传文件', NULL, '/examples/upload-file', NULL, 'M', 1, 20, NULL, NULL, 1, 0, NULL, 0, '1', '2021-04-23 22:52:04', '1', '2021-05-23 10:34:47');
INSERT INTO `sys_menu` VALUES ('f7436d87359445c093d6499d6a01b592', 'bf5c1e44546341de9acee52d148d5a76', NULL, '删除', NULL, NULL, 'data:test:delete', 'B', 1, 30, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('fa201e3353ba4591923a0f1798acc855', 'bf5c1e44546341de9acee52d148d5a76', NULL, '查看', NULL, NULL, 'data:test:view', 'B', 1, 10, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('fdbdcf8b8d674ae38154bc1e57498a91', '4a57f57fc7324c94b6390f1a2dd1f49a', 'user', '在线用户', NULL, '/main/monitor/online-user', 'online:view', 'M', 1, 40, '', NULL, 1, 0, NULL, 0, '1', '2022-03-15 23:19:04', '1', '2024-01-04 21:45:03');
INSERT INTO `sys_menu` VALUES ('ff7d37f87ab749f9836af74dbcdf033d', '8e9455740091486c914495cfb0c7faa5', NULL, '用户列表', NULL, NULL, 'role:user:list', 'B', 1, 50, NULL, NULL, 0, 0, NULL, 0, '1', '2022-02-04 17:33:20', NULL, NULL);

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `type` int NULL DEFAULT 0 COMMENT '类型 1部门 2公司',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组织机构编码',
  `pid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '父id',
  `status` int NULL DEFAULT 0 COMMENT '部门状态（0正常 1停用）',
  `leader` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `ext_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '扩展信息',
  `is_del` int NULL DEFAULT 0 COMMENT '删除标识',
  `create_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '组织机构表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('1741306141436153856', 'test', 1, '01', '0', 0, 'a', NULL, NULL, 20, NULL, 1, '1', '2023-12-31 11:51:51', NULL, NULL);
INSERT INTO `sys_office` VALUES ('1741306164391579648', 'aaa', 2, '0100', '1741306141436153856', 0, NULL, NULL, NULL, 10, NULL, 1, '1', '2023-12-31 11:51:56', NULL, NULL);
INSERT INTO `sys_office` VALUES ('1741306190996049920', 'bbb', 2, '0103', '1741306141436153856', 0, NULL, NULL, NULL, 20, NULL, 1, '1', '2023-12-31 11:52:02', NULL, NULL);
INSERT INTO `sys_office` VALUES ('1741306238710452224', 'aaabbb', 2, '0102', '1741306141436153856', 0, NULL, NULL, NULL, 10, NULL, 1, '1', '2023-12-31 11:52:14', NULL, NULL);
INSERT INTO `sys_office` VALUES ('1741306291890032640', 'aaaccc', 2, '0104', '1741306141436153856', 0, NULL, NULL, NULL, 20, NULL, 1, '1', '2023-12-31 11:52:27', NULL, NULL);
INSERT INTO `sys_office` VALUES ('1741306323766743040', 'ccc', 2, '0101', '1741306141436153856', 0, NULL, NULL, NULL, 30, NULL, 1, '1', '2023-12-31 11:52:34', NULL, NULL);
INSERT INTO `sys_office` VALUES ('1741324485124034560', 'ttt', 2, '010100', '1741306323766743040', 0, 'tttttt', NULL, NULL, 30, NULL, 1, '1', '2023-12-31 13:04:44', NULL, NULL);
INSERT INTO `sys_office` VALUES ('31b365008f994e93850186126fce87cb', '东北分公司', 2, '0002', '4c37a80226134bce8bc91c8fc04a7d2f', 0, 'mdc', NULL, 'mdc@mdc.mdc', 20, NULL, 0, '1', '2022-01-09 22:12:11', '1', '2022-03-05 17:17:29');
INSERT INTO `sys_office` VALUES ('4c37a80226134bce8bc91c8fc04a7d2f', '总公司', 2, '00', '0', 0, 'mdc', NULL, NULL, 10, NULL, 0, '1', '2022-01-09 21:59:34', '1', '2022-02-05 11:26:01');
INSERT INTO `sys_office` VALUES ('81b5493cdb31477f9ceea85b2cd08f15', '内蒙分公司', 2, '0000', '4c37a80226134bce8bc91c8fc04a7d2f', 0, NULL, NULL, NULL, 10, NULL, 0, '1', '2022-01-09 21:59:47', '1', '2022-03-05 17:17:34');
INSERT INTO `sys_office` VALUES ('a8b62a271c2a4492bd5c0653cac8f33d', '扎兰屯办事处', 2, '000000', '81b5493cdb31477f9ceea85b2cd08f15', 0, NULL, NULL, NULL, 10, NULL, 0, '1', '2022-01-16 13:15:46', '1', '2022-03-05 17:17:26');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `api_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '接口名',
  `api_path` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路径',
  `api_method` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '方法',
  `cost_time` int NULL DEFAULT NULL COMMENT '耗时',
  `create_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户代理',
  `user_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户IP',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_permission_code
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission_code`;
CREATE TABLE `sys_permission_code`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限代码',
  `pid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '父id',
  `is_del` int NULL DEFAULT 0 COMMENT '删除标识：0未删除，1已删除',
  `create_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '权限code表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_permission_code
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `status` int NULL DEFAULT NULL COMMENT '状态, 1:正常 0:停用',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色名称',
  `permission` int NULL DEFAULT NULL COMMENT '0：全部数据，1：自定义数据，2：本部门及以下数据，3：本部门数据, 4仅个人数据',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `ext_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '扩展信息',
  `is_del` int NULL DEFAULT 0 COMMENT '是否删除：0未删除，1已删除',
  `create_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', NULL, '管理员', 0, NULL, '管理员', NULL, 0, NULL, NULL, '1', '2023-04-02 20:53:45');
INSERT INTO `sys_role` VALUES ('1739546159007010816', NULL, '测试2', NULL, NULL, NULL, NULL, 0, '1', '2023-12-26 15:18:18', NULL, NULL);
INSERT INTO `sys_role` VALUES ('1739546175440293888', NULL, '得到的', NULL, NULL, NULL, NULL, 0, '1', '2023-12-26 15:18:22', NULL, NULL);
INSERT INTO `sys_role` VALUES ('1739546196671860736', NULL, '点点滴滴', NULL, NULL, NULL, NULL, 0, '1', '2023-12-26 15:18:27', '1', '2024-01-03 19:10:16');
INSERT INTO `sys_role` VALUES ('1739546261423525888', NULL, '点点滴滴2', NULL, NULL, NULL, NULL, 1, '1', '2023-12-26 15:18:43', '1', '2023-12-28 01:36:20');
INSERT INTO `sys_role` VALUES ('1739546388225724416', NULL, 'ffff', 1, NULL, 'sss', NULL, 1, '1', '2023-12-26 15:19:13', NULL, NULL);
INSERT INTO `sys_role` VALUES ('1739692348494974976', NULL, 'f', 1, NULL, NULL, NULL, 1, '1', '2023-12-27 00:59:12', NULL, NULL);
INSERT INTO `sys_role` VALUES ('1740034197030047744', NULL, '滚滚滚', NULL, NULL, NULL, NULL, 1, '1', '2023-12-27 23:37:36', NULL, NULL);
INSERT INTO `sys_role` VALUES ('1740034211387150336', NULL, '大概的风格', NULL, NULL, NULL, NULL, 1, '1', '2023-12-27 23:37:39', NULL, NULL);
INSERT INTO `sys_role` VALUES ('1740034225777807360', NULL, '公司的风格', NULL, NULL, NULL, NULL, 1, '1', '2023-12-27 23:37:42', NULL, NULL);
INSERT INTO `sys_role` VALUES ('1740034241279954944', NULL, '森岛帆高', NULL, NULL, NULL, NULL, 1, '1', '2023-12-27 23:37:46', NULL, NULL);
INSERT INTO `sys_role` VALUES ('1740034601759412224', NULL, '滚滚滚十多个', NULL, NULL, NULL, NULL, 1, '1', '2023-12-27 23:39:12', NULL, NULL);
INSERT INTO `sys_role` VALUES ('1740034615512535040', NULL, '是个地方官', NULL, NULL, '森岛帆高', NULL, 1, '1', '2023-12-27 23:39:15', NULL, NULL);
INSERT INTO `sys_role` VALUES ('1740034639906607104', NULL, '告诉对方是的', NULL, NULL, '的', NULL, 1, '1', '2023-12-27 23:39:21', NULL, NULL);
INSERT INTO `sys_role` VALUES ('1740034652967669760', NULL, '发发发', NULL, NULL, '的 ', NULL, 1, '1', '2023-12-27 23:39:24', NULL, NULL);
INSERT INTO `sys_role` VALUES ('1740034665240203264', NULL, '滴滴滴', NULL, NULL, NULL, NULL, 1, '1', '2023-12-27 23:39:27', NULL, NULL);
INSERT INTO `sys_role` VALUES ('1740034681384079360', NULL, '滴滴滴滴滴滴', NULL, NULL, NULL, NULL, 1, '1', '2023-12-27 23:39:31', NULL, NULL);
INSERT INTO `sys_role` VALUES ('1740034699037904896', NULL, '告诉对方', NULL, NULL, NULL, NULL, 1, '1', '2023-12-27 23:39:35', NULL, NULL);
INSERT INTO `sys_role` VALUES ('1d183eaec667423fa9adb20e24356a86', NULL, '全部', NULL, NULL, NULL, NULL, 0, '1', '2022-01-16 13:56:10', NULL, NULL);
INSERT INTO `sys_role` VALUES ('3a408f5157c841ea8884ade4fa56d0f4', NULL, '自定义', NULL, NULL, NULL, NULL, 0, '1', '2022-01-16 13:55:22', '1', '2022-01-16 17:49:09');
INSERT INTO `sys_role` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', NULL, '测试2', NULL, NULL, NULL, NULL, 0, '1', '2022-02-04 16:39:26', '1', '2022-02-04 16:45:11');
INSERT INTO `sys_role` VALUES ('e3448fc792ca463a95a34baf6f089dcd', NULL, '本级及子级', NULL, NULL, NULL, NULL, 0, '1', '2022-01-16 13:55:45', NULL, NULL);
INSERT INTO `sys_role` VALUES ('e619e4b665de42acbca1665fec150634', NULL, '本级', NULL, NULL, NULL, NULL, 0, '1', '2022-01-16 13:55:59', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色id',
  `menu_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('e3448fc792ca463a95a34baf6f089dcd', 'b1851d1b13594e71840103c11a37a669');
INSERT INTO `sys_role_menu` VALUES ('e3448fc792ca463a95a34baf6f089dcd', '10fc3bdde0c642aea2af34d281a49cf9');
INSERT INTO `sys_role_menu` VALUES ('e619e4b665de42acbca1665fec150634', 'b1851d1b13594e71840103c11a37a669');
INSERT INTO `sys_role_menu` VALUES ('e619e4b665de42acbca1665fec150634', '10fc3bdde0c642aea2af34d281a49cf9');
INSERT INTO `sys_role_menu` VALUES ('1d183eaec667423fa9adb20e24356a86', 'b1851d1b13594e71840103c11a37a669');
INSERT INTO `sys_role_menu` VALUES ('1d183eaec667423fa9adb20e24356a86', '10fc3bdde0c642aea2af34d281a49cf9');
INSERT INTO `sys_role_menu` VALUES ('3a408f5157c841ea8884ade4fa56d0f4', 'b1851d1b13594e71840103c11a37a669');
INSERT INTO `sys_role_menu` VALUES ('3a408f5157c841ea8884ade4fa56d0f4', '10fc3bdde0c642aea2af34d281a49cf9');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', 'b1851d1b13594e71840103c11a37a669');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', '414e5d31-fe05-4e69-9983-217c10b9740a');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', 'd7e5280a2a8f4fb3b9e2f4a3e3093a38');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', '833b204d5f2c402190bfca677421cfeb');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', '6f3594d0-5445-41e1-a13c-890a57485036');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', '4526eb9c-4b7a-4945-bfa9-cddc01f36c22');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', '6762231e-4f30-4a6b-a94e-b185e99ed608');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', '8009eed4f46141e3aca939490d68786a');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', '8e9455740091486c914495cfb0c7faa5');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', '94071254597d4da286bb8112ad93f4ff');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', '684723f4226948aba1661292961c8f71');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', 'bf41ddc3ea314b158e21e4efc1ed5a25');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', '06b8a427e4cd4c1ba11752070f565f20');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', 'bee5c6cb1b484133a4b8e72fe5c5eed0');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', 'c6e7b5866ce64bfdabeb5dd6342ca55f');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', 'c5f407478c4e4c9cbcdbee6389d2c909');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', 'b353de07f3624b4fa1c6f8b1b1e80cad');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', '546c874267514672844cd3a019e468f7');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', '81b6845a20da4028a01a42f3eb0b4f4b');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', 'e46a01397a01459bb478a5f31a6220ee');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', '24176912aa9e4b2d832f96292be3430e');
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', '10fc3bdde0c642aea2af34d281a49cf9');
INSERT INTO `sys_role_menu` VALUES ('1', '4a57f57fc7324c94b6390f1a2dd1f49a');
INSERT INTO `sys_role_menu` VALUES ('1', '39be13ef6f0745568c80bf35202ddb2b');
INSERT INTO `sys_role_menu` VALUES ('1', '6f3594d0-5445-41e1-a13c-890a57485036');
INSERT INTO `sys_role_menu` VALUES ('1', '8e9455740091486c914495cfb0c7faa5');
INSERT INTO `sys_role_menu` VALUES ('1', '06b8a427e4cd4c1ba11752070f565f20');
INSERT INTO `sys_role_menu` VALUES ('1', 'c5f407478c4e4c9cbcdbee6389d2c909');
INSERT INTO `sys_role_menu` VALUES ('1', '4fc65edbe0544c369b58fdfed1523537');
INSERT INTO `sys_role_menu` VALUES ('1', 'eee27ca353fb440aa5ac0bd7b38cad1d');
INSERT INTO `sys_role_menu` VALUES ('1', '3a0e3107402449698d86ee3cbc5272c0');
INSERT INTO `sys_role_menu` VALUES ('1', '1742907136557584384');
INSERT INTO `sys_role_menu` VALUES ('1', 'fdbdcf8b8d674ae38154bc1e57498a91');
INSERT INTO `sys_role_menu` VALUES ('1', 'd7e5280a2a8f4fb3b9e2f4a3e3093a38');
INSERT INTO `sys_role_menu` VALUES ('1', '833b204d5f2c402190bfca677421cfeb');
INSERT INTO `sys_role_menu` VALUES ('1', '414e5d31-fe05-4e69-9983-217c10b9740a');
INSERT INTO `sys_role_menu` VALUES ('1', '98a47d57680f4759816028a035ccc7d3');
INSERT INTO `sys_role_menu` VALUES ('1', '4526eb9c-4b7a-4945-bfa9-cddc01f36c22');
INSERT INTO `sys_role_menu` VALUES ('1', '1741151980400807936');
INSERT INTO `sys_role_menu` VALUES ('1', '6762231e-4f30-4a6b-a94e-b185e99ed608');
INSERT INTO `sys_role_menu` VALUES ('1', 'd9c32f7ed4c841cbb37eaff2624385bb');
INSERT INTO `sys_role_menu` VALUES ('1', 'b5a77ce22eef40cba2eb1ca2794d9d8a');
INSERT INTO `sys_role_menu` VALUES ('1', '1741801535966416896');
INSERT INTO `sys_role_menu` VALUES ('1', '1741801648935800832');
INSERT INTO `sys_role_menu` VALUES ('1', '1740066017553551360');
INSERT INTO `sys_role_menu` VALUES ('1', '94071254597d4da286bb8112ad93f4ff');
INSERT INTO `sys_role_menu` VALUES ('1', '684723f4226948aba1661292961c8f71');
INSERT INTO `sys_role_menu` VALUES ('1', 'a5f2cb418ac348bca3d51b98958c4a80');
INSERT INTO `sys_role_menu` VALUES ('1', 'bf41ddc3ea314b158e21e4efc1ed5a25');
INSERT INTO `sys_role_menu` VALUES ('1', 'ff7d37f87ab749f9836af74dbcdf033d');
INSERT INTO `sys_role_menu` VALUES ('1', '1740043945494319104');
INSERT INTO `sys_role_menu` VALUES ('1', '1740044350496313344');
INSERT INTO `sys_role_menu` VALUES ('1', '1740350681291821056');
INSERT INTO `sys_role_menu` VALUES ('1', '1740351741364408320');
INSERT INTO `sys_role_menu` VALUES ('1', '1740747658223554560');
INSERT INTO `sys_role_menu` VALUES ('1', 'bee5c6cb1b484133a4b8e72fe5c5eed0');
INSERT INTO `sys_role_menu` VALUES ('1', '1740759135730929664');
INSERT INTO `sys_role_menu` VALUES ('1', 'c6e7b5866ce64bfdabeb5dd6342ca55f');
INSERT INTO `sys_role_menu` VALUES ('1', '7324ad98fb51462795750bcfc1b11be2');
INSERT INTO `sys_role_menu` VALUES ('1', '3e14f782d4e14998bce4f9d35c032a95');
INSERT INTO `sys_role_menu` VALUES ('1', '7f20cb25f62e48c5ac5e986e3277956f');
INSERT INTO `sys_role_menu` VALUES ('1', '7e9203fdb630434abf7542ff111bc369');
INSERT INTO `sys_role_menu` VALUES ('1', '1740751453083013120');
INSERT INTO `sys_role_menu` VALUES ('1', '1740755254728855552');
INSERT INTO `sys_role_menu` VALUES ('1', '1740759467622010880');
INSERT INTO `sys_role_menu` VALUES ('1', 'b353de07f3624b4fa1c6f8b1b1e80cad');
INSERT INTO `sys_role_menu` VALUES ('1', '1742066740973670400');
INSERT INTO `sys_role_menu` VALUES ('1', '546c874267514672844cd3a019e468f7');
INSERT INTO `sys_role_menu` VALUES ('1', '710c0a9195934e73b11123b62283fdc5');
INSERT INTO `sys_role_menu` VALUES ('1', '52702cf956f847e8a2d045f66eb6bfee');

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office`  (
  `office_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组织机构id',
  `role_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户组织机构关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_office
-- ----------------------------
INSERT INTO `sys_role_office` VALUES ('81b5493cdb31477f9ceea85b2cd08f15', '3a408f5157c841ea8884ade4fa56d0f4');
INSERT INTO `sys_role_office` VALUES ('81b5493cdb31477f9ceea85b2cd08f15', 'd71c32ace3bb4d959a652ee99ecd1b26');

-- ----------------------------
-- Table structure for sys_test_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_test_data`;
CREATE TABLE `sys_test_data`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_del` int NULL DEFAULT 0 COMMENT '是否删除：0未删除，1已删除',
  `create_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_test_data
-- ----------------------------
INSERT INTO `sys_test_data` VALUES ('0572b97b3e45448bb1fcf9059e6c5ac9', '东北分公司', 0, '7217ee3f9d6e49f1a7e327183013226b', '2022-01-16 17:40:33', NULL, NULL);
INSERT INTO `sys_test_data` VALUES ('059d96a88d594995a895a6cb8151a72f', '扎兰屯', 0, '1b47d4758336487890147fc5cd64ebb9', '2022-01-16 17:48:33', NULL, NULL);
INSERT INTO `sys_test_data` VALUES ('f49eac2294114d588dee8ea548dc85c7', '内蒙分公司', 0, '7e7f4b1017fc4564ad31a05033eb29d1', '2022-01-16 17:40:15', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登录名',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名/昵称',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '盐值',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `status` int NULL DEFAULT NULL COMMENT '状态 0正常，1禁用',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` int NULL DEFAULT NULL COMMENT '性别 0女 1男',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `office_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组织机构id',
  `ext_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '扩展信息',
  `is_del` int NULL DEFAULT 0 COMMENT '删除标识：0未删除，1已删除',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '管理员', 'ECROSTGSBBVM83JMVRJI', '795fcc334966f411c93ac57685105e56854167416bf0c06b671d04000c8cd113', 0, 'ssss', 1, '13888888888', '22@abc.abc', '/userfiles/D/20240108/b7586e20682a4f8289c74d79401135ca.jpg', NULL, '4c37a80226134bce8bc91c8fc04a7d2f', NULL, 0, '', NULL, NULL, '2020-05-15 22:25:20', '1', '2022-01-21 22:11:11');
INSERT INTO `sys_user` VALUES ('1735241480093700096', 'adminx', '1', '9QTXWP2HG80X17DSGW82', 'c4752fbef1da7aa419f2d840fb6556ffa646f3e3545f0086f03c3262b2850e48', 0, '1', 1, '13500000000', '11@cc.cc', NULL, NULL, '4c37a80226134bce8bc91c8fc04a7d2f', NULL, 0, '', NULL, '1', '2023-12-14 18:13:03', '1', '2024-01-04 21:07:35');
INSERT INTO `sys_user` VALUES ('1740052594455351296', 'fff', NULL, 'O48DBO3K6JQUJY65RFRE', 'e9bcd02456ea92b3bfc8c956267ca27784e30d771501705b655c68c998949fd7', 0, NULL, NULL, NULL, NULL, NULL, NULL, '4c37a80226134bce8bc91c8fc04a7d2f', NULL, 0, '', NULL, '1', '2023-12-28 00:50:42', NULL, NULL);
INSERT INTO `sys_user` VALUES ('1740052618409021440', 'ffssss', 'ff', 'J7S0TO7BAH2GR8QCAUHN', 'c3f5f29d2751529ee4a0970b86bf61dc7203790bbc05327029484a35bf48f03f', 0, NULL, NULL, NULL, NULL, NULL, NULL, '4c37a80226134bce8bc91c8fc04a7d2f', NULL, 0, '', NULL, '1', '2023-12-28 00:50:48', '1', '2024-01-05 10:17:27');
INSERT INTO `sys_user` VALUES ('1740052693680001024', 'fsdfa', NULL, 'YLWHSTLJR0EA09U1RMAB', '776dbf9066a146901ebc661a2d0210a1edabf31c13d1347513befb2db5650abd', 0, NULL, NULL, NULL, NULL, NULL, NULL, '4c37a80226134bce8bc91c8fc04a7d2f', NULL, 0, '', NULL, '1', '2023-12-28 00:51:05', NULL, NULL);
INSERT INTO `sys_user` VALUES ('1740053702301061120', 'tess', 'ww', 'TKLKTC0C9W033U5MZNXS', '8f0821f57c34a964473f57343dc76f60f1eae94b447a0d0bb010b3b5135950c8', 0, NULL, NULL, NULL, NULL, NULL, NULL, '4c37a80226134bce8bc91c8fc04a7d2f', NULL, 0, '', NULL, '1', '2023-12-28 00:55:06', NULL, NULL);
INSERT INTO `sys_user` VALUES ('1740053730331594752', 'sss', NULL, '3Q66EJTJPQF05SREM2CB', '8d48a4a97969c0b23fe7b1aa43b646555619e0eeada73d0195f3ebf924d5650e', 0, NULL, NULL, NULL, NULL, NULL, NULL, '4c37a80226134bce8bc91c8fc04a7d2f', NULL, 0, '', NULL, '1', '2023-12-28 00:55:13', '1', '2024-01-05 10:17:25');
INSERT INTO `sys_user` VALUES ('1740053795498496000', 'sss', NULL, 'LZUZ0YFB3UHD7IGGCO4H', '3c1052f269659ce5c24296528c3637bff014371d4c283af86481d883aa2b8aee', 0, NULL, NULL, NULL, NULL, NULL, NULL, '4c37a80226134bce8bc91c8fc04a7d2f', NULL, 0, '', NULL, '1', '2023-12-28 00:55:28', NULL, NULL);
INSERT INTO `sys_user` VALUES ('1740056058929483776', 'sss', 'ss', 'O2GHUKKRSVWD5H4SOOMB', '39cc400b7a287e8b8f520d0999a50a37c7131556cc3026f52cab68339c82c13f', 0, NULL, 0, NULL, NULL, NULL, NULL, '81b5493cdb31477f9ceea85b2cd08f15', NULL, 0, '', NULL, '1', '2023-12-28 01:04:28', '1', '2024-01-05 10:16:47');
INSERT INTO `sys_user` VALUES ('1740056466313842688', 'ssss', NULL, '8DRY1Z66ARCY2GRUAA2P', 'b6011d6e70a34d6505b0ba7f87d0195a24a0d1fda8af077b0434a2b4a56b8dd5', 0, NULL, NULL, NULL, NULL, NULL, NULL, '4c37a80226134bce8bc91c8fc04a7d2f', NULL, 0, '', NULL, '1', '2023-12-28 01:06:05', NULL, NULL);
INSERT INTO `sys_user` VALUES ('1741729125258891264', 'tttt', 'ttttttt', '1CRO2KDMMH5AWIO63UHW', '6463b06d19c3891a63524563ec917d4400d32896c7e6dd775c7a4f1952a498d2', 0, NULL, 1, NULL, NULL, NULL, NULL, '4c37a80226134bce8bc91c8fc04a7d2f', NULL, 0, '', NULL, '1', '2024-01-01 15:52:38', '1', '2024-01-05 10:17:23');
INSERT INTO `sys_user` VALUES ('534a37c366ec47878a6b0c85703d0bc2', 'system', '管理员', 'Z61ZBX91ODNIC3DBOESE', 'f09371e9fc138d09b4f9ae2101ff4be0c38ccf752b0d435100d94d4a93e98198', 0, NULL, NULL, NULL, NULL, NULL, NULL, '4c37a80226134bce8bc91c8fc04a7d2f', NULL, 0, '', NULL, '1', '2022-01-30 19:28:47', '1', '2023-12-28 02:57:53');
INSERT INTO `sys_user` VALUES ('7217ee3f9d6e49f1a7e327183013226b', 'db', '123123123', 'B3EKUGANANIPZN6Y8LOA', '7452be716319606036b1decf470a479ba20ec4540e77a126f87c0f9c20a05926', 0, NULL, NULL, '13500000000', NULL, NULL, NULL, '4c37a80226134bce8bc91c8fc04a7d2f', NULL, 0, '', NULL, '1', '2022-01-16 17:24:56', '1', '2023-12-29 01:13:14');
INSERT INTO `sys_user` VALUES ('7e7f4b1017fc4564ad31a05033eb29d1', 'nm', NULL, '8RGT40IZ8DN298RQVJBK', '275b1c7c8eb453f617eddca461c5f9fb40b51dbacc382e1d529c09a7fd571f91', 0, NULL, NULL, NULL, NULL, NULL, NULL, '4c37a80226134bce8bc91c8fc04a7d2f', NULL, 0, '', NULL, '1', '2022-01-16 17:24:29', '1', '2023-12-14 21:00:52');

-- ----------------------------
-- Table structure for sys_user_code
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_code`;
CREATE TABLE `sys_user_code`  (
  `user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `code_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限代码id',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户权限code关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_code
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户id',
  `role_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户与角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('cbafb7813bd9458eae26e4dc3d05bf5e', '1d183eaec667423fa9adb20e24356a86');
INSERT INTO `sys_user_role` VALUES ('1b47d4758336487890147fc5cd64ebb9', 'e619e4b665de42acbca1665fec150634');
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('1', '1d183eaec667423fa9adb20e24356a86');
INSERT INTO `sys_user_role` VALUES ('895757b441fe45b1afb0ed1cb535f35c', '3a408f5157c841ea8884ade4fa56d0f4');
INSERT INTO `sys_user_role` VALUES ('534a37c366ec47878a6b0c85703d0bc2', '1');
INSERT INTO `sys_user_role` VALUES ('534a37c366ec47878a6b0c85703d0bc2', '1739546159007010816');
INSERT INTO `sys_user_role` VALUES ('534a37c366ec47878a6b0c85703d0bc2', '1739546175440293888');
INSERT INTO `sys_user_role` VALUES ('534a37c366ec47878a6b0c85703d0bc2', 'd71c32ace3bb4d959a652ee99ecd1b26');
INSERT INTO `sys_user_role` VALUES ('534a37c366ec47878a6b0c85703d0bc2', '3a408f5157c841ea8884ade4fa56d0f4');
INSERT INTO `sys_user_role` VALUES ('534a37c366ec47878a6b0c85703d0bc2', '1d183eaec667423fa9adb20e24356a86');
INSERT INTO `sys_user_role` VALUES ('7217ee3f9d6e49f1a7e327183013226b', '1739546196671860736');
INSERT INTO `sys_user_role` VALUES ('7e7f4b1017fc4564ad31a05033eb29d1', '1739546196671860736');
INSERT INTO `sys_user_role` VALUES ('1740053795498496000', '1739546196671860736');
INSERT INTO `sys_user_role` VALUES ('1740053730331594752', '1739546196671860736');
INSERT INTO `sys_user_role` VALUES ('1740053702301061120', '1739546196671860736');
INSERT INTO `sys_user_role` VALUES ('1740052693680001024', '1739546196671860736');
INSERT INTO `sys_user_role` VALUES ('1740052618409021440', '1739546196671860736');
INSERT INTO `sys_user_role` VALUES ('1740052594455351296', '1739546196671860736');
INSERT INTO `sys_user_role` VALUES ('1740056058929483776', '1739546196671860736');

-- ----------------------------
-- Table structure for t_data_test
-- ----------------------------
DROP TABLE IF EXISTS `t_data_test`;
CREATE TABLE `t_data_test`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名字',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `head_portrait` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `is_del` int NULL DEFAULT 0 COMMENT '删除标识：0未删除，1已删除',
  `create_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '测试生成' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_data_test
-- ----------------------------
INSERT INTO `t_data_test` VALUES ('ecacf5c78bd043b1aaf06a839f7195b1', 'test', '1', 'userfiles/2022-05-05/c6aeb598deef48c385b0da831b7c2b85/QQ图片20220505165410.jpg', 0, '1', '2022-03-30 22:43:45', '1', '2022-05-05 16:54:21', '没有');

SET FOREIGN_KEY_CHECKS = 1;
