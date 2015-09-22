-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ancestor
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `userphoto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'管理员','admin',NULL,'admin',NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advs`
--

DROP TABLE IF EXISTS `advs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advs`
--

LOCK TABLES `advs` WRITE;
/*!40000 ALTER TABLE `advs` DISABLE KEYS */;
INSERT INTO `advs` VALUES (24,'大树','firstpage-left-mid','0.00162194250151515.jpg',''),(25,NULL,'firstpage-top',NULL,'http://www.baidu.com'),(29,'adv','innerpage-left-bottom',NULL,'http://s-199749.abc188.com/'),(30,'adv','innerpage-left-top',NULL,'http://s-199749.abc188.com/'),(31,'adv','firstpage-left-bottom',NULL,'http://s-199749.abc188.com/'),(35,NULL,'firstpage-left-mid',NULL,''),(36,'adv','firstpage-top','0.5842844860162586.jpg','http://s-199749.abc188.com/'),(37,'adv','firstpage-left-top','0.5842844860162586.jpg','http://s-199749.abc188.com/'),(38,'adv','firstpage-left-mid','0.5842844860162586.jpg',''),(39,'大树','firstpage-left-bottom','0.7764171380549669.jpg','http://s-199749.abc188.com/'),(40,'大树','innerpage-left-top','0.7764171380549669.jpg','http://s-199749.abc188.com/'),(41,'大树','innerpage-left-bottom','0.596074185334146.jpg','http://s-199749.abc188.com/'),(51,'admin','innerpage-left-bottom','0.040140360593795776.jpg','http://www.google.com'),(53,'admin','firstpage-left-mid','0.30263520451262593.jpg','http://s-199749.abc188.com/'),(54,'admin','firstpage-left-bottom','0.28310156147927046.jpg','http://s-199749.abc188.com/'),(55,'admin','innerpage-left-top','0.7139146942645311.jpg','http://s-199749.abc188.com/'),(57,'ok','firstpage-top',NULL,NULL),(58,'ok','firstpage-left-top',NULL,NULL),(59,'ok','firstpage-left-mid',NULL,NULL),(60,'ok','firstpage-left-bottom',NULL,NULL),(61,'ok','innerpage-left-top',NULL,NULL),(62,'ok','firstpage-top',NULL,NULL),(63,'ok','firstpage-left-top',NULL,NULL),(67,'admin','firstpage-left-top','0.11562165687792003.jpg','http://s-199749.abc188.com/'),(68,'admin','firstpage-top','0.22036425047554076.jpg','http://s-199749.abc188.com/');
/*!40000 ALTER TABLE `advs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advscore`
--

DROP TABLE IF EXISTS `advscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advscore` (
  `scoreId` int(11) NOT NULL AUTO_INCREMENT,
  `advId` int(11) DEFAULT NULL COMMENT '广告ID',
  `score` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`scoreId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advscore`
--

LOCK TABLES `advscore` WRITE;
/*!40000 ALTER TABLE `advscore` DISABLE KEYS */;
INSERT INTO `advscore` VALUES (4,56,8,'test','firstpage-top'),(5,56,5,'大树','firstpage-top');
/*!40000 ALTER TABLE `advscore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advuser`
--

DROP TABLE IF EXISTS `advuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advuser` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advuser`
--

LOCK TABLES `advuser` WRITE;
/*!40000 ALTER TABLE `advuser` DISABLE KEYS */;
INSERT INTO `advuser` VALUES (2,'admin','admin','admin','firstpage-top,firstpage-left-top,firstpage-left-mid,firstpage-left-bottom,innerpage-left-top,innerpage-left-bottom'),(4,'adv','1234','adv','firstpage-top,firstpage-left-top,firstpage-left-mid,firstpage-left-bottom,innerpage-left-top,innerpage-left-bottom');
/*!40000 ALTER TABLE `advuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `agvscore`
--

DROP TABLE IF EXISTS `agvscore`;
/*!50001 DROP VIEW IF EXISTS `agvscore`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `agvscore` (
  `total` tinyint NOT NULL,
  `avgScore` tinyint NOT NULL,
  `fileid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `notice` varchar(5000) DEFAULT NULL,
  `system` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (10,'<font size=\"3\" face=\"黑体\" color=\"#800080\">&nbsp; 尊重事实，鄙视造谣</font>','system');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='帖子';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (9,'我爱','友情','',0,'WO的秘密','求祝福','南京','2015-08-04','关键词','标题','背景','正文','感悟','undefined',0,'undefined','undefined','undefined',0,'test',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(10,'我恨','爱人','',2,'WO的秘密','求祝福','南京','2015-08-04','这是第一个秘密哦','这是第一个秘密哦','这是第一个秘密哦','这是第一个秘密哦','这是第一个秘密哦','',0,'','','',0,'william wang',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(48,'','','',1,'','','南京','','关键词','','','','','',0,'21~25','','',0,'test','','阿萨德法师打发撒的发生的发生地方',2,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(49,'','','',1,'','','南京','','关键词','','','','','',0,'26~30','','',0,'test','','asdfasdfasdfasdfasdfasdfadsf',2,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(50,'','','',1,'','','南京','Tue Aug 11 2015 20:05:21 GMT+0800 (中国标准时间)','关键词','','','','','',0,'21~25','','',0,'test','','asdfasdfasdfasdf',2,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(51,'','','',1,'','','南京','2015-08-11 20:07','关键词','','','','','',0,'21~25','','',0,'test','','asdfasdfasdfasdfasdfasdf',2,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(52,'我恨','老师','',0,'WO的秘密','求指点','南京','2015-08-14','关键词','标题','背景','正文','感悟','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(53,'我爱','爱情','',0,'WO的秘密','求治疗','南京','2015-08-12','关键词','标题','','','','',0,'','','',0,'test','','这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(54,'私人秘密\r\n                ','同学','身体',0,'TA的秘密','','南京','2015-08-12','关键词','标题','','','','不知道',0,'21~25','','',0,'test','','ta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_',1,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(55,'私人秘密\r\n                ','爱人','品德',0,'TA的秘密','','南京','2015-08-12','关键词','TA的秘密测试','刚刚发的背景','刚刚发的正文','刚刚发的感悟','不知道',0,'10~15','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(56,'商家秘密\r\n                  ','酒店','特殊服务',0,'TA的秘密','','南京','2015-08-11','关键词','商家秘密长文','','','','',0,'','地标或大楼','街道信息',0,'test','','商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(57,'\r\n                  私人秘密\r\n                  \r','本人','技能',1,'出售秘密','','','','关键词','出售秘密长文','','','','',0,'','','',23,'test','','出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文',1,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(58,'\r\n                  商家秘密\r\n                  \r','咖啡馆','真假',1,'出售秘密','','','2015-08-12','关键词','出售商家秘密长文','','','','',0,'','地标或大楼','街道信息',12,'test','','出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文',1,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(59,'\r\n                  私人秘密\r\n                  \r','亲人','品德',1,'悬赏秘密','','南京','2015-08-12','关键词','标题','','','','不知道',0,'16~20','','',12,'test','2015-08-12','悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文',1,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(60,'\r\n                  商家秘密\r\n                  \r','咖啡馆','其他',1,'悬赏秘密','','南京','2015-08-12','关键词','标题','','','','',0,'','地标或大楼','街道信息',12,'test','2015-08-12','悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文',1,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(61,'我恨','爱人','',0,'WO的秘密','求指点','南京','2015-08-16','南京','南京','背景','正文','感悟','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(62,'我想','破处','',0,'WO的秘密','求指点','南京','2015-08-05','南京','南京','啊撒的发生的发大水','阿萨德发的说法','阿萨德发生的发生地方','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(63,'我想','破处','',0,'WO的秘密','求指点','南京','2015-08-05','南京','南京','啊撒的发生的发大水','阿萨德发的说法','阿萨德发生的发生地方','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(64,'我恨','爱人','',0,'WO的秘密','求骂醒','南京','2015-08-13','这是登陆','这是登陆后发布的','这是登陆后发布的','这是登陆后发布的','这是登陆后发布的','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(65,'我恨','爱人','',0,'WO的秘密','求骂醒','南京','2015-08-13','这是登陆','这是登陆后发布的','这是登陆后发布的','这是登陆后发布的','这是登陆后发布的','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(67,'我爱','友情','',0,'WO的秘密','求指点','南京','2015-08-17','南京','南京','这是先发表再登陆','这是先发表再登陆','这是先发表再登陆','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(68,'我做过','欺骗','',0,'WO的秘密','求祝福','南京','2015-08-16','南京','南京','asdfasdf','asdfasd','fasdfasdfdas','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(69,'我做过','欺骗','',0,'WO的秘密','求祝福','南京','2015-08-16','南京','南京','asdfasdf','asdfasd','fasdfasdfdas','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(70,'我做过','欺骗','',0,'WO的秘密','求祝福','南京','2015-08-16','南京','南京','asdfasdf','asdfasd','fasdfasdfdas','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(71,'我做过','欺骗','',0,'WO的秘密','求祝福','南京','2015-08-16','南京','南京','asdfasdf','asdfasd','fasdfasdfdas','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(72,'我做过','欺骗','',0,'WO的秘密','求祝福','南京','2015-08-16','南京','南京','asdfasdf','asdfasd','fasdfasdfdas','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(73,'我做过','欺骗','',0,'WO的秘密','求祝福','南京','2015-08-16','南京','南京','asdfasdf','asdfasd','fasdfasdfdas','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(74,'我做过','欺骗','',0,'WO的秘密','求祝福','南京','2015-08-16','南京','南京','asdfasdf','asdfasd','fasdfasdfdas','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(75,'我恨','同学','',0,'WO的秘密','求祝福','南京','2015-08-12','关键词','标题','asdfasdfasdfasdfasdfasdfasdfasdfasdf','asdfasdf','asdfasdfasdf','',0,'','','',0,'2015-08-18 14:20:39','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(76,'我恨','同学','',0,'WO的秘密','求祝福','南京','2015-08-12','关键词','标题','asdfasdfasdfasdfasdfasdfasdfasdfasdf','asdfasdf','asdfasdfasdf','',0,'','','',0,'2015-08-18 14:20:39','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(77,'我恨','爱人','',0,'WO的秘密','求治疗','南京','2015-08-05','关键词','2015-8-18日秘密','2015-8-18日秘密','2015-8-18日秘密','2015-8-18日秘密','',0,'','','',0,'2015-08-18 14:23:11','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(78,'我想','破处','',0,'WO的秘密','求指点','南京','2015-08-18','关键词','2015-8-18日秘密','2015-8-18日秘密','2015-8-18日秘密','2015-8-18日秘密','',0,'','','',0,'2015-08-18 14:24:06','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(79,'我恨','爱人','',0,'WO的秘密','求指点','南京','2015-08-20','关键词','2015-8-18日秘密','阿萨德发生的发大水的','阿萨德法师打发是的','阿萨德法师打发','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-08-20 21:41:01'),(80,'我恨','爱人','',0,'WO的秘密','求指点','南京','2015-08-20','关键词','标题','啊撒的发生的发生地方','啊撒的发生地方撒','阿萨德法师打发','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-08-20 21:42:14'),(81,'我爱','友情','',0,'WO的秘密','求祝福','南京','2015-08-20','关键词','标题','啊撒的发生的发生地方','阿萨德发生的发生发的','阿双方大是大非','',0,'','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-08-20 21:43:46'),(82,'我恨','爱人','',0,'WO的秘密','求祝福','南京','2015-08-20','关键词','标题','啊撒的发生的发生地方','阿萨德法师打发','阿萨德法师打发','',0,'26~30','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-08-20 21:44:32'),(84,'我喜欢','哥特式KK','',0,'漂流瓶','求祝福','南京','2015-08-22','关键词','标题','啊撒的发生的发生地方','阿萨德法师打发','阿萨德法师打发','',0,'','','',0,'蟋蟀','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-08-22 21:44:32'),(85,'','','',1,'漂流瓶','','南京','2015-09-13','约约约','','','来，妹子，约一下','','',1,'26~30','','',0,'test','','',2,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-09-13 20:09:21'),(86,'私人秘密\r\n                ','同学','品德',0,'TA的秘密','','上海','2015-09','恶人','太恶了','惭愧','惭愧','惭愧','李伟',0,'16~20','','',0,'test','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-09-15 10:02:47'),(90,'','','',1,'漂流瓶','','上海','2015-09-15','帅哥','','','测试测试，内容没显示？','','',0,'31~35','','',0,'大树','','',2,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-09-15 12:45:31'),(92,'','','',1,'漂流瓶','','广州','2015-09-17','约','','','测试','','',0,'21~25','','',0,'大树','','',2,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-09-17 09:08:54'),(93,'私人秘密\r\n                ','上司','怪癖',0,'TA的秘密','','肇庆广州','2015-09','心理','*总是不是有心理疾病','分公司经理','说一套做一套，吹捧自己，贬低别人，气人有笑人无。','是不是有心理问题，小时候被人看不起了？','***刚',0,'41~45','','',0,'大树','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-09-17 09:14:18'),(94,'\r\n                  商家秘密\r\n                  \r','公司','黑中介',1,'出售秘密','','','2015-02','注册公司','中山大道黑中介','我在网上搜索到该公司，看了介绍，似乎规模还可以。','注册公司价格比人家贵了一倍，还不能开发票。','太无耻。等会发名字。','',0,'','广州','中山大道',100000000,'大树','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,''),(95,'\r\n                  私人秘密\r\n                  \r','本人','经历',1,'出售秘密','','','','泡妞','泡妞',' 泡妞','泡妞','泡妞','',0,'','','',2147483647,'大树','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-09-17 09:23:09'),(96,'我恨','爱人','',0,'WO的秘密','求指点','广州','2015-09','测试','测试','测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试','测试测','测试测','',0,'','','',0,'大树','','测试测',1,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-09-17 09:31:10'),(97,'私人秘密\r\n                ','客户','其他',0,'TA的秘密','','肇庆','2015-05','人事','测试','测试','彩色','彩色','田田田田',0,'31~35','','',0,'大树','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-09-17 09:32:39');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `friendid` int(11) DEFAULT NULL,
  `friendname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (3,NULL,NULL,'test','蟋蟀'),(5,NULL,NULL,'蟋蟀','test'),(6,NULL,NULL,'test','xishuai'),(7,NULL,NULL,'xishuai','test');
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isbad`
--

DROP TABLE IF EXISTS `isbad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `isbad` (
  `isbadId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `bad` int(11) DEFAULT NULL,
  `fileid` int(11) DEFAULT NULL,
  PRIMARY KEY (`isbadId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isbad`
--

LOCK TABLES `isbad` WRITE;
/*!40000 ALTER TABLE `isbad` DISABLE KEYS */;
INSERT INTO `isbad` VALUES (16,'test',1,52),(17,'test',1,60),(18,'test',1,67),(19,'xishuai',1,66),(20,'test',1,79);
/*!40000 ALTER TABLE `isbad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isgood`
--

DROP TABLE IF EXISTS `isgood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `isgood` (
  `isgoodId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `good` int(255) DEFAULT NULL,
  `bad` int(11) DEFAULT NULL,
  `fileid` int(11) DEFAULT NULL,
  PRIMARY KEY (`isgoodId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isgood`
--

LOCK TABLES `isgood` WRITE;
/*!40000 ALTER TABLE `isgood` DISABLE KEYS */;
INSERT INTO `isgood` VALUES (3,'test',1,NULL,9);
/*!40000 ALTER TABLE `isgood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdeal`
--

DROP TABLE IF EXISTS `orderdeal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdeal`
--

LOCK TABLES `orderdeal` WRITE;
/*!40000 ALTER TABLE `orderdeal` DISABLE KEYS */;
INSERT INTO `orderdeal` VALUES (27,'WO的秘密','我恨','','选择孙类型','test','',0,'26~30'),(28,'TA的秘密','私人秘密','上司','','大树','',1,'41~45');
/*!40000 ALTER TABLE `orderdeal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replay`
--

DROP TABLE IF EXISTS `replay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replay` (
  `replayId` int(11) NOT NULL AUTO_INCREMENT,
  `replayer` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `fileid` int(11) DEFAULT NULL,
  `replayTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replayId`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replay`
--

LOCK TABLES `replay` WRITE;
/*!40000 ALTER TABLE `replay` DISABLE KEYS */;
INSERT INTO `replay` VALUES (1,'test','asdfasdfasdf',60,NULL),(2,'test','sadfasdfasdfasdf',60,NULL),(3,'test','sadfasdfasdfasdf',60,NULL),(4,'test','sadfasdfasdfasdf',60,NULL),(5,'test','sadfasdfasdfasdf',60,NULL),(6,'test','sadfasdfasdfasdf',60,NULL),(7,'test','sadfasdfasdfasdf',60,NULL),(8,'test','sadfasdfasdfasdf',60,NULL),(9,'test','sadfasdfasdfasdf',60,NULL),(10,'test','sderterwer',60,NULL),(11,'test','sadfasdfasdfasdf',60,NULL),(12,'test','sadfasdfasdfasdf',60,NULL),(13,'test','dfsdfsdfsdf',60,NULL),(14,'test','sadfasdfasdfasdf',60,NULL),(15,'test','sadfasdfasdfasdf',60,NULL),(16,'test','sadfasdfasdfasdf',60,NULL),(17,'test','sadfasdfasdfasdf',60,NULL),(18,'test','',9,''),(19,'test','',9,''),(20,'test','',9,''),(21,'test','',9,''),(22,'test','',9,''),(23,'test','',9,''),(24,'test','',9,''),(25,'test','',9,''),(26,'test','',9,''),(27,'test','',9,''),(28,'test','',9,''),(29,'test','$(this).prev().find',60,'2015-08-14 22:03:06'),(30,'test','dfdfsasdfasdf',52,'2015-08-15 12:56:52'),(31,'test','asdfasdfasdf',52,'2015-08-15 12:57:11'),(32,'test','asdfasdfasdf',52,'2015-08-15 12:57:12'),(33,'test','阿萨德发生的发生',61,'2015-08-18 18:42:29'),(34,'test','阿萨德发生的发生',61,'2015-08-18 18:42:31'),(35,'test','阿萨德发生的发生',61,'2015-08-18 18:42:38'),(36,'test','你好啊',84,'2015-09-13 20:12:13'),(37,'大树','是',91,'2015-09-16 14:09:21');
/*!40000 ALTER TABLE `replay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score` (
  `scoreId` int(11) NOT NULL AUTO_INCREMENT,
  `fileid` int(255) DEFAULT NULL,
  `score` int(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`scoreId`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (25,60,4,'test'),(27,9,6,'test'),(28,52,5,'test'),(29,53,8,'test'),(30,67,9,'test'),(31,66,6,'xishuai'),(32,82,6,'test'),(33,84,8,'test'),(34,84,9,'大树'),(35,63,9,'大树'),(36,86,9,'大树'),(37,82,9,'大树');
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `answer1` varchar(255) DEFAULT NULL,
  `answer2` varchar(255) DEFAULT NULL,
  `answer3` varchar(255) DEFAULT NULL,
  `answer4` varchar(255) DEFAULT NULL,
  `answer5` varchar(255) DEFAULT NULL,
  `answer6` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (4,'肇庆公司领导虚伪吗？',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyanswer`
--

DROP TABLE IF EXISTS `surveyanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyanswer` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `good` varchar(11) DEFAULT NULL,
  `choose` int(11) DEFAULT NULL,
  `bad` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyanswer`
--

LOCK TABLES `surveyanswer` WRITE;
/*!40000 ALTER TABLE `surveyanswer` DISABLE KEYS */;
INSERT INTO `surveyanswer` VALUES (1,'test','haha',1,NULL),(2,'蟋蟀',NULL,1,'haha');
/*!40000 ALTER TABLE `surveyanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmsg`
--

DROP TABLE IF EXISTS `systemmsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmsg` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `msgtype` varchar(255) DEFAULT NULL,
  `isOk` varchar(255) DEFAULT NULL,
  `isReaded` varchar(255) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `comefrom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmsg`
--

LOCK TABLES `systemmsg` WRITE;
/*!40000 ALTER TABLE `systemmsg` DISABLE KEYS */;
INSERT INTO `systemmsg` VALUES (8,'xishuai','好友验证通过','验证通过','已读','您通过了来自test的好友申请','系统消息'),(12,'xishuai','好友验证未通过','验证通过','已读','蟋蟀拒绝了您的好友申请','系统消息'),(13,'大树','好友申请验证','等待审核','未读','你好','test');
/*!40000 ALTER TABLE `systemmsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talk`
--

DROP TABLE IF EXISTS `talk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talk` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `senduserid` int(11) DEFAULT NULL,
  `receiveruserid` int(11) DEFAULT NULL,
  `msg` varchar(500) DEFAULT NULL,
  `sendtime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talk`
--

LOCK TABLES `talk` WRITE;
/*!40000 ALTER TABLE `talk` DISABLE KEYS */;
/*!40000 ALTER TABLE `talk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userconfig`
--

DROP TABLE IF EXISTS `userconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userconfig` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `addscore` int(11) DEFAULT '10',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userconfig`
--

LOCK TABLES `userconfig` WRITE;
/*!40000 ALTER TABLE `userconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `userconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test','test',0,1,20,'happyhour7@163.com','南京','251619896','13813994215','0.7815601651091129.jpg','asdfasdf2323','asdfasdfasdfas'),(71,'asdfasdf','asdfasdf',1,1,10,'happyhour7@163.com','南京','2516198663','13813994215','demo_logo.png',NULL,NULL),(72,'xishuai','ww3ww3',1,1,10,'happyhour7@163.com','南京','2516198663','13813994215','demo_logo.png',NULL,NULL),(83,'蟋蟀','xishuai',1,1,10,NULL,'南京',NULL,NULL,'demo_logo.png',NULL,NULL),(84,'william wang','test',1,1,10,NULL,'南京',NULL,NULL,'demo_logo.png','g','这里是个性签名'),(85,'大树','1234',1,1,25,'undefined','广州','undefined','undefined','0.38356967456638813.jpg',NULL,'当当当'),(86,'娃哈哈','1234',1,1,10,'undefined','广州','undefined','undefined','0.3461962011642754.jpg',NULL,'555');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `agvscore`
--

/*!50001 DROP TABLE IF EXISTS `agvscore`*/;
/*!50001 DROP VIEW IF EXISTS `agvscore`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `agvscore` AS select sum(`score`.`score`) AS `total`,avg(`score`.`score`) AS `avgScore`,`score`.`fileid` AS `fileid` from `score` group by `score`.`fileid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-22  9:21:18
