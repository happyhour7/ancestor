# Host: 10.20.107.253  (Version: 5.1.73-community)
# Date: 2015-08-18 19:03:45
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "admin"
#

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `userphoto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "admin"
#

INSERT INTO `admin` VALUES (1,'管理员','admin',NULL,'admin',NULL);

#
# Structure for table "advs"
#

DROP TABLE IF EXISTS `advs`;
CREATE TABLE `advs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "advs"
#

INSERT INTO `advs` VALUES (5,'admin','firstpage-top','0.15174923790618777.jpg','http://www.baidu.com'),(8,'admin','firstpage-left-top','0.15174923790618777.jpg','http://www.baidu.com'),(9,'admin','firstpage-left-mid','0.17376918881200254.jpg','http://www.baidu.com'),(10,'admin','firstpage-left-bottom','0.2883514794521034.jpg','http://www.baidu.com');

#
# Structure for table "advuser"
#

DROP TABLE IF EXISTS `advuser`;
CREATE TABLE `advuser` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "advuser"
#

INSERT INTO `advuser` VALUES (2,'admin','ww3ww3','admin','firstpage-top,firstpage-left-top,firstpage-left-mid,firstpage-left-bottom,innerpage-left-top,innerpage-left-bottom');

#
# Structure for table "files"
#

DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `secretType` varchar(45) DEFAULT NULL,
  `secretSubType` varchar(45) DEFAULT NULL,
  `secretGrandSubType` varchar(45) DEFAULT NULL,
  `secretLimit` int(11) DEFAULT NULL,
  `secretMainType` varchar(45) DEFAULT NULL,
  `secretHope` varchar(45) DEFAULT NULL,
  `secretCity` varchar(45) DEFAULT NULL,
  `secretDate` varchar(45) DEFAULT NULL,
  `secretKeyWord` varchar(45) DEFAULT NULL,
  `secretTitle` varchar(45) DEFAULT NULL,
  `secretBackground` varchar(45) DEFAULT NULL,
  `secretContent` varchar(45) DEFAULT NULL,
  `secretKnown` varchar(45) DEFAULT NULL,
  `othername` varchar(45) DEFAULT NULL,
  `othersex` int(11) DEFAULT NULL,
  `otherage` varchar(45) DEFAULT NULL,
  `otherBuildName` varchar(45) DEFAULT NULL,
  `otheraddress` varchar(200) DEFAULT NULL,
  `secretPrice` int(11) DEFAULT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `secretLimitTime` varchar(45) DEFAULT NULL,
  `longstory` varchar(1000) DEFAULT NULL,
  `islongstory` int(11) DEFAULT '0',
  `score` int(11) DEFAULT NULL,
  `goodNum` int(11) DEFAULT NULL,
  `badNum` int(11) DEFAULT NULL,
  `advimg` varchar(255) DEFAULT NULL,
  `advlink` varchar(255) DEFAULT NULL,
  `advlocation` varchar(255) DEFAULT NULL,
  `filetype` int(11) DEFAULT '1',
  `createTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='帖子';

#
# Data for table "files"
#

INSERT INTO `files` VALUES (9,'我爱','友情','',0,'WO的秘密','求祝福','南京','2015-08-04','关键词','标题','背景','正文','感悟','undefined',0,'undefined','undefined','undefined',0,'test',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(10,'我恨','爱人','',2,'WO的秘密','求祝福','南京','2015-08-04','这是第一个秘密哦','这是第一个秘密哦','这是第一个秘密哦','这是第一个秘密哦','这是第一个秘密哦','',0,'','','',0,'william wang',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(48,'','','',1,'','','南京','','关键词','','','','','',0,'21~25','','',0,'test','','阿萨德法师打发撒的发生的发生地方',2,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(49,'','','',1,'','','南京','','关键词','','','','','',0,'26~30','','',0,'test','','asdfasdfasdfasdfasdfasdfadsf',2,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(50,'','','',1,'','','南京','Tue Aug 11 2015 20:05:21 GMT+0800 (中国标准时间)','关键词','','','','','',0,'21~25','','',0,'test','','asdfasdfasdfasdf',2,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(51,'','','',1,'','','南京','2015-08-11 20:07','关键词','','','','','',0,'21~25','','',0,'test','','asdfasdfasdfasdfasdfasdf',2,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(52,'我恨','老师','',0,'WO的秘密','求指点','南京','2015-08-14','关键词','标题','背景','正文','感悟','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(53,'我爱','爱情','',0,'WO的秘密','求治疗','南京','2015-08-12','关键词','标题','','','','',0,'','','',0,'test','','这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(54,'私人秘密\r\n                ','同学','身体',0,'TA的秘密','','南京','2015-08-12','关键词','标题','','','','不知道',0,'21~25','','',0,'test','','ta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_',1,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(55,'私人秘密\r\n                ','爱人','品德',0,'TA的秘密','','南京','2015-08-12','关键词','TA的秘密测试','刚刚发的背景','刚刚发的正文','刚刚发的感悟','不知道',0,'10~15','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(56,'商家秘密\r\n                  ','酒店','特殊服务',0,'TA的秘密','','南京','2015-08-11','关键词','商家秘密长文','','','','',0,'','地标或大楼','街道信息',0,'test','','商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(57,'\r\n                  私人秘密\r\n                  \r','本人','技能',1,'出售秘密','','','','关键词','出售秘密长文','','','','',0,'','','',23,'test','','出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文',1,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(58,'\r\n                  商家秘密\r\n                  \r','咖啡馆','真假',1,'出售秘密','','','2015-08-12','关键词','出售商家秘密长文','','','','',0,'','地标或大楼','街道信息',12,'test','','出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文',1,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(59,'\r\n                  私人秘密\r\n                  \r','亲人','品德',1,'悬赏秘密','','南京','2015-08-12','关键词','标题','','','','不知道',0,'16~20','','',12,'test','2015-08-12','悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文',1,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(60,'\r\n                  商家秘密\r\n                  \r','咖啡馆','其他',1,'悬赏秘密','','南京','2015-08-12','关键词','标题','','','','',0,'','地标或大楼','街道信息',12,'test','2015-08-12','悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文',1,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(61,'我恨','爱人','',0,'WO的秘密','求指点','南京','2015-08-16','南京','南京','背景','正文','感悟','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(62,'我想','破处','',0,'WO的秘密','求指点','南京','2015-08-05','南京','南京','啊撒的发生的发大水','阿萨德发的说法','阿萨德发生的发生地方','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(63,'我想','破处','',0,'WO的秘密','求指点','南京','2015-08-05','南京','南京','啊撒的发生的发大水','阿萨德发的说法','阿萨德发生的发生地方','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(64,'我恨','爱人','',0,'WO的秘密','求骂醒','南京','2015-08-13','这是登陆','这是登陆后发布的','这是登陆后发布的','这是登陆后发布的','这是登陆后发布的','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(65,'我恨','爱人','',0,'WO的秘密','求骂醒','南京','2015-08-13','这是登陆','这是登陆后发布的','这是登陆后发布的','这是登陆后发布的','这是登陆后发布的','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(67,'我爱','友情','',0,'WO的秘密','求指点','南京','2015-08-17','南京','南京','这是先发表再登陆','这是先发表再登陆','这是先发表再登陆','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(68,'我做过','欺骗','',0,'WO的秘密','求祝福','南京','2015-08-16','南京','南京','asdfasdf','asdfasd','fasdfasdfdas','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(69,'我做过','欺骗','',0,'WO的秘密','求祝福','南京','2015-08-16','南京','南京','asdfasdf','asdfasd','fasdfasdfdas','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(70,'我做过','欺骗','',0,'WO的秘密','求祝福','南京','2015-08-16','南京','南京','asdfasdf','asdfasd','fasdfasdfdas','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(71,'我做过','欺骗','',0,'WO的秘密','求祝福','南京','2015-08-16','南京','南京','asdfasdf','asdfasd','fasdfasdfdas','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(72,'我做过','欺骗','',0,'WO的秘密','求祝福','南京','2015-08-16','南京','南京','asdfasdf','asdfasd','fasdfasdfdas','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(73,'我做过','欺骗','',0,'WO的秘密','求祝福','南京','2015-08-16','南京','南京','asdfasdf','asdfasd','fasdfasdfdas','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(74,'我做过','欺骗','',0,'WO的秘密','求祝福','南京','2015-08-16','南京','南京','asdfasdf','asdfasd','fasdfasdfdas','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(75,'我恨','同学','',0,'WO的秘密','求祝福','南京','2015-08-12','关键词','标题','asdfasdfasdfasdfasdfasdfasdfasdfasdf','asdfasdf','asdfasdfasdf','',0,'','','',0,'2015-08-18 14:20:39','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(76,'我恨','同学','',0,'WO的秘密','求祝福','南京','2015-08-12','关键词','标题','asdfasdfasdfasdfasdfasdfasdfasdfasdf','asdfasdf','asdfasdfasdf','',0,'','','',0,'2015-08-18 14:20:39','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(77,'我恨','爱人','',0,'WO的秘密','求治疗','南京','2015-08-05','关键词','2015-8-18日秘密','2015-8-18日秘密','2015-8-18日秘密','2015-8-18日秘密','',0,'','','',0,'2015-08-18 14:23:11','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(78,'我想','破处','',0,'WO的秘密','求指点','南京','2015-08-18','关键词','2015-8-18日秘密','2015-8-18日秘密','2015-8-18日秘密','2015-8-18日秘密','',0,'','','',0,'2015-08-18 14:24:06','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL);

#
# Structure for table "friends"
#

DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `friendid` int(11) DEFAULT NULL,
  `friendname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "friends"
#

INSERT INTO `friends` VALUES (1,NULL,NULL,'william wang','test');

#
# Structure for table "isbad"
#

DROP TABLE IF EXISTS `isbad`;
CREATE TABLE `isbad` (
  `isbadId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `bad` int(11) DEFAULT NULL,
  `fileid` int(11) DEFAULT NULL,
  PRIMARY KEY (`isbadId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

#
# Data for table "isbad"
#

INSERT INTO `isbad` VALUES (16,'test',1,52),(17,'test',1,60),(18,'test',1,67),(19,'xishuai',1,66);

#
# Structure for table "isgood"
#

DROP TABLE IF EXISTS `isgood`;
CREATE TABLE `isgood` (
  `isgoodId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `good` int(255) DEFAULT NULL,
  `bad` int(11) DEFAULT NULL,
  `fileid` int(11) DEFAULT NULL,
  PRIMARY KEY (`isgoodId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

#
# Data for table "isgood"
#

INSERT INTO `isgood` VALUES (3,'test',1,NULL,9);

#
# Structure for table "orderdeal"
#

DROP TABLE IF EXISTS `orderdeal`;
CREATE TABLE `orderdeal` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `maintype` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `subtype` varchar(255) DEFAULT NULL,
  `grandsubtype` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `cityname` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "orderdeal"
#

INSERT INTO `orderdeal` VALUES (4,'WO的秘密','','','','test','南京',1,'26~30');

#
# Structure for table "replay"
#

DROP TABLE IF EXISTS `replay`;
CREATE TABLE `replay` (
  `replayId` int(11) NOT NULL AUTO_INCREMENT,
  `replayer` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `fileid` int(11) DEFAULT NULL,
  `replayTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replayId`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

#
# Data for table "replay"
#

INSERT INTO `replay` VALUES (1,'test','asdfasdfasdf',60,NULL),(2,'test','sadfasdfasdfasdf',60,NULL),(3,'test','sadfasdfasdfasdf',60,NULL),(4,'test','sadfasdfasdfasdf',60,NULL),(5,'test','sadfasdfasdfasdf',60,NULL),(6,'test','sadfasdfasdfasdf',60,NULL),(7,'test','sadfasdfasdfasdf',60,NULL),(8,'test','sadfasdfasdfasdf',60,NULL),(9,'test','sadfasdfasdfasdf',60,NULL),(10,'test','sderterwer',60,NULL),(11,'test','sadfasdfasdfasdf',60,NULL),(12,'test','sadfasdfasdfasdf',60,NULL),(13,'test','dfsdfsdfsdf',60,NULL),(14,'test','sadfasdfasdfasdf',60,NULL),(15,'test','sadfasdfasdfasdf',60,NULL),(16,'test','sadfasdfasdfasdf',60,NULL),(17,'test','sadfasdfasdfasdf',60,NULL),(18,'test','',9,''),(19,'test','',9,''),(20,'test','',9,''),(21,'test','',9,''),(22,'test','',9,''),(23,'test','',9,''),(24,'test','',9,''),(25,'test','',9,''),(26,'test','',9,''),(27,'test','',9,''),(28,'test','',9,''),(29,'test','$(this).prev().find',60,'2015-08-14 22:03:06'),(30,'test','dfdfsasdfasdf',52,'2015-08-15 12:56:52'),(31,'test','asdfasdfasdf',52,'2015-08-15 12:57:11'),(32,'test','asdfasdfasdf',52,'2015-08-15 12:57:12'),(33,'test','阿萨德发生的发生',61,'2015-08-18 18:42:29'),(34,'test','阿萨德发生的发生',61,'2015-08-18 18:42:31'),(35,'test','阿萨德发生的发生',61,'2015-08-18 18:42:38');

#
# Structure for table "score"
#

DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `scoreId` int(11) NOT NULL AUTO_INCREMENT,
  `fileid` int(255) DEFAULT NULL,
  `score` int(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`scoreId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

#
# Data for table "score"
#

INSERT INTO `score` VALUES (25,60,4,'test'),(27,9,6,'test'),(28,52,5,'test'),(29,53,8,'test'),(30,67,9,'test'),(31,66,6,'xishuai'),(32,82,6,'test');

#
# Structure for table "talk"
#

DROP TABLE IF EXISTS `talk`;
CREATE TABLE `talk` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `senduserid` int(11) DEFAULT NULL,
  `receiveruserid` int(11) DEFAULT NULL,
  `msg` varchar(500) DEFAULT NULL,
  `sendtime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "talk"
#


#
# Structure for table "userconfig"
#

DROP TABLE IF EXISTS `userconfig`;
CREATE TABLE `userconfig` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `addscore` int(11) DEFAULT '10',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "userconfig"
#


#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT '0',
  `usertype` int(11) DEFAULT '0' COMMENT '0:普通用户；1：广告主；2：咨询师',
  `score` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cityname` varchar(45) DEFAULT NULL,
  `qq` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `userPhoto` varchar(45) DEFAULT 'demo_logo.png',
  `address` varchar(200) DEFAULT NULL,
  `mark` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

#
# Data for table "users"
#

INSERT INTO `users` VALUES (1,'test','test',0,1,10,'happyhour7@163.com','南京','251619896','13813994215','0.06278088735416532.jpg','asdfasdf2323','asdfasdfasdfas'),(71,'asdfasdf','asdfasdf',1,1,10,'happyhour7@163.com','南京','2516198663','13813994215','demo_logo.png',NULL,NULL),(72,'xishuai','ww3ww3',1,1,10,'happyhour7@163.com','南京','2516198663','13813994215','demo_logo.png',NULL,NULL);

#
# Structure for table "agvscore"
#

DROP VIEW IF EXISTS `agvscore`;
CREATE VIEW `agvscore` AS 
  select sum(`score`.`score`) AS `total`,avg(`score`.`score`) AS `avgScore`,`score`.`fileid` AS `fileid` from `score` group by `score`.`fileid`;
