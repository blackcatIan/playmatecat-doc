/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2015/5/21 11:27:59                           */
/*==============================================================*/


drop table if exists permission;

drop table if exists rel_role_permission;

drop table if exists rel_user_role;

drop table if exists role;

drop table if exists sys;

drop table if exists sys_module;

drop table if exists user;

/*==============================================================*/
/* Table: permission                                            */
/*==============================================================*/
create table permission
(
   id                   smallint not null auto_increment comment '键',
   sys_module_id        smallint not null comment '键',
   name                 varchar(50) not null comment '权限名',
   code                 varchar(200) not null comment 'shiro权限编码，格式
            子系统:模块:权限名(或控件名)
            例如 bbs:pannel:edit',
   is_deleted           bool default 0,
   primary key (id)
);

alter table permission comment '权限表';

/*==============================================================*/
/* Table: rel_role_permission                                   */
/*==============================================================*/
create table rel_role_permission
(
   role_id              smallint not null comment '键',
   permission_id        smallint not null comment '键',
   is_deleted           bool default 0,
   primary key (role_id, permission_id)
);

alter table rel_role_permission comment '角色-权限关系表';

/*==============================================================*/
/* Table: rel_user_role                                         */
/*==============================================================*/
create table rel_user_role
(
   user_id              smallint not null comment '键',
   role_id              smallint not null comment '键',
   is_deleted           bool default 0,
   primary key (user_id, role_id)
);

alter table rel_user_role comment '用户-角色关系表';

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   id                   smallint not null auto_increment comment '键',
   sys_id               smallint not null comment '键',
   name                 varchar(50) not null comment '角色名',
   description          varchar(1000) comment '描述',
   is_deleted           bool default 0,
   primary key (id)
);

alter table role comment '角色表';

/*==============================================================*/
/* Table: sys                                                   */
/*==============================================================*/
create table sys
(
   id                   smallint not null auto_increment comment '键',
   name                 varchar(50) not null comment '子系统名称',
   is_deleted           bool default 0,
   primary key (id)
);

alter table sys comment '系统表';

/*==============================================================*/
/* Table: sys_module                                            */
/*==============================================================*/
create table sys_module
(
   id                   smallint not null auto_increment comment '键',
   sys_id               smallint not null comment '键',
   name                 varchar(50) not null comment '模块名',
   is_deleted           bool default 0,
   primary key (id)
);

alter table sys_module comment '系统模块表';

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   id                   smallint not null auto_increment comment '键',
   username             varchar(50) not null comment '用户名',
   password             varchar(200) not null comment '密码',
   email                varchar(200) not null comment '邮箱',
   is_deleted           bool default 0,
   cell_phone           varchar(50),
   cell_phone_areacode  varchar(50),
   registered_at        timestamp not null,
   updated_at           timestamp not null,
   primary key (id)
);

alter table user comment '用户表';

