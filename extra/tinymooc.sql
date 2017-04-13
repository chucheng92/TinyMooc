USE `tinymooc`;

/*Table structure for table `attention` */

DROP TABLE IF EXISTS `attention`;

CREATE TABLE `attention` (
  `ATTENTION_ID` varchar(32) NOT NULL,
  `ATTENTION_DATE` datetime DEFAULT NULL,
  `ATTENTION_EACH` varchar(50) DEFAULT NULL,
  `ATTENTIONED_USER_ID` varchar(32) DEFAULT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ATTENTION_ID`),
  KEY `FK_h315idsypxlxvy8cagj09fbre` (`ATTENTIONED_USER_ID`),
  KEY `FK_hh8nc05x99l4h61b0c0ioggcj` (`USER_ID`),
  CONSTRAINT `FK_h315idsypxlxvy8cagj09fbre` FOREIGN KEY (`ATTENTIONED_USER_ID`) REFERENCES `user` (`USER_ID`),
  CONSTRAINT `FK_hh8nc05x99l4h61b0c0ioggcj` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `attention` */

insert  into `attention`(`ATTENTION_ID`,`ATTENTION_DATE`,`ATTENTION_EACH`,`ATTENTIONED_USER_ID`,`USER_ID`) values ('4cfea3834094498cb4afa4cbf9d45a73','2016-02-22 22:11:02',NULL,'691ef4ccfb0743a2ad1f41f51ecfe121','0d82eddbd6ad4534ba10f597c781d9b0');

/*Table structure for table `authority` */

DROP TABLE IF EXISTS `authority`;

CREATE TABLE `authority` (
  `AUTHORITY_ID` varchar(32) NOT NULL,
  `AUTHORITY_INTRO` varchar(100) DEFAULT NULL,
  `AUTHORITY_NAME` varchar(200) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`AUTHORITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `authority` */

insert  into `authority`(`AUTHORITY_ID`,`AUTHORITY_INTRO`,`AUTHORITY_NAME`,`UPDATE_DATE`) values ('1',NULL,'回复话题',NULL),('2',NULL,'查看私信',NULL);

/*Table structure for table `challenge` */

DROP TABLE IF EXISTS `challenge`;

CREATE TABLE `challenge` (
  `CHALLENGE_ID` varchar(32) NOT NULL,
  `CHALLENGE_DATE` datetime DEFAULT NULL,
  `MAJOR` varchar(50) DEFAULT NULL,
  `MAJOR_RANK` int(11) DEFAULT NULL,
  `PASS_NUM` int(11) DEFAULT NULL,
  `TEAM_RANK` int(11) DEFAULT NULL,
  `TOTAL_SCORE` int(11) DEFAULT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`CHALLENGE_ID`),
  KEY `FK_fy9g2ap5elqmq1cbuqxade21h` (`USER_ID`),
  CONSTRAINT `FK_fy9g2ap5elqmq1cbuqxade21h` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `challenge` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `COMMENT_ID` varchar(32) NOT NULL,
  `COMMENT_CONTENT` text,
  `COMMENT_DATE` datetime DEFAULT NULL,
  `COMMENT_OBJECT` varchar(32) DEFAULT NULL,
  `TYPE` varchar(50) DEFAULT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`COMMENT_ID`),
  KEY `FK_o0bjolslpxje7vjya6xv5dh60` (`PARENT_ID`),
  KEY `FK_krcqeop2yuanxsopu8ov9u5f2` (`USER_ID`),
  CONSTRAINT `FK_krcqeop2yuanxsopu8ov9u5f2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`),
  CONSTRAINT `FK_o0bjolslpxje7vjya6xv5dh60` FOREIGN KEY (`PARENT_ID`) REFERENCES `comment` (`COMMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`COMMENT_ID`,`COMMENT_CONTENT`,`COMMENT_DATE`,`COMMENT_OBJECT`,`TYPE`,`PARENT_ID`,`USER_ID`) values ('01931371a1b7494097361de87648a0f6','','2016-02-18 16:42:01','3f6bcbb6fa13488aa85a93ec47effcab','话题',NULL,'0d82eddbd6ad4534ba10f597c781d9b0'),('0cc2585193b446c39c0f4742361dd725','132123','2016-02-18 16:49:33','3f6bcbb6fa13488aa85a93ec47effcab','话题','364ce9fe2b1440e79c88b2debc5177c5','0d82eddbd6ad4534ba10f597c781d9b0'),('1388f85379dd4004bc014f8dac334704','13211321','2016-02-19 14:14:21','3f6bcbb6fa13488aa85a93ec47effcab','话题',NULL,'0d82eddbd6ad4534ba10f597c781d9b0'),('1cfffdec14bf48cf9607faf525135e03','<img src=\"http://119.29.231.159:8080/tinymooc/upfiles/folder/20151220/1450593286741.jpg\" alt=\"\" />','2015-12-20 14:34:55','5bb8cc93f55d4f1cb4446c1c38497f75','课时',NULL,'691ef4ccfb0743a2ad1f41f51ecfe123'),('21189a58a2474d34955bf621c7e68d0d','32131','2015-12-20 21:56:00','6bd3da722ca34228ac1ec143ea778627','课时',NULL,'691ef4ccfb0743a2ad1f41f51ecfe121'),('33da7e5ef1eb4332b54ead39852da50d','测试','2015-12-20 14:35:12','5bb8cc93f55d4f1cb4446c1c38497f75','课时',NULL,'691ef4ccfb0743a2ad1f41f51ecfe123'),('364ce9fe2b1440e79c88b2debc5177c5','','2016-02-18 16:47:44','3f6bcbb6fa13488aa85a93ec47effcab','话题',NULL,'0d82eddbd6ad4534ba10f597c781d9b0'),('4c5f359addf4471594e816d7332fd4d0','321321321','2015-12-20 21:56:04','6bd3da722ca34228ac1ec143ea778627','课时','92d0b5ddc759415ba7799ad93e36ace5','691ef4ccfb0743a2ad1f41f51ecfe121'),('54661580ad6e437bb54de90f4e3a703f','大神','2016-02-18 16:42:40','3f6bcbb6fa13488aa85a93ec47effcab','话题','bc501def8f934affa11bdaf277c2a5dc','0d82eddbd6ad4534ba10f597c781d9b0'),('7edd383f16bc46a4b6300e854ae7fcf1','','2016-02-18 16:47:41','3f6bcbb6fa13488aa85a93ec47effcab','话题',NULL,'0d82eddbd6ad4534ba10f597c781d9b0'),('7ef54bc301f8461aac4829f0d3388ea6','3433333333333','2016-02-18 16:50:09','3f6bcbb6fa13488aa85a93ec47effcab','话题',NULL,'0d82eddbd6ad4534ba10f597c781d9b0'),('7ff2f5dd4ee343939213fe14de7954f5','','2016-02-18 16:49:39','3f6bcbb6fa13488aa85a93ec47effcab','话题','364ce9fe2b1440e79c88b2debc5177c5','0d82eddbd6ad4534ba10f597c781d9b0'),('91c31e17aa3f436f862a6eecd692bc6e','123','2016-02-18 16:49:28','3f6bcbb6fa13488aa85a93ec47effcab','话题',NULL,'0d82eddbd6ad4534ba10f597c781d9b0'),('92d0b5ddc759415ba7799ad93e36ace5','3231321','2015-12-20 21:55:52','6bd3da722ca34228ac1ec143ea778627','课时',NULL,'691ef4ccfb0743a2ad1f41f51ecfe121'),('98c3727e899c438fa46289f77160354e','','2016-02-18 16:42:05','3f6bcbb6fa13488aa85a93ec47effcab','话题',NULL,'0d82eddbd6ad4534ba10f597c781d9b0'),('9a4dce95b88d4def97d4cef4ef3b2fc9','132123','2016-02-18 16:50:02','3f6bcbb6fa13488aa85a93ec47effcab','话题',NULL,'0d82eddbd6ad4534ba10f597c781d9b0'),('a9dd84cbad6d46d8934344d57721bd19','12312','2016-02-18 16:49:58','3f6bcbb6fa13488aa85a93ec47effcab','话题',NULL,'0d82eddbd6ad4534ba10f597c781d9b0'),('bc501def8f934affa11bdaf277c2a5dc','','2016-02-18 16:41:58','3f6bcbb6fa13488aa85a93ec47effcab','话题',NULL,'0d82eddbd6ad4534ba10f597c781d9b0'),('ce9c4fb508a04fefaa0f9c32c9a3191f','','2016-02-18 16:47:39','3f6bcbb6fa13488aa85a93ec47effcab','话题',NULL,'0d82eddbd6ad4534ba10f597c781d9b0'),('e35c50549550490882af699eb389f38b','1231','2016-02-18 16:49:55','3f6bcbb6fa13488aa85a93ec47effcab','话题',NULL,'0d82eddbd6ad4534ba10f597c781d9b0'),('eae637953db64d78b0e1fc3b5eaf8ff6','','2016-02-18 16:58:01','3f6bcbb6fa13488aa85a93ec47effcab','话题','ce9c4fb508a04fefaa0f9c32c9a3191f','0d82eddbd6ad4534ba10f597c781d9b0'),('f3dc96350f0c428d9d1707ba01f2dd5a','<strong><span style=\"color:#ff6666;\">棒棒哒</span></strong>','2016-01-14 16:44:12','076e439d4a474a49842bba5a3b7f7eb6','课时',NULL,'691ef4ccfb0743a2ad1f41f51ecfe121'),('f55b988d2bc147ec9fadf89d6534c076','312312','2015-12-20 21:55:57','6bd3da722ca34228ac1ec143ea778627','课时',NULL,'691ef4ccfb0743a2ad1f41f51ecfe121'),('f5b7f367d787455ca9d5bf88b2e5edf2','321213132<img alt=\"哭\" src=\"resource/js/xheditor/xheditor_emot/default/cry.gif\" emot=\"default,cry\" />','2016-02-18 16:58:08','3f6bcbb6fa13488aa85a93ec47effcab','话题','9a4dce95b88d4def97d4cef4ef3b2fc9','0d82eddbd6ad4534ba10f597c781d9b0');

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `COURSE_ID` varchar(32) NOT NULL,
  `APPLY_DATE` datetime DEFAULT NULL,
  `APPROVE_DATE` datetime DEFAULT NULL,
  `COURSE_INTRO` varchar(200) DEFAULT NULL,
  `COURSE_STATE` varchar(50) DEFAULT NULL,
  `COURSE_TITLE` varchar(50) DEFAULT NULL,
  `LESSON_NUM` int(11) DEFAULT NULL,
  `SCAN_NUM` int(11) DEFAULT NULL,
  `TYPE` varchar(50) DEFAULT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `LOGO_URL` varchar(1000) DEFAULT NULL,
  `TOTAL_MARK` double(3,2) DEFAULT '0.00',
  PRIMARY KEY (`COURSE_ID`),
  KEY `FK_iimrs13de0a8udrlbhm3s2436` (`PARENT_ID`),
  CONSTRAINT `FK_iimrs13de0a8udrlbhm3s2436` FOREIGN KEY (`PARENT_ID`) REFERENCES `course` (`COURSE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`COURSE_ID`,`APPLY_DATE`,`APPROVE_DATE`,`COURSE_INTRO`,`COURSE_STATE`,`COURSE_TITLE`,`LESSON_NUM`,`SCAN_NUM`,`TYPE`,`PARENT_ID`,`LOGO_URL`,`TOTAL_MARK`) values ('076e439d4a474a49842bba5a3b7f7eb6','2016-01-15 12:56:36',NULL,'介绍计算机基础','批准','01.01_计算机基础(计算机概述)',1,31,NULL,'fc317eeea0854db88b466ee9db2969ab','/resource/pic/courseLogo/course1.jpg',0.00),('0ba42041d2484614bbaabcf5b896eebd','2016-01-23 20:24:10',NULL,'介绍字典','批准','python在线教学-08-字典',8,0,NULL,'494bd36c5fdc4d90b7f50b065b8112db',NULL,0.00),('12ca2eee099c48dba95fd00e284a643d','2016-01-20 19:29:39',NULL,'介绍SpringMVC的异常处理-抛出异常','批准','09springmvc异常处理-抛出异常',9,0,NULL,'4d107ef28754495ba9da5ddbf46676fa',NULL,0.00),('2371461ebd3d489799915f31d1d8d116','2016-01-23 20:22:47',NULL,'变量','批准','python在线教学-03-变量',3,0,NULL,'494bd36c5fdc4d90b7f50b065b8112db',NULL,0.00),('2566a663d47546a0b79d7a3c75d618cc','2016-01-23 20:23:20',NULL,'介绍数据类型-数字-字符串','批准','python在线教学-05-数据类型-数字-字符串',5,0,NULL,'494bd36c5fdc4d90b7f50b065b8112db',NULL,0.00),('3faaf2dd45324e00a616130ada0f3bc4','2016-01-20 19:27:54','2016-02-23 13:22:02','springmvc参数绑定-list','批准','04springmvc注解开发-springmvc参数绑定-list',4,0,NULL,'4d107ef28754495ba9da5ddbf46676fa',NULL,0.00),('494bd36c5fdc4d90b7f50b065b8112db','2016-01-23 20:06:10','2016-02-19 16:01:59','通过本课程的学习，您将学会搭建基本的Python开发环境，以函数为基础编写完整的Python代码，熟练掌握Python的基本数据类型以及list和dict的操作。打好成为大神坚实的基础。','批准','Python大神养成计划',NULL,101,'计算机',NULL,'http://119.29.231.159:8080/tinymooc/upfiles/folder/20160123/1453550661821.jpg',9.90),('4c22e2eb34bb4779a5e585d9c394c987','2016-01-23 20:22:33',NULL,'开始编程','批准','python在线教学-02-开始编程吧',2,0,NULL,'494bd36c5fdc4d90b7f50b065b8112db',NULL,0.00),('4d107ef28754495ba9da5ddbf46676fa','2016-01-20 19:25:54','2016-02-23 13:27:02','现在主流的Web MVC框架除了Struts这个主力外，其次就是Spring MVC了，因此这也是作为一名程序员需要掌握的主流框架，框架选择多了，应对多变的需求和业务时，可实行的方案自然就多了。不过要想灵活运用Spring MVC来应对大多数的Web开发，就必须要掌握它的配置及原理。而SpringMVC注解开发当然是需要的掌握的。','批准','【萌课首发】SpringMVC注解开发',NULL,33,'计算机',NULL,'http://119.29.231.159:8080/tinymooc/upfiles/folder/20160120/1453289062564.jpg',9.90),('4de08488a8b14b5f8732b81ed413f54a','2016-01-23 20:22:04',NULL,'走进python','批准','python在线教学-01-走进python',1,0,NULL,'494bd36c5fdc4d90b7f50b065b8112db',NULL,0.00),('53eb35ea31164d79bc8c4eb4c2a1711f','2016-01-20 19:29:11','2016-02-23 13:24:39','介绍异常处理-全局异常处理器开发','批准','08springmvc异常处理-全局异常处理器开发',8,0,NULL,'4d107ef28754495ba9da5ddbf46676fa',NULL,0.00),('60cf44d67ad4408e8b79bdb1f0ebf22e','2016-01-23 20:25:11',NULL,'流程控制-遍历序列及字典','批准','python在线教学-12-流程控制-遍历序列及字典',12,0,NULL,'494bd36c5fdc4d90b7f50b065b8112db',NULL,0.00),('61514e6d9e054cc3aea4317aee45bed6','2016-01-14 13:02:38',NULL,'运动员和教练的一个案列Demo','批准','10.01_面向对象(运动员和教练案例分析)',10,1,NULL,'fc317eeea0854db88b466ee9db2969ab','/resource/pic/courseLogo/course1.jpg',0.00),('694072a4fb52412b9fe8a58538862fac','2016-01-14 13:00:16',NULL,'二维数组概述和格式的讲解','批准','06.01_Java语言基础(二维数组概述和格式1的讲解)',6,1,NULL,'fc317eeea0854db88b466ee9db2969ab','/resource/pic/courseLogo/course1.jpg',0.00),('7323887fb56e4269baab1383fdcb1bb9','2016-01-14 12:59:12',NULL,'Java语言基础(选择结构switch语句的格式及其解释)','批准','04.01_Java语言基础(选择结构switch语句的格式及其解释)',4,2,NULL,'fc317eeea0854db88b466ee9db2969ab','/resource/pic/courseLogo/course1.jpg',0.00),('76ed33c890e8497bb7dfd6b719700b5a','2016-01-14 13:02:00',NULL,'关键字Final的引入','批准','09.01_面向对象(final关键字引入)',9,1,NULL,'fc317eeea0854db88b466ee9db2969ab','/resource/pic/courseLogo/course1.jpg',0.00),('7bf50856c94a40cb8dc1961cfcb9603b','2016-01-23 20:24:54',NULL,'流程控制-for','批准','python在线教学-11-流程控制-for',11,0,NULL,'494bd36c5fdc4d90b7f50b065b8112db',NULL,0.00),('843b3421f3dc4607a2c4eb91d7710dda','2016-01-23 20:23:02',NULL,'运算符和表达式','批准','python在线教学-04-运算符-表达式',4,0,NULL,'494bd36c5fdc4d90b7f50b065b8112db',NULL,0.00),('8b80d69687b04a6d99ed7b2c59cc1938','2016-01-14 12:59:44',NULL,'方法概述和格式说明','批准','05.01_Java语言基础(方法概述和格式说明)',5,0,NULL,'fc317eeea0854db88b466ee9db2969ab','/resource/pic/courseLogo/course1.jpg',0.00),('9c749e9ac1f740a1baf6b9334d82c0f3','2016-01-14 12:57:30',NULL,'介绍Java语言关键字，标识符的概述和组成规则','批准','02.02_Java语言基础(标识符的概述和组成规则)',2,5,NULL,'fc317eeea0854db88b466ee9db2969ab','/resource/pic/courseLogo/course1.jpg',0.00),('a9867cdbf1694c7d9708cdbd5a3c6481','2016-01-20 19:27:19',NULL,'springmvc参数绑定-包装类型pojo参数绑定','批准','02springmvc注解开发-springmvc参数绑定',2,0,NULL,'4d107ef28754495ba9da5ddbf46676fa',NULL,0.00),('ade2209a7bea4816952340c852e2c228','2016-01-23 20:23:55',NULL,'介绍列表','批准','python在线教学-07-列表 ',7,0,NULL,'494bd36c5fdc4d90b7f50b065b8112db',NULL,0.00),('b0c0e51f3898415790c02061402331ee','2016-01-14 13:01:32',NULL,'面向对象(工具类中使用静态)','批准','08.01_面向对象(工具类中使用静态)',8,1,NULL,'fc317eeea0854db88b466ee9db2969ab','/resource/pic/courseLogo/course1.jpg',0.00),('b3453e612e1746489e884c19c3d0020c','2016-01-20 19:28:46','2016-02-23 13:24:37','介绍数据回显','批准','07springmvc注解开发-数据回显',7,0,NULL,'4d107ef28754495ba9da5ddbf46676fa',NULL,0.00),('b3bed530cdbf4c23a987fc15002096cf','2016-01-23 20:26:13',NULL,'while循环','批准','python在线教学14-流程控制-while',14,0,NULL,'494bd36c5fdc4d90b7f50b065b8112db',NULL,0.00),('b421e8fc51e94d7bb15a325aadb4ba1e','2016-01-20 19:28:24','2016-02-23 13:24:35','validation校验-分组校验','批准','06springmvc注解开发-validation校验-分组校验',6,0,NULL,'4d107ef28754495ba9da5ddbf46676fa',NULL,0.00),('b42640bdac6b4c9092c30a10bab693a0','2016-01-14 12:58:20',NULL,'介绍运算符的使用','批准','03.02_Java语言基础(算术运算符的基本用法)',3,3,NULL,'fc317eeea0854db88b466ee9db2969ab','/resource/pic/courseLogo/course1.jpg',0.00),('c9f896d193d94ff881a99fe8cc6b480a','2016-01-20 18:59:00',NULL,'LoveLive2015剧场版，欢迎观看。','批准','LoveLive2015剧场版',1,0,NULL,'e05aa3bd1ba74b09ad21ce8e24e64bed',NULL,0.00),('cbf18236393546a5815c10e0331644b5','2016-01-23 20:23:33',NULL,'介绍元组','批准','python在线教学-06-元组',6,0,NULL,'494bd36c5fdc4d90b7f50b065b8112db',NULL,0.00),('d318cebdb5e64e0bafdf6fa190b05d63','2016-01-20 19:28:12','2016-02-23 13:24:28','validation校验-商品修改校验','批准','05springmvc注解开发-validation校验-商品修改校验',5,0,NULL,'4d107ef28754495ba9da5ddbf46676fa',NULL,0.00),('d3c70d40ff0e4f26a59239cf5b1491b1','2016-01-23 20:24:26',NULL,'介绍流程控制-if','批准','python在线教学-09-流程控制-if',9,0,NULL,'494bd36c5fdc4d90b7f50b065b8112db',NULL,0.00),('d64081c8a92449618b396b417e8368f0','2016-01-20 19:27:36','2016-02-23 13:24:16','springmvc参数绑定-数组','批准','03springmvc注解开发-springmvc参数绑定-数组',3,0,NULL,'4d107ef28754495ba9da5ddbf46676fa',NULL,0.00),('d719ee60899f40ce8f0bbdcf37ab9a66','2016-01-20 19:26:41','2016-02-23 13:24:32','第一节','批准','01springmvc第一天课程复习',1,0,NULL,'4d107ef28754495ba9da5ddbf46676fa',NULL,0.00),('e05aa3bd1ba74b09ad21ce8e24e64bed','2016-01-20 16:16:07','2016-01-11 17:08:06','学员偶像祭，LoveLive2015剧场版高清，欢迎观看。','批准','LoveLive2015剧场版',NULL,166,'动漫',NULL,'http://119.29.231.159:8080/tinymooc/upfiles/folder/20160120/1453277713782.jpg',8.90),('e4b395b73b5848dabf84a3f8a92d2cc4','2016-01-14 13:00:52',NULL,'面向对象的成员变量和局部变量','批准','07.01_面向对象(成员变量和局部变量的区别)',7,1,NULL,'fc317eeea0854db88b466ee9db2969ab','/resource/pic/courseLogo/course1.jpg',0.00),('f2f4f70de13e4c2bab9fb633921bb94b','2016-01-23 20:25:48',NULL,'循环','批准','python在线教学-13-流程控制-循环控制',13,0,NULL,'494bd36c5fdc4d90b7f50b065b8112db',NULL,0.00),('fc317eeea0854db88b466ee9db2969ab','2016-01-14 12:53:18','2016-01-12 17:08:00','Java入门到精通传智播客全套教程，欢迎学习。','批准','Java入门到精通',NULL,158,'计算机',NULL,'/resource/pic/courseLogo/course1.jpg',9.90),('ffebecb965f2465c89d53dd93621aa70','2016-01-23 20:24:36',NULL,'流程控制-逻辑','批准','python在线教学-10-流程控制-逻辑',10,0,NULL,'494bd36c5fdc4d90b7f50b065b8112db',NULL,0.00);

/*Table structure for table `data_dic` */

DROP TABLE IF EXISTS `data_dic`;

CREATE TABLE `data_dic` (
  `DIC_ID` varchar(32) NOT NULL,
  `DIC_KEY` varchar(50) DEFAULT NULL,
  `DIC_VALUE` varchar(50) DEFAULT NULL,
  `INTRO` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `data_dic` */

insert  into `data_dic`(`DIC_ID`,`DIC_KEY`,`DIC_VALUE`,`INTRO`) values ('1','专业分类','摄影','摄影频道'),('2','专业分类','艺术','艺术频道'),('3','专业分类','兴趣','兴趣频道'),('4','专业分类','计算机','计算机频道'),('5','专业分类','文学','文学频道'),('6','专业分类','求职','求职频道'),('7','专业分类','动漫','动漫频道'),('8','专业分类','其他','其他内容'),('9','专业分类','音乐','音乐频道');

/*Table structure for table `discuss` */

DROP TABLE IF EXISTS `discuss`;

CREATE TABLE `discuss` (
  `DISCUSS_ID` varchar(32) NOT NULL,
  `DISCUSS_INTOR` varchar(200) DEFAULT NULL,
  `ESSENCE` varchar(50) DEFAULT NULL,
  `PUBLISH_DATE` datetime DEFAULT NULL,
  `SCAN_NUM` int(11) DEFAULT NULL,
  `TOP` int(11) DEFAULT NULL,
  `TOPIC` varchar(50) DEFAULT NULL,
  `TEAM_ID` varchar(32) DEFAULT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`DISCUSS_ID`),
  KEY `FK_adotdltyjuyo667mjsc5ymhsm` (`TEAM_ID`),
  KEY `FK_ce3e3fldp21yoywub71oms45c` (`USER_ID`),
  CONSTRAINT `FK_adotdltyjuyo667mjsc5ymhsm` FOREIGN KEY (`TEAM_ID`) REFERENCES `team` (`TEAM_ID`),
  CONSTRAINT `FK_ce3e3fldp21yoywub71oms45c` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `discuss` */

insert  into `discuss`(`DISCUSS_ID`,`DISCUSS_INTOR`,`ESSENCE`,`PUBLISH_DATE`,`SCAN_NUM`,`TOP`,`TOPIC`,`TEAM_ID`,`USER_ID`) values ('3f6bcbb6fa13488aa85a93ec47effcab',NULL,NULL,'2016-02-18 16:18:04',55,0,'话题测试','12328c2f401d4b72900a40ba44d241d3','0d82eddbd6ad4534ba10f597c781d9b0');

/*Table structure for table `favorite` */

DROP TABLE IF EXISTS `favorite`;

CREATE TABLE `favorite` (
  `FAVORITE_ID` varchar(32) NOT NULL,
  `COURSE_ID` varchar(100) DEFAULT NULL,
  `COURSE_NAME` varchar(1000) DEFAULT NULL,
  `FAVORITE_DATE` datetime DEFAULT NULL,
  `URL` varchar(500) DEFAULT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`FAVORITE_ID`),
  KEY `FK_9e0ouqgjsw1hdclr2s5qsb6rk` (`USER_ID`),
  CONSTRAINT `FK_9e0ouqgjsw1hdclr2s5qsb6rk` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `favorite` */

insert  into `favorite`(`FAVORITE_ID`,`COURSE_ID`,`COURSE_NAME`,`FAVORITE_DATE`,`URL`,`USER_ID`) values ('1eb9361b60954ed6ba0ce3ca57e45f16','4d107ef28754495ba9da5ddbf46676fa','【萌课首发】SpringMVC注解开发','2016-02-19 14:01:14','courseDetailPage.htm?courseId=4d107ef28754495ba9da5ddbf46676fa','691ef4ccfb0743a2ad1f41f51ecfe121'),('30cc46d3b83d4facbe069be9131b04f0','494bd36c5fdc4d90b7f50b065b8112db','Python大神养成计划','2016-02-19 14:46:46','courseDetailPage.htm?courseId=494bd36c5fdc4d90b7f50b065b8112db','691ef4ccfb0743a2ad1f41f51ecfe121'),('58272cf0aef542398d4387ded2a23baf','fc317eeea0854db88b466ee9db2969ab','Java入门到精通','2016-02-17 22:14:17','courseDetailPage.htm?courseId=fc317eeea0854db88b466ee9db2969ab','691ef4ccfb0743a2ad1f41f51ecfe121'),('6fa8f9d2266049f7a99072b3a46451dd','e05aa3bd1ba74b09ad21ce8e24e64bed','LoveLive2015剧场版','2016-02-18 14:50:42','courseDetailPage.htm?courseId=e05aa3bd1ba74b09ad21ce8e24e64bed','691ef4ccfb0743a2ad1f41f51ecfe122'),('bb608d1ce8fc460f85bb7f0fc2bbab53','494bd36c5fdc4d90b7f50b065b8112db','Python大神养成计划','2016-02-22 22:06:32','courseDetailPage.htm?courseId=494bd36c5fdc4d90b7f50b065b8112db','0d82eddbd6ad4534ba10f597c781d9b0');

/*Table structure for table `friendli_link` */

DROP TABLE IF EXISTS `friendli_link`;

CREATE TABLE `friendli_link` (
  `FRIENDLY_LINK_ID` varchar(32) NOT NULL,
  `LINK_NAME` varchar(50) DEFAULT NULL,
  `URL` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FRIENDLY_LINK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `friendli_link` */

/*Table structure for table `grade` */

DROP TABLE IF EXISTS `grade`;

CREATE TABLE `grade` (
  `GRADE_ID` varchar(32) NOT NULL,
  `GRADE_OBJECT` varchar(32) DEFAULT NULL,
  `MARK` double(3,2) DEFAULT '0.00',
  `USER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`GRADE_ID`),
  KEY `FK_id4kd455j4nho6urcfoxgluh9` (`USER_ID`),
  CONSTRAINT `FK_id4kd455j4nho6urcfoxgluh9` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `grade` */

insert  into `grade`(`GRADE_ID`,`GRADE_OBJECT`,`MARK`,`USER_ID`) values ('4b71d505fb41437bb720baf8c38dd072','494bd36c5fdc4d90b7f50b065b8112db',5.00,'691ef4ccfb0743a2ad1f41f51ecfe121'),('ca1e8f34e17049c79fb3807344d9d5ea','4d107ef28754495ba9da5ddbf46676fa',5.00,'0d82eddbd6ad4534ba10f597c781d9b0'),('e39ef06d687142d6a6bdecef1e9449d6','fc317eeea0854db88b466ee9db2969ab',5.00,'0d82eddbd6ad4534ba10f597c781d9b0'),('f0fa704a79da478a942d1ce089388346','e05aa3bd1ba74b09ad21ce8e24e64bed',4.00,'691ef4ccfb0743a2ad1f41f51ecfe122'),('ff0739f19c5e47c7940e3bc152e144b4','494bd36c5fdc4d90b7f50b065b8112db',5.00,'0d82eddbd6ad4534ba10f597c781d9b0');

/*Table structure for table `head_image` */

DROP TABLE IF EXISTS `head_image`;

CREATE TABLE `head_image` (
  `IMAGE_ID` varchar(32) NOT NULL,
  `IMAGE_LARGE` varchar(100) DEFAULT NULL,
  `IMAGE_MID` varchar(100) DEFAULT NULL,
  `IMAGE_SMALL` varchar(100) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`IMAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `head_image` */

insert  into `head_image`(`IMAGE_ID`,`IMAGE_LARGE`,`IMAGE_MID`,`IMAGE_SMALL`,`CREATE_DATE`) values ('70328611d330411ca1d438ba70a103da','/resource/pic/imagehead/ChenLi/20160217_180104_1.jpg','/resource/pic/imagehead/ChenLi/20160217_180104_2.jpg','/resource/pic/imagehead/ChenLi/20160217_180104_3.jpg',NULL),('70328611d330411ca1d438ba70a10ccc','/resource/pic/imagehead/default_teamlarge.jpg','/resource/pic/imagehead/default_teamlarge.jpg','/resource/pic/imagehead/default_team.png',NULL),('e0a069a4605e4d3a9854d1da83a019fa','/resource/pic/imagehead/default1.jpg','/resource/pic/imagehead/default2.jpg','/resource/pic/imagehead/default3.jpg',NULL);

/*Table structure for table `image_text` */

DROP TABLE IF EXISTS `image_text`;

CREATE TABLE `image_text` (
  `RESOURCE_ID` varchar(32) NOT NULL,
  `CONTENT` text,
  PRIMARY KEY (`RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `image_text` */

insert  into `image_text`(`RESOURCE_ID`,`CONTENT`) values ('145d7ae584084703b8e6c6c29a419594','132123'),('241359a4401547b8a274eac3e572767b','<img src=\"http://119.29.231.159:8080/tinymooc/upfiles/folder/20151221/1450703135448.jpg\" alt=\"\" />'),('336a26dac3f2404b98de8af092aa1a01',''),('3e5ccdc843434bb781ef40a93ae32e25',''),('438c920e6253407db8df1b6964188084',''),('80849f0347e345f3b6a91533c1de150c',''),('809d9ae6d695433abc2328c51c0a769d',''),('8ecc1946dd374bfeabe098c5a81a5b70','132213'),('a98f9a37a026462381d0ddb3ab570065','132312312'),('c73e765f3b3a46379492575047742598','312321'),('ce7a7c4d084943a9a9b31c564247bc35',''),('d03ae2af2aeb435480c80ce49100685f','<img src=\"http://119.29.231.159:8080/tinymooc/upfiles/folder/20151220/1450619723736.jpg\" alt=\"\" />'),('f9541164ccb34678bf4f51d88fd770bd','大苏打');

/*Table structure for table `inform` */

DROP TABLE IF EXISTS `inform`;

CREATE TABLE `inform` (
  `INFORM_ID` varchar(32) NOT NULL,
  `INFORM_DATE` datetime DEFAULT NULL,
  `INFORM_OBJECT` varchar(32) DEFAULT NULL,
  `INFORM_REASON` varchar(200) DEFAULT NULL,
  `INFORM_STATE` varchar(50) DEFAULT NULL,
  `INFORM_TYPE` varchar(50) DEFAULT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`INFORM_ID`),
  KEY `FK_ng99ub2umjmssn8tfff2a21tu` (`USER_ID`),
  CONSTRAINT `FK_ng99ub2umjmssn8tfff2a21tu` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `inform` */

/*Table structure for table `label` */

DROP TABLE IF EXISTS `label`;

CREATE TABLE `label` (
  `LABEL_ID` varchar(32) NOT NULL,
  `FREQUENCY` int(11) DEFAULT NULL,
  `LABEL_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LABEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `label` */

insert  into `label`(`LABEL_ID`,`FREQUENCY`,`LABEL_NAME`) values ('1',17,'音乐'),('10',23,'金融'),('11',14,'会计'),('12',18,'艺术'),('13',17,'咖啡'),('14',10,'QQ'),('15',11,'体育'),('16',9,'C#'),('17',5,'IT'),('18',19,'大数据'),('19',15,'爱情'),('2',14,'LoveLive'),('20',11,'电影'),('3',23,'动漫'),('4',27,'计算机'),('4c4d7165636645e8b65189d26d134ad3',1,'aop，ioc'),('5',26,'Java'),('6',20,'JavaEE'),('7',26,'云计算'),('8',46,'摄影'),('9',17,'美食'),('9050db629439437aac88e4dc8bc17648',1,'aop'),('9919956d95d94484bc163fb3e16f0609',1,'ioc');

/*Table structure for table `label_object` */

DROP TABLE IF EXISTS `label_object`;

CREATE TABLE `label_object` (
  `LABEL_OBJECT_ID` varchar(32) NOT NULL,
  `OBJECT_ID` varchar(32) DEFAULT NULL,
  `OBJECT_TYPE` varchar(50) DEFAULT NULL,
  `LABEL_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`LABEL_OBJECT_ID`),
  KEY `FK_32y4pha4rruj983yuebixx3j4` (`LABEL_ID`),
  CONSTRAINT `FK_32y4pha4rruj983yuebixx3j4` FOREIGN KEY (`LABEL_ID`) REFERENCES `label` (`LABEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `label_object` */

insert  into `label_object`(`LABEL_OBJECT_ID`,`OBJECT_ID`,`OBJECT_TYPE`,`LABEL_ID`) values ('09450dee2fda4a279f47866d45908eb2','691ef4ccfb0743a2ad1f41f51ecfe122','user','16'),('10','1','course','4'),('12e84f679498423183d28ff65e6b4b94','0d82eddbd6ad4534ba10f597c781d9b0','user','15'),('1702214ef6d34a06a559275490e552f9','691ef4ccfb0743a2ad1f41f51ecfe121','user','3'),('17101e3d84f1429386532b6ce325a8f7','0d82eddbd6ad4534ba10f597c781d9b0','user','10'),('2','c1a96dd091514dfc8c7d4ed183815562',NULL,'2'),('2a62b20a3d8749189260ab5589077ef7','691ef4ccfb0743a2ad1f41f51ecfe122','user','9'),('2bc6d2df2ddd4a3db23acb0440d3a01b','691ef4ccfb0743a2ad1f41f51ecfe122','user','5'),('2d907650fcd942dbbe527903c75fd385','691ef4ccfb0743a2ad1f41f51ecfe121','user','13'),('2e0b9cc555934e58b5f5e9d8ef044bb1','691ef4ccfb0743a2ad1f41f51ecfe121','user','10'),('3','c1a96dd091514dfc8c7d4ed183815562','','3'),('4','691ef4ccfb0743a2ad1f41f51ecfe121','team','7'),('4207efe746fc4a1e8d213b30b9be676b','691ef4ccfb0743a2ad1f41f51ecfe122','user','6'),('5','691ef4ccfb0743a2ad1f41f51ecfe123','team','7'),('5d08cd45593745688d945157c092762a','494bd36c5fdc4d90b7f50b065b8112db','course','7'),('5e67dbb6cc874580ac0211ad9b91a1e3','691ef4ccfb0743a2ad1f41f51ecfe122','user','12'),('67942fb7b01b467c8383bf5111ae6e79','691ef4ccfb0743a2ad1f41f51ecfe121','user','8'),('6e72c7b430a140e59a7e14d430ffe2a8','494bd36c5fdc4d90b7f50b065b8112db','course','5'),('7','691ef4ccfb0743a2ad1f41f51ecfe122','team','3'),('79a268abb698483fac8598994b288437','e05aa3bd1ba74b09ad21ce8e24e64bed','course','3'),('8','6','team','1'),('9','6','team','2'),('b2925ccee26d40428b53d9a5bf27fc9b','691ef4ccfb0743a2ad1f41f51ecfe121','user','6'),('b91f068d36bb49bf92ac79f2b9a787c2','e05aa3bd1ba74b09ad21ce8e24e64bed','course','2'),('c1d276256cca43e892047f6d796b6988','691ef4ccfb0743a2ad1f41f51ecfe121','course','7'),('ca656f8971e8432d902ec2c043c78ff2','12328c2f401d4b72900a40ba44d241d3','team','4c4d7165636645e8b65189d26d134ad3'),('cbe33dcc890548cdb113afc8072a6c57','0d82eddbd6ad4534ba10f597c781d9b0','user','1'),('ea681f51609145549026cda55a8b6d4f','494bd36c5fdc4d90b7f50b065b8112db','course','4');

/*Table structure for table `level` */

DROP TABLE IF EXISTS `level`;

CREATE TABLE `level` (
  `LEVEL_ID` varchar(32) NOT NULL,
  `LV` int(11) DEFAULT NULL,
  `LV_CONDITION` int(11) DEFAULT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  `TYPE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LEVEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level` */

insert  into `level`(`LEVEL_ID`,`LV`,`LV_CONDITION`,`TITLE`,`TYPE`) values ('01',1,0,'慕萌而来','用户'),('02',2,20,'围观卖萌\r\n','用户'),('03',3,50,'一见萌心\r\n','用户'),('04',4,100,'萌系爆发\r\n','用户'),('05',5,200,'萌力无边\r\n','用户'),('06',6,500,'万萌之王\r\n','用户'),('07',7,1000,'进阶萌神\r\n','用户'),('08',8,2000,'萌神降临\r\n','用户'),('09',9,5000,'创世萌神\r\n','用户'),('10',10,10000,'初入萌系','用户'),('11',1,0,'初涉编程\r\n','小组用户'),('12',2,20,'初涉语法\r\n','小组用户'),('13',3,50,'初涉算法\r\n','小组用户'),('14',4,100,'语法提高\r\n','小组用户'),('15',5,200,'面向过程\r\n','小组用户'),('16',6,500,'算法提高\r\n','小组用户'),('17',7,1000,'面向对象\r\n','小组用户'),('18',8,2000,'模块编程\r\n','小组用户'),('19',9,5000,'软件架构\r\n','小组用户'),('20',10,10000,'科学家','小组用户'),('21',1,0,'DOS\r\n','小组'),('22',2,100,'WIN 98\r\n','小组'),('23',3,500,'WIN XP\r\n','小组'),('24',4,1000,'WIN 7\r\n','小组'),('25',5,5000,'WIN 10\r\n','小组');

/*Table structure for table `level_authority` */

DROP TABLE IF EXISTS `level_authority`;

CREATE TABLE `level_authority` (
  `LEVEL_AUTHORITY_ID` varchar(32) NOT NULL,
  `AUTHORITY_ID` varchar(32) DEFAULT NULL,
  `LEVEL_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`LEVEL_AUTHORITY_ID`),
  KEY `FK_brndqcbecuk3nclr8hehkggsc` (`AUTHORITY_ID`),
  KEY `FK_ckt7t86nbful8ag6wxvifp2ad` (`LEVEL_ID`),
  CONSTRAINT `FK_brndqcbecuk3nclr8hehkggsc` FOREIGN KEY (`AUTHORITY_ID`) REFERENCES `authority` (`AUTHORITY_ID`),
  CONSTRAINT `FK_ckt7t86nbful8ag6wxvifp2ad` FOREIGN KEY (`LEVEL_ID`) REFERENCES `level` (`LEVEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level_authority` */

/*Table structure for table `link` */

DROP TABLE IF EXISTS `link`;

CREATE TABLE `link` (
  `RESOURCE_ID` varchar(32) NOT NULL,
  `LINK_URL` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `link` */

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `MESSAGE_ID` varchar(32) NOT NULL,
  `CONTENT` varchar(200) DEFAULT NULL,
  `MESSAGE_STATE` varchar(50) DEFAULT NULL,
  `SEND_DATE` datetime DEFAULT NULL,
  `RECEIVER_ID` varchar(32) DEFAULT NULL,
  `SENDER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`MESSAGE_ID`),
  KEY `FK_o306am2a248m3w7idfjqwt9vc` (`RECEIVER_ID`),
  KEY `FK_8nalv7qfm0585rw0fjjsd0ub1` (`SENDER_ID`),
  CONSTRAINT `FK_8nalv7qfm0585rw0fjjsd0ub1` FOREIGN KEY (`SENDER_ID`) REFERENCES `user` (`USER_ID`),
  CONSTRAINT `FK_o306am2a248m3w7idfjqwt9vc` FOREIGN KEY (`RECEIVER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `message` */

insert  into `message`(`MESSAGE_ID`,`CONTENT`,`MESSAGE_STATE`,`SEND_DATE`,`RECEIVER_ID`,`SENDER_ID`) values ('12f23bdbeb8549c2aa767657e4482e6b','132','已读','2016-01-26 15:06:59','691ef4ccfb0743a2ad1f41f51ecfe122','691ef4ccfb0743a2ad1f41f51ecfe121'),('47c08d541d4c40509a310457660bd974','3123','已读','2015-12-21 20:19:13','691ef4ccfb0743a2ad1f41f51ecfe122','691ef4ccfb0743a2ad1f41f51ecfe121'),('50fee4437d1d49cb81faa0de6e2b47db','1312312','已读','2016-02-19 14:13:39','691ef4ccfb0743a2ad1f41f51ecfe121','0d82eddbd6ad4534ba10f597c781d9b0'),('63ee4e3d824c4a988cef2931bace68b8','2133','已读','2015-12-31 13:10:46','691ef4ccfb0743a2ad1f41f51ecfe122','691ef4ccfb0743a2ad1f41f51ecfe121'),('883f1ad10b944cb798730c61928e6d00','2  给  1','已读','2015-12-20 21:05:13','691ef4ccfb0743a2ad1f41f51ecfe121','691ef4ccfb0743a2ad1f41f51ecfe122'),('9a1fa1e1134f42868d52e5e151dce50e','32132','已读','2016-01-26 15:07:37','691ef4ccfb0743a2ad1f41f51ecfe122','691ef4ccfb0743a2ad1f41f51ecfe121'),('c9330c631b3141a1b963b65d97e60f5f','3333333333332','已读','2016-01-26 15:07:54','691ef4ccfb0743a2ad1f41f51ecfe122','691ef4ccfb0743a2ad1f41f51ecfe121'),('d9fa1d5e1a4e492d93380380a87f26d5','132123123','已读','2016-02-17 18:02:17','0d82eddbd6ad4534ba10f597c781d9b0','691ef4ccfb0743a2ad1f41f51ecfe121'),('e25a31e1d97a4af4b36973a3e6cbce23','2 发给1 1','已读','2015-12-20 21:04:24','691ef4ccfb0743a2ad1f41f51ecfe121','691ef4ccfb0743a2ad1f41f51ecfe122'),('eab46db3be68443db71f45bd71488d6d','acsa','已读','2015-12-31 13:11:03','691ef4ccfb0743a2ad1f41f51ecfe122','691ef4ccfb0743a2ad1f41f51ecfe121');

/*Table structure for table `note` */

DROP TABLE IF EXISTS `note`;

CREATE TABLE `note` (
  `NOTE_ID` varchar(32) NOT NULL,
  `NOTE_CONTENT` text,
  `ADD_DATE` datetime DEFAULT NULL,
  `USER_COURSE_ID` varchar(32) DEFAULT NULL,
  `PUBLIC` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`NOTE_ID`),
  KEY `FK_o306am2a248m3w7idfjqwt9v1` (`USER_COURSE_ID`),
  CONSTRAINT `FK_o306am2a248m3w7idfjqwt9v1` FOREIGN KEY (`USER_COURSE_ID`) REFERENCES `user_course` (`USER_COURSE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `note` */

insert  into `note`(`NOTE_ID`,`NOTE_CONTENT`,`ADD_DATE`,`USER_COURSE_ID`,`PUBLIC`) values ('54400c70b8e64214b84ae8229634edd6','kotori的学习笔记','2016-02-17 19:59:35','2391909e189a4b1ca37eec8963fc2cff','是'),('e674ce7d07ed4780b1b47e5d47ecbfd8','313213123123123','2016-01-22 15:57:22','fd0a94c46cd1477fa082e963b3c112ca','是');

/*Table structure for table `operation_log` */

DROP TABLE IF EXISTS `operation_log`;

CREATE TABLE `operation_log` (
  `LOG_ID` varchar(32) NOT NULL,
  `LOG_DATE` datetime DEFAULT NULL,
  `LOG_EXPLORER` varchar(50) DEFAULT NULL,
  `LOG_OPERATION` varchar(50) DEFAULT NULL,
  `LOG_USER_IP` varchar(50) DEFAULT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operation_log` */

/*Table structure for table `prop` */

DROP TABLE IF EXISTS `prop`;

CREATE TABLE `prop` (
  `PROP_ID` varchar(32) NOT NULL,
  `PROP_INTRO` varchar(100) DEFAULT NULL,
  `PROP_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PROP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `prop` */

/*Table structure for table `resource` */

DROP TABLE IF EXISTS `resource`;

CREATE TABLE `resource` (
  `RESOURCE_ID` varchar(32) NOT NULL,
  `RESOURCE_OBJECT` varchar(32) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `resource` */

insert  into `resource`(`RESOURCE_ID`,`RESOURCE_OBJECT`,`type`) values ('01006f7d271a494aa754372f100b040d','076e439d4a474a49842bba5a3b7f7eb6','video'),('04638548cc2d4c92b65506acf5a8154f','b3bfd175a3564ae4b62bd673c707ff4f','video'),('091df933f01f441ba4ae882e9f5f3e49','b26e3f35c7774cb385c7f159a93f21f5','video'),('0aed8775827f4b8d8561c7d73289695f','4de08488a8b14b5f8732b81ed413f54a','video'),('0baba5fa7e3f479a9f4f94f8f99a331a','ade2209a7bea4816952340c852e2c228','video'),('0ee92d52d352441db6bc8df74c83a748','d3b4fb654c9645d189d905f75279f747','video'),('141faa6c65df452495c130a04c30918e','53eb35ea31164d79bc8c4eb4c2a1711f','video'),('145d7ae584084703b8e6c6c29a419594','5d3e5cdb48b04ee2af493147bac858a9',NULL),('19ad3a63a68144f08ee80422bf983349','12ca2eee099c48dba95fd00e284a643d','video'),('1d9016e7f3714825a18ada6ee53782f7','fff0efb3734a4228ba62081ebf08e1b2','video'),('241359a4401547b8a274eac3e572767b','6c7a7e00c24f4818baa13ed6447164e8',NULL),('336a26dac3f2404b98de8af092aa1a01','6768c9e3e4fe489db6e0ccffc1ed9650',NULL),('36d249b91fff4d2fb7057d5887351c61','8b80d69687b04a6d99ed7b2c59cc1938','video'),('36d8154911f144f0ab647921eb6962aa','d64081c8a92449618b396b417e8368f0','video'),('3aa357e112cb43fc826320809828e4bc','f2f4f70de13e4c2bab9fb633921bb94b','video'),('3e5ccdc843434bb781ef40a93ae32e25','359994a1d40c4679bcc79b0b487f629a',NULL),('4119fc15e8d04cb8bb5cd761fcbb64a2','e4b395b73b5848dabf84a3f8a92d2cc4','video'),('4155dd227c1d4a8ebe88cfb91292750b','b3bed530cdbf4c23a987fc15002096cf','video'),('438c920e6253407db8df1b6964188084','f9ac669182314db28cc5858a9d2d6005',NULL),('4564f498139f47d28dc1069fc6b3a639','4c22e2eb34bb4779a5e585d9c394c987','video'),('48ad6fd10adc4b81bfc7ad988d082634','843b3421f3dc4607a2c4eb91d7710dda','video'),('4fba93dd0edc402a9bd1f6058db3f0a9','ad9ec3841cdf43ad9b16a00768bf0b2a','video'),('4fd4ca25da4c49ce918aba921293902c','ced414e0697d424f98e06f6bafca3ba8','video'),('5138bf663f044801a90e26627e99a5fc','e639e931d6154c1a9468bcb7fde5a83a','video'),('521bf07d09d844bf92774fb268d25faf','fb5419abe11c42d9a825ef5e9b00a0f7','video'),('536b434830e848358fba7dfd0b467a8f','d719ee60899f40ce8f0bbdcf37ab9a66','video'),('599efba82d2c47b79b801ef2219f28de','fb7d8e5939b2487eb8b8fc109d199241','video'),('5c9383bece71432fab9ceba3e6536e6c','0ba42041d2484614bbaabcf5b896eebd','video'),('5cb7b36673ef41809e8fb23a4acabd02','a9867cdbf1694c7d9708cdbd5a3c6481','video'),('5ce4f15733354c0db6cbdf601455ef1f','b3453e612e1746489e884c19c3d0020c','video'),('655ef7e0d26e4320b974c133e3aff7be','a862c23f190342d8b0d807b062d45bfa','video'),('6b7ea586cfd745ba8043a780a9adcbc6','d3c70d40ff0e4f26a59239cf5b1491b1','video'),('6eb471981ca84cbfa295de9fe5fb70e7','e97d4a82309d47258d733efc10905d39','video'),('714f9c90e40d4933ac19c1ce92e54b4c','d1d09a226b65495d9ac380a9bf4b3112','video'),('781a549d230d455f894d9741016f416a','2566a663d47546a0b79d7a3c75d618cc','video'),('7d7cbe13f8fb461191f96b751a398642','410a2eacc22d4c1e86664f0257da90c3','video'),('7f8ebe02a65342d385b73fad9823b436','7323887fb56e4269baab1383fdcb1bb9','video'),('80849f0347e345f3b6a91533c1de150c','932bfe1baea7410f866bf4c8373bdcc7',NULL),('809d9ae6d695433abc2328c51c0a769d','9e7aac1fe5394e849db62f50526938bd',NULL),('84c8f61ad16f43269b744cfd2c221022','c9f896d193d94ff881a99fe8cc6b480a','video'),('89f38f1933254aa6b874a9b1b6159e0e','5bb8cc93f55d4f1cb4446c1c38497f75','video'),('8ad20c706fe44a3da6dc42a85e511f9a','9c749e9ac1f740a1baf6b9334d82c0f3','video'),('8c8b4690f5b04f1c8181b1ba4930b54a','b42640bdac6b4c9092c30a10bab693a0','video'),('8eb496ea97df49c59988f76247fd3fb5','992dff3083f342bd88884bb635c779ac','video'),('8ecc1946dd374bfeabe098c5a81a5b70','7de489859d4a44da8666aa4af3ee5202',NULL),('90c44cff6d564f889678dda6cb22b985','a5d83ea9c7c24b2389cb8cf304603b01','video'),('91d7c86bfde2481999524c38f6d688b1','ffebecb965f2465c89d53dd93621aa70','video'),('94042ae0f1fe440aa7cf231388dfe74f','b0c0e51f3898415790c02061402331ee','video'),('98cf187631524696a06ea586df915645','3841aa97ebb14bbeb839b1c5206cd64c','video'),('9a7c53d9b86143adabbb3f13b6393043','694072a4fb52412b9fe8a58538862fac','video'),('9dbfa6d77981492caabc70c67e9fdf36','e7fbfcd921764f99a7b310a6e8989bd3','video'),('a69a4f8bff1c4a4dbeb8dddb54b4d4c9','d90e4135c9db432e9c67abe44c85b903','video'),('a98f9a37a026462381d0ddb3ab570065','469b77d70cfa4e8187ae253fa7af9433',NULL),('ac2b1be414c345bda64b1f75a4e7fe0a','cbf18236393546a5815c10e0331644b5','video'),('c4f4e9e96a1148efaec86eb53c2188e7','61514e6d9e054cc3aea4317aee45bed6','video'),('c73e765f3b3a46379492575047742598','1e6a49a5b15d451eb1956564e6065549',NULL),('c9d59e4e4a36454cb476bf9c80bac184','3faaf2dd45324e00a616130ada0f3bc4','video'),('cb3331287a7442cbbd5eda7d6e2714ca','d56e258a981d49529fd225c9a2812dbb','video'),('cc69e97256f4482e99d6069d60e988fb','b421e8fc51e94d7bb15a325aadb4ba1e','video'),('ce7a7c4d084943a9a9b31c564247bc35','6337966aa3e74ff49250782b666a7c54',NULL),('cf9727916a3941a3abcda7e17647ae42','d318cebdb5e64e0bafdf6fa190b05d63','video'),('d03ae2af2aeb435480c80ce49100685f','6bd3da722ca34228ac1ec143ea778627',NULL),('d5a5d5ab47cc4ac0ab0f6a6498e12c33','2371461ebd3d489799915f31d1d8d116','video'),('dfe5bf714469432cb7a15892fef0bf71','b80d57a096ff4b8c9b6223a78ced0075','video'),('eba6341115164c8d8802c2c54e82cc25','60cf44d67ad4408e8b79bdb1f0ebf22e','video'),('ef5ddd89452a4bf2a6c5b030df6a73d7','76ed33c890e8497bb7dfd6b719700b5a','video'),('f26c0e3d5615422db6a9dc2eb3e8a8d7','1d4ef128a6824f7ea312cb70f7ff9f3a','video'),('f9541164ccb34678bf4f51d88fd770bd','3f6bcbb6fa13488aa85a93ec47effcab',NULL),('fc91c863084540efa114e9a1fccd9d74','7bf50856c94a40cb8dc1961cfcb9603b','video');

/*Table structure for table `rule` */

DROP TABLE IF EXISTS `rule`;

CREATE TABLE `rule` (
  `RULE_ID` varchar(32) NOT NULL,
  `ACTION` varchar(50) DEFAULT NULL,
  `CREDIT` int(11) DEFAULT NULL,
  `GOLD` int(11) DEFAULT NULL,
  `REMARK` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rule` */

insert  into `rule`(`RULE_ID`,`ACTION`,`CREDIT`,`GOLD`,`REMARK`) values ('1','修改昵称',NULL,5,NULL);

/*Table structure for table `sensitive_words` */

DROP TABLE IF EXISTS `sensitive_words`;

CREATE TABLE `sensitive_words` (
  `SENSITIVE_WORDS_ID` varchar(32) NOT NULL,
  `REPLACE_WORD` varchar(50) DEFAULT NULL,
  `SENSITIVE_WORD` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SENSITIVE_WORDS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sensitive_words` */

/*Table structure for table `team` */

DROP TABLE IF EXISTS `team`;

CREATE TABLE `team` (
  `TEAM_ID` varchar(32) NOT NULL,
  `APPLY_DATE` datetime DEFAULT NULL,
  `APPROVE_DATE` datetime DEFAULT NULL,
  `CONSTRUCTION` int(11) DEFAULT NULL,
  `TEAM_INTRO` varchar(200) DEFAULT NULL,
  `TEAM_NAME` varchar(50) DEFAULT NULL,
  `TEAM_STATE` varchar(50) DEFAULT NULL,
  `TYPE` varchar(50) DEFAULT NULL,
  `IMAGE_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`TEAM_ID`),
  KEY `FK_cllkkf87m38k07aud358alytp` (`IMAGE_ID`),
  CONSTRAINT `FK_cllkkf87m38k07aud358alytp` FOREIGN KEY (`IMAGE_ID`) REFERENCES `head_image` (`IMAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `team` */

insert  into `team`(`TEAM_ID`,`APPLY_DATE`,`APPROVE_DATE`,`CONSTRUCTION`,`TEAM_INTRO`,`TEAM_NAME`,`TEAM_STATE`,`TYPE`,`IMAGE_ID`) values ('12328c2f401d4b72900a40ba44d241d3','2016-02-17 20:09:24','2016-02-17 20:17:57',10,'爱Coding，爱Java2','我们的Java','批准','计算机','70328611d330411ca1d438ba70a10ccc');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `USER_ID` varchar(32) NOT NULL,
  `BIRTHDAY` date DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL,
  `CREDIT` int(11) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `GENDER` varchar(50) DEFAULT NULL,
  `GOLD` int(11) DEFAULT NULL,
  `INTRO` varchar(200) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `QQ` varchar(200) DEFAULT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `USER_STATE` varchar(50) DEFAULT NULL,
  `WECHAT` varchar(200) DEFAULT NULL,
  `IMAGE_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `FK_g8u2gilas7pn7p1wsjkedefp4` (`IMAGE_ID`),
  CONSTRAINT `FK_g8u2gilas7pn7p1wsjkedefp4` FOREIGN KEY (`IMAGE_ID`) REFERENCES `head_image` (`IMAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`USER_ID`,`BIRTHDAY`,`CITY`,`CREDIT`,`EMAIL`,`GENDER`,`GOLD`,`INTRO`,`PASSWORD`,`QQ`,`USERNAME`,`USER_STATE`,`WECHAT`,`IMAGE_ID`) values ('07d56b1ebc76495080d1e82ff0f36fe4',NULL,NULL,1,'admin@tinymooc.com','男',10,NULL,'admin92',NULL,'管理员','管理员',NULL,'e0a069a4605e4d3a9854d1da83a019fa'),('0d82eddbd6ad4534ba10f597c781d9b0','1934-03-03','xm',11,'215298955@qq.com','男',1,'介绍','199214',NULL,'kotori','激活',NULL,'70328611d330411ca1d438ba70a103da'),('691ef4ccfb0743a2ad1f41f51ecfe121','1994-01-04','厦门',101,'932191671@qq.com','男',13117,'testname1的个人介绍','2015XMUxmu','88888','ChenLi','激活','testwechat','70328611d330411ca1d438ba70a103da'),('691ef4ccfb0743a2ad1f41f51ecfe122','2015-11-12','厦门2',102,'932191672@qq.com','男',202,'testname2的个人介绍','2015XMUxmu',NULL,'testname2','激活',NULL,'70328611d330411ca1d438ba70a103da'),('691ef4ccfb0743a2ad1f41f51ecfe123','2015-11-13','厦门3',103,'932191673@qq.com','女',203,'testname3的个人介绍','2015XMUxmu',NULL,'testname3','激活',NULL,'70328611d330411ca1d438ba70a103da'),('691ef4ccfb0743a2ad1f41f51ecfe124','2015-11-14','厦门4',104,'932191674@qq.com','女',204,'testname4的个人介绍','2015XMUxmu',NULL,'testname4','激活',NULL,'70328611d330411ca1d438ba70a103da'),('691ef4ccfb0743a2ad1f41f51ecfe125','2015-11-15','厦门5',105,'932191675@qq.com','女',205,'testname5的个人介绍','2015XMUxmu',NULL,'testname5','激活',NULL,'70328611d330411ca1d438ba70a103da'),('691ef4ccfb0743a2ad1f41f51ecfe126','2015-11-16','厦门6',106,'932191676@qq.com','女',206,'testname6的个人介绍','2015XMUxmu',NULL,'testname6','激活',NULL,'70328611d330411ca1d438ba70a103da'),('691ef4ccfb0743a2ad1f41f51ecfe127','2015-11-17','厦门7',107,'932191677@qq.com','男',207,'testname7的个人介绍','2015XMUxmu',NULL,'testname7','激活',NULL,'70328611d330411ca1d438ba70a103da'),('691ef4ccfb0743a2ad1f41f51ecfe128','2015-11-18','厦门8',108,'932191678@qq.com','男',208,'testname8的个人介绍','2015XMUxmu',NULL,'testname8','激活',NULL,'70328611d330411ca1d438ba70a103da'),('691ef4ccfb0743a2ad1f41f51ecfe129','2015-11-19','厦门9',109,'932191679@qq.com','男',10,'testname9的个人介绍','2015XMUxmu',NULL,'testname9','激活',NULL,'70328611d330411ca1d438ba70a103da');

/*Table structure for table `user_course` */

DROP TABLE IF EXISTS `user_course`;

CREATE TABLE `user_course` (
  `USER_COURSE_ID` varchar(32) NOT NULL,
  `LEARN_STATE` varchar(50) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `USER_POSITION` varchar(50) DEFAULT NULL,
  `COURSE_ID` varchar(32) DEFAULT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_COURSE_ID`),
  KEY `FK_s5b0gh1aii0ih1yi9pk1vlo6v` (`COURSE_ID`),
  KEY `FK_70yfm6oh4yqolh6fgivfjns7c` (`USER_ID`),
  CONSTRAINT `FK_70yfm6oh4yqolh6fgivfjns7c` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`),
  CONSTRAINT `FK_s5b0gh1aii0ih1yi9pk1vlo6v` FOREIGN KEY (`COURSE_ID`) REFERENCES `course` (`COURSE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_course` */

insert  into `user_course`(`USER_COURSE_ID`,`LEARN_STATE`,`START_DATE`,`USER_POSITION`,`COURSE_ID`,`USER_ID`) values ('08dc8d7019ab408dbe18d9f68d9d3419',NULL,NULL,'创建者','d64081c8a92449618b396b417e8368f0','691ef4ccfb0743a2ad1f41f51ecfe121'),('0fffd3fd8a524c858310f1f9bfac166d',NULL,NULL,'创建者','53eb35ea31164d79bc8c4eb4c2a1711f','691ef4ccfb0743a2ad1f41f51ecfe121'),('2391909e189a4b1ca37eec8963fc2cff','学习中','2016-02-17 19:59:14','学员','9c749e9ac1f740a1baf6b9334d82c0f3','0d82eddbd6ad4534ba10f597c781d9b0'),('3573bb6660324f5f985b991085308a5e',NULL,NULL,'创建者','4d107ef28754495ba9da5ddbf46676fa','691ef4ccfb0743a2ad1f41f51ecfe121'),('35a2d3a06bcb40879025425a2d7bf9af','学习中','2016-02-17 18:58:33','学员','4de08488a8b14b5f8732b81ed413f54a','691ef4ccfb0743a2ad1f41f51ecfe121'),('3ea8ebc5906c40848da3c439402d64c5',NULL,NULL,'创建者','b421e8fc51e94d7bb15a325aadb4ba1e','691ef4ccfb0743a2ad1f41f51ecfe121'),('40832f78ff2f4e41a05066aea2025a4a',NULL,NULL,'创建者','494bd36c5fdc4d90b7f50b065b8112db','0d82eddbd6ad4534ba10f597c781d9b0'),('4ac19d89b19d4924b2603fd73629e7b7',NULL,NULL,'创建者','ffebecb965f2465c89d53dd93621aa70','0d82eddbd6ad4534ba10f597c781d9b0'),('51ca3e9752eb41cca907b65a9379ba18',NULL,NULL,'创建者','b3453e612e1746489e884c19c3d0020c','691ef4ccfb0743a2ad1f41f51ecfe121'),('522c2dbe547c4c0994ca3289a0acdc77','学习中','2016-01-24 20:05:26','学员','494bd36c5fdc4d90b7f50b065b8112db','691ef4ccfb0743a2ad1f41f51ecfe122'),('6a6f433ab2a44b509112f274c247dbc2',NULL,NULL,'创建者','d3c70d40ff0e4f26a59239cf5b1491b1','0d82eddbd6ad4534ba10f597c781d9b0'),('6dbad28b56d4464aa0f25b985247a623',NULL,NULL,'创建者','c9f896d193d94ff881a99fe8cc6b480a','691ef4ccfb0743a2ad1f41f51ecfe121'),('6dbad28b56d4464aa0f25b985247a624',NULL,NULL,'创建者','e05aa3bd1ba74b09ad21ce8e24e64bed','691ef4ccfb0743a2ad1f41f51ecfe121'),('7084426e452842839159892282b927de',NULL,NULL,'创建者','a9867cdbf1694c7d9708cdbd5a3c6481','691ef4ccfb0743a2ad1f41f51ecfe121'),('7625e907d52c4747b229b7680c4cb710',NULL,NULL,'创建者','0ba42041d2484614bbaabcf5b896eebd','0d82eddbd6ad4534ba10f597c781d9b0'),('85a87609515e474bbcde77da0ea6fd81',NULL,NULL,'创建者','12ca2eee099c48dba95fd00e284a643d','691ef4ccfb0743a2ad1f41f51ecfe121'),('917e7fc421dc4d319390fe9a0bf3d900','学习中','2016-01-26 19:21:31','学员','494bd36c5fdc4d90b7f50b065b8112db','691ef4ccfb0743a2ad1f41f51ecfe121'),('945b017dcecb4dd8a8b0c504be3adbf8',NULL,NULL,'创建者','2371461ebd3d489799915f31d1d8d116','0d82eddbd6ad4534ba10f597c781d9b0'),('94cb377fb9a843f582d4c9796d7c7e63',NULL,NULL,'创建者','4de08488a8b14b5f8732b81ed413f54a','0d82eddbd6ad4534ba10f597c781d9b0'),('9c77d2ee592548ffad9b107a29240e86',NULL,NULL,'创建者','d318cebdb5e64e0bafdf6fa190b05d63','691ef4ccfb0743a2ad1f41f51ecfe121'),('b18a160e4c024bd98148382d9b10945b',NULL,NULL,'创建者','3faaf2dd45324e00a616130ada0f3bc4','691ef4ccfb0743a2ad1f41f51ecfe121'),('b6732447216248dcb4d45a00141aa027',NULL,NULL,'创建者','fc317eeea0854db88b466ee9db2969ab','691ef4ccfb0743a2ad1f41f51ecfe121'),('c0055ad316fa470a80b4d73cfbfd2f1f',NULL,NULL,'创建者','7bf50856c94a40cb8dc1961cfcb9603b','0d82eddbd6ad4534ba10f597c781d9b0'),('c1ff55de41c9476f83d79ea2e60bdaf8',NULL,NULL,'创建者','60cf44d67ad4408e8b79bdb1f0ebf22e','0d82eddbd6ad4534ba10f597c781d9b0'),('c9e70b41be7541529d685ce4726abdaf',NULL,NULL,'创建者','b3bed530cdbf4c23a987fc15002096cf','0d82eddbd6ad4534ba10f597c781d9b0'),('d24f23c1bc554486a2c7e48061591bd4',NULL,NULL,'创建者','d719ee60899f40ce8f0bbdcf37ab9a66','691ef4ccfb0743a2ad1f41f51ecfe121'),('ec88fdbc3bf9457bbe7b69627be743f8',NULL,NULL,'创建者','2566a663d47546a0b79d7a3c75d618cc','0d82eddbd6ad4534ba10f597c781d9b0'),('eec49babbf4a41cf9d3d86fc767770ce',NULL,NULL,'创建者','f2f4f70de13e4c2bab9fb633921bb94b','0d82eddbd6ad4534ba10f597c781d9b0'),('ef73d7d6b30e429bb1d0ebdae7be0a49',NULL,NULL,'创建者','4c22e2eb34bb4779a5e585d9c394c987','0d82eddbd6ad4534ba10f597c781d9b0'),('f61622084ae24f71a8588fc125517549',NULL,NULL,'创建者','843b3421f3dc4607a2c4eb91d7710dda','0d82eddbd6ad4534ba10f597c781d9b0'),('fa1896457e7149659e9e1ed600e6f904',NULL,NULL,'创建者','cbf18236393546a5815c10e0331644b5','0d82eddbd6ad4534ba10f597c781d9b0'),('fd0a94c46cd1477fa082e963b3c112ca','学习中','2016-01-22 15:57:03','学员','076e439d4a474a49842bba5a3b7f7eb6','691ef4ccfb0743a2ad1f41f51ecfe122'),('ff9b4a20b64048378b7b4be835ce6273',NULL,NULL,'创建者','ade2209a7bea4816952340c852e2c228','0d82eddbd6ad4534ba10f597c781d9b0');

/*Table structure for table `user_prop` */

DROP TABLE IF EXISTS `user_prop`;

CREATE TABLE `user_prop` (
  `USER_PROP_ID` varchar(32) NOT NULL,
  `NUMBER` int(11) DEFAULT NULL,
  `PROP_ID` varchar(32) DEFAULT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_PROP_ID`),
  KEY `FK_73cq51gvbb2i3kk82xn7nx7q6` (`PROP_ID`),
  KEY `FK_fjew8um86sjde8ye8d9ajw7uk` (`USER_ID`),
  CONSTRAINT `FK_73cq51gvbb2i3kk82xn7nx7q6` FOREIGN KEY (`PROP_ID`) REFERENCES `prop` (`PROP_ID`),
  CONSTRAINT `FK_fjew8um86sjde8ye8d9ajw7uk` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_prop` */

/*Table structure for table `user_team` */

DROP TABLE IF EXISTS `user_team`;

CREATE TABLE `user_team` (
  `USER_TEAM_ID` varchar(32) NOT NULL,
  `APPLY_DATE` datetime DEFAULT NULL,
  `APPROVE_DATE` datetime DEFAULT NULL,
  `CONTRIBUTION` int(11) DEFAULT NULL,
  `USER_POSITION` varchar(18) DEFAULT NULL,
  `USER_STATE` varchar(18) DEFAULT NULL,
  `TEAM_ID` varchar(32) DEFAULT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_TEAM_ID`),
  KEY `FK_h88j3fttig49v2mgbl8xf5581` (`TEAM_ID`),
  KEY `FK_r520om1wpkypopaagq1bkgysf` (`USER_ID`),
  CONSTRAINT `FK_h88j3fttig49v2mgbl8xf5581` FOREIGN KEY (`TEAM_ID`) REFERENCES `team` (`TEAM_ID`),
  CONSTRAINT `FK_r520om1wpkypopaagq1bkgysf` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_team` */

insert  into `user_team`(`USER_TEAM_ID`,`APPLY_DATE`,`APPROVE_DATE`,`CONTRIBUTION`,`USER_POSITION`,`USER_STATE`,`TEAM_ID`,`USER_ID`) values ('838bb492630f45b2b928a342a8b4212c','2016-02-17 20:09:24','2016-02-17 20:09:24',10,'组长','批准','12328c2f401d4b72900a40ba44d241d3','0d82eddbd6ad4534ba10f597c781d9b0'),('85c4d4e7016440729e5d768a6b2d704f','2016-02-17 20:21:05','2016-02-19 14:07:53',0,'组员','批准','12328c2f401d4b72900a40ba44d241d3','691ef4ccfb0743a2ad1f41f51ecfe121');

/*Table structure for table `video` */

DROP TABLE IF EXISTS `video`;

CREATE TABLE `video` (
  `RESOURCE_ID` varchar(32) NOT NULL,
  `VIDEO_URL` varchar(100) DEFAULT NULL,
  `TENCENT_VIDEO_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `video` */

insert  into `video`(`RESOURCE_ID`,`VIDEO_URL`,`TENCENT_VIDEO_ID`) values ('01006f7d271a494aa754372f100b040d','01.01_计算机基础(计算机概述).avi','14651978969256225702'),('0aed8775827f4b8d8561c7d73289695f','python在线教学-01-走进python.flv','14651978969256254066'),('141faa6c65df452495c130a04c30918e','08springmvc异常处理-全局异常处理器开发.avi','14651978969256244985'),('19ad3a63a68144f08ee80422bf983349','09springmvc异常处理-抛出异常.avi','14651978969256244990'),('36d249b91fff4d2fb7057d5887351c61','05.01_Java语言基础(方法概述和格式说明).avi','14651978969256225712'),('36d8154911f144f0ab647921eb6962aa','03springmvc注解开发-springmvc参数绑定-数组.avi','14651978969256244962'),('3aa357e112cb43fc826320809828e4bc','python在线教学-13-流程控制-循环控制.flv','14651978969256254108'),('4119fc15e8d04cb8bb5cd761fcbb64a2','07.01_面向对象(成员变量和局部变量的区别).avi','14651978969256225720'),('4155dd227c1d4a8ebe88cfb91292750b','python在线教学14-流程控制-while.flv','14651978969256254109'),('4564f498139f47d28dc1069fc6b3a639','python在线教学-02-开始编程吧.flv','14651978969256254067'),('48ad6fd10adc4b81bfc7ad988d082634','python在线教学-04-运算符-表达式.flv','14651978969256254069'),('536b434830e848358fba7dfd0b467a8f','01springmvc第一天课程复习.avi','14651978969256244950'),('5c9383bece71432fab9ceba3e6536e6c','python在线教学-08-字典.flv','14651978969256254103'),('5cb7b36673ef41809e8fb23a4acabd02','02springmvc参数绑定-包装类型pojo参数绑定.avi','14651978969256244957'),('5ce4f15733354c0db6cbdf601455ef1f','07springmvc注解开发-数据回显.avi','14651978969256244979'),('6b7ea586cfd745ba8043a780a9adcbc6','python在线教学-09-流程控制-if.flv','14651978969256254104'),('781a549d230d455f894d9741016f416a','python在线教学-05-数据类型-数字-字符串.flv','14651978969256254070'),('7f8ebe02a65342d385b73fad9823b436','04.01_Java语言基础(选择结构switch语句的格式及其解释).avi','14651978969256225709'),('84c8f61ad16f43269b744cfd2c221022','LL剧场版.mp4','14651978969256244875'),('8ad20c706fe44a3da6dc42a85e511f9a','02.02_Java语言基础(标识符的概述和组成规则).avi','14651978969256225703'),('8c8b4690f5b04f1c8181b1ba4930b54a','03.02_Java语言基础(算术运算符的基本用法).avi','14651978969256225705'),('91d7c86bfde2481999524c38f6d688b1','python在线教学-10-流程控制-逻辑.flv','14651978969256254105'),('94042ae0f1fe440aa7cf231388dfe74f','08.01_面向对象(工具类中使用静态).avi','14651978969256225725'),('9a7c53d9b86143adabbb3f13b6393043','06.01_Java语言基础(二维数组概述和格式1的讲解).avi','14651978969256225713'),('ac2b1be414c345bda64b1f75a4e7fe0a','python在线教学-06-元组.flv','14651978969256254072'),('c4f4e9e96a1148efaec86eb53c2188e7','10.01_面向对象(运动员和教练案例分析).avi','14651978969256225728'),('c9d59e4e4a36454cb476bf9c80bac184','04springmvc注解开发-springmvc参数绑定-list.avi','14651978969256244964'),('cc69e97256f4482e99d6069d60e988fb','06springmvc注解开发-validation校验-分组校验.avi','14651978969256244975'),('cf9727916a3941a3abcda7e17647ae42','05springmvc注解开发-validation校验-商品修改校验.avi','14651978969256244969'),('d5a5d5ab47cc4ac0ab0f6a6498e12c33','python在线教学-03-变量.flv','14651978969256254068'),('eba6341115164c8d8802c2c54e82cc25','python在线教学-12-流程控制-遍历序列及字典.flv','14651978969256254107'),('ef5ddd89452a4bf2a6c5b030df6a73d7','09.01_面向对象(final关键字引入).avi','14651978969256225726'),('fc91c863084540efa114e9a1fccd9d74','python在线教学-11-流程控制-for.flv','14651978969256254106');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
