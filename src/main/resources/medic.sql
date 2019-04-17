/*
SQLyog Enterprise - MySQL GUI v8.14 
MySQL - 5.5.53 : Database - medic
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`medic` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `medic`;

/*Table structure for table `t_account` */

DROP TABLE IF EXISTS `t_account`;

CREATE TABLE `t_account` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `m_time` date DEFAULT NULL,
  `m_type` varchar(255) DEFAULT NULL COMMENT '充值/消费/提现',
  `m_amoney` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`m_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `t_account` */

insert  into `t_account`(`m_id`,`u_id`,`m_time`,`m_type`,`m_amoney`) values (1,1,'2018-03-05','消费','-100');
insert  into `t_account`(`m_id`,`u_id`,`m_time`,`m_type`,`m_amoney`) values (2,1,'2018-03-06','提现','-100');
insert  into `t_account`(`m_id`,`u_id`,`m_time`,`m_type`,`m_amoney`) values (3,1,'2018-03-07','充值','+100');

/*Table structure for table `t_address` */

DROP TABLE IF EXISTS `t_address`;

CREATE TABLE `t_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receive_person` varchar(10) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `is_default` int(2) DEFAULT NULL,
  `u_id` int(10) DEFAULT NULL,
  `is_delete` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

/*Data for the table `t_address` */

insert  into `t_address`(`id`,`receive_person`,`telephone`,`address`,`is_default`,`u_id`,`is_delete`) values (1,'张汝洪','15328393101','陕西省西安市雁塔区丈八沟街道丈八西路辅路罗马景福城',1,19,0);
insert  into `t_address`(`id`,`receive_person`,`telephone`,`address`,`is_default`,`u_id`,`is_delete`) values (2,'倪卟懂','15228627334','陕西省西安市雁塔区丈八沟街道零壹广场A座西安软件园(科技二路)',0,19,0);
insert  into `t_address`(`id`,`receive_person`,`telephone`,`address`,`is_default`,`u_id`,`is_delete`) values (48,'倪卟懂','15328393101','陕西省西安市雁塔区电子城街道雁环中路联盟新城',0,20,0);
insert  into `t_address`(`id`,`receive_person`,`telephone`,`address`,`is_default`,`u_id`,`is_delete`) values (45,'张汝洪','15328393101','陕西省西安市雁塔区丈八沟街道丈八西路罗马景福城',1,20,0);
insert  into `t_address`(`id`,`receive_person`,`telephone`,`address`,`is_default`,`u_id`,`is_delete`) values (50,'张汝洪','15328393101','陕西省西安市雁塔区丈八沟街道零壹广场A座西安软件园(科技二路)',0,26,0);
insert  into `t_address`(`id`,`receive_person`,`telephone`,`address`,`is_default`,`u_id`,`is_delete`) values (51,'倪卟懂','15228627334','陕西省西安市雁塔区丈八沟街道零壹广场A座西安软件园(科技二路)',1,26,0);
insert  into `t_address`(`id`,`receive_person`,`telephone`,`address`,`is_default`,`u_id`,`is_delete`) values (52,'张汝洪','15328393101','陕西省西安市雁塔区丈八沟街道西北工业大学研发中心西安软件园(科技二路)',1,27,0);
insert  into `t_address`(`id`,`receive_person`,`telephone`,`address`,`is_default`,`u_id`,`is_delete`) values (53,'张汝洪','15226853652','陕西省西安市雁塔区电子城街道子午大道9号江林新城C区',1,28,0);

/*Table structure for table `t_admin` */

DROP TABLE IF EXISTS `t_admin`;

CREATE TABLE `t_admin` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_username` varchar(255) DEFAULT NULL,
  `ad_password` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ad_id`) USING BTREE,
  KEY `roleIdpre` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `t_admin` */

insert  into `t_admin`(`ad_id`,`ad_username`,`ad_password`,`role_id`) values (2,'admin','e10adc3949ba59abbe56e057f20f883e',1);
insert  into `t_admin`(`ad_id`,`ad_username`,`ad_password`,`role_id`) values (13,'nibudon','e10adc3949ba59abbe56e057f20f883e',2);

/*Table structure for table `t_admin_menu` */

DROP TABLE IF EXISTS `t_admin_menu`;

CREATE TABLE `t_admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `t_admin_menu` */

insert  into `t_admin_menu`(`id`,`menu_name`) values (1,'个人信息');
insert  into `t_admin_menu`(`id`,`menu_name`) values (2,'人员管理');
insert  into `t_admin_menu`(`id`,`menu_name`) values (3,'图片管理');
insert  into `t_admin_menu`(`id`,`menu_name`) values (4,'订单管理');
insert  into `t_admin_menu`(`id`,`menu_name`) values (5,'图表统计');
insert  into `t_admin_menu`(`id`,`menu_name`) values (6,'药材管理');
insert  into `t_admin_menu`(`id`,`menu_name`) values (7,'类别管理');

/*Table structure for table `t_admin_menu_child` */

DROP TABLE IF EXISTS `t_admin_menu_child`;

CREATE TABLE `t_admin_menu_child` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `child_menu_name` varchar(255) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `child_menu_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `t_admin_menu_child` */

insert  into `t_admin_menu_child`(`id`,`child_menu_name`,`parentid`,`child_menu_url`) values (1,'用户管理',2,'/admin/user/mainToUserinfo');
insert  into `t_admin_menu_child`(`id`,`child_menu_name`,`parentid`,`child_menu_url`) values (2,'员工管理',2,'/admin/user/mainToAdmin');
insert  into `t_admin_menu_child`(`id`,`child_menu_name`,`parentid`,`child_menu_url`) values (3,'订单管理',4,'/admin/order/mainToAdminOrder');
insert  into `t_admin_menu_child`(`id`,`child_menu_name`,`parentid`,`child_menu_url`) values (4,'上传图片',3,'/admin/img/mainToAdminImg');
insert  into `t_admin_menu_child`(`id`,`child_menu_name`,`parentid`,`child_menu_url`) values (5,'药材管理',6,'/admin/snackinfo/mainToAdminSnackinfo');
insert  into `t_admin_menu_child`(`id`,`child_menu_name`,`parentid`,`child_menu_url`) values (6,'饼图统计',5,'/admin/map/mainToPieMap');
insert  into `t_admin_menu_child`(`id`,`child_menu_name`,`parentid`,`child_menu_url`) values (7,'个人信息',1,'/user/mainToAdminuser');
insert  into `t_admin_menu_child`(`id`,`child_menu_name`,`parentid`,`child_menu_url`) values (8,'类别管理',7,'/medicineType/typeManager.html');
insert  into `t_admin_menu_child`(`id`,`child_menu_name`,`parentid`,`child_menu_url`) values (9,'修改密码',1,'/user/toAlterPass.html');

/*Table structure for table `t_comment` */

DROP TABLE IF EXISTS `t_comment`;

CREATE TABLE `t_comment` (
  `e_id` double DEFAULT NULL,
  `e_parentId` double DEFAULT NULL,
  `s_id` double DEFAULT NULL,
  `u_id` double DEFAULT NULL,
  `e_pictureName` varchar(765) DEFAULT NULL,
  `e_type` double DEFAULT NULL,
  `e_score` double DEFAULT NULL,
  `info` varchar(765) DEFAULT NULL,
  `e_date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `t_comment` */

/*Table structure for table `t_integral` */

DROP TABLE IF EXISTS `t_integral`;

CREATE TABLE `t_integral` (
  `i_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL COMMENT '用户id',
  `i_number` int(11) DEFAULT NULL COMMENT '获得积分',
  `i_time` date DEFAULT NULL COMMENT '操作时间',
  `i_dese` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`i_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `t_integral` */

insert  into `t_integral`(`i_id`,`u_id`,`i_number`,`i_time`,`i_dese`) values (1,1,6,'2018-03-01','每天登录送积分');
insert  into `t_integral`(`i_id`,`u_id`,`i_number`,`i_time`,`i_dese`) values (2,1,5,'2018-02-28','每天登录送积分');
insert  into `t_integral`(`i_id`,`u_id`,`i_number`,`i_time`,`i_dese`) values (3,1,4,'2018-02-27','每天登录送积分');
insert  into `t_integral`(`i_id`,`u_id`,`i_number`,`i_time`,`i_dese`) values (4,1,3,'2018-03-02','每天登录送积分');
insert  into `t_integral`(`i_id`,`u_id`,`i_number`,`i_time`,`i_dese`) values (5,1,2,'2018-03-03','每天登录送积分');
insert  into `t_integral`(`i_id`,`u_id`,`i_number`,`i_time`,`i_dese`) values (6,1,1,'2018-03-04','每天登录送积分');
insert  into `t_integral`(`i_id`,`u_id`,`i_number`,`i_time`,`i_dese`) values (7,1,7,'2018-03-25','每天登录送积分');
insert  into `t_integral`(`i_id`,`u_id`,`i_number`,`i_time`,`i_dese`) values (8,1,8,'2018-03-24','每天登录送积分');
insert  into `t_integral`(`i_id`,`u_id`,`i_number`,`i_time`,`i_dese`) values (9,1,9,'2018-03-23','每天登录送积分');
insert  into `t_integral`(`i_id`,`u_id`,`i_number`,`i_time`,`i_dese`) values (10,1,10,'2018-03-22','每天登录送积分');
insert  into `t_integral`(`i_id`,`u_id`,`i_number`,`i_time`,`i_dese`) values (11,1,11,'2018-03-21','每天登录送积分');

/*Table structure for table `t_medicine_type` */

DROP TABLE IF EXISTS `t_medicine_type`;

CREATE TABLE `t_medicine_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) DEFAULT NULL,
  `is_delete` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `t_medicine_type` */

insert  into `t_medicine_type`(`id`,`type_name`,`is_delete`) values (1,'清热药',0);
insert  into `t_medicine_type`(`id`,`type_name`,`is_delete`) values (2,'止血药',0);
insert  into `t_medicine_type`(`id`,`type_name`,`is_delete`) values (3,'解表药',0);
insert  into `t_medicine_type`(`id`,`type_name`,`is_delete`) values (4,'祛风湿药',0);
insert  into `t_medicine_type`(`id`,`type_name`,`is_delete`) values (5,'泻下药',0);
insert  into `t_medicine_type`(`id`,`type_name`,`is_delete`) values (6,'安神药',0);
insert  into `t_medicine_type`(`id`,`type_name`,`is_delete`) values (7,'其它',0);

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `u_id` int(11) DEFAULT NULL,
  `e_id` int(11) DEFAULT NULL COMMENT '操作员ID',
  `o_time` date DEFAULT NULL,
  `o_type` int(11) DEFAULT NULL COMMENT '-1:未发货；1:完成，0：已发货',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `t_order` */

insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (127,'201811126926',19,1,'2018-11-12',1);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (129,'201811159013',19,2,'2018-11-15',1);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (130,'201811203487',19,NULL,'2018-11-20',-2);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (131,'201811206371',19,NULL,'2018-11-20',-2);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (133,'201811203245',19,NULL,'2018-11-20',-2);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (135,'201811201237',19,NULL,'2018-11-20',-2);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (136,'201811201616',19,NULL,'2018-11-20',-2);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (137,'201811218729',23,NULL,'2018-11-21',-1);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (138,'201811211110',19,NULL,'2018-11-21',-2);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (139,'201811271279',19,2,'2018-11-27',1);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (140,'201811308716',24,NULL,'2018-11-30',-2);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (141,'201812093976',19,NULL,'2018-12-09',-2);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (142,'201812125917',19,NULL,'2018-12-12',-2);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (143,'201812139719',23,NULL,'2018-12-13',-2);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (144,'201812138688',19,NULL,'2018-12-13',-2);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (145,'201812165327',19,13,'2018-12-16',1);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (146,'201812244248',19,2,'2018-12-24',1);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (147,'201901027981',19,2,'2019-01-02',1);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (148,'201901024684',27,2,'2019-01-02',0);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (149,'201902175574',19,NULL,'2019-02-17',-1);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (150,'201902176198',28,NULL,'2019-02-17',-1);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (151,'201904177478',19,2,'2019-04-17',1);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (152,'201904175568',19,2,'2019-04-17',1);
insert  into `t_order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (153,'201904175491',19,2,'2019-04-17',1);

/*Table structure for table `t_orderdetail` */

DROP TABLE IF EXISTS `t_orderdetail`;

CREATE TABLE `t_orderdetail` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` varchar(255) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  `o_num` int(11) DEFAULT NULL,
  `o_money` double DEFAULT NULL,
  PRIMARY KEY (`d_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `t_orderdetail` */

insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (94,'201803272559',20,2,10);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (154,'201811024234',26,1,16);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (155,'201811024234',25,1,1);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (156,'201811045281',82,2,10);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (157,'201811126926',26,3,16);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (159,'201811159013',81,3,2.1);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (160,'201811203487',33,3,16);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (161,'201811206371',33,5,16);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (164,'201811203245',82,3,2.3000000000000003);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (167,'201811203245',45,2,27);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (168,'201811201237',82,1,2.3000000000000003);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (169,'201811201237',25,1,4);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (170,'201811201616',26,1,16);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (171,'201811218729',26,1,16);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (172,'201811211110',84,2,18.400000000000002);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (173,'201811211110',27,2,24);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (174,'201811271279',69,2,72);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (175,'201811308716',79,2,16);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (176,'201811308716',33,1,24);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (177,'201811308716',85,4,8.4);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (178,'201812093976',82,3,2.3000000000000003);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (179,'201812125917',40,1,30);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (180,'201812139719',84,1,18.400000000000002);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (181,'201812138688',26,1,16);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (182,'201812165327',31,1,16);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (183,'201812244248',40,1,30);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (184,'201812244248',28,1,30);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (185,'201812244248',59,1,56);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (186,'201901027981',28,1,30);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (187,'201901027981',40,1,30);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (188,'201901024684',81,1,2.1);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (189,'201902175574',46,3,16);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (190,'201902176198',33,1,24);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (191,'201904177478',28,3,30);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (192,'201904175568',81,1,2.1);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (193,'201904175491',29,2,8);
insert  into `t_orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (194,'201904175491',27,1,24);

/*Table structure for table `t_permission` */

DROP TABLE IF EXISTS `t_permission`;

CREATE TABLE `t_permission` (
  `perid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `isparent` int(11) DEFAULT NULL,
  `ismenu` int(11) DEFAULT NULL,
  PRIMARY KEY (`perid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `t_permission` */

insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (1,'员工管理',0,'/snack/admin/user/mainToAdmin',1,1);
insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (2,'员工添加',1,'/snack/admin/user/addNewAdmin',0,1);
insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (3,'员工删除',1,'/snack/admin/user/delAdminById',0,1);
insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (4,'员工修改',1,'/snack/admin/user/updateGoAdminById',0,1);
insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (6,'用户管理',0,'/snack/admin/user/mainToUserinfo',1,1);
insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (9,'用户删除',6,'/snack/admin/user/delUserinfoById',0,1);
insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (10,'用户修改',6,'/snack/admin/user/updateGoUserinfoById',0,1);
insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (13,'订单管理',0,'/snack/admin/order/mainToAdminOrder',1,1);
insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (14,'订单修改',13,'/snack/admin/order/updateSelectAdminOrder',0,1);
insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (15,'订单删除',13,'/snack/admin/order/deleteAdminOrder',0,1);
insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (16,'详情修改',13,'/snack/admin/order/updateSelectAdminOrderDetial',0,1);
insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (17,'详情删除',13,'/snack/admin/order/deleteOrderdetail',0,1);
insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (19,'图片管理',0,'/snack/admin/img/mainToAdminImg',1,1);
insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (20,'上传图片',19,'/snack/admin/img/upload',0,1);
insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (21,'商品管理',0,'/snack/admin/snackinfo/mainToAdminSnackinfo',0,1);
insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (22,'商品上架',21,'/snack/admin/snackinfo/addAdminSnack',0,1);
insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (23,'商品删除',21,'/snack/admin/snackinfo/delAdminUserinfo',0,1);
insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (24,'商品修改',21,'/snack/admin/snackinfo/selectAdminUserinfoBysId',0,1);
insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (25,'个人信息',0,'/admin/user/mainToAdminuser',1,1);
insert  into `t_permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (26,'确认发货',13,'/snack/admin/order/userOrderConfirm',0,1);

/*Table structure for table `t_receiptinfo` */

DROP TABLE IF EXISTS `t_receiptinfo`;

CREATE TABLE `t_receiptinfo` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` varchar(255) DEFAULT NULL,
  `o_name` varchar(255) DEFAULT NULL,
  `o_phone` varchar(255) DEFAULT NULL,
  `o_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `t_receiptinfo` */

insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (90,'201803272559','哈哈','110110110110','浙江大学');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (131,'201811024234','学猫叫','15868526202','浙江杭州');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (132,'201811045281','zuidaima','13520109202','zuidaima.com');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (133,'201811126926','张汝洪','15328393101','陕西省西安市雁塔区丈八沟街道丈八西路');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (135,'201811159013','倪卟懂','15228627334','四川省');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (136,'201811203487','张汝洪','15328393101','陕西省西安市莲湖区青年路');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (137,'201811206371','张汝洪','15328393101','陕西省西安市莲湖区青年路');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (139,'201811203245','张汝洪','15328393101','陕西省西安市莲湖区青年路');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (141,'201811201237','张汝洪','15328393101','陕西省西安市莲湖区青年路');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (142,'201811201616','张汝洪','15328393101','陕西省西安市雁塔区丈八西路辅路');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (143,'201811218729','张汝洪','15328393101','陕西西安');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (144,'201811211110','张汝洪','15328393101','陕西省西安市莲湖区青年路');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (145,'201811271279','张汝洪','15328393101','陕西省西安市雁塔区丈八西路');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (146,'201811308716','lisuduo','13919991435','xbmu');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (147,'201812093976','张汝洪','15328393101','陕西');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (148,'201812125917','张汝洪','15328393101','陕西省西安市雁塔区丈八沟街道零壹广场A座西安软件园(科技二路)');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (149,'201812139719','郑裕琳','18215522446','成都市');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (150,'201812138688','张汝洪','15228627334','陕西省西安市雁塔区丈八沟街道中联西北工程设计研究院科技办公楼');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (151,'201812165327','倪卟懂','15228627334','陕西省西安市雁塔区丈八沟街道旺座现代城D座旺座现代城');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (152,'201812244248','倪卟懂','15228627334','陕西省西安市雁塔区丈八沟街道零壹广场A座西安软件园(科技二路)');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (153,'201901027981','张汝洪','15328393101','陕西省西安市雁塔区丈八沟街道丈八西路辅路罗马景福城');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (154,'201901024684','张汝洪','15328393101','陕西省西安市雁塔区丈八沟街道西北工业大学研发中心西安软件园(科技二路)');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (155,'201902175574','倪卟懂','15228627334','陕西省西安市雁塔区丈八沟街道零壹广场A座西安软件园(科技二路)');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (156,'201902176198','张汝洪','15226853652','陕西省西安市雁塔区电子城街道子午大道9号江林新城C区');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (157,'201904177478','倪卟懂','15228627334','陕西省西安市雁塔区丈八沟街道零壹广场A座西安软件园(科技二路)');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (158,'201904175568','倪卟懂','15228627334','陕西省西安市雁塔区丈八沟街道零壹广场A座西安软件园(科技二路)');
insert  into `t_receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (159,'201904175491','倪卟懂','15228627334','陕西省西安市雁塔区丈八沟街道零壹广场A座西安软件园(科技二路)');

/*Table structure for table `t_record` */

DROP TABLE IF EXISTS `t_record`;

CREATE TABLE `t_record` (
  `record_id` double DEFAULT NULL,
  `s_id` double DEFAULT NULL,
  `recordDate` date DEFAULT NULL,
  `recordNumber` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `t_record` */

insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (13,20,'2019-02-16',2);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (14,23,'2019-03-27',4);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (15,20,'2019-03-27',6);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (16,20,'2019-03-27',2);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (17,23,'2019-03-27',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (18,21,'2019-03-27',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (19,20,'2019-03-27',2);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (20,21,'2019-03-27',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (21,24,'2019-03-27',3);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (22,23,'2019-03-28',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (23,21,'2019-03-28',10);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (24,21,'2019-03-28',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (25,20,'2019-03-28',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (26,24,'2019-03-28',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (27,24,'2019-03-28',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (28,23,'2019-03-31',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (29,23,'2019-04-01',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (30,20,'2019-04-01',6);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (31,24,'2019-04-01',3);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (32,20,'2019-04-01',6);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (33,23,'2019-04-01',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (34,62,'2019-04-01',4);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (35,27,'2019-04-01',5);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (36,45,'2019-04-01',3);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (37,51,'2019-04-17',4);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (38,34,'2019-04-17',4);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (39,26,'2019-04-01',8);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (40,30,'2019-04-01',10);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (41,51,'2019-04-30',3);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (42,33,'2019-04-30',4);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (43,26,'2019-04-30',3);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (44,56,'2018-04-30',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (45,26,'2018-10-25',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (46,26,'2018-10-25',5);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (47,26,'2018-10-25',22);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (48,34,'2018-10-25',6);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (49,26,'2018-11-04',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (50,25,'2018-11-04',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (51,26,'2018-11-12',3);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (52,81,'2018-11-15',3);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (53,31,'2018-11-19',3);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (54,32,'2018-11-19',5);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (55,35,'2018-11-19',6);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (NULL,69,'2018-11-27',2);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (NULL,28,'2019-01-02',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (NULL,40,'2019-01-02',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (NULL,40,'2019-01-02',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (NULL,28,'2019-01-02',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (NULL,59,'2019-01-02',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (NULL,81,'2019-01-02',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (NULL,31,'2019-01-02',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (NULL,28,'2019-04-17',3);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (NULL,81,'2019-04-17',1);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (NULL,29,'2019-04-17',2);
insert  into `t_record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (NULL,27,'2019-04-17',1);

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `t_role` */

insert  into `t_role`(`role_id`,`role_name`,`role_info`) values (1,'超级管理员','系统最高权限者');
insert  into `t_role`(`role_id`,`role_name`,`role_info`) values (2,'普通管理员','管理发货');

/*Table structure for table `t_rolepermission` */

DROP TABLE IF EXISTS `t_rolepermission`;

CREATE TABLE `t_rolepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `perid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `t_rolepermission` */

insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (1,1,1);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (2,1,2);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (3,1,3);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (4,1,4);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (5,1,6);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (6,1,9);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (7,1,10);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (8,1,13);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (9,1,14);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (10,1,15);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (11,1,16);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (12,1,17);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (13,1,19);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (14,1,20);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (15,1,21);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (16,1,22);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (17,1,23);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (18,1,24);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (19,2,1);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (20,2,6);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (21,2,13);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (22,2,14);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (23,2,15);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (24,2,16);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (25,2,17);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (26,2,19);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (27,2,21);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (28,2,25);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (29,1,25);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (30,3,1);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (31,3,6);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (32,3,13);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (33,3,19);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (34,3,21);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (35,3,25);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (36,1,26);
insert  into `t_rolepermission`(`id`,`role_id`,`perid`) values (37,2,26);

/*Table structure for table `t_snackinfo` */

DROP TABLE IF EXISTS `t_snackinfo`;

CREATE TABLE `t_snackinfo` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_batch` varchar(255) DEFAULT NULL COMMENT '批次好=生产日期+2位随机数',
  `s_name` varchar(255) DEFAULT NULL,
  `s_price` double DEFAULT NULL,
  `s_discount` varchar(255) DEFAULT NULL COMMENT '折扣',
  `s_pictureUrl` varchar(255) DEFAULT NULL,
  `s_brand` varchar(255) DEFAULT NULL COMMENT '品牌',
  `s_place` varchar(255) DEFAULT NULL COMMENT '产地',
  `s_Imported` int(1) DEFAULT NULL COMMENT '是否进口',
  `s_score` int(11) DEFAULT NULL COMMENT '积分',
  `s_pDate` date DEFAULT NULL COMMENT '生产日期',
  `s_qDate` varchar(255) DEFAULT NULL COMMENT '保质期',
  `state` int(11) DEFAULT NULL COMMENT '1---上架，0---草稿，-1--下架',
  `s_createDate` date DEFAULT NULL COMMENT '上架时间',
  `s_dese` varchar(255) DEFAULT NULL COMMENT '详情',
  `s_type` varchar(255) DEFAULT NULL,
  `s_number` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `t_snackinfo` */

insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (20,'201803273550','胖大海',10,'10','pangdahai.jpg','百事','浙江',1,NULL,'2018-03-15','12',1,'2018-03-27','开肺解表，清热利咽，通便。风热失音，咳嗽、咽喉肿痛。','1',9980);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (21,'201803276547','红毛菍',40,'9','hongmaoren.jpg','恰恰','浙江',1,NULL,'2018-03-24','12',1,'2018-03-27','止血，止痢。用于便血，月经过多，腹泻;外用治创伤出血。','2',989999);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (23,'201803271694','牛蒡子',100,'8','niupangzi.jpg','小辣椒','浙江',1,NULL,'2018-03-14','12',1,'2018-03-27','散风热，宣肺，透疹解毒。感冒风热，咳嗽，咽喉肿痛，斑疹不透，痈肿疮毒。','3',9991);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (24,'201803272746','鱼腥草',25,'5','yuxingcao.jpg','大本营','浙江',0,NULL,'2018-03-14','12',1,'2018-03-27','清热解毒；排脓消痈；利尿通淋肺痈吐脓；痰热喘咳；喉哦；热痢；痈肿疮毒；热淋。','1',9992);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (25,'201804174136','薄荷',10,'4','bohe.jpg','咪咪','广东',0,NULL,'2018-04-15','12',1,'2018-04-17','风热表证；头痛目赤；咽喉肿痛；麻疹不透；陷疹瘙痒；肝郁胁痛。','3',99999);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (26,'201804172196','酸枣仁',20,'8','suanzaoren.jpg','乐事','上海',0,NULL,'2018-04-17','12',1,'2018-04-17','宁心安神，敛汗生津。虚烦不眠，惊悸健忘，虚汗烦渴。','6',9952);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (27,'201804171833','葛根',30,'8','gegen.jpg','宇润','安徽',0,NULL,'2018-04-17','12',1,'2018-04-17','发表退热，生津止渴。“疗肌解表甘葛先而柴胡次之”，见《药性赋》。表症发热无汗，头项强痛，热病口渴，消渴，斑疹不透，脾虚泄泻。','3',9994);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (28,'201804174852','远志',30,'10','yuanzhi.jpg','董小姐','海南',0,NULL,'2018-04-17','18',1,'2018-04-17','惊悸健忘，痈疽疮肿，咳嗽多痰，失眠多梦。','6',995);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (29,'201804171022','白芨',10,'8','baiji.jpg','旺旺','北京',1,NULL,'2018-04-17','12',1,'2018-04-17','咯血；吐血；衄血；便血；外伤出血；痈疮肿毒；烫灼伤；手足皲裂；肛裂。','2',199998);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (30,'201804172485','白芷',55,'8','baizhi.jpg','甘源','浙江',1,NULL,'2018-04-17','12',1,'2018-04-17','感冒头痛；眉棱骨痛；牙痛；鼻塞；鼻渊；湿胜久泻；妇女白带；痈疽疮疡；毒蛇咬伤。','3',9000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (31,'201804172109','路路通',20,'8','lulutong.jpg','旺旺','浙江',0,NULL,'2018-04-18','12',1,'2018-04-17','通经、利水、除湿热痹痛。月经不调、周身痹痛、小便不利。现多以煎水饮，治耳聋。','4',9999);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (32,'201804174170','大黄',30,'10','dahuang.jpg','妙妙','浙江',0,NULL,'2018-04-19','12',1,'2018-04-17','实热便秘；热结胸痞；湿热 泻痢；黄疸；淋病；水肿腹满；小便不利；目赤；咽喉肿痛；口舌生疮；胃热呕吐；吐血；咯血；衄血；便血；尿血；蓄血；经闭；产后瘀滞。','5',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (33,'201804173272','夜交藤',30,'8','yejiaoteng.jpg','旺旺','浙江',0,NULL,'2018-04-02','12',1,'2018-04-17','软坚、消痰、清热利水。瘿瘤瘰疠，疝气，睾丸肿痛，痰饮水肿。','6',119996);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (34,'201804175107','桑叶',20,'6','sangye.jpg','旺旺','浙江',0,NULL,'2018-04-05','12',1,'2018-04-17','疏风清热，凉血明目。风热感冒，咳嗽头痛，目赤。','3',102292);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (36,'201804174966','豆豉',20,'8','douchi.jpg','旺旺','浙江',0,NULL,'2018-04-19','12',1,'2018-04-17','解表、发汗、除烦。感冒发烧、头疼无汗、心烦胸闷。','3',2000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (37,'201804178458','桂枝',100,'6','guizhi1.jpg','旺旺','浙江',1,NULL,'2018-04-14','12',1,'2018-04-17','助阳解表，温通经脉，温化水湿。风寒感冒，风寒湿痹，经闭腹痛，痰饮蓄水，适用于感冒风寒之表虚自汗者。','3',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (38,'201804172586','麻黄',20,'4','mahuang1.jpg','旺旺','浙江',0,NULL,'2018-04-18','12',1,'2018-04-17','发汗散寒，宣肺平喘，利水消肿。用于风寒感冒，胸闷喘咳，风水浮肿；支气管哮喘。','3',20000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (39,'201804178495','番泻叶',20,'10','fanxieye.jpg','旺旺','浙江',0,NULL,'2018-04-19','12',1,'2018-04-17','热结便秘，习惯性便秘，积滞腹胀，水肿臌胀，胃、十二指肠溃疡出血。','5',20000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (40,'201804171216','合欢皮',50,'6','hehuanpi.jpg','旺旺','浙江',1,NULL,'2018-03-07','12',1,'2018-04-17','安神、解郁、活血，止痛，续筋骨。心神不安，忧郁失眠，肺痈，筋骨损伤，痔漏疼痛。','6',9998);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (41,'201804171172','白茅根',20,'8','baimaogen.jpg','旺旺','浙江',0,NULL,'2018-04-20','12',1,'2018-04-17','清热凉血，止血。利尿。热病烦渴，吐衄，尿血，水肿，黄疸，肺热咳喘等症。鲜用凉血益阴。炒炭去瘀止血。','2',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (43,'201804172550','茜草',20,'7','xicao.jpg','恰恰','浙江',0,NULL,'2018-04-21','12',1,'2018-04-17','凉血、止血、去瘀血、活血。吐、衄、便、崩、尿血，月经不调，经闭腹痛，跌打损伤，瘀血肿痛等症。','2',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (44,'201804179981','苍耳子',30,'6','cangerzi.jpg','旺旺','浙江',0,NULL,'2018-04-12','12',1,'2018-04-17','鼻渊；风寒头痛；风湿痹痛；风疹；湿疹；疥癣。','3',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (45,'201804177197','海螵蛸',30,'9','hailuoshao.jpg','旺旺','浙江',0,NULL,'2018-04-20','12',1,'2018-04-17','吐血；呕血；崩漏；便血；衄血；创伤出血；肾虚遗精滑精，赤白带下，胃痛嘈杂；嗳气泛酸；湿疹溃疡。','4',9997);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (46,'201804175915','巴豆',20,'8','badou.jpg','旺旺','浙江',1,NULL,'2018-04-14','12',1,'2018-04-17','峻下寒积，逐水消肿。胃肠寒积停滞，脘腹胀痛，痰多水肿等症。外用治恶疮疥癣。','5',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (47,'201804176852','柏子仁',30,'9','boziren.jpg','旺旺','浙江',1,NULL,'2018-04-13','12',1,'2018-04-17','惊悸失眠、健忘，体虚多汗，遗精，便秘等症。','6',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (48,'201804176635','仙鹤草',40,'8','xianhecao.jpg','旺旺','浙江',0,NULL,'2018-04-14','12',1,'2018-04-17','收敛止血，补虚。吐、咯、衄、便、尿血、崩漏等各种出血证，治脱力劳伤。','2',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (50,'201804177641','侧伯叶',45,'8','ceboye.jpg','旺旺','浙江',0,NULL,'2018-04-14','12',1,'2018-04-17','治咯血；吐血；衄血；尿血；血痢；肠风下血；崩漏不止；咳嗽痰多；风湿痹痛；丹毒；痄腮，烫伤。','2',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (51,'201804171818','细辛',30,'9','xixin.jpg','旺旺','浙江',0,NULL,'2018-04-13','12',1,'2018-04-17','风寒表证；头痛，牙痛；风湿痹痛；痰饮咳喘；鼻塞；鼻渊；口疮。','3',9993);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (52,'201804177621','海桐皮',50,'8','haitongpi.jpg','旺旺','浙江',1,NULL,'2018-03-20','12',1,'2018-04-17','祛风湿，通经络，杀虫。风湿痹病、痢疾、牙痛、疥癣。','4',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (53,'201804176052','火麻仁',40,'9','huomaren.jpg','旺旺','浙江',0,NULL,'2018-04-19','12',1,'2018-04-17','润燥滑肠。津桔便秘。老年体虚，产后血虚者宜之。','5',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (54,'201804176090','茯神',30,'8','fushen.jpg','旺旺','浙江',0,NULL,'2018-03-07','12',1,'2018-04-17','散寒除湿发汗，通血脉，暖胃消食。风寒咳嗽，留饮宿食，腹痛虫草疾，呕吐泻痢，蛔虫、蛲虫，疝气，阴痒湿疮。','6',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (57,'201804173371','降香',35,'8','jiangxiang.jpg','旺旺','浙江',0,NULL,'2018-04-17','12',1,'2018-04-17','行瘀止血、消肿止痛。金疮出血，跌打损伤，疼痛，瘀血肿痛等症。','2',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (58,'201804171125','佩兰',50,'9','peilan.jpg','旺旺','西藏',0,NULL,'2018-04-19','12',1,'2018-04-17','发表解暑，化湿开胃。夏伤暑湿，头胀胸闷，寒热，身重，口中甜腻或多涎臭，胃呆不饥。','3',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (59,'201804179146','壁虎',80,'7','bihu.jpg','旺旺','浙江',1,NULL,'2018-04-19','12',1,'2018-04-17','祛风定惊；解毒散结。主历节风痛；四肢不遂；惊痫；破伤风，痈疬；疠风；风癣；噎膈。','4',9999);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (60,'201804177428','甘遂',30,'5','gansui.jpg','旺旺','浙江',0,NULL,'2018-03-07','12',1,'2018-04-17','泻水逐饮；破积通便。主水肿；腹水；留饮结胸；癫痫；喘咳；大小便不通。','5',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (61,'201804176104','秫米',30,'8','chumi.jpg','旺旺','浙江',0,NULL,'2018-04-19','12',1,'2018-04-17','跌打损伤，痈疽肿痛，腰膝无力，风湿痹痛，胎动不安及崩漏等症。','6',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (62,'201804171606','荷叶',10,'8','heye.jpg','旺旺','浙江',0,NULL,'2018-04-05','12',1,'2018-04-17','暑湿烦渴；头痛眩晕；脾虚腹胀；大便泄泻；叶血下血；产后恶露不净。','1',9996);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (63,'201804172259','金银花',10,'10','jinyinhua.jpg','旺旺','浙江',0,NULL,'2018-04-17','12',1,'2018-04-17','清热解毒。主温病发热；热毒血痢；痈肿疔疮；喉痹及多种感染性疾病。','1',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (64,'201804176802','蒲黄',50,'8','puhuang.jpg','旺旺','浙江',0,NULL,'2018-04-19','12',1,'2018-04-17','除热，行血，消瘀，利水，炒炭止血。经闭，痛经，产后瘀血作痛，跌打损伤，尿涩作痛及一切血症。','2',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (65,'201804175746','辛夷',40,'7','xinyi.jpg','旺旺','浙江',1,NULL,'2018-04-19','12',1,'2018-04-17','散风、通鼻窍。感冒头痛，鼻塞，鼻渊。','3',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (66,'201804177256','徐长卿',100,'8','xuchangqin.jpg','旺旺','浙江',0,NULL,'2018-04-19','12',1,'2018-04-17','祛风止痛、温经通络、解读消肿。风湿性关节痛、胃痛、跌打肿痛、肝硬化腹水、月经不调。','4',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (67,'201804177149','亚麻子',60,'8','yamazi.jpg','旺旺','浙江',0,NULL,'2018-04-17','12',1,'2018-04-17','麻风；皮肤干燥；瘙痒；脱发；疮疡湿疹；肠燥便秘。','5',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (68,'201804172033','白花丁香',50,'5','baihuadingxiang.jpg','旺旺','浙江',0,NULL,'2018-04-17','12',1,'2018-04-17','清心安神。主心烦失眠；头痛健忘。','6',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (69,'201804176739','菊花',80,'9','juhua.jpg','旺旺','浙江',0,NULL,'2018-04-20','43',1,'2018-04-17','疏风除热，清肝明目。头目风热，眩晕，头痛目赤等症。','1',9998);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (70,'201804174121','决明子',20,'8','juemingzi.jpg','旺旺','浙江',0,NULL,'2018-04-13','12',1,'2018-04-17','清肝益肾，明目，通便。头痛，目赤，昏暗不明，内热便秘。','1',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (71,'201804175818','连翘',20,'8','lianqiao.jpg','旺旺','浙江',0,NULL,'2018-04-17','12',1,'2018-04-17','清心解热，消肿散结，利尿。外感风热，急性热病初起。烦热神昏，痈肿疮毒，瘰疠等症。','1',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (72,'201804179160','桦叶荚蒾',70,'7','huayejiami.jpg','旺旺','浙江',1,NULL,'2018-04-09','12',1,'2018-04-17','调经，涩精。主治月经不调，梦遗虚滑，肺热口臭及白浊带下等症。','2',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (73,'201804174125','荆芥',50,'8','jinjie.jpg','旺旺','浙江',0,NULL,'2018-04-17','18',1,'2018-04-17','发汗解表，散瘀止血。外感风寒，麻疹初期透发不畅，炒炭可止衄血、崩漏、便血。习惯无汗用芥穗，有汗用荆芥，入血分用荆芥炭。','3',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (74,'201804172373','桑寄生',40,'8','sangjisheng.jpg','旺旺','浙江',1,NULL,'2018-04-19','12',1,'2018-04-17','补肝肾、除风湿、强筋骨、养血安胎。腰膝疼痛。筋骨无力，胎动胎漏。','4',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (75,'201804175309','芫花',20,'7','wuhua.jpg','旺旺','浙江',0,NULL,'2018-04-19','12',1,'2018-04-17','泻水、逐痰。痰饮喘咳，水肿胀满。','5',1000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (76,'201804178276','柏树果',30,'9','baishuguo.jpg','旺旺','浙江',1,NULL,'2018-04-19','12',1,'2018-04-17','祛风；和中；安神；止血。主感冒发热；胃痛呕吐；烦躁；失眠；劳伤吐血。','6',1000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (77,'201804177722','鸡冠虫',200,'5','jiguanchong.jpg','咪咪','浙江',0,NULL,'2018-04-20','12',1,'2018-04-17','通血闭，破症块。主治狂犬病及症瘕瘀结。','6',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (78,'201804171055','龙须草',30,'8','longxucao.jpg','恰恰','浙江',0,NULL,'2018-04-07','12',1,'2018-04-17','清热解毒，利尿，止痛。治小便淋涩，黄水疮。','1',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (79,'201804172661','防风',20,'8','fangfeng.jpg','旺旺','浙江',1,NULL,'2018-03-20','18',1,'2018-04-17','外感风寒；头痛身痛；风湿痹痛；骨节酸痛；腹痛泄泻；肠风下血；破伤风；风疹瘙痒；疮疡初起。','3',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (80,'201804173962','浮萍',10,'7','fuping.jpg','旺旺','浙江',0,NULL,'2018-04-04','12',1,'2018-04-17','发表透疹，利水退肿。感冒发烧，斑疹不透，肌肤肿胀，小便不利。','3',10000);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (81,'201807029034','八角',21,'1','bajiao.jpg','旺旺','浙江杭州',0,NULL,'2018-04-17','12',1,'2018-07-02','32','7',9995);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (82,'201811206178','板蓝根',23,'1','banlangen.jpg','安安','四川',0,NULL,'2018-11-05','3',1,'2018-11-20','清热解毒，解心胃热毒。流感、热病发斑、扁桃体炎、腮腺炎、流脑、肠炎、菌痢，但主要用于大头瘟、颜面丹毒和腮腺炎。','1',45);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (83,'201811208394','槐花',40,'8','huaihua.jpg','活到老','四川',0,NULL,'2018-11-01','12',1,'2018-11-20','凉血止血，清肝明目。常用于高血压头晕，痔疮及肠风便血，血痢等出血症。','2',45);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (84,'201811206779','木瓜',23,'8','mugua.jpg','好医生','四川',0,NULL,'2018-11-01','12',1,'2018-11-20','风湿痹痛，肢体酸重，筋脉拘挛，吐泻转筋，脚气水肿。','4',23);
insert  into `t_snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (85,'201811201929','芦荟',12,'7','luhui.jpg','qq','四川',0,NULL,'2018-11-02','24',1,'2018-11-20','热结便秘；肝火头痛；目赤惊风；虫积腹痛；疥癣；痔瘘；解巴豆毒。','5',45);

/*Table structure for table `t_userinfo` */

DROP TABLE IF EXISTS `t_userinfo`;

CREATE TABLE `t_userinfo` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `u_username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `u_password` varchar(255) DEFAULT NULL COMMENT '密码',
  `u_money` varchar(255) DEFAULT NULL COMMENT '钱包金额',
  `u_phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `u_email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `u_sex` char(255) DEFAULT NULL COMMENT '性别',
  `u_resgistDate` date DEFAULT NULL COMMENT '出生日期',
  `u_address` varchar(255) DEFAULT NULL COMMENT '地址',
  `u_score` int(11) DEFAULT NULL COMMENT '积分总数',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `t_userinfo` */

insert  into `t_userinfo`(`u_id`,`u_realname`,`u_username`,`u_password`,`u_money`,`u_phone`,`u_email`,`u_sex`,`u_resgistDate`,`u_address`,`u_score`) values (19,'张汝洪','nibudon','0659c7992e268962384eb17fafe88364','9183.0','15328393101','729686144@qq.com','男','2018-11-07','陕西西安',100);
insert  into `t_userinfo`(`u_id`,`u_realname`,`u_username`,`u_password`,`u_money`,`u_phone`,`u_email`,`u_sex`,`u_resgistDate`,`u_address`,`u_score`) values (23,'郑裕琳','郑裕琳','583123ca508f853b3524a2faf2c7c87c','9981.6','18215522446','1944245223@qq.com','女','2018-11-20','四川省成都市',NULL);
insert  into `t_userinfo`(`u_id`,`u_realname`,`u_username`,`u_password`,`u_money`,`u_phone`,`u_email`,`u_sex`,`u_resgistDate`,`u_address`,`u_score`) values (24,'lisuduo','lisuduo','827ccb0eea8a706c4c34a16891f84e7b','9910.4','13919991435','435752897@qq.com','女','2018-11-30','yuzhong',NULL);
insert  into `t_userinfo`(`u_id`,`u_realname`,`u_username`,`u_password`,`u_money`,`u_phone`,`u_email`,`u_sex`,`u_resgistDate`,`u_address`,`u_score`) values (25,'张无忌','zhangwuji','0659c7992e268962384eb17fafe88364','10000','15228654563','zhangwj@qq.com','男','2018-12-25','光明顶',NULL);
insert  into `t_userinfo`(`u_id`,`u_realname`,`u_username`,`u_password`,`u_money`,`u_phone`,`u_email`,`u_sex`,`u_resgistDate`,`u_address`,`u_score`) values (26,'张汝洪','nbd','0659c7992e268962384eb17fafe88364','10000','15328393101','1396667258@qq.com','男','2019-01-02','陕西',NULL);
insert  into `t_userinfo`(`u_id`,`u_realname`,`u_username`,`u_password`,`u_money`,`u_phone`,`u_email`,`u_sex`,`u_resgistDate`,`u_address`,`u_score`) values (27,'郑裕琳','zhengyulin','0659c7992e268962384eb17fafe88364','9997.9','15228627334','729686144@qq.com','女','2019-01-02','四川成都',NULL);
insert  into `t_userinfo`(`u_id`,`u_realname`,`u_username`,`u_password`,`u_money`,`u_phone`,`u_email`,`u_sex`,`u_resgistDate`,`u_address`,`u_score`) values (28,'张汝洪','test20190217','26188a923c2c28e9988a7b0f57ea6b86','10000','15326851236','729686144@qq.com','男','2019-02-17','陕西',NULL);
insert  into `t_userinfo`(`u_id`,`u_realname`,`u_username`,`u_password`,`u_money`,`u_phone`,`u_email`,`u_sex`,`u_resgistDate`,`u_address`,`u_score`) values (29,'倪卟懂','nibudon1','0659c7992e268962384eb17fafe88364','10000','15236525632','123@qq.com','男','2019-02-25','陕西',NULL);
insert  into `t_userinfo`(`u_id`,`u_realname`,`u_username`,`u_password`,`u_money`,`u_phone`,`u_email`,`u_sex`,`u_resgistDate`,`u_address`,`u_score`) values (30,'倪卟懂','nibudo','e10adc3949ba59abbe56e057f20f883e','10000','15328393101','123@qq.com','男','2019-04-16','',NULL);

/* Procedure structure for procedure `haha` */

/*!50003 DROP PROCEDURE IF EXISTS  `haha` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `haha`(in a int,in b int)
BEGIN
set @x=0;
set @x =a+b;
SELECT @x as num;
end */$$
DELIMITER ;

/* Procedure structure for procedure `jk` */

/*!50003 DROP PROCEDURE IF EXISTS  `jk` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `jk`()
BEGIN
 SELECT * from admin;
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
