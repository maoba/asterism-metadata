--系统用户表
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` BIGINT NOT NULL  AUTO_INCREMENT COMMENT '主键',
  `user_name` VARCHAR(64) DEFAULT NULL COMMENT '用户名称',
  `user_pwd`  VARCHAR(64) DEFAULT NULL COMMENT '用户密码',
  `tenant_id` BIGINT DEFAULT 0 COMMENT '租户id',
  `tenant_name` VARCHAR(64) DEFAULT NULL COMMENT '租户名称',
  `cell_phone_num` VARCHAR(32) DEFAULT NULL COMMENT '手机号码',
  `email` VARCHAR(32) DEFAULT NULL COMMENT '邮箱',
  `salt`  VARCHAR(32) DEFAULT NULL COMMENT '盐',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  `avatar` VARCHAR(32) DEFAULT NULL COMMENT '头像url地址',
  `position` VARCHAR(32) DEFAULT NULL COMMENT '职位信息',
  `status` INT DEFAULT 0 COMMENT '-1:删除 0：失效 1：生效',
  `sex` TINYINT DEFAULT 0 COMMENT '0:男 1：女',
  `terminal_type` INT(2) DEFAULT 0 COMMENT '登入端类型 0:pc端  1:手机端',
  PRIMARY KEY (`id`),
  INDEX `tenant_id`(`tenant_id`),
  INDEX `cell_phone_num`(`cell_phone_num`),
  INDEX `email`(`email`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统用户登录表';

--用户角色关系表
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role` (
  `id` BIGINT NOT NULL  AUTO_INCREMENT COMMENT '主键',
  `role_id` BIGINT(64) DEFAULT 0 COMMENT '角色Id',
  `role_name`  VARCHAR(64) DEFAULT NULL COMMENT '角色名称',
  `role_code` VARCHAR(64) DEFAULT NULL COMMENT '角色编码',
  `user_id` BIGINT DEFAULT 0 COMMENT '用户id',
  `tenant_id` BIGINT DEFAULT 0 COMMENT '租户id',
  `user_name` VARCHAR(64) DEFAULT NULL COMMENT '用户名称',
  PRIMARY KEY (`id`),
  INDEX `role_id`(`role_id`),
  INDEX `user_id`(`user_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户角色关系表';


--系统角色表
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role` (
  `id` BIGINT NOT NULL  AUTO_INCREMENT COMMENT '主键',
  `role_name` VARCHAR(64) DEFAULT NULL COMMENT '角色名称',
  `tenant_id` BIGINT DEFAULT 0 COMMENT '租户id',
  `role_code` VARCHAR(32) DEFAULT NULL COMMENT '角色编码',
  `description` VARCHAR(64) DEFAULT NULL COMMENT '描述信息',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  INDEX `tenant_id`(`tenant_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';


--系统角色权限表
DROP TABLE IF EXISTS `system_role_permission`;
CREATE TABLE `system_role_permission` (
  `id` BIGINT NOT NULL  AUTO_INCREMENT COMMENT '主键',
  `role_id` BIGINT DEFAULT 0 COMMENT '角色Id',
  `role_name` VARCHAR(64) DEFAULT NULL COMMENT '角色名称',
  `permission_id` BIGINT DEFAULT 0 COMMENT '权限id',
  `permission_code` VARCHAR(64) DEFAULT NULL COMMENT '权限编码',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  INDEX `role_id`(`role_id`),
  INDEX `permission_id`(`permission_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色权限表';

--权限表
DROP TABLE IF EXISTS `system_permission`;
CREATE TABLE `system_permission` (
  `id` BIGINT NOT NULL  AUTO_INCREMENT COMMENT '主键',
  `module_name` VARCHAR(64) DEFAULT NULL COMMENT '模块名称',
  `module_code`  VARCHAR(64) DEFAULT NULL COMMENT '模块编码',
  `permission_code` VARCHAR(64) DEFAULT NULL COMMENT '权限编码',
  `permission_url` VARCHAR(64) DEFAULT NULL COMMENT '权限地址',
  `permission_ico` VARCHAR(64) DEFAULT NULL COMMENT '权限图标',
  `permission_type` TINYINT DEFAULT 0 COMMENT '0:目录 1:资源',
  `terminal_type` TINYINT DEFAULT 0 COMMENT '0:pc权限 1:手机权限',
  `tenant_id` BIGINT DEFAULT 0 COMMENT '租户id',
  `parent_id` BIGINT DEFAULT 0 COMMENT '父节点',
  `status` TINYINT DEFAULT 0 COMMENT '-1:删除 0:失效 1:生效',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  INDEX `module_code`(`module_code`),
  INDEX `tenant_id`(`tenant_id`),
  INDEX `parent_id`(`parent_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='权限表';



