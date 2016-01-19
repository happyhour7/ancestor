-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ancestor
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','chenman30aflower',NULL,'admin',NULL),(2,'1号','knowledge',NULL,'admin1',NULL),(3,'2号','knowledge',NULL,'admin2',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advs`
--

LOCK TABLES `advs` WRITE;
/*!40000 ALTER TABLE `advs` DISABLE KEYS */;
INSERT INTO `advs` VALUES (24,'大树','firstpage-left-mid','0.00162194250151515.jpg',''),(25,NULL,'firstpage-top',NULL,'http://www.baidu.com'),(35,NULL,'firstpage-left-mid',NULL,''),(39,'大树','firstpage-left-bottom','0.7764171380549669.jpg','http://s-199749.abc188.com/'),(40,'大树','innerpage-left-top','0.7764171380549669.jpg','http://s-199749.abc188.com/'),(41,'大树','innerpage-left-bottom','0.596074185334146.jpg','http://s-199749.abc188.com/'),(57,'ok','firstpage-top',NULL,NULL),(58,'ok','firstpage-left-top',NULL,NULL),(59,'ok','firstpage-left-mid',NULL,NULL),(60,'ok','firstpage-left-bottom',NULL,NULL),(61,'ok','innerpage-left-top',NULL,NULL),(62,'ok','firstpage-top',NULL,NULL),(63,'ok','firstpage-left-top',NULL,NULL),(73,'admin','firstpage-left-bottom','0.21615187032148242.jpg','http://s-199749.abc188.com/'),(77,'admin','firstpage-left-top','0.3502621138468385.jpg','http://s-199749.abc188.com/'),(78,'admin','firstpage-left-mid','0.5885099745355546.jpg','http://s-199749.abc188.com/'),(80,'admin','innerpage-left-top','0.48899485846050084.jpg','http://s-199749.abc188.com/'),(82,'admin','innerpage-left-bottom','0.6240886847954243.jpg','http://s-199749.abc188.com/'),(84,'admin','firstpage-top','0.44608689355663955.jpg','http://s-199749.abc188.com/'),(86,'adv','firstpage-top','0.4237996495794505.jpg','http://s-199749.abc188.com/'),(123,NULL,'innerpage-left-bottom','0.09729672083631158.jpg','http://s-199749.abc188.com/'),(124,'江边野火','innerpage-left-bottom','0.4016406156588346.jpg','http://s-199749.abc188.com/'),(131,'adv','firstpage-left-mid','0.3583142380230129.jpg','http://www.cricricket.com.cn/'),(132,'adv','firstpage-left-bottom','0.16090118163265288.jpg','http://www.cricricket.com.cn/'),(133,'adv','firstpage-left-top','0.15803832304663956.jpg','http://www.cricricket.com.cn/'),(135,'adv','innerpage-left-top','0.2550096116028726.jpg','http://s-199749.abc188.com/'),(136,'adv','innerpage-left-bottom','0.020653894869610667.jpg','http://s-199749.abc188.com/');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advscore`
--

LOCK TABLES `advscore` WRITE;
/*!40000 ALTER TABLE `advscore` DISABLE KEYS */;
INSERT INTO `advscore` VALUES (4,56,8,'test','firstpage-top'),(5,56,5,'大树','firstpage-top'),(6,24,8,'大树','firstpage-left-mid'),(7,39,7,'大树','firstpage-left-bottom'),(8,68,8,'test','firstpage-top'),(9,67,7,'test','firstpage-left-top'),(10,68,7,'大树','firstpage-top'),(11,84,9,'大树','firstpage-top'),(12,77,9,'大树','firstpage-left-top'),(13,78,6,'大树','firstpage-left-mid'),(14,73,6,'大树','firstpage-left-bottom'),(16,82,9,'/','innerpage-left-bottom'),(18,80,5,'/','innerpage-left-top'),(19,89,9,'江边野火','firstpage-left-top'),(20,88,2,'江边野火','firstpage-left-mid'),(21,89,10,'杜雷寺','firstpage-left-top'),(22,133,10,'江边野火','firstpage-left-top'),(23,131,9,'江边野火','firstpage-left-mid'),(24,132,9,'江边野火','firstpage-left-bottom'),(25,133,9,'小白痴','firstpage-left-top'),(26,131,9,'小白痴','firstpage-left-mid'),(27,132,10,'小白痴','firstpage-left-bottom'),(28,133,9,'小小美','firstpage-left-top'),(29,131,6,'小小美','firstpage-left-mid'),(30,132,7,'小小美','firstpage-left-bottom');
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
INSERT INTO `advuser` VALUES (2,'admin','bridge','admin','');
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
-- Table structure for table `awardrecord`
--

DROP TABLE IF EXISTS `awardrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awardrecord` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awardrecord`
--

LOCK TABLES `awardrecord` WRITE;
/*!40000 ALTER TABLE `awardrecord` DISABLE KEYS */;
INSERT INTO `awardrecord` VALUES (1,'2015-12-22'),(2,'2015-12-23'),(3,'2015-12-24'),(4,'2015-12-25'),(5,'2015-12-29'),(6,'2015-12-31'),(7,'2016-01-01'),(8,'2016-01-06'),(9,'2016-01-07'),(10,'2016-01-08'),(11,'2016-01-12'),(12,'2016-01-13'),(13,'2016-01-14'),(14,'2016-01-15'),(15,'2016-01-16'),(16,'2016-01-19');
/*!40000 ALTER TABLE `awardrecord` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatgroups`
--

LOCK TABLES `chatgroups` WRITE;
/*!40000 ALTER TABLE `chatgroups` DISABLE KEYS */;
INSERT INTO `chatgroups` VALUES (122,'与大树,蟋蟀群聊中','大树,蟋蟀','test','2015-09-26 19:53:37'),(140,'与蟋蟀,test,江边野火群聊中','蟋蟀,test,江边野火','大树','2015-09-28 19:17:58'),(162,'与江边野火群聊中','江边野火','没有人','2015-10-05 21:17:09'),(175,'与小蚊子群聊中','小蚊子','蟋蟀','2015-11-06 23:11:23'),(176,'与蟋蟀群聊中','蟋蟀','小蚊子','2015-11-07 09:35:43'),(188,'与江边野火群聊中','江边野火','小月月','2015-11-19 15:03:29'),(230,'与江边野火群聊中','江边野火','温柔一梦','2015-12-20 21:57:52'),(232,'与温柔一梦群聊中','温柔一梦','江边野火','2015-12-21 17:04:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (32,'50','rankpay'),(34,'<p><font size=\"3\" face=\"微软雅黑\">本站是小群体网站，旨在打造一个分享私密、结交秘友的空间，除了可以发布自己的秘密，还可以悬赏你想知道的秘密，可以和认识的秘友一对一聊天、群聊，可以偷好友的蟋蟀腿。在这里，可以体验到一种隐私的快乐！请只介绍给您信任的朋友！</font></p>','system');
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
  `secretBackground` varchar(255) DEFAULT NULL,
  `secretContent` varchar(255) DEFAULT NULL,
  `secretKnown` varchar(255) DEFAULT NULL,
  `othername` varchar(45) DEFAULT NULL,
  `othersex` int(11) DEFAULT NULL,
  `otherage` varchar(45) DEFAULT NULL,
  `otherBuildName` varchar(45) DEFAULT NULL,
  `otheraddress` varchar(200) DEFAULT NULL,
  `secretPrice` int(11) DEFAULT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `secretLimitTime` date DEFAULT NULL,
  `longstory` text,
  `islongstory` int(11) DEFAULT '0',
  `score` int(11) DEFAULT NULL,
  `noReply` tinyint(1) NOT NULL DEFAULT '0',
  `goodNum` int(11) DEFAULT NULL,
  `badNum` int(11) DEFAULT NULL,
  `advimg` varchar(255) DEFAULT NULL,
  `advlink` varchar(255) DEFAULT NULL,
  `advlocation` varchar(255) DEFAULT NULL,
  `filetype` int(11) DEFAULT '1',
  `createTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8 COMMENT='帖子';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (286,'\r\n                  私人的\r\n                  \r\n','其他','其他',1,'悬赏秘密','','天津','1997-10','英文歌','求一首英文歌的歌名','大概1997年的时候买过一个碟，里面是MTV集锦，里面的所有歌都很好听，后来被朋友拿走了。','其中一个女歌手唱的歌，高潮部分是tonight，tonight，two become one。歌手唱的时候俯身朝前抬头，很诱惑的表情。','如果知道碟里面的其他歌曲就更赞了。','女歌手',0,'26~30','','',5,'江边野火','2015-11-19','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-18 23:52:25'),(400,'','','',1,'漂流瓶','','','2016-01-11','','','','欢迎美女！','','',1,'','','',0,'江边野火','0000-00-00','',2,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2016-01-11 21:32:04'),(408,'\r\n                  私人的\r\n                  \r\n','其他','其他',1,'悬赏秘密','','广州','2016-01','射箭','广州有没有射箭俱乐部之类的','比较喜欢传统弓箭，想玩玩。','广州有哪里可以射箭吗？','rt','射箭',1,'26~30','','',1000,'江边野火','2016-01-30','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2016-01-19 08:09:13');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floaterowner`
--

DROP TABLE IF EXISTS `floaterowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `floaterowner` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fileid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floaterowner`
--

LOCK TABLES `floaterowner` WRITE;
/*!40000 ALTER TABLE `floaterowner` DISABLE KEYS */;
INSERT INTO `floaterowner` VALUES (1,274,'不是事儿','2015-11-16 10:43:52'),(2,275,'小月月','2015-11-16 10:44:54'),(3,276,'不是事儿','2015-11-16 14:07:20'),(4,285,'小月月','2015-11-18 15:43:42'),(5,287,'不是事儿','2015-11-19 06:19:30');
/*!40000 ALTER TABLE `floaterowner` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heimingdan`
--

DROP TABLE IF EXISTS `heimingdan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heimingdan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `othername` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heimingdan`
--

LOCK TABLES `heimingdan` WRITE;
/*!40000 ALTER TABLE `heimingdan` DISABLE KEYS */;
INSERT INTO `heimingdan` VALUES (4,'江边野火','小白痴','2015-12-09 10:48:57');
/*!40000 ALTER TABLE `heimingdan` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isbad`
--

LOCK TABLES `isbad` WRITE;
/*!40000 ALTER TABLE `isbad` DISABLE KEYS */;
INSERT INTO `isbad` VALUES (16,'test',1,52),(17,'test',1,60),(18,'test',1,67),(19,'xishuai',1,66),(20,'test',1,79),(21,'大树',1,101),(22,'江边野火',1,112),(27,'test',1,107),(29,'江边野火',1,151),(30,'江边野火',1,150),(32,'蟋蟀',1,158),(35,'没有故事的人',1,170),(36,'随缘',1,184),(37,'随缘',1,176),(38,'笨蛋里挑骨头',1,184),(39,'叶子',1,185),(40,'叶子',1,184),(41,'叶子',1,181),(42,'叶子',1,176),(43,'沉小鱼',1,189),(44,'沉小鱼',1,185),(45,'沉小鱼',1,184),(46,'杜雷寺',1,189),(47,'小蚊子',1,210),(48,'小月月',1,221),(49,'小月月',1,220),(50,'小月月',1,210),(51,'不是事儿',1,230),(52,'不是事儿',1,229),(53,'不是事儿',1,228),(54,'不是事儿',1,226),(55,'不是事儿',1,224),(56,'不是事儿',1,222),(57,'不是事儿',1,220),(58,'蕾丝边',1,228),(59,'蕾丝边',1,226),(60,'蕾丝边',1,225),(61,'蕾丝边',1,224),(62,'蕾丝边',1,223),(63,'蕾丝边',1,222),(64,'蕾丝边',1,220),(65,'蕾丝边',1,210),(66,'爱死寂寞人',1,229),(67,'爱死寂寞人',1,226),(68,'爱死寂寞人',1,225),(69,'爱死寂寞人',1,223),(70,'爱死寂寞人',1,222),(71,'爱死寂寞人',1,220),(72,'爱死寂寞人',1,210);
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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isgood`
--

LOCK TABLES `isgood` WRITE;
/*!40000 ALTER TABLE `isgood` DISABLE KEYS */;
INSERT INTO `isgood` VALUES (3,'test',1,NULL,9),(4,'没有人',1,NULL,109),(7,'test',1,NULL,108),(8,'江边野火',1,NULL,149),(19,'杜雷寺',1,NULL,161),(20,'小月月',1,NULL,161),(22,'蟋蟀',1,NULL,161),(23,'爱死寂寞人',1,NULL,156),(24,'爱死寂寞人',1,NULL,155),(25,'爱死寂寞人',1,NULL,158),(26,'随缘',1,NULL,185),(27,'随缘',1,NULL,181),(28,'笨蛋里挑骨头',1,NULL,189),(36,'蟋蟀',1,NULL,181),(37,'不是事儿',1,NULL,189),(38,'不是事儿',1,NULL,185),(39,'不是事儿',1,NULL,184),(40,'不是事儿',1,NULL,181),(41,'不是事儿',1,NULL,176),(44,'小月月',1,NULL,189),(45,'叶子',1,NULL,189),(47,'沉小鱼',1,NULL,181),(48,'沉小鱼',1,NULL,176),(50,'不是事儿',1,NULL,233),(51,'不是事儿',1,NULL,231),(52,'不是事儿',1,NULL,225),(53,'不是事儿',1,NULL,223),(54,'蕾丝边',1,NULL,233),(55,'蕾丝边',1,NULL,231),(56,'蕾丝边',1,NULL,230),(57,'蕾丝边',1,NULL,229),(58,'蕾丝边',1,NULL,221),(59,'爱死寂寞人',1,NULL,233),(60,'爱死寂寞人',1,NULL,231),(61,'爱死寂寞人',1,NULL,224),(62,'爱死寂寞人',1,NULL,221),(63,'温柔一梦',1,NULL,281),(64,'温柔一梦',1,NULL,280),(65,'江边野火',1,NULL,280),(66,'江边野火',1,NULL,247),(67,'江边野火',1,NULL,246),(68,'江边野火',1,NULL,240),(69,'江边野火',1,NULL,237),(70,'江边野火',1,NULL,220),(71,'江边野火',1,NULL,210),(72,'温柔一梦',1,NULL,350),(73,'温柔一梦',1,NULL,398);
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
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdeal`
--

LOCK TABLES `orderdeal` WRITE;
/*!40000 ALTER TABLE `orderdeal` DISABLE KEYS */;
INSERT INTO `orderdeal` VALUES (27,'WO的秘密','我恨','','选择孙类型','test','',0,'26~30'),(38,'WO的秘密','','','','娃哈哈','',0,''),(47,'WO的秘密','','','','大树','',0,''),(48,'WO的秘密','','','','杜雷寺','',0,''),(54,'WO的秘密','','','','小月月','',0,''),(59,'TA的秘密','私人的','其他','','不是事儿','',2,''),(72,'','','','','小白痴','',0,'21~25'),(110,'','','其他','其他','江边野火','',0,''),(116,'WO的秘密','','','','蟋蟀','广州',0,'');
/*!40000 ALTER TABLE `orderdeal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pays`
--

DROP TABLE IF EXISTS `pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pays` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `trade_no` varchar(100) NOT NULL COMMENT '支付宝订单号',
  `out_trade_no` varchar(100) NOT NULL COMMENT '网站订单号',
  `total_fee` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays`
--

LOCK TABLES `pays` WRITE;
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
INSERT INTO `pays` VALUES (1,'蟋蟀','2015102121001004060081543949','20151021344666',0.01),(2,'蟋蟀','2015102121001004680044908379','20151021419355',1),(3,'江边野火','2015110821001004680098436109','2015118344488',1),(4,'江边野火','2015110821001004680003785675','2015118979666',1);
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replay`
--

LOCK TABLES `replay` WRITE;
/*!40000 ALTER TABLE `replay` DISABLE KEYS */;
INSERT INTO `replay` VALUES (105,'蟋蟀','的',406,'2016-01-15 10:22:31'),(106,'江边野火','的',406,'2016-01-15 10:22:44'),(107,'江边野火','1',407,'2016-01-18 16:06:09'),(108,'蟋蟀','的',407,'2016-01-18 16:06:19'),(109,'江边野火','的',409,'2016-01-19 14:34:32'),(110,'蟋蟀','d ',409,'2016-01-19 14:34:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (25,60,4,'test'),(27,9,6,'test'),(28,52,5,'test'),(29,53,8,'test'),(30,67,9,'test'),(31,66,6,'xishuai'),(32,82,6,'test'),(33,84,8,'test'),(34,84,9,'大树'),(35,63,9,'大树'),(36,86,9,'大树'),(37,82,9,'大树'),(38,81,4,'大树'),(41,60,9,'大树'),(42,58,6,'大树'),(43,86,8,'娃哈哈'),(44,112,5,'江边野火'),(45,10,2,'大树'),(46,122,9,'大树'),(47,127,9,'大树'),(48,155,5,'杜雷寺'),(49,10,10,'杜雷寺'),(50,189,9,'蟋蟀'),(51,185,9,'蟋蟀'),(52,189,10,'笨蛋里挑骨头'),(53,210,10,'小蚊子'),(54,233,10,'小月月'),(55,231,10,'小月月'),(56,230,7,'小月月'),(57,229,9,'小月月'),(58,228,9,'小月月'),(59,225,8,'小月月'),(60,223,9,'小月月'),(61,222,9,'小月月'),(62,221,9,'小月月'),(63,220,9,'小月月'),(64,210,9,'小月月'),(65,233,10,'不是事儿'),(66,231,10,'不是事儿'),(67,230,9,'不是事儿'),(68,229,10,'不是事儿'),(69,228,10,'不是事儿'),(70,226,8,'不是事儿'),(71,225,9,'不是事儿'),(72,224,10,'不是事儿'),(73,223,9,'不是事儿'),(74,222,9,'不是事儿'),(75,233,9,'蕾丝边'),(76,230,10,'蕾丝边'),(77,229,10,'蕾丝边'),(78,228,10,'蕾丝边'),(79,226,10,'蕾丝边'),(80,225,10,'蕾丝边'),(81,224,8,'蕾丝边'),(82,223,9,'蕾丝边'),(83,222,9,'蕾丝边'),(84,221,9,'蕾丝边'),(85,220,9,'蕾丝边'),(86,210,8,'蕾丝边'),(87,233,10,'爱死寂寞人'),(88,231,9,'爱死寂寞人'),(89,230,9,'爱死寂寞人'),(90,229,9,'爱死寂寞人'),(91,226,9,'爱死寂寞人'),(92,225,9,'爱死寂寞人'),(93,224,8,'爱死寂寞人'),(94,223,10,'爱死寂寞人'),(95,222,10,'爱死寂寞人'),(96,221,8,'爱死寂寞人'),(97,220,10,'爱死寂寞人'),(98,210,8,'爱死寂寞人'),(99,280,10,'温柔一梦'),(100,281,10,'江边野火'),(101,286,10,'小月月'),(102,247,10,'江边野火'),(103,246,10,'江边野火'),(104,240,10,'江边野火'),(105,237,10,'江边野火'),(106,398,10,'蟋蟀'),(107,391,10,'蟋蟀'),(108,350,10,'蟋蟀'),(109,345,10,'蟋蟀'),(110,286,10,'蟋蟀');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (20,'你有秘密会找个地方倾诉出来吗？',NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyanswer`
--

LOCK TABLES `surveyanswer` WRITE;
/*!40000 ALTER TABLE `surveyanswer` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmsg`
--

LOCK TABLES `systemmsg` WRITE;
/*!40000 ALTER TABLE `systemmsg` DISABLE KEYS */;
INSERT INTO `systemmsg` VALUES (8,'xishuai','好友验证通过','验证通过','已读','您通过了来自test的好友申请','系统消息'),(12,'xishuai','好友验证未通过','验证通过','已读','蟋蟀拒绝了您的好友申请','系统消息'),(15,'test','好友验证通过','验证通过','未读消息','大树通过了您的好友申请','系统消息'),(26,'娟娟细流','好友验证通过','验证通过','未读消息','您通过了来自江边野火的好友申请','系统消息'),(31,'娟娟细流','好友申请验证','等待审核','未读','加','蟋蟀'),(38,'没有人','好友验证通过','验证通过','未读消息','江边野火通过了您的好友申请','系统消息'),(40,'没有人','好友验证通过','验证通过','未读消息','江边野火通过了您的好友申请','系统消息'),(41,'娟娟细流','好友申请验证','等待审核','未读','嘿嘿','大树'),(45,'大树','好友申请验证','等待审核','已读','出','江边野火'),(50,'没有故事的人','好友验证通过','验证通过','未读消息','您通过了来自爱死寂寞人的好友申请','系统消息'),(51,NULL,'好友申请验证','等待审核','未读',NULL,'蟋蟀'),(52,NULL,'好友申请验证','等待审核','未读',NULL,'蟋蟀'),(59,NULL,'好友申请验证','等待审核','未读',NULL,'江边野火'),(63,'小月月','好友验证通过','验证通过','已读','您通过了来自江边野火的好友申请','系统消息'),(80,'蟋蟀','悬赏秘密采纳通知','等待审核','已读','恭喜您！您的回复已被采纳，江边野火给您1个蟋蟀腿','江边野火');
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
-- Table structure for table `tourecord`
--

DROP TABLE IF EXISTS `tourecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tourecord` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sender` varchar(200) NOT NULL,
  `receiver` varchar(200) NOT NULL,
  `xishuaitui` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourecord`
--

LOCK TABLES `tourecord` WRITE;
/*!40000 ALTER TABLE `tourecord` DISABLE KEYS */;
INSERT INTO `tourecord` VALUES (1,'江边野火','蟋蟀',27,'2015-12-06 15:20:00'),(2,'蟋蟀','江边野火',21,'2015-12-07 05:27:13'),(3,'江边野火','温柔一梦',15,'2015-12-16 14:18:06'),(4,'温柔一梦','江边野火',0,'2015-12-23 16:03:30');
/*!40000 ALTER TABLE `tourecord` ENABLE KEYS */;
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
  `age` varchar(45) DEFAULT NULL,
  `usertype` int(11) DEFAULT '0' COMMENT '0:普通用户；1：广告主；2：咨询师',
  `score` int(11) DEFAULT '0',
  `email` varchar(45) DEFAULT NULL,
  `cityname` varchar(45) DEFAULT NULL,
  `qq` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `userPhoto` varchar(45) DEFAULT 'logo.jpg',
  `address` varchar(200) DEFAULT NULL,
  `mark` varchar(45) DEFAULT NULL,
  `money` float NOT NULL DEFAULT '0',
  `xishuaitui` decimal(11,2) NOT NULL DEFAULT '0.00',
  `xinyongfen` double DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (117,'蟋蟀','knowledge',1,'36~40',1,110,'undefined','广州','undefined','undefined','0.20968210534192622.jpg',NULL,'我是一个小蟋蟀',0,273.48,NULL),(119,'小小美','knowledge',0,'',1,30,'undefined','南京','undefined','undefined','0.639867514371872.jpg',NULL,'我是一个小蟋蟀',0,61.00,NULL),(121,'笨蛋里挑骨头','knowledge',0,'26~30',1,25,'undefined','北京','undefined','undefined','0.8328178711235523.jpg',NULL,'我是一个小蟋蟀',0,70.00,NULL),(122,'小蚊子','knowledge',0,'21~25',1,35,'undefined','广州','undefined','undefined','0.31903971498832107.jpg',NULL,'我是一个小蟋蟀',0,128.10,NULL),(123,'不是事儿','knowledge',1,'21~25',1,25,NULL,'天津',NULL,NULL,'0.7469870562199503.jpg',NULL,NULL,0,79.30,NULL),(124,'美丽人生','knowledge',0,'26~30',1,20,NULL,'杭州',NULL,NULL,'0.532550600823015.jpg',NULL,NULL,0,61.00,NULL),(125,'小月月','knowledge',0,'26~30',1,35,'undefined','上海','undefined','undefined','0.8088674764148891.jpg',NULL,'我是一个小蟋蟀',0,83.00,NULL),(127,'有缘千里','knowledge',0,'26~30',1,20,NULL,'青岛',NULL,NULL,'0.4399007686879486.jpg',NULL,NULL,0,61.00,NULL),(128,'随缘','knowledge',1,'36~40',1,15,NULL,'西安',NULL,NULL,'logo.jpg',NULL,NULL,0,51.00,NULL),(129,'叶子','knowledge',0,'21~25',1,20,NULL,'柳州',NULL,NULL,'logo.jpg',NULL,NULL,0,62.00,NULL),(130,'蕾丝边','knowledge',0,'21~25',1,20,NULL,'佛山',NULL,NULL,'0.1979770192410797.jpg',NULL,NULL,0,61.00,NULL),(131,'爱死寂寞人','knowledge',1,'',1,20,'undefined','上海','undefined','undefined','0.39070191816426814.jpg',NULL,'春天花会开',0,90.00,NULL),(133,'江边野火','knowledge',1,'36~40',1,220,'undefined','广州','undefined','undefined','0.05786626157350838.jpg',NULL,'撒欢的野鸭',2,1512.10,10),(134,'杜雷寺','knowledge',1,'26~30',1,15,NULL,'南昌',NULL,NULL,'logo.jpg',NULL,NULL,0,51.00,NULL),(135,'死胖子','knowledge',1,'31~35',1,20,NULL,'南京',NULL,NULL,'logo.jpg',NULL,NULL,0,71.00,NULL),(136,'温柔一梦','740860638hcm210',0,'',1,15,'undefined','在这里等你','undefined','undefined','0.07583917793817818.jpg',NULL,'我是一个小蟋蟀',0,16.00,NULL),(137,'虾扯蛋','knowledge',1,'31~35',1,10,NULL,'月球',NULL,NULL,'logo.jpg',NULL,NULL,0,0.00,NULL),(138,'我要减肥','knowledge',0,'16~20',1,15,NULL,'月球',NULL,NULL,'logo.jpg',NULL,NULL,0,51.00,NULL),(139,'胖大海','knowledge',1,'26~30',1,15,NULL,'云浮',NULL,NULL,'logo.jpg',NULL,NULL,0,51.00,NULL),(140,'小蟋蟀','knowledge',1,'10~15',1,10,NULL,'月球',NULL,NULL,'logo.jpg',NULL,NULL,0,0.00,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xishuaituideal`
--

DROP TABLE IF EXISTS `xishuaituideal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xishuaituideal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sender` varchar(200) NOT NULL,
  `receiver` varchar(200) NOT NULL,
  `fieldid` int(11) NOT NULL,
  `xishuaitui` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xishuaituideal`
--

LOCK TABLES `xishuaituideal` WRITE;
/*!40000 ALTER TABLE `xishuaituideal` DISABLE KEYS */;
INSERT INTO `xishuaituideal` VALUES (1,'不是事儿','蟋蟀',203,1,'2015-11-04 01:07:35'),(2,'蟋蟀','叶子',230,1,'2015-11-07 10:14:43'),(3,'小小美','江边野火',233,1,'2015-11-07 17:12:03'),(4,'江边野火','小月月',255,1,'2015-11-09 14:11:33'),(5,'不是事儿','蟋蟀',260,1,'2015-11-12 14:40:50'),(6,'温柔一梦','江边野火',280,5,'2015-11-17 16:20:28'),(7,'温柔一梦','江边野火',280,5,'2015-11-17 16:25:37'),(8,'江边野火','温柔一梦',281,1,'2015-11-18 01:30:08'),(9,'江边野火','江边野火',286,5,'2015-12-05 05:54:31'),(10,'不是事儿','江边野火',286,1,'2015-12-04 01:36:54'),(11,'system','江边野火',0,10,'2015-12-10 14:00:55'),(12,'system','江边野火',0,10,'2015-12-10 14:03:31'),(13,'system','江边野火',0,10,'2015-12-10 14:04:17'),(14,'system','江边野火',0,10,'2015-12-10 14:05:51'),(15,'system','江边野火',0,10,'2015-12-10 14:07:08'),(16,'system','江边野火',0,10,'2015-12-10 14:09:07'),(17,'system','江边野火',0,10,'2015-12-10 14:12:06'),(18,'system','江边野火',0,10,'2015-12-10 14:16:49'),(19,'system','江边野火',0,10,'2015-12-15 04:31:27'),(20,'system','江边野火',0,10,'2015-12-15 04:32:41'),(21,'江边野火','蟋蟀',277,100,'2015-12-15 06:43:14'),(22,'system','蟋蟀',0,10,'2015-12-15 06:54:22'),(23,'system','江边野火',0,10,'2015-12-15 06:57:03'),(24,'system','江边野火',0,10,'2015-12-15 07:16:10'),(25,'system','蟋蟀',0,10,'2015-12-15 07:18:37'),(26,'system','蟋蟀',0,10,'2015-12-15 07:19:51'),(27,'system','蟋蟀',0,10,'2015-12-15 07:27:21'),(28,'system','江边野火',0,10,'2015-12-15 10:34:54'),(29,'system','江边野火',0,10,'2015-12-15 10:36:19'),(30,'system','江边野火',0,10,'2015-12-15 14:08:23'),(31,'system','江边野火',0,10,'2015-12-17 13:23:16'),(32,'system','江边野火',0,10,'2015-12-20 14:21:42'),(33,'system','江边野火',0,10,'2015-12-21 14:39:32'),(34,'system','蟋蟀',0,10,'2015-12-21 22:08:58'),(35,'system','江边野火',0,10,'2015-12-22 05:57:38'),(36,'system','蟋蟀',0,10,'2015-12-22 05:58:54'),(37,'蟋蟀','江边野火',350,100,'2015-12-23 07:29:03'),(38,'system','蟋蟀',0,10,'2015-12-23 16:03:05'),(39,'system','江边野火',0,10,'2015-12-28 10:54:23'),(40,'system','蟋蟀',0,9,'2015-12-28 10:58:03'),(41,'system','蟋蟀',0,9,'2015-12-28 10:58:32'),(42,'system','蟋蟀',0,9,'2015-12-28 10:58:58'),(43,'system','不是事儿',0,9,'2015-12-28 11:05:47'),(44,'system','小小美',0,10,'2015-12-28 11:07:04'),(45,'system','小白痴',0,1,'2015-12-28 11:08:22'),(46,'system','笨蛋里挑骨头',0,10,'2015-12-28 11:10:17'),(47,'system','小蚊子',0,10,'2015-12-28 11:11:40'),(48,'system','美丽人生',0,1,'2015-12-28 11:13:04'),(49,'system','小月月',0,1,'2015-12-28 11:15:27'),(50,'system','爱死寂寞人',0,10,'2015-12-28 11:17:00'),(51,'system','爱死寂寞人',0,10,'2015-12-28 11:17:03'),(52,'system','爱死寂寞人',0,10,'2015-12-28 11:22:54'),(53,'system','有缘千里',0,1,'2015-12-28 11:23:47'),(54,'system','随缘',0,1,'2015-12-28 11:24:28'),(55,'system','叶子',0,1,'2015-12-28 11:25:47'),(56,'system','我要减肥',0,1,'2015-12-28 11:26:54'),(57,'system','蕾丝边',0,1,'2015-12-28 11:27:31'),(58,'system','杜雷寺',0,1,'2015-12-28 11:28:11'),(59,'system','死胖子',0,1,'2015-12-28 11:28:49'),(60,'system','胖大海',0,1,'2015-12-28 11:29:58'),(61,'system','江边野火',0,10,'2015-12-30 14:19:34'),(62,'system','江边野火',0,10,'2015-12-30 14:35:21'),(63,'system','江边野火',0,10,'2015-12-31 01:06:44'),(64,'system','江边野火',0,1,'2016-01-05 08:03:06'),(65,'system','江边野火',0,0,'2016-01-05 08:03:06'),(66,'system','江边野火',0,10,'2016-01-05 13:47:26'),(67,'system','江边野火',0,10,'2016-01-05 13:58:22'),(68,'system','江边野火',0,10,'2016-01-05 14:13:15'),(69,'system','江边野火',0,10,'2016-01-05 14:40:04'),(70,'system','蟋蟀',0,9,'2016-01-06 01:04:31'),(71,'system','蟋蟀',0,1,'2016-01-06 01:04:31'),(72,'蟋蟀','江边野火',388,400,'2016-01-06 01:06:15'),(73,'system','江边野火',0,10,'2016-01-06 08:06:05'),(74,'system','江边野火',0,10,'2016-01-06 08:35:08'),(75,'system','江边野火',0,10,'2016-01-06 09:27:22'),(76,'system','江边野火',0,10,'2016-01-06 09:28:10'),(77,'system','江边野火',0,10,'2016-01-06 09:29:56'),(78,'system','江边野火',0,10,'2016-01-06 09:37:43'),(79,'system','江边野火',0,10,'2016-01-06 10:37:32'),(80,'system','江边野火',0,10,'2016-01-06 11:05:27'),(81,'system','江边野火',0,10,'2016-01-06 15:48:58'),(82,'system','江边野火',0,10,'2016-01-07 05:51:30'),(83,'system','江边野火',0,1,'2016-01-07 05:51:30'),(84,'system','江边野火',0,10,'2016-01-07 15:09:07'),(85,'蟋蟀','江边野火',398,200,'2016-01-11 12:23:05'),(86,'system','蟋蟀',0,1,'2016-01-11 12:42:41'),(87,'system','蟋蟀',0,0,'2016-01-11 12:42:41'),(88,'system','小蚊子',0,1,'2016-01-11 12:42:58'),(89,'system','小蚊子',0,0,'2016-01-11 12:42:58'),(90,'system','江边野火',0,10,'2016-01-12 11:29:04'),(91,'system','江边野火',0,10,'2016-01-12 13:07:47'),(92,'system','江边野火',0,10,'2016-01-13 14:47:58'),(93,'system','江边野火',0,10,'2016-01-14 01:45:15'),(94,'system','江边野火',0,10,'2016-01-14 02:15:10'),(95,'system','江边野火',0,1,'2016-01-14 02:15:10'),(96,'system','蟋蟀',0,1,'2016-01-15 02:22:32'),(97,'system','蟋蟀',0,0,'2016-01-15 02:22:32'),(98,'system','江边野火',0,10,'2016-01-15 02:22:45'),(99,'system','江边野火',0,1,'2016-01-15 02:22:45'),(100,'蟋蟀','江边野火',286,10,'2016-01-18 08:04:19'),(101,'system','江边野火',0,10,'2016-01-18 08:05:44'),(102,'system','江边野火',0,1,'2016-01-18 08:05:44'),(103,'system','蟋蟀',0,1,'2016-01-18 08:05:54'),(104,'system','蟋蟀',0,0,'2016-01-18 08:05:54'),(105,'小小美','江边野火',286,1,'2016-01-18 11:43:33'),(106,'system','江边野火',0,10,'2016-01-19 06:34:04'),(107,'system','江边野火',0,1,'2016-01-19 06:34:04'),(108,'system','蟋蟀',0,1,'2016-01-19 06:34:14'),(109,'system','蟋蟀',0,0,'2016-01-19 06:34:14'),(110,'蟋蟀','江边野火',409,1,'2016-01-19 06:35:00'),(111,'system','江边野火',0,10,'2016-01-19 06:37:46'),(112,'system','江边野火',0,10,'2016-01-19 06:38:05'),(113,'小小美','江边野火',411,1,'2016-01-19 06:38:37'),(114,'小小美','江边野火',410,1,'2016-01-19 06:38:41'),(115,'小小美','江边野火',409,1,'2016-01-19 06:38:46'),(116,'小小美','江边野火',408,1,'2016-01-19 06:38:51');
/*!40000 ALTER TABLE `xishuaituideal` ENABLE KEYS */;
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

-- Dump completed on 2016-01-19 15:55:26
