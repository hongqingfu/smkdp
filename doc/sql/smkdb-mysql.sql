/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : smkdb

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-05-09 09:19:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gen_data_source
-- ----------------------------
DROP TABLE IF EXISTS `gen_data_source`;
CREATE TABLE `gen_data_source` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `database_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '数据库类型',
  `database_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '数据库名称',
  `server` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '服务器IP',
  `port` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '端口号',
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `create_by` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改者',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of gen_data_source
-- ----------------------------
INSERT INTO `gen_data_source` VALUES ('37039a75098c4e7eb4020f5b29e46d9a', '当前数据库', 'mysql', 'smkdb', 'localhost', '3306', 'root', 'root', '1', '2018-04-11 00:00:00', '1', '2018-04-11 22:12:58', null, '0');

-- ----------------------------
-- Table structure for gen_scheme
-- ----------------------------
DROP TABLE IF EXISTS `gen_scheme`;
CREATE TABLE `gen_scheme` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '分类',
  `package_name` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '生成表编号',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='生成方案';

-- ----------------------------
-- Records of gen_scheme
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '关联父表外键',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_name` (`name`) USING BTREE,
  KEY `gen_table_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('8b2b37df1aa64a0f998c71b2cd1f90ba', 'sys_area', '地区', 'SysArea', null, null, '1', '2018-04-24 10:41:26', null, null, null, '0');
INSERT INTO `gen_table` VALUES ('b8ec2036fd3240cbb98bd5ae1f28519c', 'sys_dict', '字典', 'SysDict', null, null, '1', '2018-04-25 10:41:53', null, null, null, '0');
INSERT INTO `gen_table` VALUES ('c3aebd598f084fb0bb032cad49dcf826', 'sys_user_role', '用户角色', 'SysUserRole', null, null, '1', '2018-05-01 14:57:05', null, null, null, '0');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`) USING BTREE,
  KEY `gen_table_column_name` (`name`) USING BTREE,
  KEY `gen_table_column_sort` (`sort`) USING BTREE,
  KEY `gen_table_column_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('051d7a96696942958f19813544798840', 'da7fb300e7b8472c8d2d5ff4df7f084f', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', 'N', 'Y', null, null, 'Y', 'N', '=', 'text', null, null, '12', '1', '2018-05-01 14:57:49', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('08a2d772dded4413a67c8b220662f2e4', 'c3aebd598f084fb0bb032cad49dcf826', 'role_id', '角色编号', 'varchar(64)', 'String', 'roleId', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '2', '1', '2018-05-01 14:57:05', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('1ba19dc0e32142ec91c5eff2cb747038', '8b2b37df1aa64a0f998c71b2cd1f90ba', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '10', '1', '2018-04-24 10:41:26', '1', '2018-04-26 14:43:30', null, '0');
INSERT INTO `gen_table_column` VALUES ('3cce4127a1864429a66085d83dd3ca31', 'b8ec2036fd3240cbb98bd5ae1f28519c', 'create_date', '创建时间', 'datetime', 'Date', 'createDate', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '9', '1', '2018-04-25 10:41:53', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('3fcc8018d39a4f85974366ad98fcac19', 'da7fb300e7b8472c8d2d5ff4df7f084f', 'sort', '排序（升序）', 'decimal(10,0)', 'BigDecimal', 'sort', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '6', '1', '2018-05-01 14:57:49', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('4109210502724439947c31b454b3daa4', '8b2b37df1aa64a0f998c71b2cd1f90ba', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', 'N', 'Y', null, null, 'Y', 'N', '=', 'text', null, null, '12', '1', '2018-04-24 10:41:26', '1', '2018-04-26 14:43:30', null, '0');
INSERT INTO `gen_table_column` VALUES ('46b81a539d7846d1b024b5550d15cbe1', '8b2b37df1aa64a0f998c71b2cd1f90ba', 'id', '编号', 'varchar(64)', 'String', 'id', 'Y', 'N', 'Y', 'N', 'N', 'Y', '=', 'text', null, null, '1', '1', '2018-04-24 10:41:26', '1', '2018-04-26 14:43:30', null, '0');
INSERT INTO `gen_table_column` VALUES ('4840bfa12b18473ebff2119fd401e899', 'b8ec2036fd3240cbb98bd5ae1f28519c', 'type', '类型', 'varchar(100)', 'String', 'type', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '4', '1', '2018-04-25 10:41:53', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('4bd30386e9844de4a2ced750247f8e73', '8b2b37df1aa64a0f998c71b2cd1f90ba', 'update_date', '更新时间', 'datetime', 'Date', 'updateDate', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '11', '1', '2018-04-24 10:41:26', '1', '2018-04-26 14:43:30', null, '0');
INSERT INTO `gen_table_column` VALUES ('4d6cccd0ffda49b79c90115600d71bfc', '8b2b37df1aa64a0f998c71b2cd1f90ba', 'type', '区域类型', 'char(1)', 'String', 'type', 'N', 'Y', null, null, 'Y', 'N', '=', 'text', null, null, '7', '1', '2018-04-24 10:41:26', '1', '2018-04-26 14:43:30', null, '0');
INSERT INTO `gen_table_column` VALUES ('5316d260e26d4dc8beb5c694eff6c9e9', '8b2b37df1aa64a0f998c71b2cd1f90ba', 'code', '区域编码', 'varchar(100)', 'String', 'code', 'N', 'Y', null, null, 'Y', 'N', '=', 'text', null, null, '6', '1', '2018-04-24 10:41:26', '1', '2018-04-26 14:43:30', null, '0');
INSERT INTO `gen_table_column` VALUES ('58110c66f5484c9bad34b8765046e49d', 'b8ec2036fd3240cbb98bd5ae1f28519c', 'description', '描述', 'varchar(100)', 'String', 'description', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '5', '1', '2018-04-25 10:41:53', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('6e3dbb21accd4484bada9c50c1631a66', 'b8ec2036fd3240cbb98bd5ae1f28519c', 'value', '数据值', 'varchar(100)', 'String', 'value', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '2', '1', '2018-04-25 10:41:53', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('6f625e95ad9341f1b3cdaedb9a32ef7c', '8b2b37df1aa64a0f998c71b2cd1f90ba', 'parent_ids', '所有父级编号', 'varchar(2000)', 'String', 'parentIds', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '3', '1', '2018-04-24 10:41:26', '1', '2018-04-26 14:43:30', null, '0');
INSERT INTO `gen_table_column` VALUES ('752d5649016247c6b89af56007137587', 'da7fb300e7b8472c8d2d5ff4df7f084f', 'type', '类型', 'varchar(100)', 'String', 'type', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '4', '1', '2018-05-01 14:57:49', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('787137020afd403382cb9530547cac9a', 'da7fb300e7b8472c8d2d5ff4df7f084f', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '13', '1', '2018-05-01 14:57:49', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('7ea91e1faae84d45850a3774d2b48215', 'b8ec2036fd3240cbb98bd5ae1f28519c', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '13', '1', '2018-04-25 10:41:53', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('7fceedb89d504428acf68e29432bb9dd', 'da7fb300e7b8472c8d2d5ff4df7f084f', 'id', '编号', 'varchar(64)', 'String', 'id', 'Y', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '1', '1', '2018-05-01 14:57:49', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('86c0f5ac977841d2973580403ae56df0', 'da7fb300e7b8472c8d2d5ff4df7f084f', 'value', '数据值', 'varchar(100)', 'String', 'value', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '2', '1', '2018-05-01 14:57:49', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('8db26193cd64448a85c103bcfc554c06', 'b8ec2036fd3240cbb98bd5ae1f28519c', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '10', '1', '2018-04-25 10:41:53', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('9ae477570a2f4a29a138ddc84305ae84', 'da7fb300e7b8472c8d2d5ff4df7f084f', 'create_date', '创建时间', 'datetime', 'Date', 'createDate', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '9', '1', '2018-05-01 14:57:49', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('a20efff86b8c4a38bfe406e7fe90ee6a', '8b2b37df1aa64a0f998c71b2cd1f90ba', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '8', '1', '2018-04-24 10:41:26', '1', '2018-04-26 14:43:30', null, '0');
INSERT INTO `gen_table_column` VALUES ('a593148100e841d0b9ac3d0b90a90561', 'da7fb300e7b8472c8d2d5ff4df7f084f', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '10', '1', '2018-05-01 14:57:49', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('a6285bf1dd8049acb9c87db27ac46fd6', 'da7fb300e7b8472c8d2d5ff4df7f084f', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '8', '1', '2018-05-01 14:57:49', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('a8615e16ffcd4727ad91b1ff7cd33b37', 'da7fb300e7b8472c8d2d5ff4df7f084f', 'update_date', '更新时间', 'datetime', 'Date', 'updateDate', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '11', '1', '2018-05-01 14:57:49', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('b8759ed3a8c043cf802c1097a82eea4d', '8b2b37df1aa64a0f998c71b2cd1f90ba', 'create_date', '创建时间', 'datetime', 'Date', 'createDate', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '9', '1', '2018-04-24 10:41:26', '1', '2018-04-26 14:43:30', null, '0');
INSERT INTO `gen_table_column` VALUES ('c0e2589009144ca8958861ff5409efe0', 'b8ec2036fd3240cbb98bd5ae1f28519c', 'label', '标签名', 'varchar(100)', 'String', 'label', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '3', '1', '2018-04-25 10:41:53', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('c260252528424e0797a81fb9d8abecc3', 'b8ec2036fd3240cbb98bd5ae1f28519c', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', 'N', 'Y', null, null, 'Y', 'N', '=', 'text', null, null, '12', '1', '2018-04-25 10:41:53', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('cb8715690e5d4bdeb40a8b6077b6df74', 'c3aebd598f084fb0bb032cad49dcf826', 'user_id', '用户编号', 'varchar(64)', 'String', 'userId', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '1', '1', '2018-05-01 14:57:05', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('cbc284a2efc04b39935565e67920a5ca', 'da7fb300e7b8472c8d2d5ff4df7f084f', 'label', '标签名', 'varchar(100)', 'String', 'label', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '3', '1', '2018-05-01 14:57:49', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('ceccdeb7a19f4833b16ae053fb874b14', '8b2b37df1aa64a0f998c71b2cd1f90ba', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '13', '1', '2018-04-24 10:41:26', '1', '2018-04-26 14:43:30', null, '0');
INSERT INTO `gen_table_column` VALUES ('d0e67d51f825449494ea308410c9e021', 'b8ec2036fd3240cbb98bd5ae1f28519c', 'id', '编号', 'varchar(64)', 'String', 'id', 'Y', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '1', '1', '2018-04-25 10:41:53', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('d1a72b9fba744a41981bd6936ae94e35', 'da7fb300e7b8472c8d2d5ff4df7f084f', 'parent_id', '父级编号', 'varchar(64)', 'String', 'parentId', 'N', 'Y', null, null, 'Y', 'N', '=', 'text', null, null, '7', '1', '2018-05-01 14:57:49', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('d4389c628c0c44a49d0fdf2daba2f370', 'b8ec2036fd3240cbb98bd5ae1f28519c', 'parent_id', '父级编号', 'varchar(64)', 'String', 'parentId', 'N', 'Y', null, null, 'Y', 'N', '=', 'text', null, null, '7', '1', '2018-04-25 10:41:53', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('d993ca56e09c4874afccac66d70c9747', '8b2b37df1aa64a0f998c71b2cd1f90ba', 'sort', '排序', 'decimal(10,0)', 'BigDecimal', 'sort', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '5', '1', '2018-04-24 10:41:26', '1', '2018-04-26 14:43:30', null, '0');
INSERT INTO `gen_table_column` VALUES ('dcc2f2abfc154cb38a60f6cc2e99caa3', '8b2b37df1aa64a0f998c71b2cd1f90ba', 'parent_id', '父级编号', 'varchar(64)', 'String', 'parentId', 'N', 'N', 'Y', 'Y', 'Y', 'Y', '=', 'text', null, null, '2', '1', '2018-04-24 10:41:26', '1', '2018-04-26 14:43:30', null, '0');
INSERT INTO `gen_table_column` VALUES ('e29b12e56e0f4bc2a8f596ff8ddbd8e7', 'b8ec2036fd3240cbb98bd5ae1f28519c', 'update_date', '更新时间', 'datetime', 'Date', 'updateDate', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '11', '1', '2018-04-25 10:41:53', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('f174d1200ca3454a9e3f06ceeb3a8ab0', '8b2b37df1aa64a0f998c71b2cd1f90ba', 'name', '名称', 'varchar(100)', 'String', 'name', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '4', '1', '2018-04-24 10:41:26', '1', '2018-04-26 14:43:30', null, '0');
INSERT INTO `gen_table_column` VALUES ('f326dec01f114625b6ccf7902e7d45a3', 'da7fb300e7b8472c8d2d5ff4df7f084f', 'description', '描述', 'varchar(100)', 'String', 'description', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '5', '1', '2018-05-01 14:57:49', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('fbb7fd18e7f84b4c81a8fbfaa808bd45', 'b8ec2036fd3240cbb98bd5ae1f28519c', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '8', '1', '2018-04-25 10:41:53', null, null, null, '0');
INSERT INTO `gen_table_column` VALUES ('fc6340ea9dba4ec8adf747e9c09a9d86', 'b8ec2036fd3240cbb98bd5ae1f28519c', 'sort', '排序（升序）', 'decimal(10,0)', 'BigDecimal', 'sort', 'N', 'N', null, null, 'Y', 'N', '=', 'text', null, null, '6', '1', '2018-04-25 10:41:53', null, null, null, '0');

-- ----------------------------
-- Table structure for gen_template
-- ----------------------------
DROP TABLE IF EXISTS `gen_template`;
CREATE TABLE `gen_template` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '生成文件名',
  `content` text COLLATE utf8_bin COMMENT '内容',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代码模板表';

-- ----------------------------
-- Records of gen_template
-- ----------------------------

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
  `type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`) USING BTREE,
  KEY `sys_area_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='区域表';

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('1', '0', '0,', '中国', '10', '100000', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('2', '1', '0,1,', '福建省', '20', '110000', '2', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('3', '2', '0,1,2,', '厦门市', '30', '110101', '3', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('4', '3', '0,1,2,3,', '思明区', '40', '110102', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('5', '3', '0,1,2,3,', '湖里区', '50', '110103', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `value` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '数据值',
  `label` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '标签名',
  `type` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`) USING BTREE,
  KEY `sys_dict_label` (`label`) USING BTREE,
  KEY `sys_dict_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('10', 'yellow', '黄色', 'color', '颜色值', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('11', 'orange', '橙色', 'color', '颜色值', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('12', 'default', '默认主题', 'theme', '主题方案', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('13', 'green', '绿色主题', 'theme', '主题方案', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('14', 'readable', '橙色主题', 'theme', '主题方案', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('15', 'united', '红色主题', 'theme', '主题方案', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('16', 'flat', 'Flat主题', 'theme', '主题方案', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('17', '1', '国家', 'sys_area_type', '区域类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('19', '3', '地市', 'sys_area_type', '区域类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('20', '4', '区县', 'sys_area_type', '区域类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('21', '1', '公司', 'sys_office_type', '机构类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('22', '2', '部门', 'sys_office_type', '机构类型', '70', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('23', '3', '小组', 'sys_office_type', '机构类型', '80', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('24', '4', '其它', 'sys_office_type', '机构类型', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('28', '1', '一级', 'sys_office_grade', '机构等级', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('29', '2', '二级', 'sys_office_grade', '机构等级', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('30', '3', '三级', 'sys_office_grade', '机构等级', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('31', '4', '四级', 'sys_office_grade', '机构等级', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('32', '1', '所有数据', 'sys_data_scope', '数据范围', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', '100', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('39', '1', '系统管理', 'sys_user_type', '用户类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('40', '2', '部门经理', 'sys_user_type', '用户类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('41', '3', '普通用户', 'sys_user_type', '用户类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('67', '1', '接入日志', 'sys_log_type', '日志类型', '30', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('7', 'red', '红色', 'color', '颜色值', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('8', 'green', '绿色', 'color', '颜色值', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('9', 'blue', '蓝色', 'color', '颜色值', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('96', '1', '男', 'sex', '性别', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('97', '2', '女', 'sex', '性别', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `type` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '操作方式',
  `params` text COLLATE utf8_bin COMMENT '操作提交的数据',
  `exception` text COLLATE utf8_bin COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`) USING BTREE,
  KEY `sys_log_request_uri` (`request_uri`) USING BTREE,
  KEY `sys_log_type` (`type`) USING BTREE,
  KEY `sys_log_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('5b4bb16b571444898c7ac4eb177446b3', '1', '绯荤粺鐧诲綍', '1', '2018-02-26 20:45:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '/tansun-project/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('60aac9ee10534e6fa8f9c8c6d2785475', '2', '', '1', '2018-02-26 20:45:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', '/tansun-project/a', 'GET', 0x6C6F67696E3D, 0x6F72672E737072696E676672616D65776F726B2E7765622E7574696C2E4E6573746564536572766C6574457863657074696F6E3A2048616E646C65722070726F63657373696E67206661696C65643B206E657374656420657863657074696F6E206973206A6176612E6C616E672E4E6F537563684D6574686F644572726F723A20636F6D2E74616E73756E2E65617379636172652E636F72652E636F6E6669672E476C6F62616C2E6765744D656E754C61796F757428294C6A6176612F6C616E672F537472696E673B0D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E747269676765724166746572436F6D706C6574696F6E576974684572726F722844697370617463686572536572766C65742E6A6176613A31333032290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F44697370617463682844697370617463686572536572766C65742E6A6176613A393737290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F536572766963652844697370617463686572536572766C65742E6A6176613A383933290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E70726F6365737352657175657374284672616D65776F726B536572766C65742E6A6176613A393635290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E646F476574284672616D65776F726B536572766C65742E6A6176613A383536290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A363234290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E4672616D65776F726B536572766C65742E73657276696365284672616D65776F726B536572766C65742E6A6176613A383431290D0A096174206A617661782E736572766C65742E687474702E48747470536572766C65742E736572766963652848747470536572766C65742E6A6176613A373331290D0A096174206F72672E6170616368652E636174616C696E612E636F72652E4170706C69636174696F6E46696C746572436861696E2E696E7465726E616C446F46696C746572284170706C69636174696F6E46696C746572436861696E2E6A6176613A333033290D0A096174206F72672E6170616368652E636174616C696E612E636F72652E4170706C69636174696F6E46696C746572436861696E2E646F46696C746572284170706C69636174696F6E46696C746572436861696E2E6A6176613A323038290D0A096174206F72672E6170616368652E746F6D6361742E776562736F636B65742E7365727665722E577346696C7465722E646F46696C74657228577346696C7465722E6A6176613A3532290D0A096174206F72672E6170616368652E636174616C696E612E636F72652E4170706C69636174696F6E46696C746572436861696E2E696E7465726E616C446F46696C746572284170706C69636174696F6E46696C746572436861696E2E6A6176613A323431290D0A096174206F72672E6170616368652E636174616C696E612E636F72652E4170706C69636174696F6E46696C746572436861696E2E646F46696C746572284170706C69636174696F6E46696C746572436861696E2E6A6176613A323038290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E6F627461696E436F6E74656E7428536974654D65736846696C7465722E6A6176613A313239290D0A09617420636F6D2E6F70656E73796D70686F6E792E736974656D6573682E7765626170702E536974654D65736846696C7465722E646F46696C74657228536974654D65736846696C7465722E6A6176613A3737290D0A096174206F72672E6170616368652E636174616C696E612E636F72652E4170706C69636174696F6E46696C746572436861696E2E696E7465726E616C446F46696C746572284170706C69636174696F6E46696C746572436861696E2E6A6176613A323431290D0A096174206F72672E6170616368652E636174616C696E612E636F72652E4170706C69636174696F6E46696C746572436861696E2E646F46696C746572284170706C69636174696F6E46696C746572436861696E2E6A6176613A323038290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E50726F7869656446696C746572436861696E2E646F46696C7465722850726F7869656446696C746572436861696E2E6A6176613A3631290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E41647669636546696C7465722E65786563757465436861696E2841647669636546696C7465722E6A6176613A313038290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E41647669636546696C7465722E646F46696C746572496E7465726E616C2841647669636546696C7465722E6A6176613A313337290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E50726F7869656446696C746572436861696E2E646F46696C7465722850726F7869656446696C746572436861696E2E6A6176613A3636290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E65786563757465436861696E284162737472616374536869726F46696C7465722E6A6176613A343439290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C74657224312E63616C6C284162737472616374536869726F46696C7465722E6A6176613A333635290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E646F43616C6C285375626A65637443616C6C61626C652E6A6176613A3930290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E5375626A65637443616C6C61626C652E63616C6C285375626A65637443616C6C61626C652E6A6176613A3833290D0A096174206F72672E6170616368652E736869726F2E7375626A6563742E737570706F72742E44656C65676174696E675375626A6563742E657865637574652844656C65676174696E675375626A6563742E6A6176613A333833290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4162737472616374536869726F46696C7465722E646F46696C746572496E7465726E616C284162737472616374536869726F46696C7465722E6A6176613A333632290D0A096174206F72672E6170616368652E736869726F2E7765622E736572766C65742E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313235290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E696E766F6B6544656C65676174652844656C65676174696E6746696C74657250726F78792E6A6176613A333434290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F78792E646F46696C7465722844656C65676174696E6746696C74657250726F78792E6A6176613A323631290D0A096174206F72672E6170616368652E636174616C696E612E636F72652E4170706C69636174696F6E46696C746572436861696E2E696E7465726E616C446F46696C746572284170706C69636174696F6E46696C746572436861696E2E6A6176613A323431290D0A096174206F72672E6170616368652E636174616C696E612E636F72652E4170706C69636174696F6E46696C746572436861696E2E646F46696C746572284170706C69636174696F6E46696C746572436861696E2E6A6176613A323038290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E436861726163746572456E636F64696E6746696C7465722E646F46696C746572496E7465726E616C28436861726163746572456E636F64696E6746696C7465722E6A6176613A3835290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E4F6E63655065725265717565737446696C7465722E646F46696C746572284F6E63655065725265717565737446696C7465722E6A6176613A313037290D0A096174206F72672E6170616368652E636174616C696E612E636F72652E4170706C69636174696F6E46696C746572436861696E2E696E7465726E616C446F46696C746572284170706C69636174696F6E46696C746572436861696E2E6A6176613A323431290D0A096174206F72672E6170616368652E636174616C696E612E636F72652E4170706C69636174696F6E46696C746572436861696E2E646F46696C746572284170706C69636174696F6E46696C746572436861696E2E6A6176613A323038290D0A096174206F72672E6170616368652E636174616C696E612E636F72652E5374616E646172645772617070657256616C76652E696E766F6B65285374616E646172645772617070657256616C76652E6A6176613A323230290D0A096174206F72672E6170616368652E636174616C696E612E636F72652E5374616E64617264436F6E7465787456616C76652E696E766F6B65285374616E64617264436F6E7465787456616C76652E6A6176613A313232290D0A096174206F72672E6170616368652E636174616C696E612E61757468656E74696361746F722E41757468656E74696361746F72426173652E696E766F6B652841757468656E74696361746F72426173652E6A6176613A353035290D0A096174206F72672E6170616368652E636174616C696E612E636F72652E5374616E64617264486F737456616C76652E696E766F6B65285374616E64617264486F737456616C76652E6A6176613A313730290D0A096174206F72672E6170616368652E636174616C696E612E76616C7665732E4572726F725265706F727456616C76652E696E766F6B65284572726F725265706F727456616C76652E6A6176613A313033290D0A096174206F72672E6170616368652E636174616C696E612E76616C7665732E4163636573734C6F6756616C76652E696E766F6B65284163636573734C6F6756616C76652E6A6176613A393537290D0A096174206F72672E6170616368652E636174616C696E612E636F72652E5374616E64617264456E67696E6556616C76652E696E766F6B65285374616E64617264456E67696E6556616C76652E6A6176613A313136290D0A096174206F72672E6170616368652E636174616C696E612E636F6E6E6563746F722E436F796F7465416461707465722E7365727669636528436F796F7465416461707465722E6A6176613A343233290D0A096174206F72672E6170616368652E636F796F74652E6874747031312E416273747261637448747470313150726F636573736F722E70726F6365737328416273747261637448747470313150726F636573736F722E6A6176613A31303739290D0A096174206F72672E6170616368652E636F796F74652E416273747261637450726F746F636F6C244162737472616374436F6E6E656374696F6E48616E646C65722E70726F6365737328416273747261637450726F746F636F6C2E6A6176613A363230290D0A096174206F72672E6170616368652E746F6D6361742E7574696C2E6E65742E4A496F456E64706F696E7424536F636B657450726F636573736F722E72756E284A496F456E64706F696E742E6A6176613A333138290D0A096174206A6176612E7574696C2E636F6E63757272656E742E546872656164506F6F6C4578656375746F722E72756E576F726B657228556E6B6E6F776E20536F75726365290D0A096174206A6176612E7574696C2E636F6E63757272656E742E546872656164506F6F6C4578656375746F7224576F726B65722E72756E28556E6B6E6F776E20536F75726365290D0A096174206F72672E6170616368652E746F6D6361742E7574696C2E746872656164732E5461736B546872656164245772617070696E6752756E6E61626C652E72756E285461736B5468726561642E6A6176613A3631290D0A096174206A6176612E6C616E672E5468726561642E72756E28556E6B6E6F776E20536F75726365290D0A4361757365642062793A206A6176612E6C616E672E4E6F537563684D6574686F644572726F723A20636F6D2E74616E73756E2E65617379636172652E636F72652E636F6E6669672E476C6F62616C2E6765744D656E754C61796F757428294C6A6176612F6C616E672F537472696E673B0D0A09617420636F6D2E74616E73756E2E65617379636172652E6D6F64756C65732E7379732E7765622E4C6F67696E436F6E74726F6C6C65722E696E646578284C6F67696E436F6E74726F6C6C65722E6A6176613A313835290D0A09617420636F6D2E74616E73756E2E65617379636172652E6D6F64756C65732E7379732E7765622E4C6F67696E436F6E74726F6C6C6572242446617374436C6173734279537072696E6743474C4942242461643735303435652E696E766F6B65283C67656E6572617465643E290D0A096174206F72672E737072696E676672616D65776F726B2E63676C69622E70726F78792E4D6574686F6450726F78792E696E766F6B65284D6574686F6450726F78792E6A6176613A323034290D0A096174206F72672E737072696E676672616D65776F726B2E616F702E6672616D65776F726B2E43676C6962416F7050726F78792443676C69624D6574686F64496E766F636174696F6E2E696E766F6B654A6F696E706F696E742843676C6962416F7050726F78792E6A6176613A373138290D0A096174206F72672E737072696E676672616D65776F726B2E616F702E6672616D65776F726B2E5265666C6563746976654D6574686F64496E766F636174696F6E2E70726F63656564285265666C6563746976654D6574686F64496E766F636174696F6E2E6A6176613A313537290D0A096174206F72672E6170616368652E736869726F2E737072696E672E73656375726974792E696E746572636570746F722E416F70416C6C69616E6365416E6E6F746174696F6E73417574686F72697A696E674D6574686F64496E746572636570746F7224312E70726F6365656428416F70416C6C69616E6365416E6E6F746174696F6E73417574686F72697A696E674D6574686F64496E746572636570746F722E6A6176613A3832290D0A096174206F72672E6170616368652E736869726F2E617574687A2E616F702E417574686F72697A696E674D6574686F64496E746572636570746F722E696E766F6B6528417574686F72697A696E674D6574686F64496E746572636570746F722E6A6176613A3339290D0A096174206F72672E6170616368652E736869726F2E737072696E672E73656375726974792E696E746572636570746F722E416F70416C6C69616E6365416E6E6F746174696F6E73417574686F72697A696E674D6574686F64496E746572636570746F722E696E766F6B6528416F70416C6C69616E6365416E6E6F746174696F6E73417574686F72697A696E674D6574686F64496E746572636570746F722E6A6176613A313135290D0A096174206F72672E737072696E676672616D65776F726B2E616F702E6672616D65776F726B2E5265666C6563746976654D6574686F64496E766F636174696F6E2E70726F63656564285265666C6563746976654D6574686F64496E766F636174696F6E2E6A6176613A313739290D0A096174206F72672E737072696E676672616D65776F726B2E616F702E6672616D65776F726B2E43676C6962416F7050726F78792444796E616D696341647669736564496E746572636570746F722E696E746572636570742843676C6962416F7050726F78792E6A6176613A363533290D0A09617420636F6D2E74616E73756E2E65617379636172652E6D6F64756C65732E7379732E7765622E4C6F67696E436F6E74726F6C6C65722424456E68616E6365724279537072696E6743474C4942242439653934353732612E696E646578283C67656E6572617465643E290D0A0961742073756E2E7265666C6563742E4E61746976654D6574686F644163636573736F72496D706C2E696E766F6B6530284E6174697665204D6574686F64290D0A0961742073756E2E7265666C6563742E4E61746976654D6574686F644163636573736F72496D706C2E696E766F6B6528556E6B6E6F776E20536F75726365290D0A0961742073756E2E7265666C6563742E44656C65676174696E674D6574686F644163636573736F72496D706C2E696E766F6B6528556E6B6E6F776E20536F75726365290D0A096174206A6176612E6C616E672E7265666C6563742E4D6574686F642E696E766F6B6528556E6B6E6F776E20536F75726365290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E6D6574686F642E737570706F72742E496E766F6361626C6548616E646C65724D6574686F642E646F496E766F6B6528496E766F6361626C6548616E646C65724D6574686F642E6A6176613A323232290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E6D6574686F642E737570706F72742E496E766F6361626C6548616E646C65724D6574686F642E696E766F6B65466F725265717565737428496E766F6361626C6548616E646C65724D6574686F642E6A6176613A313337290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E6D76632E6D6574686F642E616E6E6F746174696F6E2E536572766C6574496E766F6361626C6548616E646C65724D6574686F642E696E766F6B65416E6448616E646C6528536572766C6574496E766F6361626C6548616E646C65724D6574686F642E6A6176613A313130290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E6D76632E6D6574686F642E616E6E6F746174696F6E2E526571756573744D617070696E6748616E646C6572416461707465722E696E766F6B6548616E646C65724D6574686F6428526571756573744D617070696E6748616E646C6572416461707465722E6A6176613A373735290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E6D76632E6D6574686F642E616E6E6F746174696F6E2E526571756573744D617070696E6748616E646C6572416461707465722E68616E646C65496E7465726E616C28526571756573744D617070696E6748616E646C6572416461707465722E6A6176613A373035290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E6D76632E6D6574686F642E416273747261637448616E646C65724D6574686F64416461707465722E68616E646C6528416273747261637448616E646C65724D6574686F64416461707465722E6A6176613A3835290D0A096174206F72672E737072696E676672616D65776F726B2E7765622E736572766C65742E44697370617463686572536572766C65742E646F44697370617463682844697370617463686572536572766C65742E6A6176613A393539290D0A092E2E2E203530206D6F72650D0A);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '父级编号',
  `has_children` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '是否有子级',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '链接',
  `target` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '图标',
  `is_show` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`) USING BTREE,
  KEY `sys_menu_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '1', '系统管理', '1', '', '0', '0', '1', '0', '1', '2018-03-24 00:00:00', '1', '2018-04-08 19:09:50', '', '0');
INSERT INTO `sys_menu` VALUES ('11', '1', '0', '用户管理', '10', 'sys/userList', '0', '0', '1', '0', '1', '2018-03-24 00:00:00', '1', '2018-04-06 22:09:36', '', '0');
INSERT INTO `sys_menu` VALUES ('12', '1', '0', '菜单管理', '11', 'sys/menulist', '0', '0', '0', '0', '1', '2018-03-24 18:59:23', '1', '2018-04-19 11:53:01', '', '0');
INSERT INTO `sys_menu` VALUES ('13', '1', '0', '角色管理', '13', '', '0', '0', '1', '0', '1', '2018-04-07 00:00:00', '1', '2018-04-08 19:03:20', '', '0');
INSERT INTO `sys_menu` VALUES ('2', '0', '1', '代码生成器', '2', '', '0', '0', '1', '0', '1', '2018-03-24 00:00:00', '1', '2018-04-13 16:18:19', '', '0');
INSERT INTO `sys_menu` VALUES ('21', '2', '0', '表单配置', '2', 'table/list', '0', '0', '1', '0', '1', '2018-04-11 00:00:00', '1', '2018-04-11 20:58:30', '', '0');
INSERT INTO `sys_menu` VALUES ('22', '2', '0', '数据库配置', '1', 'dataSource/list', '0', '0', '1', '0', '1', '2018-04-11 00:00:00', '1', '2018-04-13 16:18:19', '', '0');

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属区域',
  `code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
  `type` char(1) COLLATE utf8_bin NOT NULL COMMENT '机构类型',
  `grade` char(1) COLLATE utf8_bin NOT NULL COMMENT '机构等级',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '传真',
  `email` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`) USING BTREE,
  KEY `sys_office_del_flag` (`del_flag`) USING BTREE,
  KEY `sys_office_type` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='机构表';

-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('1', '0', '0,', '福建省总公司', '10', '2', '100000', '1', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('2', '1', '0,1,', '公司领导', '10', '2', '100001', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('3', '1', '0,1,', '综合部', '20', '2', '100002', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('4', '1', '0,1,', '市场部', '30', '2', '100003', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('5', '1', '0,1,', '技术部', '40', '2', '100004', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('6', '1', '0,1,', '研发部', '50', '2', '100005', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('7', '1', '0,1,', '厦门市分公司', '20', '3', '200000', '1', '2', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `enname` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`) USING BTREE,
  KEY `sys_role_enname` (`enname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', '系统管理员', 'sys_admin', 'assignment', '1', '', '1', '1', '2013-05-27 08:00:00', '1', '2017-02-08 11:21:01', '', '0');
INSERT INTO `sys_role` VALUES ('2', '1', '公司管理员', 'com_admin', 'assignment', '2', '', '1', '1', '2013-05-27 08:00:00', '1', '2017-02-08 11:21:17', '', '0');
INSERT INTO `sys_role` VALUES ('3', '1', '本公司管理员', 'com_admin_local', 'assignment', '3', '', '1', '1', '2013-05-27 08:00:00', '1', '2017-02-08 11:20:39', '', '0');
INSERT INTO `sys_role` VALUES ('4', '1', '部门管理员', 'dept_admin', 'assignment', '4', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('5', '1', '本部门管理员', 'dept_admin_local', 'assignment', '5', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('6', '1', '普通用户', 'normal_user', 'assignment', '8', '', '1', '1', '2013-05-27 08:00:00', '1', '2017-01-22 10:43:58', '', '0');
INSERT INTO `sys_role` VALUES ('7', '7', '厦门市管理员', 'xm_admin', 'assignment', '9', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '0b2ebd4d639e4c2b83c2dd0764522f24');
INSERT INTO `sys_role_menu` VALUES ('1', '0ca004d6b1bf4bcab9670a5060d82a55');
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '16');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '18');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '21');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '3c92c17886944d0687e73e286cada573');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '4855cf3b25c244fb8500a380db189d97');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '67');
INSERT INTO `sys_role_menu` VALUES ('1', '68');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '79');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '81');
INSERT INTO `sys_role_menu` VALUES ('1', '82');
INSERT INTO `sys_role_menu` VALUES ('1', '84');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', 'afab2db430e2457f9cf3a11feaa8b869');
INSERT INTO `sys_role_menu` VALUES ('1', 'b1f6d1b86ba24365bae7fd86c5082317');
INSERT INTO `sys_role_menu` VALUES ('1', 'ba8092291b40482db8fe7fc006ea3d76');
INSERT INTO `sys_role_menu` VALUES ('1', 'c2e4d9082a0b4386884a0b203afe2c5c');
INSERT INTO `sys_role_menu` VALUES ('1', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
INSERT INTO `sys_role_menu` VALUES ('1', 'df7ce823c5b24ff9bada43d992f373e2');

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-机构';

-- ----------------------------
-- Records of sys_role_office
-- ----------------------------
INSERT INTO `sys_role_office` VALUES ('7', '7');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `company_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '登录名',
  `password` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '工号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `email` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `user_type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`) USING BTREE,
  KEY `sys_user_login_name` (`login_name`) USING BTREE,
  KEY `sys_user_company_id` (`company_id`) USING BTREE,
  KEY `sys_user_update_date` (`update_date`) USING BTREE,
  KEY `sys_user_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', '2', 'administrator', 'e2168c8badd54513f1b377265f29f6f91d29936f116961590e996f36', '0001', '系统管理员', '0592@163.com', '0592', '0592', null, '', '0:0:0:0:0:0:0:1', '2018-02-26 20:45:12', '1', '1', '2013-05-27 08:00:00', '1', '2017-02-06 14:04:10', '最高管理员', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户-角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');

-- ----------------------------
-- Table structure for test_data
-- ----------------------------
DROP TABLE IF EXISTS `test_data`;
CREATE TABLE `test_data` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `sex` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据表';

-- ----------------------------
-- Records of test_data
-- ----------------------------

-- ----------------------------
-- Table structure for test_data_child
-- ----------------------------
DROP TABLE IF EXISTS `test_data_child`;
CREATE TABLE `test_data_child` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `test_data_main_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主表ID',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_child_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据子表';

-- ----------------------------
-- Records of test_data_child
-- ----------------------------

-- ----------------------------
-- Table structure for test_data_main
-- ----------------------------
DROP TABLE IF EXISTS `test_data_main`;
CREATE TABLE `test_data_main` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `sex` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_main_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据表';

-- ----------------------------
-- Records of test_data_main
-- ----------------------------

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_tree_del_flag` (`del_flag`) USING BTREE,
  KEY `test_data_parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='树结构表';

-- ----------------------------
-- Records of test_tree
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
