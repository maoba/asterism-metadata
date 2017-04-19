--租户表（给平台管理员使用）
DROP TABLE IF EXISTS `tenant`;
CREATE TABLE `tenant` (
  `id` BIGINT NOT NULL  AUTO_INCREMENT COMMENT '主键',
  `name` VARCHAR(64) DEFAULT NULL COMMENT '租户的名称',
  `description`  VARCHAR(512) DEFAULT NULL COMMENT '租户的简单的介绍',
  `location` VARCHAR(64) DEFAULT NULL COMMENT '学校的地理位置',
  `detail_id` BIGINT DEFAULT 0 COMMENT '关联的具体学校id',
  `status` INT DEFAULT 1 COMMENT '-1：删除 0：失效 1：生效',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  INDEX `detail_id`(`detail_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户表';


--租户详情表（主要给租户管理员使用）
DROP TABLE IF EXISTS `tenant_detail`;
CREATE TABLE `tenant_detail` (
  `id` BIGINT NOT NULL  AUTO_INCREMENT COMMENT '主键',
  `name` VARCHAR(64) DEFAULT NULL COMMENT '租户的名称',
  `description`  VARCHAR(512) DEFAULT NULL COMMENT '租户的简单的介绍',
  `location` VARCHAR(64) DEFAULT NULL COMMENT '学校的地理位置',
  `latitude` DOUBLE DEFAULT 0.00 COMMENT '纬度',
  `longitude` DOUBLE DEFAULT 0.00 COMMENT '经度',
  `detail_desc` TEXT DEFAULT NULL COMMENT '学校详细描述信息',
  `register_local` VARCHAR(64) DEFAULT NULL COMMENT '学校注册地点',
  `teacher_num` INT(8) DEFAULT NULL COMMENT '教师总人数',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  INDEX `name`(`name`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户表';


--教职工管理
DROP TABLE IF EXISTS `tenant_teacher`;
CREATE TABLE `tenant_teacher` (
  `id` BIGINT NOT NULL  AUTO_INCREMENT COMMENT '主键',
  `name` VARCHAR(64) DEFAULT NULL COMMENT '教师真实姓名',
  `cellphone`  VARCHAR(16) DEFAULT NULL COMMENT '手机号码',
  `telephone` VARCHAR(16) DEFAULT NULL COMMENT '固定电话号码',
  `nickname` VARCHAR(16) DEFAULT NULL COMMENT '昵称',
  `sex` INT(4) DEFAULT 0 COMMENT '0：男  1：女',
  `position` VARCHAR(32) DEFAULT NULL COMMENT '职位信息',
  `home_address` VARCHAR(128) DEFAULT NULL COMMENT '家庭地址',
  `now_address` VARCHAR(128) DEFAULT NULL COMMENT '现住地址',
  `experience` INT(4) DEFAULT 0 COMMENT '工作经验，单位:年',
  `tenant_id` BIGINT DEFAULT 0 COMMENT '所属租户的id',
  `avatar` VARCHAR(64) DEFAULT NULL COMMENT '头像url',
  `qualifications` VARCHAR(32) DEFAULT NULL COMMENT '学历',
  `graduate_institutions` VARCHAR(32) DEFAULT NULL COMMENT '毕业院校',
  `description` VARCHAR(32) DEFAULT NULL COMMENT '描述信息',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  `status` TINYINT(2) DEFAULT 0 COMMENT '-1:删除 0：离职 1：在职',
  PRIMARY KEY (`id`),
  INDEX `name`(`name`),
  INDEX `tenant_id`(`tenant_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户表';


--学生信息管理
DROP TABLE IF EXISTS `tenant_student`;
CREATE TABLE `tenant_student` (
  `id` BIGINT NOT NULL  AUTO_INCREMENT COMMENT '主键',
  `name` VARCHAR(64) DEFAULT NULL COMMENT '学生姓名',
  `age`  INT(4) DEFAULT 0 COMMENT '年龄',
  `sex` INT(2) DEFAULT 0 COMMENT '0：男 1：女',
  `address` VARCHAR(256) DEFAULT NULL COMMENT '家庭地址',
  `student_type` INT(2) DEFAULT 0 COMMENT '学生类型：0-少儿 1-青少年 2-成人',
  `tenant_id` BIGINT DEFAULT 0 COMMENT '所属租户id',
  `class_id` BIGINT DEFAULT 0 COMMENT '所属班级id',
  `class_name` VARCHAR(64) DEFAULT NULL COMMENT '所属班级名称',
  `start_time` DATETIME DEFAULT NULL COMMENT '入校时间',
  `finish_time` DATETIME DEFAULT NULL COMMENT '离校时间',
  `status` INT(2) DEFAULT 0 COMMENT '-1:删除 0：离校  1：在校',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  INDEX `name`(`name`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='学生信息表';

--家人关联信息管理
DROP TABLE IF EXISTS `tenant_family`;
CREATE TABLE `tenant_family` (
  `id` BIGINT NOT NULL  AUTO_INCREMENT COMMENT '主键',
  `member_name` VARCHAR(64) DEFAULT NULL COMMENT '成员姓名',
  `member_type`  INT(2) DEFAULT 0 COMMENT '0:父亲 1:母亲 3:配偶',
  `member_contact` VARCHAR(64) DEFAULT NULL COMMENT '联系方式',
  `family_tel` VARCHAR(32) DEFAULT NULL COMMENT '家庭固定电话',
  `address` VARCHAR(256) DEFAULT NULL COMMENT '家庭地址',
  `family_type` INT(2) DEFAULT NULL COMMENT '家庭关联类型  0:关联学生 1:关联教师',
  `relative_id` BIGINT DEFAULT 0 COMMENT '关联成员的id',
  `relative_name` VARCHAR(32) DEFAULT NULL COMMENT '关联成员姓名',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  INDEX `member_name`(`member_name`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='学生家人表';


--班级信息
DROP TABLE IF EXISTS `tenant_class`;
CREATE TABLE `tenant_class` (
  `id` BIGINT NOT NULL  AUTO_INCREMENT COMMENT '主键',
  `name` VARCHAR(64) DEFAULT NULL COMMENT '班级名称',
  `tenant_id`  BIGINT DEFAULT 0 COMMENT '租户id',
  `introduce` VARCHAR(256) DEFAULT NULL COMMENT '班级介绍',
  `slogan` VARCHAR(256) DEFAULT NULL COMMENT '班级口号',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  INDEX `name`(`name`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='班级表';


--班级教师表
DROP TABLE IF EXISTS `tenant_teacher_class`;
CREATE TABLE `tenant_teacher_class` (
  `id` BIGINT NOT NULL  AUTO_INCREMENT COMMENT '主键',
  `teacher_id` BIGINT DEFAULT 0 COMMENT '教师ID',
  `teacher_name`  VARCHAR(32) DEFAULT NULL COMMENT '教师名称',
  `class_id` BIGINT DEFAULT 0 COMMENT '班级ID',
  `position` VARCHAR(32) DEFAULT NULL COMMENT '教师职位',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  INDEX `teacher_name`(`teacher_name`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='班级教师关系表';


--课程表
DROP TABLE IF EXISTS `tenant_course`;
CREATE TABLE `tenant_course` (
  `id` BIGINT NOT NULL  AUTO_INCREMENT COMMENT '主键',
  `name` BIGINT DEFAULT NULL COMMENT '课程名称',
  `fit`  VARCHAR(32) DEFAULT NULL COMMENT '适合对象',
  `target` varchar(256)	 DEFAULT NULL COMMENT '课程目标',
  `feature` VARCHAR(256) DEFAULT NULL COMMENT '课程特色',
  `tenant_id` BIGINT DEFAULT 0 COMMENT '租户的id',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  INDEX `tenant_id`(`tenant_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='课程表';


--教师课程关系表
DROP TABLE IF EXISTS `tenant_teacher_course`;
CREATE TABLE `tenant_teacher_course` (
  `id` BIGINT NOT NULL  AUTO_INCREMENT COMMENT '主键',
  `course_id` BIGINT DEFAULT 0 COMMENT '课程id',
  `course_name`  VARCHAR(32) DEFAULT NULL COMMENT '课程名称',
  `teacher_id` BIGINT DEFAULT NULL COMMENT '教师Id',
  `teacher_name` VARCHAR(32) DEFAULT NULL COMMENT '教师名称',
  `avatar` VARCHAR(32) DEFAULT NULL COMMENT '教师头像',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  INDEX `course_id`(`course_id`),
  INDEX `teacher_id`(`teacher_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='教师课程关系表';

--学生课程关系表
DROP TABLE IF EXISTS `tenant_student_course`;
CREATE TABLE `tenant_student_course` (
  `id` BIGINT NOT NULL  AUTO_INCREMENT COMMENT '主键',
  `course_id` BIGINT DEFAULT 0 COMMENT '课程id',
  `course_name`  VARCHAR(32) DEFAULT NULL COMMENT '课程名称',
  `student_id` BIGINT DEFAULT NULL COMMENT '学生id',
  `student_name` VARCHAR(32) DEFAULT NULL COMMENT '学生名称',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  INDEX `course_id`(`course_id`),
  INDEX `student_id`(`student_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='学生课程关系表';




