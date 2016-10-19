/*
Navicat SQL Server Data Transfer

Source Server         : localhost2
Source Server Version : 105000
Source Host           : ZCF-PC\SQLEXPRESS:1433
Source Database       : test
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 105000
File Encoding         : 65001

Date: 2016-08-31 16:27:01
*/


-- ----------------------------
-- Table structure for t_s_authority
-- ----------------------------
DROP TABLE [dbo].[t_s_authority]
GO
CREATE TABLE [dbo].[t_s_authority] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] varchar(100) NULL ,
[type] varchar(50) NULL ,
[url] varchar(200) NULL ,
[parent_id] int NOT NULL ,
[permission] varchar(100) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[t_s_authority]', RESEED, 6)
GO

-- ----------------------------
-- Records of t_s_authority
-- ----------------------------
SET IDENTITY_INSERT [dbo].[t_s_authority] ON
GO
INSERT INTO [dbo].[t_s_authority] ([id], [name], [type], [url], [parent_id], [permission]) VALUES (N'1', N'资源', N'menu', N'', N'0', N'')
GO
GO
INSERT INTO [dbo].[t_s_authority] ([id], [name], [type], [url], [parent_id], [permission]) VALUES (N'2', N'用户管理', N'menu', N'/user', N'1', N'user:*')
GO
GO
INSERT INTO [dbo].[t_s_authority] ([id], [name], [type], [url], [parent_id], [permission]) VALUES (N'3', N'用户新增', N'button', N'', N'2', N'user:create')
GO
GO
INSERT INTO [dbo].[t_s_authority] ([id], [name], [type], [url], [parent_id], [permission]) VALUES (N'4', N'用户修改', N'button', N'', N'2', N'user:update')
GO
GO
INSERT INTO [dbo].[t_s_authority] ([id], [name], [type], [url], [parent_id], [permission]) VALUES (N'5', N'用户删除', N'button', N'', N'2', N'user:delete')
GO
GO
INSERT INTO [dbo].[t_s_authority] ([id], [name], [type], [url], [parent_id], [permission]) VALUES (N'6', N'用户查看', N'button', N'', N'2', N'user:view')
GO
GO
SET IDENTITY_INSERT [dbo].[t_s_authority] OFF
GO

-- ----------------------------
-- Table structure for t_s_role
-- ----------------------------
DROP TABLE [dbo].[t_s_role]
GO
CREATE TABLE [dbo].[t_s_role] (
[id] int NOT NULL IDENTITY(1,1) ,
[role_code] varchar(100) NULL ,
[role_name] varchar(100) NULL ,
[authority_ids] varchar(100) NULL ,
[available] int NULL DEFAULT ((0)) ,
[addTime] datetime NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[t_s_role]', RESEED, 4)
GO

-- ----------------------------
-- Records of t_s_role
-- ----------------------------
SET IDENTITY_INSERT [dbo].[t_s_role] ON
GO
INSERT INTO [dbo].[t_s_role] ([id], [role_code], [role_name], [authority_ids], [available], [addTime]) VALUES (N'1', N'SUPERADMIN', N'超级管理员', N'2', N'0', N'2016-08-30 18:21:20.000')
GO
GO
INSERT INTO [dbo].[t_s_role] ([id], [role_code], [role_name], [authority_ids], [available], [addTime]) VALUES (N'2', N'PLATFORMADMIN', N'平台管理员', N'2', N'0', N'2016-08-30 18:21:24.000')
GO
GO
INSERT INTO [dbo].[t_s_role] ([id], [role_code], [role_name], [authority_ids], [available], [addTime]) VALUES (N'3', N'ADMIN', N'管理员', N'2', N'0', N'2016-08-30 18:21:27.000')
GO
GO
INSERT INTO [dbo].[t_s_role] ([id], [role_code], [role_name], [authority_ids], [available], [addTime]) VALUES (N'4', N'COMPANYADMIN', N'企业管理员', N'2', N'0', N'2016-08-30 18:21:29.000')
GO
GO
SET IDENTITY_INSERT [dbo].[t_s_role] OFF
GO

-- ----------------------------
-- Table structure for t_s_type
-- ----------------------------
DROP TABLE [dbo].[t_s_type]
GO
CREATE TABLE [dbo].[t_s_type] (
[ID] varchar(32) NOT NULL ,
[typecode] varchar(50) NULL ,
[typename] varchar(50) NULL ,
[typepid] varchar(32) NULL ,
[typegroupid] varchar(32) NULL 
)


GO

-- ----------------------------
-- Records of t_s_type
-- ----------------------------
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62ba230033', N'2', N'菜单图标', null, N'4028808a4f4a6207014f4a62b4e70029')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62ba680034', N'1', N'系统图标', null, N'4028808a4f4a6207014f4a62b4e70029')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62baa90035', N'files', N'附件', null, N'4028808a4f4a6207014f4a62b6f70031')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62bae40036', N'1', N'优质订单', null, N'4028808a4f4a6207014f4a62b537002a')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62bb240037', N'2', N'普通订单', null, N'4028808a4f4a6207014f4a62b537002a')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62bb640038', N'1', N'签约客户', null, N'4028808a4f4a6207014f4a62b574002b')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62bba40039', N'2', N'普通客户', null, N'4028808a4f4a6207014f4a62b574002b')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62bbe7003a', N'1', N'特殊服务', null, N'4028808a4f4a6207014f4a62b5b2002c')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62bc42003b', N'2', N'普通服务', null, N'4028808a4f4a6207014f4a62b5b2002c')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62bc9b003c', N'single', N'单条件查询', null, N'4028808a4f4a6207014f4a62b5f6002d')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62bce0003d', N'group', N'范围查询', null, N'4028808a4f4a6207014f4a62b5f6002d')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62bd2f003e', N'Y', N'是', null, N'4028808a4f4a6207014f4a62b633002e')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62bd6f003f', N'N', N'否', null, N'4028808a4f4a6207014f4a62b633002e')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62bdb10040', N'Integer', N'Integer', null, N'4028808a4f4a6207014f4a62b673002f')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62bdfa0041', N'Date', N'Date', null, N'4028808a4f4a6207014f4a62b673002f')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62be580042', N'String', N'String', null, N'4028808a4f4a6207014f4a62b673002f')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62be9f0043', N'Long', N'Long', null, N'4028808a4f4a6207014f4a62b673002f')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62beea0044', N'act', N'工作流引擎表', null, N'4028808a4f4a6207014f4a62b6b30030')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62bf420045', N't_s', N'系统基础表', null, N'4028808a4f4a6207014f4a62b6b30030')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62bfae0046', N't_b', N'业务表', null, N'4028808a4f4a6207014f4a62b6b30030')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62c0060047', N't_p', N'自定义引擎表', null, N'4028808a4f4a6207014f4a62b6b30030')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62c05a0048', N'news', N'新闻', null, N'4028808a4f4a6207014f4a62b6f70031')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62c0b00049', N'0', N'男性', null, N'4028808a4f4a6207014f4a62b7360032')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808a4f4a6207014f4a62c108004a', N'1', N'女性', null, N'4028808a4f4a6207014f4a62b7360032')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808b4f0263cf014f026fc828000f', N'gongzhong01', N'钳工', null, N'4028808b4f0263cf014f026edc05000d')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808b4f0263cf014f027024de0011', N'gongzhong02', N'泥工', null, N'4028808b4f0263cf014f026edc05000d')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808b4f0263cf014f0270682e0013', N'gongzhong03', N'木工', null, N'4028808b4f0263cf014f026edc05000d')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808b4f0263cf014f027088210015', N'gongzhong04', N'水电工', null, N'4028808b4f0263cf014f026edc05000d')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808b4f0263cf014f0270d0150017', N'gongzhong05', N'钢筋工', null, N'4028808b4f0263cf014f026edc05000d')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808b4f0263cf014f0270f3e40019', N'gongzhong06', N'混凝土工', null, N'4028808b4f0263cf014f026edc05000d')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808b4f0263cf014f02718274001d', N'zhicheng01', N'管理员', null, N'4028808b4f0263cf014f027157fc001b')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808b4f0263cf014f0271aad6001f', N'zhicheng02', N'总经理', null, N'4028808b4f0263cf014f027157fc001b')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808b4f0263cf014f0271c4220021', N'zhicheng03', N'副总经理', null, N'4028808b4f0263cf014f027157fc001b')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808b4f0263cf014f0271f1560023', N'zhicheng04', N'项目经理', null, N'4028808b4f0263cf014f027157fc001b')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808b4f0263cf014f027216ee0025', N'zhicheng05', N'施工员', null, N'4028808b4f0263cf014f027157fc001b')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808b4f0263cf014f02724ee40027', N'zhicheng06', N'预算员', null, N'4028808b4f0263cf014f027157fc001b')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808b4f0263cf014f02727fa00029', N'zhicheng07', N'材料员', null, N'4028808b4f0263cf014f027157fc001b')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808b4f0263cf014f0272a286002b', N'zhicheng08', N'质检员', null, N'4028808b4f0263cf014f027157fc001b')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808b4f0263cf014f0272cda9002d', N'zhicheng09', N'安全员', null, N'4028808b4f0263cf014f027157fc001b')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808b4f0263cf014f0273017f002f', N'zhicheng10', N'办公室人员', null, N'4028808b4f0263cf014f027157fc001b')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808b4f4e177c014f4e2bd7df0005', N'zhengfu0', N'系统管理员', null, N'ff8080814f107bae014f108896d80003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808c4f73339b014f7349662b000b', N'0', N'噪音', null, N'4028808c4f73339b014f7349404d0009')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808c4f73339b014f7349808a000d', N'1', N'粉尘', null, N'4028808c4f73339b014f7349404d0009')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808c4f73339b014f7349a3fa000f', N'2', N'温度', null, N'4028808c4f73339b014f7349404d0009')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808c4f73339b014f7349baa10011', N'3', N'湿度', null, N'4028808c4f73339b014f7349404d0009')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808d4f6e4e12014f6e523c330003', N'0', N'待执法', null, N'4028808d4f6e4e12014f6e51b8a90001')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808d4f6e4e12014f6e525f900005', N'1', N'待整改', null, N'4028808d4f6e4e12014f6e51b8a90001')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'4028808d4f6e4e12014f6e5282bf0007', N'2', N'已整改', null, N'4028808d4f6e4e12014f6e51b8a90001')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a2bfa3a4f1b8b2e014f1c3baef20006', N'zhengfu00', N'工地人员', null, N'ff8080814f107bae014f108896d80003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a2bfa3a4fcedf7d014fd0781e4401ab', N'gongzhong07', N'工作人员', null, N'4028808b4f0263cf014f026edc05000d')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a2bfa3a4fda29b9014fda4c7bd40071', N'units07', N'万块', null, N'ff8080814f0dcc1f014f0dd04d6b0001')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a2bfa3a4fda29b9014fda54593f0089', N'units08', N'根', null, N'ff8080814f0dcc1f014f0dd04d6b0001')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a2bfa3a4ff2479b014ff3a2bbfc00f5', N'zhengfu15', N'市城乡建设委员会', null, N'ff8080814f107bae014f108896d80003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a2bfa3a512dea79015133a9e6d00142', N'dianxin', N'市电信', null, N'ff8080814f107bae014f108896d80003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a2bfa3a512dea79015133aa6f990144', N'dianxin01', N'区电信', null, N'ff8080814f107bae014f108896d80003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a2bfa3a516bdebc0151803fc8df0356', N'zhicheng11', N'无', null, N'4028808b4f0263cf014f027157fc001b')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a2bfa3a516bdebc0151845c67f9049f', N'jjkf01', N'经济开发区', null, N'8a2bfa3a516bdebc0151845b80e4049c')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854e8b70033', N'2', N'菜单图标', null, N'8a53b7844ef8542c014ef854e4330029')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854e8f50034', N'1', N'系统图标', null, N'8a53b7844ef8542c014ef854e4330029')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854e9340035', N'files', N'附件', null, N'8a53b7844ef8542c014ef854e6070031')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854e9720036', N'1', N'优质订单', null, N'8a53b7844ef8542c014ef854e471002a')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854e9a10037', N'2', N'普通订单', null, N'8a53b7844ef8542c014ef854e471002a')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854e9e00038', N'1', N'签约客户', null, N'8a53b7844ef8542c014ef854e4b0002b')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854ea1e0039', N'2', N'普通客户', null, N'8a53b7844ef8542c014ef854e4b0002b')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854ea5d003a', N'1', N'特殊服务', null, N'8a53b7844ef8542c014ef854e4de002c')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854ea8c003b', N'2', N'普通服务', null, N'8a53b7844ef8542c014ef854e4de002c')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854eaca003c', N'single', N'单条件查询', null, N'8a53b7844ef8542c014ef854e51d002d')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854eb09003d', N'group', N'范围查询', null, N'8a53b7844ef8542c014ef854e51d002d')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854eb37003e', N'Y', N'是', null, N'8a53b7844ef8542c014ef854e55b002e')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854eb76003f', N'N', N'否', null, N'8a53b7844ef8542c014ef854e55b002e')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854eba50040', N'Integer', N'Integer', null, N'8a53b7844ef8542c014ef854e58a002f')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854ebe30041', N'Date', N'Date', null, N'8a53b7844ef8542c014ef854e58a002f')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854ec220042', N'String', N'String', null, N'8a53b7844ef8542c014ef854e58a002f')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854ec510043', N'Long', N'Long', null, N'8a53b7844ef8542c014ef854e58a002f')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854ec8f0044', N'act', N'工作流引擎表', null, N'8a53b7844ef8542c014ef854e5c90030')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854ecbe0045', N't_s', N'系统基础表', null, N'8a53b7844ef8542c014ef854e5c90030')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854ecfd0046', N't_b', N'业务表', null, N'8a53b7844ef8542c014ef854e5c90030')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854ed3b0047', N't_p', N'自定义引擎表', null, N'8a53b7844ef8542c014ef854e5c90030')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854ed6a0048', N'news', N'新闻', null, N'8a53b7844ef8542c014ef854e6070031')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854eda80049', N'0', N'男', null, N'8a53b7844ef8542c014ef854e6460032')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'8a53b7844ef8542c014ef854ede7004a', N'1', N'女', null, N'8a53b7844ef8542c014ef854e6460032')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0cb3fe014f0cb74fa20005', N'bloodtype0', N'A', null, N'ff8080814f0cb3fe014f0cb6d0050003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0cb3fe014f0cb76bb10007', N'bloodtype1', N'B', null, N'ff8080814f0cb3fe014f0cb6d0050003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0cb3fe014f0cb78aac0009', N'bloodtype2', N'AB', null, N'ff8080814f0cb3fe014f0cb6d0050003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0cb3fe014f0cb7b269000b', N'bloodtype3', N'O', null, N'ff8080814f0cb3fe014f0cb6d0050003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0cb3fe014f0cb81ab8000d', N'bloodtype4', N'其他', null, N'ff8080814f0cb3fe014f0cb6d0050003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0cb3fe014f0cb8e1f30011', N'wenhualv0', N'小学', null, N'ff8080814f0cb3fe014f0cb8b7ef000f')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0cb3fe014f0cb904d70013', N'wenhualv1', N'初中', null, N'ff8080814f0cb3fe014f0cb8b7ef000f')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0cb3fe014f0cb920870015', N'wenhualv2', N'高中', null, N'ff8080814f0cb3fe014f0cb8b7ef000f')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0cb3fe014f0cb986f50017', N'wenhualv3', N'大专', null, N'ff8080814f0cb3fe014f0cb8b7ef000f')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0cb3fe014f0cb9a7b10019', N'wenhualv4', N'本科', null, N'ff8080814f0cb3fe014f0cb8b7ef000f')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0cb3fe014f0cb9efa6001b', N'wenhualv5', N'硕士', null, N'ff8080814f0cb3fe014f0cb8b7ef000f')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0cb3fe014f0cba1ce5001d', N'wenhualv6', N'博士', null, N'ff8080814f0cb3fe014f0cb8b7ef000f')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0cb3fe014f0cbad9e60021', N'healthlv0', N'一般', null, N'ff8080814f0cb3fe014f0cba9877001f')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0cb3fe014f0cbaf7950023', N'healthlv1', N'健康', null, N'ff8080814f0cb3fe014f0cba9877001f')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0cb3fe014f0cbb1e250025', N'healthlv2', N'优', null, N'ff8080814f0cb3fe014f0cba9877001f')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0cb3fe014f0cbc7c600029', N'marry01', N'未婚', null, N'ff8080814f0cb3fe014f0cbc4def0027')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0cb3fe014f0cbca96e002b', N'marry02', N'已婚', null, N'ff8080814f0cb3fe014f0cbc4def0027')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0cb3fe014f0cbcf724002d', N'marry03', N'离异', null, N'ff8080814f0cb3fe014f0cbc4def0027')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0cb3fe014f0cbd228f002f', N'marry04', N'丧偶', null, N'ff8080814f0cb3fe014f0cbc4def0027')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0d71b3014f0d738c670003', N'bxzk01', N'无保险', null, N'ff8080814f0d71b3014f0d7367570001')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0d71b3014f0d73dd0a0005', N'bxzk02', N'安全险', null, N'ff8080814f0d71b3014f0d7367570001')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0d71b3014f0d741b1d0007', N'bxzk03', N'高空险', null, N'ff8080814f0d71b3014f0d7367570001')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0dcc1f014f0dd076fb0003', N'units01', N'公斤', null, N'ff8080814f0dcc1f014f0dd04d6b0001')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0dcc1f014f0dd095800005', N'units02', N'吨', null, N'ff8080814f0dcc1f014f0dd04d6b0001')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0dcc1f014f0dd0c0110007', N'units03', N'米', null, N'ff8080814f0dcc1f014f0dd04d6b0001')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0dcc1f014f0dd0eae90009', N'units04', N'平方米', null, N'ff8080814f0dcc1f014f0dd04d6b0001')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0dcc1f014f0dd21cf1000c', N'units05', N'立方米', null, N'ff8080814f0dcc1f014f0dd04d6b0001')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f0dcc1f014f0dd2bf68000e', N'units06', N'公里', null, N'ff8080814f0dcc1f014f0dd04d6b0001')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f105862014f105c6f840003', N'todostate1', N'待审', null, N'ff8080814f105862014f105c0fc60001')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f105862014f105ca2f70005', N'todostate2', N'已审', null, N'ff8080814f105862014f105c0fc60001')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f107bae014f109716a40005', N'zhengfu01', N'市建筑市场管理站', null, N'ff8080814f107bae014f108896d80003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f107bae014f10974d2a0007', N'zhengfu02', N'市质量监督管理站', null, N'ff8080814f107bae014f108896d80003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f107bae014f109782710009', N'zhengfu03', N'市安全监督管理站', null, N'ff8080814f107bae014f108896d80003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f107bae014f1097b88e000b', N'zhengfu04', N'市质量技术监督局', null, N'ff8080814f107bae014f108896d80003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f107bae014f1097ef62000d', N'zhengfu05', N'市安全生产监督管理局', null, N'ff8080814f107bae014f108896d80003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f107bae014f10981614000f', N'zhengfu06', N'市环保局', null, N'ff8080814f107bae014f108896d80003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f107bae014f10984a9d0011', N'zhengfu07', N'市城市管理委员会', null, N'ff8080814f107bae014f108896d80003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f107bae014f1098f3c30013', N'zhengfu08', N'市国土资源和规划局', null, N'ff8080814f107bae014f108896d80003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f107bae014f10991e200015', N'zhengfu09', N'区县建管站', null, N'ff8080814f107bae014f108896d80003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f107bae014f1099480c0017', N'zhengfu10', N'区县质监局', null, N'ff8080814f107bae014f108896d80003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f107bae014f109975b50019', N'zhengfu11', N'区县安监局', null, N'ff8080814f107bae014f108896d80003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f107bae014f1099acbd001b', N'zhengfu12', N'区县城管局', null, N'ff8080814f107bae014f108896d80003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f107bae014f1099dc64001d', N'zhengfu13', N'区县环保局', null, N'ff8080814f107bae014f108896d80003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f107bae014f109a4f2e0020', N'zhengfu14', N'区县规划局', null, N'ff8080814f107bae014f108896d80003')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f182376014f1837f6170003', N'punish01', N'罚款', null, N'ff8080814f182376014f1837b4a40001')
GO
GO
INSERT INTO [dbo].[t_s_type] ([ID], [typecode], [typename], [typepid], [typegroupid]) VALUES (N'ff8080814f182376014f18381b180005', N'punish02', N'整改', null, N'ff8080814f182376014f1837b4a40001')
GO
GO

-- ----------------------------
-- Table structure for t_s_user
-- ----------------------------
DROP TABLE [dbo].[t_s_user]
GO
CREATE TABLE [dbo].[t_s_user] (
[id] int NOT NULL IDENTITY(1,1) ,
[realname] varchar(50) NULL ,
[username] varchar(10) NOT NULL ,
[password] varchar(100) NOT NULL ,
[belong_Area] varchar(256) NULL ,
[belong_City] varchar(32) NULL ,
[belong_Province] varchar(32) NULL ,
[email] varchar(50) NULL ,
[mobile] varchar(30) NULL ,
[zhengfuid] varchar(50) NULL ,
[salt] varchar(100) NOT NULL ,
[role_ids] varchar(100) NULL ,
[addTime] datetime NULL ,
[locked] varchar(10) NOT NULL DEFAULT ((0)) ,
[lastLoginTime] datetime NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[t_s_user]', RESEED, 2)
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N't_s_user', 
'COLUMN', N'locked')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'0可用 1锁定'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N't_s_user'
, @level2type = 'COLUMN', @level2name = N'locked'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'0可用 1锁定'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N't_s_user'
, @level2type = 'COLUMN', @level2name = N'locked'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N't_s_user', 
'COLUMN', N'lastLoginTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'最后一次登录时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N't_s_user'
, @level2type = 'COLUMN', @level2name = N'lastLoginTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'最后一次登录时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N't_s_user'
, @level2type = 'COLUMN', @level2name = N'lastLoginTime'
GO

-- ----------------------------
-- Records of t_s_user
-- ----------------------------
SET IDENTITY_INSERT [dbo].[t_s_user] ON
GO
INSERT INTO [dbo].[t_s_user] ([id], [realname], [username], [password], [belong_Area], [belong_City], [belong_Province], [email], [mobile], [zhengfuid], [salt], [role_ids], [addTime], [locked], [lastLoginTime]) VALUES (N'2', N'admin', N'admin', N'e66d29305e6040d32a892fa2ed44297b', null, null, null, null, null, null, N'ee23747f172c5c001ecdfe22373108e0', null, N'2016-08-30 21:03:52.000', N'0', null)
GO
GO
SET IDENTITY_INSERT [dbo].[t_s_user] OFF
GO

-- ----------------------------
-- Indexes structure for table t_s_authority
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_s_authority
-- ----------------------------
ALTER TABLE [dbo].[t_s_authority] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table t_s_role
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_s_role
-- ----------------------------
ALTER TABLE [dbo].[t_s_role] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Uniques structure for table t_s_role
-- ----------------------------
ALTER TABLE [dbo].[t_s_role] ADD UNIQUE ([id] DESC)
GO

-- ----------------------------
-- Indexes structure for table t_s_type
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_s_type
-- ----------------------------
ALTER TABLE [dbo].[t_s_type] ADD PRIMARY KEY ([ID])
GO

-- ----------------------------
-- Indexes structure for table t_s_user
-- ----------------------------
CREATE UNIQUE INDEX [user_id] ON [dbo].[t_s_user]
([id] DESC) 
WITH (IGNORE_DUP_KEY = ON)
GO

-- ----------------------------
-- Primary Key structure for table t_s_user
-- ----------------------------
ALTER TABLE [dbo].[t_s_user] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[t_s_user]
-- ----------------------------
ALTER TABLE [dbo].[t_s_user] ADD FOREIGN KEY ([id]) REFERENCES [dbo].[t_s_user] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
