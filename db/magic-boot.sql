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

 Date: 08/12/2023 01:34:08
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
INSERT INTO `sys_configure` VALUES ('5646fe2ba5674a5e89e74fcd65e8c42d', '1xx', 'super-password', '通用密码', NULL, '1', '万能登录密码，所有用户都能进行登录', 0, '1', '2022-05-21 12:41:51', '1', '2022-05-21 13:55:36', NULL);
INSERT INTO `sys_configure` VALUES ('a2cac5d9036b41ecaed4496b2f40085c', 'false', 'verification-code.enable', '是否验证“验证码”', '', '0', '1、开发模式下验证码可以不用输入，即可登录', 0, '1', '2022-05-21 11:29:24', '1', '2023-04-02 21:20:08', NULL);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `desc_ribe` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `dict_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '字典类型：0系统类，1业务类',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型',
  `is_del` int NULL DEFAULT 0 COMMENT '删除标识：0未删除，1已删除',
  `create_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('0da16e6dbc904a8dbcc3e3b15b0fdb11', '性别', '1', 'sex', 0, '1', '2022-03-28 21:57:05', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('3c393981-9ddd-40b2-8c19-85f0a9d9a98f', '组织机构类型', '0', 'office_type', 0, '1', '2021-04-22 21:30:30', '1', '2022-02-05 15:33:09', '');
INSERT INTO `sys_dict` VALUES ('ae9a2cd400264ff6bdc2f00b62d6e911', '字典类型', '0', 'dict_type', 0, NULL, NULL, '1', '2021-04-30 22:17:24', '');
INSERT INTO `sys_dict` VALUES ('ae9a2cd400264ff6bdc2f00b62d6e941', '是否登录', '0', 'is_login', 0, NULL, NULL, '1', '2021-04-30 22:14:58', '');

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
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件相对路径',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `external_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '外部id，其他表数据id',
  `external_type` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '外部文件类型，比如：是营业执照啊 还是 头像啊',
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

-- ----------------------------
-- Table structure for sys_gen_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_gen_info`;
CREATE TABLE `sys_gen_info`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `datasource` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '数据源',
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表名',
  `table_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表注释',
  `columns` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '字段信息json',
  `info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成信息json',
  `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '生成表信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_gen_info
-- ----------------------------
INSERT INTO `sys_gen_info` VALUES ('5', '', 't_data_test', '测试生成', '[{\"columnName\":\"name\",\"columnComment\":\"名字\",\"columnType\":\"varchar(255)\",\"component\":\"component: \'input\'\",\"where\":\"like\",\"save\":true,\"query\":true,\"list\":true,\"required\":true},{\"columnName\":\"sex\",\"columnComment\":\"性别\",\"columnType\":\"varchar(255)\",\"component\":\"component: \'select\'\",\"where\":\"=\",\"save\":true,\"query\":true,\"list\":true,\"required\":false,\"dictType\":\"sex\"},{\"columnName\":\"headPortrait\",\"columnComment\":\"头像\",\"columnType\":\"varchar(255)\",\"component\":\"component: \'upload-image\'\",\"where\":\"in\",\"save\":true,\"query\":true,\"list\":true,\"required\":true},{\"columnName\":\"remarks\",\"columnComment\":\"备注\",\"columnType\":\"text\",\"component\":\"component: \'input\',\\n                    props: {\\n                        type: \'textarea\'\\n                    }\\n      \",\"where\":\"<=\",\"save\":true,\"query\":true,\"list\":true,\"required\":false}]', '{\"moduleName\":\"数据管理\",\"modulePath\":\"/data\",\"businessName\":\"测试生成\",\"businessPath\":\"/test\",\"template\":\"singleTable\",\"pid\":\"d7f8d052d4864bd285c575c3cf2dce69\"}', '2022-03-28 21:56:09', '2022-05-27 13:36:55');

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

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `pid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '父id',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图标',
  `desc_ribe` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '描述',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单链接',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `component_name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组件名称',
  `open_mode` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '打开方式，0：iframe  1：新标签页',
  `is_del` int NULL DEFAULT 0 COMMENT '是否删除：0未删除，1已删除',
  `create_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `keep_alive` int NULL DEFAULT 1 COMMENT '是否缓存：1缓存，0不缓存',
  `is_show` int NULL DEFAULT NULL COMMENT '是否显示：1显示，0不显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0', '', '', NULL, '功能菜单', '', '', 1, NULL, '0', 0, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES ('067343d790fd4d73b3e2ea5bb3d043f1', '99c6e9aeb6694c349f5db66e2516f069', '', '', '删除', '', 'code:gen:delete', 30, '', '0', 0, '1', '2022-03-27 22:25:27', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('06b8a427e4cd4c1ba11752070f565f20', 'b1851d1b13594e71840103c11a37a669', 'user-group', '', '用户管理', '/main/system/user', '', 50, '', '0', 0, NULL, NULL, '1', '2023-06-25 20:25:26', 1, 1);
INSERT INTO `sys_menu` VALUES ('06d8c9243e5e43bcbd1c24d10d02fbad', 'b198ae9fec6f4de8a44b7f6e097a44b3', NULL, NULL, '查看', NULL, 'data:test:view', 10, NULL, '0', 0, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES ('1009eed4f46141e3aca939490d68786a', '8009eed4f46141e3aca939490d68786a', NULL, NULL, '按钮', '', '', 30, '', '0', 0, '1', '2019-11-15 10:23:07', '1', '2023-05-31 15:28:31', 0, 0);
INSERT INTO `sys_menu` VALUES ('10fc3bdde0c642aea2af34d281a49cf9', 'b1851d1b13594e71840103c11a37a669', 'home', '', '测试数据', '/main/system/test', '', 100, 'data-test-list', '0', 0, '1', '2022-01-16 13:43:03', '1', '2023-05-31 15:28:41', 1, 1);
INSERT INTO `sys_menu` VALUES ('11ac1fc1d2864f079a48d29f82dbb820', '99c6e9aeb6694c349f5db66e2516f069', '', '', '执行生成', '', 'code:gen:execute', 40, '', '0', 0, '1', '2022-05-10 16:22:38', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('24176912aa9e4b2d832f96292be3430e', '81b6845a20da4028a01a42f3eb0b4f4b', '', '', '删除', '', 'dict:items:delete', 20, NULL, '0', 0, '1', '2020-12-10 10:38:43', '1', '2021-04-30 21:37:39', 0, 0);
INSERT INTO `sys_menu` VALUES ('25162c30ae0d4297ade09539bcf81d86', '81b6845a20da4028a01a42f3eb0b4f4b', NULL, NULL, '查看', NULL, 'dict:items:view', 30, NULL, '0', 0, '1', '2022-02-05 22:07:33', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('2664b76cb2904227bce5b0f7d1dd6e7b', '641253af-8ea1-4b5d-8bc3-a7165ef60ff2', '', '', '下拉框', '/examples/select-example', '', 60, NULL, '0', 0, '1', '2021-08-29 17:35:17', '1', '2022-01-21 21:57:29', 0, 1);
INSERT INTO `sys_menu` VALUES ('2b8742fc1d2e4c92937517b95b09c50b', '81b6845a20da4028a01a42f3eb0b4f4b', '', '', '下移', '', 'dict:items:sort:down', 50, '', '0', 0, '1', '2022-05-10 16:21:40', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('35e56d173b5f4e6790883572d3104137', '99c6e9aeb6694c349f5db66e2516f069', '', '', '生成', '', 'code:gen', 20, '', '0', 0, '1', '2022-03-18 08:07:03', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('36329aad6f8e444dae4338b2124da7ba', '28216291e6a84b14aefbad91ed2b0f34', NULL, NULL, '保存', NULL, 'data:test:save', 20, NULL, '0', 0, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES ('39be13ef6f0745568c80bf35202ddb2b', 'b1851d1b13594e71840103c11a37a669', 'menu', '', '菜单管理', '/main/system/menu', '', 10, '', '0', 0, NULL, NULL, '1', '2023-06-25 20:10:13', 1, 1);
INSERT INTO `sys_menu` VALUES ('3a0e3107402449698d86ee3cbc5272c0', '4a57f57fc7324c94b6390f1a2dd1f49a', 'database', '', '数据库监控', '/system/monitor/druid', '', 30, '', '0', 0, '1', '2022-03-05 23:21:35', '1', '2023-05-31 15:28:58', 0, 1);
INSERT INTO `sys_menu` VALUES ('3ae3a47e3bf54bb682adb10b497e6183', 'b198ae9fec6f4de8a44b7f6e097a44b3', NULL, NULL, '保存', NULL, 'data:test:save', 20, NULL, '0', 0, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES ('3cac94be259c48d4ae778a13ee8fab82', '116182d1349a464fa89e24ddb349fea9', NULL, NULL, '删除', NULL, 'data:test:delete', 30, NULL, '0', 0, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES ('3da5882528b640478b6d64bcbc4d1795', '99c6e9aeb6694c349f5db66e2516f069', '', '', '保存', '', 'code:gen:save', 10, '', '0', 0, '1', '2022-03-18 08:03:08', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('3e14f782d4e14998bce4f9d35c032a95', '06b8a427e4cd4c1ba11752070f565f20', '', '', '禁止登录', '', 'user:change:login:status', 40, '', '0', 0, '1', '2022-05-09 21:43:06', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('414e5d31-fe05-4e69-9983-217c10b9740a', '39be13ef6f0745568c80bf35202ddb2b', '', '', '查看', '', 'menu:view', 30, NULL, '0', 0, '1', '2021-03-25 20:40:12', '1', '2022-02-05 22:02:57', 0, 0);
INSERT INTO `sys_menu` VALUES ('4526eb9c-4b7a-4945-bfa9-cddc01f36c22', '6f3594d0-5445-41e1-a13c-890a57485036', '', '', '保存', '', 'office:save', 10, NULL, '0', 0, '1', '2021-04-22 20:43:09', '1', '2022-02-05 22:04:03', 0, 0);
INSERT INTO `sys_menu` VALUES ('4807e74954c1443c811c701bacb878df', '116182d1349a464fa89e24ddb349fea9', NULL, NULL, '查看', NULL, 'data:test:view', 10, NULL, '0', 0, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES ('4a57f57fc7324c94b6390f1a2dd1f49a', '0', 'diagnostics', '', '系统监控', '/system/monitor', '', 40, '', '0', 0, '1', '2022-03-05 17:24:21', '1', '2023-06-25 20:33:18', 0, 1);
INSERT INTO `sys_menu` VALUES ('4a9047e1c44a4e69907ca8bfe077e38a', '81b6845a20da4028a01a42f3eb0b4f4b', '', '', '上移', '', 'dict:items:sort:up', 40, '', '0', 0, '1', '2022-05-10 16:21:21', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('4e0f340982ea477f9b66beca5f5d7218', '39be13ef6f0745568c80bf35202ddb2b', '', '', '上移', '', 'menu:sort:up', 40, '', '0', 0, '1', '2022-05-09 21:41:01', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('4fc65edbe0544c369b58fdfed1523537', '4a57f57fc7324c94b6390f1a2dd1f49a', 'profile', '', '操作日志', '/system/monitor/oper-log', '', 10, '', '0', 0, '1', '2022-03-05 17:24:45', '1', '2023-06-14 11:08:49', 1, 1);
INSERT INTO `sys_menu` VALUES ('5215c2511a1e4279a536ab663a344a37', '9de78e0a6042469c891af82fbc21ba90', NULL, NULL, '保存', NULL, 'component:save', 10, NULL, '0', 0, '1', '2022-03-04 21:51:32', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('52702cf956f847e8a2d045f66eb6bfee', 'fdbdcf8b8d674ae38154bc1e57498a91', '', '', '踢人', '', 'online:logout', 10, '', '0', 0, '1', '2022-03-16 08:16:35', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('546c874267514672844cd3a019e468f7', 'c5f407478c4e4c9cbcdbee6389d2c909', '', '', '删除', '', 'dict:delete', 20, NULL, '0', 0, '1', '2020-11-11 14:11:38', '1', '2021-04-30 21:37:22', 0, 0);
INSERT INTO `sys_menu` VALUES ('641253af-8ea1-4b5d-8bc3-a7165ef60ff2', '0', 'ant-design', '', '一些例子', '/examples', '', 20, '', '0', 0, '1', '2021-03-28 22:59:56', '1', '2023-06-25 20:31:26', 0, 1);
INSERT INTO `sys_menu` VALUES ('6762231e-4f30-4a6b-a94e-b185e99ed608', '6f3594d0-5445-41e1-a13c-890a57485036', '', '', '删除', '', 'office:delete', 20, NULL, '0', 0, '1', '2021-04-22 20:42:56', '1', '2022-02-05 22:04:07', 0, 0);
INSERT INTO `sys_menu` VALUES ('684723f4226948aba1661292961c8f71', '8e9455740091486c914495cfb0c7faa5', '', '', '删除', '', 'role:delete', 20, NULL, '0', 0, '1', '2020-11-11 13:59:45', '1', '2021-04-30 21:36:56', 0, 0);
INSERT INTO `sys_menu` VALUES ('6f3594d0-5445-41e1-a13c-890a57485036', 'b1851d1b13594e71840103c11a37a669', 'apartment', '', '组织机构', '/main/system/office', '', 20, '', '0', 0, '1', '2021-04-22 20:40:14', '1', '2023-06-25 20:12:59', 1, 1);
INSERT INTO `sys_menu` VALUES ('710c0a9195934e73b11123b62283fdc5', 'c5f407478c4e4c9cbcdbee6389d2c909', NULL, NULL, '查看', NULL, 'dict:view', 30, NULL, '0', 0, '1', '2022-02-05 22:05:51', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('713626516eaa4ba98c9daf55009b481e', '641253af-8ea1-4b5d-8bc3-a7165ef60ff2', '', '', '测试表单', '/examples/test-mb-form', '', 80, '', '0', 0, '1', '2022-03-15 07:51:25', '1', '2022-03-15 07:51:34', 0, 1);
INSERT INTO `sys_menu` VALUES ('7324ad98fb51462795750bcfc1b11be2', '06b8a427e4cd4c1ba11752070f565f20', NULL, NULL, '查看', NULL, 'user:view', 30, NULL, '0', 0, '1', '2022-02-05 22:05:18', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('74c852ea-be4b-4533-b146-cfbd776045d5', '641253af-8ea1-4b5d-8bc3-a7165ef60ff2', '', '', '富文本', '/examples/ueditor-example', '', 30, NULL, '0', 0, '1', '2021-05-16 15:25:52', '1', '2021-05-16 15:25:52', 0, 1);
INSERT INTO `sys_menu` VALUES ('7ad229f12c8f4b57bbb9349e2ffd8932', 'b1851d1b13594e71840103c11a37a669', 'setting-center', '', '配置中心', '/main/system/configure', '', 110, '', '0', 0, '1', '2022-05-21 18:32:26', '1', '2023-06-25 20:27:15', 1, 1);
INSERT INTO `sys_menu` VALUES ('7c9ddcf803074f6c8b763517d37732a7', '6f3594d0-5445-41e1-a13c-890a57485036', '', '', '上移', '', 'office:sort:up', 50, '', '0', 0, '1', '2022-05-09 21:42:04', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('7e9203fdb630434abf7542ff111bc369', '06b8a427e4cd4c1ba11752070f565f20', '', '', '导入预览', '', 'user:import:preview', 60, '', '0', 0, '1', '2022-05-09 21:43:28', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('7f20cb25f62e48c5ac5e986e3277956f', '06b8a427e4cd4c1ba11752070f565f20', '', '', '导入', '', 'user:import', 50, '', '0', 0, '1', '2022-05-09 21:43:18', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('8009eed4f46141e3aca939490d68786a', 'b1851d1b13594e71840103c11a37a669', '', '', '区域管理', '/main/system/area', '', 30, '', '0', 0, '1', '2019-11-15 10:23:07', '1', '2023-05-31 15:28:31', 0, 0);
INSERT INTO `sys_menu` VALUES ('81b6845a20da4028a01a42f3eb0b4f4b', 'c5f407478c4e4c9cbcdbee6389d2c909', '', '', '字典项', '', '', 40, NULL, '0', 0, '1', '2020-12-10 09:35:02', '1', '2021-04-30 21:37:28', 0, 0);
INSERT INTO `sys_menu` VALUES ('833b204d5f2c402190bfca677421cfeb', '39be13ef6f0745568c80bf35202ddb2b', '', '', '删除', '', 'menu:delete', 20, NULL, '0', 0, '1', '2020-11-11 11:06:05', '1', '2021-04-30 21:36:36', 0, 0);
INSERT INTO `sys_menu` VALUES ('8bf0ebc0098c4003b353d36bec3fff19', 'bf5c1e44546341de9acee52d148d5a76', NULL, NULL, '保存', NULL, 'data:test:save', 20, NULL, '0', 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('8e9455740091486c914495cfb0c7faa5', 'b1851d1b13594e71840103c11a37a669', 'safety-certificate', '', '角色管理', '/main/system/role', '', 40, '', '0', 0, NULL, NULL, '1', '2023-06-25 20:25:22', 1, 1);
INSERT INTO `sys_menu` VALUES ('90c5d6263fa04b5db2a1b0a626409523', '28216291e6a84b14aefbad91ed2b0f34', NULL, NULL, '查看', NULL, 'data:test:view', 10, NULL, '0', 0, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES ('91a9226d1c6c4634b70dc4e9866e89cb', '39be13ef6f0745568c80bf35202ddb2b', '', '', '下移', '', 'menu:sort:down', 50, '', '0', 0, '1', '2022-05-09 21:41:12', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('91bdb7d742a64a8c8a8fdc6d3bb61581', '641253af-8ea1-4b5d-8bc3-a7165ef60ff2', '', '', '可编辑表格', '/examples/editor-table', '', 40, NULL, '0', 0, '1', '2021-06-13 12:53:11', '1', '2021-06-13 12:53:11', 0, 1);
INSERT INTO `sys_menu` VALUES ('9385945c7f5f476ab38885976907db2a', '641253af-8ea1-4b5d-8bc3-a7165ef60ff2', '', '', '测试外链', 'http://baidu.com', '', 90, '', '1', 0, '1', '2022-06-28 10:53:20', '1', '2023-04-27 18:52:30', 0, 1);
INSERT INTO `sys_menu` VALUES ('94071254597d4da286bb8112ad93f4ff', '8e9455740091486c914495cfb0c7faa5', '', '', '保存', '', 'role:save', 10, NULL, '0', 0, '1', '2020-11-11 13:59:27', '1', '2021-04-30 21:36:51', 0, 0);
INSERT INTO `sys_menu` VALUES ('98a47d57680f4759816028a035ccc7d3', '39be13ef6f0745568c80bf35202ddb2b', '', '', '是否显示/缓存', '', 'menu:change', 60, '', '0', 0, '1', '2022-05-09 21:41:37', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('99c6e9aeb6694c349f5db66e2516f069', 'd7f8d052d4864bd285c575c3cf2dce69', 'code', '', '代码生成', '/lowcode/code-gen-list', '', 30, '', '0', 0, '1', '2022-03-18 08:01:25', '1', '2022-04-04 00:48:32', 1, 1);
INSERT INTO `sys_menu` VALUES ('9fe1eaae168e4b719dc880f039ccd7b7', 'fdbdcf8b8d674ae38154bc1e57498a91', '', '', '查看', '', 'online:view', 20, '', '0', 0, '1', '2022-05-10 16:16:11', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('a224c0274f8e4ae6931e7deab75cd90b', '7ad229f12c8f4b57bbb9349e2ffd8932', '', '', '删除', '', 'configure:delete', 30, '', '0', 0, '1', '2022-05-21 18:34:48', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('a2c99f09bbe24cc1be6344fe99c8a612', '9de78e0a6042469c891af82fbc21ba90', NULL, NULL, '删除', NULL, 'component:delete', 20, NULL, '0', 0, '1', '2022-03-04 21:51:48', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('a52bc9968c324813bd93a5642f5011ea', 'bccc28641f4647d3beeaef0381fdf079', NULL, NULL, '查看', NULL, 'system:role:view', 10, NULL, '0', 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu` VALUES ('a5f2cb418ac348bca3d51b98958c4a80', '8e9455740091486c914495cfb0c7faa5', NULL, NULL, '查看', NULL, 'role:view', 30, NULL, '0', 0, '1', '2022-02-05 22:04:56', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('a7a7ba2e31504b27a02465ecf6e014c6', 'b198ae9fec6f4de8a44b7f6e097a44b3', NULL, NULL, '删除', NULL, 'data:test:delete', 30, NULL, '0', 0, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES ('a9b57951790b423a91e8232aca514305', '7ad229f12c8f4b57bbb9349e2ffd8932', '', '', '保存', '', 'configure:save', 20, '', '0', 0, '1', '2022-05-21 18:34:38', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('b1851d1b13594e71840103c11a37a669', '0', 'setting', '', '系统设置', '/system', '', 10, '', '0', 0, NULL, NULL, '1', '2023-06-25 20:09:53', 0, 1);
INSERT INTO `sys_menu` VALUES ('b353de07f3624b4fa1c6f8b1b1e80cad', 'c5f407478c4e4c9cbcdbee6389d2c909', '', '', '保存', '', 'dict:save', 10, NULL, '0', 0, '1', '2020-11-11 14:11:28', '1', '2021-04-30 21:37:14', 0, 0);
INSERT INTO `sys_menu` VALUES ('b5a77ce22eef40cba2eb1ca2794d9d8a', '6f3594d0-5445-41e1-a13c-890a57485036', NULL, NULL, '用户列表', NULL, 'office:user:list', 40, NULL, '0', 0, '1', '2022-02-04 17:44:08', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('bccc28641f4647d3beeaef0381fdf079', NULL, '', NULL, '角色管理', '/system/role', NULL, 10, 'system-role-list', '0', 0, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES ('bee5c6cb1b484133a4b8e72fe5c5eed0', '06b8a427e4cd4c1ba11752070f565f20', '', '', '保存', '', 'user:save', 10, NULL, '0', 0, '1', '2020-11-11 13:27:06', '1', '2021-04-30 21:37:01', 0, 0);
INSERT INTO `sys_menu` VALUES ('bf41ddc3ea314b158e21e4efc1ed5a25', '8e9455740091486c914495cfb0c7faa5', NULL, NULL, '权限', NULL, 'role:permission', 40, NULL, '0', 0, '1', '2022-01-11 20:31:02', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('c38e9fe9521a4294bda2ab6ed8273719', '116182d1349a464fa89e24ddb349fea9', NULL, NULL, '保存', NULL, 'data:test:save', 20, NULL, '0', 0, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES ('c4352b75954a47de84cd896c6e2093b9', '99c6e9aeb6694c349f5db66e2516f069', '', '', '查看', '', 'code:gen:view', 50, '', '0', 0, '1', '2022-05-10 16:23:08', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('c50388914fab408c8b74f83d0d43e557', '641253af-8ea1-4b5d-8bc3-a7165ef60ff2', NULL, NULL, '测试列表', '/examples/test-mb-list', NULL, 70, NULL, '0', 0, '1', '2022-03-06 15:13:30', NULL, NULL, 0, 1);
INSERT INTO `sys_menu` VALUES ('c5f407478c4e4c9cbcdbee6389d2c909', 'b1851d1b13594e71840103c11a37a669', 'dict', '', '数据字典', '/main/system/dic', '', 60, '', '0', 0, '1', '2019-11-15 10:22:28', '1', '2023-06-25 20:26:35', 1, 1);
INSERT INTO `sys_menu` VALUES ('c6e7b5866ce64bfdabeb5dd6342ca55f', '06b8a427e4cd4c1ba11752070f565f20', '', '', '删除', '', 'user:delete', 20, NULL, '0', 0, '1', '2020-11-11 13:27:22', '1', '2021-04-30 21:37:05', 0, 0);
INSERT INTO `sys_menu` VALUES ('c7445e2ac6144a15a76d723607fbfb9d', 'd7f8d052d4864bd285c575c3cf2dce69', 'api', '', '接口管理', '/lowcode/magic-editor', '', 20, '', '1', 0, '1', '2022-03-04 21:05:29', '1', '2023-04-27 18:51:42', 1, 1);
INSERT INTO `sys_menu` VALUES ('d346dfed451b44cbb4474f0b586c32f8', '28216291e6a84b14aefbad91ed2b0f34', NULL, NULL, '删除', NULL, 'data:test:delete', 30, NULL, '0', 0, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES ('d790c401c3024332be8aee049af09030', '6f3594d0-5445-41e1-a13c-890a57485036', '', '', '下移', '', 'office:sort:down', 60, '', '0', 0, '1', '2022-05-09 21:42:21', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('d7e5280a2a8f4fb3b9e2f4a3e3093a38', '39be13ef6f0745568c80bf35202ddb2b', '', '', '保存', '', 'menu:save', 10, NULL, '0', 0, '1', '2020-11-11 13:58:32', '1', '2021-04-30 21:36:28', 0, 0);
INSERT INTO `sys_menu` VALUES ('d7f8d052d4864bd285c575c3cf2dce69', '0', 'code', '', '低代码', '/lowcode', '', 30, '', '0', 0, '1', '2022-03-04 21:03:42', '1', '2023-06-25 20:31:30', 1, 1);
INSERT INTO `sys_menu` VALUES ('d9c32f7ed4c841cbb37eaff2624385bb', '6f3594d0-5445-41e1-a13c-890a57485036', NULL, NULL, '查看', NULL, 'office:view', 30, NULL, '0', 0, '1', '2022-02-05 22:04:25', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('dc332875-831e-4937-86ff-0c7420915ce9', '641253af-8ea1-4b5d-8bc3-a7165ef60ff2', '', '', '三级联动', '/examples/three-linkage', '', 10, NULL, '0', 0, '1', '2021-03-28 23:04:14', '1', '2021-04-30 21:38:23', 0, 1);
INSERT INTO `sys_menu` VALUES ('e46a01397a01459bb478a5f31a6220ee', '81b6845a20da4028a01a42f3eb0b4f4b', '', '', '保存', '', 'dict:items:save', 10, NULL, '0', 0, '1', '2020-12-10 10:38:27', '1', '2021-04-30 21:37:35', 0, 0);
INSERT INTO `sys_menu` VALUES ('e950b960890d4fb3916cd1c561dba035', 'bccc28641f4647d3beeaef0381fdf079', NULL, NULL, '保存', NULL, 'system:role:save', 20, NULL, '0', 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu` VALUES ('eee27ca353fb440aa5ac0bd7b38cad1d', '4a57f57fc7324c94b6390f1a2dd1f49a', 'login-log', '', '登录日志', '/system/monitor/login-log', '', 20, '', '0', 0, '1', '2022-03-05 17:25:05', '1', '2023-06-25 20:35:17', 1, 1);
INSERT INTO `sys_menu` VALUES ('ef2eeb351c9d421991514c7a205083d1', '7ad229f12c8f4b57bbb9349e2ffd8932', '', '', '查看', '', 'configure:view', 10, '', '0', 0, '1', '2022-05-21 18:34:29', NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('f09410d5-5043-4164-9f68-8d135de71b29', '641253af-8ea1-4b5d-8bc3-a7165ef60ff2', '', '', '上传文件', '/examples/upload-file', '', 20, NULL, '0', 0, '1', '2021-04-23 22:52:04', '1', '2021-05-23 10:34:47', 0, 1);
INSERT INTO `sys_menu` VALUES ('f7436d87359445c093d6499d6a01b592', 'bf5c1e44546341de9acee52d148d5a76', NULL, NULL, '删除', NULL, 'data:test:delete', 30, NULL, '0', 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('f79ec17944f5485b9cf7c12ad2553a2b', 'bccc28641f4647d3beeaef0381fdf079', NULL, NULL, '删除', NULL, 'system:role:delete', 30, NULL, '0', 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu` VALUES ('fa201e3353ba4591923a0f1798acc855', 'bf5c1e44546341de9acee52d148d5a76', NULL, NULL, '查看', NULL, 'data:test:view', 10, NULL, '0', 0, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `sys_menu` VALUES ('fdbdcf8b8d674ae38154bc1e57498a91', '4a57f57fc7324c94b6390f1a2dd1f49a', 'user', '', '在线用户', '/system/monitor/online-user', '', 40, '', '0', 0, '1', '2022-03-15 23:19:04', '1', '2023-05-31 15:29:03', 0, 1);
INSERT INTO `sys_menu` VALUES ('ff7d37f87ab749f9836af74dbcdf033d', '8e9455740091486c914495cfb0c7faa5', NULL, NULL, '用户列表', NULL, 'role:user:list', 50, NULL, '0', 0, '1', '2022-02-04 17:33:20', NULL, NULL, 0, 0);

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组织机构编码',
  `pid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '父id',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
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
INSERT INTO `sys_office` VALUES ('31b365008f994e93850186126fce87cb', '东北分公司', '2', 'db', '4c37a80226134bce8bc91c8fc04a7d2f', 20, 0, '1', '2022-01-09 22:12:11', '1', '2022-03-05 17:17:29');
INSERT INTO `sys_office` VALUES ('4c37a80226134bce8bc91c8fc04a7d2f', '马小东总公司', '2', 'mxd', '0', 10, 0, '1', '2022-01-09 21:59:34', '1', '2022-02-05 11:26:01');
INSERT INTO `sys_office` VALUES ('81b5493cdb31477f9ceea85b2cd08f15', '内蒙分公司', '2', 'nm', '4c37a80226134bce8bc91c8fc04a7d2f', 10, 0, '1', '2022-01-09 21:59:47', '1', '2022-03-05 17:17:34');
INSERT INTO `sys_office` VALUES ('a8b62a271c2a4492bd5c0653cac8f33d', '扎兰屯办事处', '2', 'zlt', '81b5493cdb31477f9ceea85b2cd08f15', 10, 0, '1', '2022-01-16 13:15:46', '1', '2022-03-05 17:17:26');

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
  `type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色编码',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '0：全部，1：自定义，2：本级级子级，3：本级',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `desc_ribe` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `is_del` int NULL DEFAULT 0 COMMENT '是否删除：0未删除，1已删除',
  `create_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', '管理员', 'admin', '0', NULL, '管理员', 0, NULL, NULL, '1', '2023-04-02 20:53:45');
INSERT INTO `sys_role` VALUES ('1d183eaec667423fa9adb20e24356a86', NULL, '全部', 'qb', '0', NULL, NULL, 0, '1', '2022-01-16 13:56:10', NULL, NULL);
INSERT INTO `sys_role` VALUES ('3a408f5157c841ea8884ade4fa56d0f4', NULL, '自定义', 'zdy', '1', NULL, NULL, 0, '1', '2022-01-16 13:55:22', '1', '2022-01-16 17:49:09');
INSERT INTO `sys_role` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', NULL, '测试2', 'test2', '1', NULL, NULL, 0, '1', '2022-02-04 16:39:26', '1', '2022-02-04 16:45:11');
INSERT INTO `sys_role` VALUES ('e3448fc792ca463a95a34baf6f089dcd', NULL, '本级及子级', 'bjjzj', '2', NULL, NULL, 0, '1', '2022-01-16 13:55:45', NULL, NULL);
INSERT INTO `sys_role` VALUES ('e619e4b665de42acbca1665fec150634', NULL, '本级', 'bj', '3', NULL, NULL, 0, '1', '2022-01-16 13:55:59', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色id',
  `menu_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_role_menu` VALUES ('d71c32ace3bb4d959a652ee99ecd1b26', '39be13ef6f0745568c80bf35202ddb2b');
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
INSERT INTO `sys_role_menu` VALUES ('1', NULL);
INSERT INTO `sys_role_menu` VALUES ('1', '4e0f340982ea477f9b66beca5f5d7218');
INSERT INTO `sys_role_menu` VALUES ('1', '91a9226d1c6c4634b70dc4e9866e89cb');
INSERT INTO `sys_role_menu` VALUES ('1', '98a47d57680f4759816028a035ccc7d3');

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office`  (
  `office_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组织机构id',
  `role_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户组织机构关联表' ROW_FORMAT = DYNAMIC;

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
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `head_portrait` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `is_login` int NULL DEFAULT 0 COMMENT '禁止登录：0未禁用，1已禁用',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `office_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组织机构id',
  `is_del` int NULL DEFAULT 0 COMMENT '删除标识：0未删除，1已删除',
  `create_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`, `username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '管理员', '987654321', '2b27d6195c1d2ae9e541280b0f713000e0ccfaed389d65178b4d9ec99339e775', '1', '13888888888', 'userfiles/2023-04-01/1d8cd6ccc18746419b97bbd74702d38c/图片的副本2.png,userfiles/2023-04-15/5e4e53ef95884413b09509b8558393d8/iShot_2023-04-15_09.36.22.png,userfiles/2023-04-01/1d8cd6ccc18746419b97bbd74702d38c/图片的副本2.png,userfiles/2023-04-15/5e4e53ef95884413b09509b8558393d8/iShot_2023-04-15_09.36.22.png,userfiles/2023-04-01/1d8cd6ccc18746419b97bbd74702d38c/图片的副本2.png,userfiles/2023-04-15/5e4e53ef95884413b09509b8558393d8/iShot_2023-04-15_09.36.22.png,userfiles/2023-04-01/1d8cd6ccc18746419b97bbd74702d38c/图片的副本2.png,userfiles/2023-04-15/5e4e53ef95884413b09509b8558393d8/iShot_2023-04-15_09.36.22.png,userfiles/2023-04-01/1d8cd6ccc18746419b97bbd74702d38c/图片的副本2.png,userfiles/2023-04-15/5e4e53ef95884413b09509b8558393d8/iShot_2023-04-15_09.36.22.png', 0, NULL, '31b365008f994e93850186126fce87cb', 0, NULL, '2020-05-15 22:25:20', '1', '2022-01-21 22:11:11');
INSERT INTO `sys_user` VALUES ('534a37c366ec47878a6b0c85703d0bc2', 'system', '管理员', '987654321', '2b27d6195c1d2ae9e541280b0f713000e0ccfaed389d65178b4d9ec99339e775', NULL, NULL, NULL, 0, NULL, '4c37a80226134bce8bc91c8fc04a7d2f', 0, '1', '2022-01-30 19:28:47', '1', '2022-02-05 22:12:45');
INSERT INTO `sys_user` VALUES ('7217ee3f9d6e49f1a7e327183013226b', 'db', NULL, '987654321', '2b27d6195c1d2ae9e541280b0f713000e0ccfaed389d65178b4d9ec99339e775', NULL, NULL, NULL, 0, NULL, '31b365008f994e93850186126fce87cb', 0, '1', '2022-01-16 17:24:56', NULL, NULL);
INSERT INTO `sys_user` VALUES ('7e7f4b1017fc4564ad31a05033eb29d1', 'nm', NULL, '987654321', '2b27d6195c1d2ae9e541280b0f713000e0ccfaed389d65178b4d9ec99339e775', NULL, NULL, NULL, 0, NULL, '81b5493cdb31477f9ceea85b2cd08f15', 0, '1', '2022-01-16 17:24:29', '1', '2022-01-16 17:24:38');

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
INSERT INTO `sys_user_role` VALUES ('7e7f4b1017fc4564ad31a05033eb29d1', 'e3448fc792ca463a95a34baf6f089dcd');
INSERT INTO `sys_user_role` VALUES ('cbafb7813bd9458eae26e4dc3d05bf5e', '1d183eaec667423fa9adb20e24356a86');
INSERT INTO `sys_user_role` VALUES ('7217ee3f9d6e49f1a7e327183013226b', 'e619e4b665de42acbca1665fec150634');
INSERT INTO `sys_user_role` VALUES ('1b47d4758336487890147fc5cd64ebb9', 'e619e4b665de42acbca1665fec150634');
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('1', '1d183eaec667423fa9adb20e24356a86');
INSERT INTO `sys_user_role` VALUES ('534a37c366ec47878a6b0c85703d0bc2', '1');
INSERT INTO `sys_user_role` VALUES ('895757b441fe45b1afb0ed1cb535f35c', '3a408f5157c841ea8884ade4fa56d0f4');

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
