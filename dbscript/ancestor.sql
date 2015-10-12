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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advs`
--

LOCK TABLES `advs` WRITE;
/*!40000 ALTER TABLE `advs` DISABLE KEYS */;
INSERT INTO `advs` VALUES (24,'大树','firstpage-left-mid','0.00162194250151515.jpg',''),(25,NULL,'firstpage-top',NULL,'http://www.baidu.com'),(29,'adv','innerpage-left-bottom',NULL,'http://s-199749.abc188.com/'),(30,'adv','innerpage-left-top',NULL,'http://s-199749.abc188.com/'),(31,'adv','firstpage-left-bottom',NULL,'http://s-199749.abc188.com/'),(35,NULL,'firstpage-left-mid',NULL,''),(36,'adv','firstpage-top','0.5842844860162586.jpg','http://s-199749.abc188.com/'),(37,'adv','firstpage-left-top','0.5842844860162586.jpg','http://s-199749.abc188.com/'),(38,'adv','firstpage-left-mid','0.5842844860162586.jpg',''),(39,'大树','firstpage-left-bottom','0.7764171380549669.jpg','http://s-199749.abc188.com/'),(40,'大树','innerpage-left-top','0.7764171380549669.jpg','http://s-199749.abc188.com/'),(41,'大树','innerpage-left-bottom','0.596074185334146.jpg','http://s-199749.abc188.com/'),(57,'ok','firstpage-top',NULL,NULL),(58,'ok','firstpage-left-top',NULL,NULL),(59,'ok','firstpage-left-mid',NULL,NULL),(60,'ok','firstpage-left-bottom',NULL,NULL),(61,'ok','innerpage-left-top',NULL,NULL),(62,'ok','firstpage-top',NULL,NULL),(63,'ok','firstpage-left-top',NULL,NULL),(73,'admin','firstpage-left-bottom','0.21615187032148242.jpg','http://s-199749.abc188.com/'),(77,'admin','firstpage-left-top','0.3502621138468385.jpg','http://s-199749.abc188.com/'),(78,'admin','firstpage-left-mid','0.5885099745355546.jpg','http://s-199749.abc188.com/'),(80,'admin','innerpage-left-top','0.48899485846050084.jpg','http://s-199749.abc188.com/'),(82,'admin','innerpage-left-bottom','0.6240886847954243.jpg','http://s-199749.abc188.com/'),(84,'admin','firstpage-top','0.44608689355663955.jpg','http://s-199749.abc188.com/');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advscore`
--

LOCK TABLES `advscore` WRITE;
/*!40000 ALTER TABLE `advscore` DISABLE KEYS */;
INSERT INTO `advscore` VALUES (4,56,8,'test','firstpage-top'),(5,56,5,'大树','firstpage-top'),(6,24,8,'大树','firstpage-left-mid'),(7,39,7,'大树','firstpage-left-bottom'),(8,68,8,'test','firstpage-top'),(9,67,7,'test','firstpage-left-top'),(10,68,7,'大树','firstpage-top'),(11,84,9,'大树','firstpage-top'),(12,77,9,'大树','firstpage-left-top'),(13,78,6,'大树','firstpage-left-mid'),(14,73,6,'大树','firstpage-left-bottom'),(16,82,9,'/','innerpage-left-bottom'),(18,80,5,'/','innerpage-left-top');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advuser`
--

LOCK TABLES `advuser` WRITE;
/*!40000 ALTER TABLE `advuser` DISABLE KEYS */;
INSERT INTO `advuser` VALUES (2,'admin','knowledge','管理员',''),(4,'adv','1234','advvvvv','firstpage-top,firstpage-left-top,firstpage-left-mid,firstpage-left-bottom,innerpage-left-top'),(7,'adv1','1234','adv1','firstpage-top'),(8,'adv2','12345','adv2','firstpage-left-top'),(9,'adv3','123456','adv3','firstpage-left-mid');
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
-- Table structure for table `chatgroups`
--

DROP TABLE IF EXISTS `chatgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `members` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `createTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatgroups`
--

LOCK TABLES `chatgroups` WRITE;
/*!40000 ALTER TABLE `chatgroups` DISABLE KEYS */;
INSERT INTO `chatgroups` VALUES (122,'与大树,蟋蟀群聊中','大树,蟋蟀','test','2015-09-26 19:53:37'),(123,'与test群聊中','test','蟋蟀','2015-09-28 19:03:46'),(140,'与蟋蟀,test,江边野火群聊中','蟋蟀,test,江边野火','大树','2015-09-28 19:17:58'),(162,'与江边野火群聊中','江边野火','没有人','2015-10-05 21:17:09'),(163,'与没有人群聊中','没有人','江边野火','2015-10-09 20:58:24');
/*!40000 ALTER TABLE `chatgroups` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (13,'<font color=\"#000000\" face=\"微软雅黑\" size=\"3\">我们都是好孩子，异想天开的孩子</font>','system');
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
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COMMENT='帖子';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (10,'我恨','爱人','',2,'WO的秘密','求祝福','南京','2015-08-04','这是第一个秘密哦','这是第一个秘密哦','这是第一个秘密哦','这是第一个秘密哦','这是第一个秘密哦','',0,'','','',0,'william wang',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(110,'','','',1,'漂流瓶','','','2015-09-25','','','','的','','',0,'','','',0,'娃哈哈','','',2,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-09-25 10:35:51'),(111,'','','',1,'漂流瓶','','','2015-09-25','','','','的','','',0,'','','',0,'娃哈哈','','',2,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-09-25 10:37:04'),(113,'','','',1,'漂流瓶','','这里','2015-09-28','秘密','','','欲望太强','','',2,'21~25','','',0,'没有人','','',2,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-09-28 21:22:19'),(118,'我做过','其他','',1,'WO的秘密','求安慰','镇江','1990-07','童年','小时候杀死了很多小田鸡','夏天的时候稻田里很多小田鸡','那时候拿了手工做的小竹弓箭，到处射杀小田鸡','现在想起来感觉很不好','',0,'','','',0,'大树','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-09-29 10:27:07'),(122,'我做过','其他','',1,'WO的秘密','求赞','新兴','2015-09','放生','今天买了一只狗','今天同事告诉我她们打算把养的狗卖给狗贩','有些不忍心，这个狗小的时候我就和它玩过，现在大了看到我还认识我，我喜欢它刚毅的眼神和健壮的','放生的感觉很不错。','',0,'','','',0,'江边野火','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-09-29 23:37:57'),(127,'商家秘密\r\n                  ','公司','黑中介',1,'TA的秘密','','广州','2015-04','永×财务','注册公司找了个黑中介','注册公司','找了个永×公司，有个姓王的业务，交了钱之后态度就差好多，价格还贵2700，也不告知注册用的','黑中介真是防不胜防','',0,'','','中山大道天河商贸大厦',0,'江边野火','','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-10-09 21:15:10'),(128,'','','',1,'漂流瓶','','','2015-10-12','','','','有没有人','','',0,'','','',0,'江边野火','','',2,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-10-12 16:42:00'),(129,'\r\n                  商家秘密\r\n                  \r','餐馆','其他',1,'悬赏秘密','','','2015-10','秘密','哪间旅馆比较好一点','想去旅游','哪间旅馆好一点不会被宰','谢谢','',0,'','海口','亚龙湾',500,'大树','2015-11','',0,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-10-12 16:55:24'),(131,'','','',1,'漂流瓶','','','2015-10-12','','','','有没有北京的','','',0,'','','',0,'偷偷的','','',2,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-10-12 20:44:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (3,NULL,NULL,'test','蟋蟀'),(5,NULL,NULL,'蟋蟀','test'),(6,NULL,NULL,'test','xishuai'),(7,NULL,NULL,'xishuai','test'),(20,NULL,NULL,'江边野火','没有人'),(21,NULL,NULL,'没有人','江边野火'),(22,NULL,NULL,'没有人','江边野火'),(23,NULL,NULL,'江边野火','没有人'),(24,NULL,NULL,'没有人','江边野火'),(25,NULL,NULL,'江边野火','没有人');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isbad`
--

LOCK TABLES `isbad` WRITE;
/*!40000 ALTER TABLE `isbad` DISABLE KEYS */;
INSERT INTO `isbad` VALUES (16,'test',1,52),(17,'test',1,60),(18,'test',1,67),(19,'xishuai',1,66),(20,'test',1,79),(21,'大树',1,101),(22,'江边野火',1,112),(27,'test',1,107);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isgood`
--

LOCK TABLES `isgood` WRITE;
/*!40000 ALTER TABLE `isgood` DISABLE KEYS */;
INSERT INTO `isgood` VALUES (3,'test',1,NULL,9),(4,'没有人',1,NULL,109),(7,'test',1,NULL,108);
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdeal`
--

LOCK TABLES `orderdeal` WRITE;
/*!40000 ALTER TABLE `orderdeal` DISABLE KEYS */;
INSERT INTO `orderdeal` VALUES (27,'WO的秘密','我恨','','选择孙类型','test','',0,'26~30'),(38,'WO的秘密','','','','娃哈哈','',0,''),(45,'WO的秘密','','','','江边野火','',0,''),(46,'TA的秘密','','','','大树','',0,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replay`
--

LOCK TABLES `replay` WRITE;
/*!40000 ALTER TABLE `replay` DISABLE KEYS */;
INSERT INTO `replay` VALUES (1,'test','asdfasdfasdf',60,NULL),(2,'test','sadfasdfasdfasdf',60,NULL),(3,'test','sadfasdfasdfasdf',60,NULL),(4,'test','sadfasdfasdfasdf',60,NULL),(5,'test','sadfasdfasdfasdf',60,NULL),(6,'test','sadfasdfasdfasdf',60,NULL),(7,'test','sadfasdfasdfasdf',60,NULL),(8,'test','sadfasdfasdfasdf',60,NULL),(9,'test','sadfasdfasdfasdf',60,NULL),(10,'test','sderterwer',60,NULL),(11,'test','sadfasdfasdfasdf',60,NULL),(12,'test','sadfasdfasdfasdf',60,NULL),(13,'test','dfsdfsdfsdf',60,NULL),(14,'test','sadfasdfasdfasdf',60,NULL),(15,'test','sadfasdfasdfasdf',60,NULL),(16,'test','sadfasdfasdfasdf',60,NULL),(17,'test','sadfasdfasdfasdf',60,NULL),(18,'test','',9,''),(19,'test','',9,''),(20,'test','',9,''),(21,'test','',9,''),(22,'test','',9,''),(23,'test','',9,''),(24,'test','',9,''),(25,'test','',9,''),(26,'test','',9,''),(27,'test','',9,''),(28,'test','',9,''),(29,'test','$(this).prev().find',60,'2015-08-14 22:03:06'),(30,'test','dfdfsasdfasdf',52,'2015-08-15 12:56:52'),(31,'test','asdfasdfasdf',52,'2015-08-15 12:57:11'),(32,'test','asdfasdfasdf',52,'2015-08-15 12:57:12'),(33,'test','阿萨德发生的发生',61,'2015-08-18 18:42:29'),(34,'test','阿萨德发生的发生',61,'2015-08-18 18:42:31'),(35,'test','阿萨德发生的发生',61,'2015-08-18 18:42:38'),(36,'test','你好啊',84,'2015-09-13 20:12:13'),(37,'大树','是',91,'2015-09-16 14:09:21'),(38,'娃哈哈','的',98,'2015-09-22 22:35:49'),(39,'娃哈哈','约',105,'2015-09-24 09:59:23'),(40,'大树','的',104,'2015-09-24 10:06:44'),(41,'大树','的',104,'2015-09-24 10:07:00'),(42,'大树','的',104,'2015-09-24 10:08:20'),(43,'大树','的',107,'2015-09-25 10:06:06'),(44,'江边野火','哈哈',112,'2015-09-28 20:56:46'),(45,'没有人','？\n',10,'2015-09-28 21:14:08'),(46,'没有人','？\n',106,'2015-09-28 21:15:20'),(47,'没有人','？',102,'2015-09-28 21:17:55'),(48,'没有人','嗨',111,'2015-09-28 21:23:44'),(49,'没有人','哈哈\n',115,'2015-09-28 21:31:07'),(50,'没有人','？\n',122,'2015-10-05 21:26:32'),(51,'江边野火','没有内容？',114,'2015-10-08 19:54:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (25,60,4,'test'),(27,9,6,'test'),(28,52,5,'test'),(29,53,8,'test'),(30,67,9,'test'),(31,66,6,'xishuai'),(32,82,6,'test'),(33,84,8,'test'),(34,84,9,'大树'),(35,63,9,'大树'),(36,86,9,'大树'),(37,82,9,'大树'),(38,81,4,'大树'),(41,60,9,'大树'),(42,58,6,'大树'),(43,86,8,'娃哈哈'),(44,112,5,'江边野火'),(45,10,2,'大树'),(46,122,9,'大树'),(47,127,9,'大树');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (7,'你看过姜文的《鬼子来了》吗？',NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyanswer`
--

LOCK TABLES `surveyanswer` WRITE;
/*!40000 ALTER TABLE `surveyanswer` DISABLE KEYS */;
INSERT INTO `surveyanswer` VALUES (1,'test','haha',1,NULL),(2,'蟋蟀',NULL,1,'haha'),(3,'娃哈哈','haha',1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmsg`
--

LOCK TABLES `systemmsg` WRITE;
/*!40000 ALTER TABLE `systemmsg` DISABLE KEYS */;
INSERT INTO `systemmsg` VALUES (8,'xishuai','好友验证通过','验证通过','已读','您通过了来自test的好友申请','系统消息'),(12,'xishuai','好友验证未通过','验证通过','已读','蟋蟀拒绝了您的好友申请','系统消息'),(15,'test','好友验证通过','验证通过','未读消息','大树通过了您的好友申请','系统消息'),(26,'娟娟细流','好友验证通过','验证通过','未读消息','您通过了来自江边野火的好友申请','系统消息'),(31,'娟娟细流','好友申请验证','等待审核','未读','加','蟋蟀'),(38,'没有人','好友验证通过','验证通过','未读消息','江边野火通过了您的好友申请','系统消息'),(40,'没有人','好友验证通过','验证通过','未读消息','江边野火通过了您的好友申请','系统消息'),(41,'娟娟细流','好友申请验证','等待审核','未读','嘿嘿','大树');
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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (85,'大树','1234',1,1,60,'undefined','广州','undefined','undefined','0.38356967456638813.jpg',NULL,'当当当'),(87,'娟娟细流','1234',0,1,10,NULL,'临沂',NULL,NULL,'demo_logo.png',NULL,NULL),(89,'没有人','740860638hcm210',0,1,15,'undefined','','undefined','undefined','0.8318439889699221.jpg',NULL,'没有人问有没有人？'),(90,'娃哈哈','1234',1,1,10,NULL,'广州',NULL,NULL,'demo_logo.png',NULL,NULL),(91,'蟋蟀','xishuai',1,1,10,NULL,'广州',NULL,NULL,'demo_logo.png',NULL,NULL),(92,'江边野火','knowledge',1,1,25,NULL,'广州',NULL,NULL,'demo_logo.png',NULL,NULL),(93,'偷偷的','knowledge',1,1,10,NULL,'北京',NULL,NULL,'demo_logo.png',NULL,NULL);
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

-- Dump completed on 2015-10-12 23:14:54
