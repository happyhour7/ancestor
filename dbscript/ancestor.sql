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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'管理员','admin',NULL,'admin',NULL),(2,'admin1','knowledge',NULL,'admin1',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advs`
--

LOCK TABLES `advs` WRITE;
/*!40000 ALTER TABLE `advs` DISABLE KEYS */;
INSERT INTO `advs` VALUES (24,'大树','firstpage-left-mid','0.00162194250151515.jpg',''),(25,NULL,'firstpage-top',NULL,'http://www.baidu.com'),(35,NULL,'firstpage-left-mid',NULL,''),(39,'大树','firstpage-left-bottom','0.7764171380549669.jpg','http://s-199749.abc188.com/'),(40,'大树','innerpage-left-top','0.7764171380549669.jpg','http://s-199749.abc188.com/'),(41,'大树','innerpage-left-bottom','0.596074185334146.jpg','http://s-199749.abc188.com/'),(57,'ok','firstpage-top',NULL,NULL),(58,'ok','firstpage-left-top',NULL,NULL),(59,'ok','firstpage-left-mid',NULL,NULL),(60,'ok','firstpage-left-bottom',NULL,NULL),(61,'ok','innerpage-left-top',NULL,NULL),(62,'ok','firstpage-top',NULL,NULL),(63,'ok','firstpage-left-top',NULL,NULL),(73,'admin','firstpage-left-bottom','0.21615187032148242.jpg','http://s-199749.abc188.com/'),(77,'admin','firstpage-left-top','0.3502621138468385.jpg','http://s-199749.abc188.com/'),(78,'admin','firstpage-left-mid','0.5885099745355546.jpg','http://s-199749.abc188.com/'),(80,'admin','innerpage-left-top','0.48899485846050084.jpg','http://s-199749.abc188.com/'),(82,'admin','innerpage-left-bottom','0.6240886847954243.jpg','http://s-199749.abc188.com/'),(84,'admin','firstpage-top','0.44608689355663955.jpg','http://s-199749.abc188.com/'),(86,'adv','firstpage-top','0.4237996495794505.jpg','http://s-199749.abc188.com/'),(88,'adv','firstpage-left-mid','0.9696883431170136.jpg','http://s-199749.abc188.com/'),(89,'adv','firstpage-left-top','0.5417921037878841.jpg','http://s-199749.abc188.com/'),(90,'adv','firstpage-left-bottom','0.02691914327442646.jpg','http://s-199749.abc188.com/'),(91,'adv','innerpage-left-top','0.6197059678379446.jpg','http://s-199749.abc188.com/'),(92,'adv','innerpage-left-bottom','0.5442114630714059.jpg','http://s-199749.abc188.com/');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advscore`
--

LOCK TABLES `advscore` WRITE;
/*!40000 ALTER TABLE `advscore` DISABLE KEYS */;
INSERT INTO `advscore` VALUES (4,56,8,'test','firstpage-top'),(5,56,5,'大树','firstpage-top'),(6,24,8,'大树','firstpage-left-mid'),(7,39,7,'大树','firstpage-left-bottom'),(8,68,8,'test','firstpage-top'),(9,67,7,'test','firstpage-left-top'),(10,68,7,'大树','firstpage-top'),(11,84,9,'大树','firstpage-top'),(12,77,9,'大树','firstpage-left-top'),(13,78,6,'大树','firstpage-left-mid'),(14,73,6,'大树','firstpage-left-bottom'),(16,82,9,'/','innerpage-left-bottom'),(18,80,5,'/','innerpage-left-top'),(19,89,9,'江边野火','firstpage-left-top'),(20,88,2,'江边野火','firstpage-left-mid'),(21,89,10,'杜雷寺','firstpage-left-top');
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
INSERT INTO `advuser` VALUES (2,'admin','knowledge','管理员',''),(4,'adv','1234','advvvvv','firstpage-top,firstpage-left-top,firstpage-left-mid,firstpage-left-bottom,innerpage-left-top,innerpage-left-bottom'),(7,'adv1','1234','adv1','firstpage-top'),(8,'adv2','12345','adv2','firstpage-left-top'),(9,'adv3','123456','adv3','firstpage-left-mid');
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
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatgroups`
--

LOCK TABLES `chatgroups` WRITE;
/*!40000 ALTER TABLE `chatgroups` DISABLE KEYS */;
INSERT INTO `chatgroups` VALUES (122,'与大树,蟋蟀群聊中','大树,蟋蟀','test','2015-09-26 19:53:37'),(140,'与蟋蟀,test,江边野火群聊中','蟋蟀,test,江边野火','大树','2015-09-28 19:17:58'),(162,'与江边野火群聊中','江边野火','没有人','2015-10-05 21:17:09'),(170,'与没有人群聊中','没有人','江边野火','2015-10-14 12:20:40'),(175,'与小蚊子群聊中','小蚊子','蟋蟀','2015-11-06 23:11:23'),(176,'与蟋蟀群聊中','蟋蟀','小蚊子','2015-11-07 09:35:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (24,'<font size=\"4\">欢迎光临本网站！您可以在本网站发布、出售、悬赏秘密，可以加好友聊天、群聊、偷好友蟋蟀腿，可以打赏你喜欢的用户。</font>','system');
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
  `longstory` varchar(1000) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8 COMMENT='帖子';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (210,'私人的\r\n                ','其他','其他',1,'TA的秘密','','美国','1995-01','一夫三妻','美三姐妹同嫁一夫','美三姐妹同嫁一夫，其中两个孪生姐妹，另外一个是她们表姐。','共生24个孩子，其乐融融！你们羡慕吗？','估计是什么教徒吧。摩门？','乔',1,'41~45','','',0,'蟋蟀','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-06 10:51:15'),(220,'我喜欢做','人','',1,'WO的秘密','求约','天津','2015-11','翘臀','喜欢女人的翘臀','很多男人喜欢女人的咪咪。','我更喜欢女人的翘臀，喜欢在女人的后面看着翘臀扭来扭去。','看到就很兴奋。','',0,'','','',0,'不是事儿','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-07 14:49:35'),(221,'我最近','人','',1,'WO的秘密','求约','南京','2015-10','性幻想','我是女孩，有时候会性幻想，正常吗','不是处女了，有一年多没有交男朋友了。','最近有时候会发呆，会想和男人上床，很模糊，但是下面会湿。','正常吗？是不是要找男人了？','',0,'','','',0,'小小美','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-07 14:52:45'),(222,'我做过','人','',1,'WO的秘密','求指点','深圳','2012-08','处女膜','被同学摸过下面，处女膜还在吗？','高中的时候被同学摸过下面，有点疼就没让继续摸。','是不是把膜摸破了？','最近男朋友想要我，有点担心。','',0,'','','',0,'小白痴','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-07 14:55:02'),(223,'我爱','物','',1,'WO的秘密','求指点','北京','2015-11','强迫症','我有强迫症，家里有一点点乱都不行','我感觉我有秩序强迫症了，家里有一点点乱都不行。','男朋友如果有一点不注意弄乱的沙发、茶几什么的，我都会抱怨，然后整理好。','我的强迫症是不是很严重了？','',0,'','','',0,'笨蛋里挑骨头','0000-00-00','我感觉我有秩序强迫症了，家里有一点点乱都不行。男朋友如果有一点不注意弄乱的沙发、茶几什么的，我都会抱怨，然后整理好。男朋友都有怨言了。我的强迫症是不是很重',1,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-07 14:58:07'),(224,'我爱','事','',1,'WO的秘密','求安慰','广州','2015-11','揭痂之癖','我喜欢揭伤口的痂，喜欢撕死皮','有时候伤口快好了，我会提前撕开痂皮，然后又流血，等痂快好了又揭。','这应该不是什么病吧？也因为这样我的伤口好的很快。','有同样爱好的吗？','',0,'','','',0,'小蚊子','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-07 15:00:48'),(225,'我爱','人','',1,'WO的秘密','求祝福','杭州','2011-02','暗恋','暗恋一个朋友，好几年了','是我大学同一级的校友，有一次同学聚会上认识的。','很巧，毕业后都到杭州工作。不巧的是，我们没有成为男女朋友，可能他对我没感觉吧。','王振龙。','',0,'','','',0,'美丽人生','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-07 15:05:16'),(226,'私人的\r\n                ','同事','其他',1,'TA的秘密','','上海','2015-11','买房','同事父母要求同事男朋友有房才能结婚','同事是本地人，她父母要求她男朋友先买房才能结婚。','上海房价这么高，他男朋友一个月才几千块，家里又支援不上。同事看起来蛮痛苦犹豫的。','房价跌下来就好了。','杨',0,'26~30','','',0,'小月月','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-07 15:10:25'),(228,'我最近','人','',1,'WO的秘密','求开导','上海','2015-10','小姨子','老婆太强势，经常意淫小姨子','老婆太强势了，但是小姨子就比较温柔。','小姨子还没有男朋友，我经常意淫小姨子，性幻想，她的眼她的身材，好像她也看到我的眼神不一样了','煎熬啊','',0,'','','',0,'爱死寂寞人','0000-00-00','老婆太强势了，但是小姨子就比较温柔。小姨子还没有男朋友，我经常意淫小姨子，性幻想，她的眼她的身材，好像她也看到我的眼神不一样了，不过她也没表现出什么。熬啊',1,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-07 15:18:33'),(229,'我做过','人','',1,'WO的秘密','求骂醒','济南','2012-07','裸照','以前给一个网友拍照看了下面','有过一个短暂的婚姻，郁闷的时候认识了一个网友。','聊的蛮好的，后来发展到拍照给他看了下面，慢慢的后来就不怎么联系了。','男人是不是连看都是得到了就不在意了？','',0,'','','',0,'有缘千里','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-07 15:22:03'),(230,'其他','其他','',1,'WO的秘密','求安慰','柳州','2015-11','人丑自卑','长的丑，很自卑','从小就长的丑，经常被同学嘲笑。','工作也不好，不会和人打交道，朋友也比较少，到现在也没交过男朋友。','老天为什么这么不公平','',0,'','','',0,'叶子','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-07 15:29:31'),(231,'其他','人','',1,'WO的秘密','求指点','佛山','2015-11','情趣内衣','男朋友喜欢让我穿着性感内衣','男朋友之前比较花，他喜欢让我穿着性感内衣，有时候在家还不让穿内裤。','我知道他喜欢玩花样，时间长了他会不会有新的要求？','会不会有天对我腻了？','',0,'','','',0,'蕾丝边','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-07 15:33:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (1,NULL,NULL,'江边野火','不是事儿'),(2,NULL,NULL,'不是事儿','江边野火');
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isbad`
--

LOCK TABLES `isbad` WRITE;
/*!40000 ALTER TABLE `isbad` DISABLE KEYS */;
INSERT INTO `isbad` VALUES (16,'test',1,52),(17,'test',1,60),(18,'test',1,67),(19,'xishuai',1,66),(20,'test',1,79),(21,'大树',1,101),(22,'江边野火',1,112),(27,'test',1,107),(29,'江边野火',1,151),(30,'江边野火',1,150),(32,'蟋蟀',1,158),(35,'没有故事的人',1,170),(36,'随缘',1,184),(37,'随缘',1,176),(38,'笨蛋里挑骨头',1,184),(39,'叶子',1,185),(40,'叶子',1,184),(41,'叶子',1,181),(42,'叶子',1,176),(43,'沉小鱼',1,189),(44,'沉小鱼',1,185),(45,'沉小鱼',1,184),(46,'杜雷寺',1,189),(47,'小蚊子',1,210);
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isgood`
--

LOCK TABLES `isgood` WRITE;
/*!40000 ALTER TABLE `isgood` DISABLE KEYS */;
INSERT INTO `isgood` VALUES (3,'test',1,NULL,9),(4,'没有人',1,NULL,109),(7,'test',1,NULL,108),(8,'江边野火',1,NULL,149),(19,'杜雷寺',1,NULL,161),(20,'小月月',1,NULL,161),(22,'蟋蟀',1,NULL,161),(23,'爱死寂寞人',1,NULL,156),(24,'爱死寂寞人',1,NULL,155),(25,'爱死寂寞人',1,NULL,158),(26,'随缘',1,NULL,185),(27,'随缘',1,NULL,181),(28,'笨蛋里挑骨头',1,NULL,189),(36,'蟋蟀',1,NULL,181),(37,'不是事儿',1,NULL,189),(38,'不是事儿',1,NULL,185),(39,'不是事儿',1,NULL,184),(40,'不是事儿',1,NULL,181),(41,'不是事儿',1,NULL,176),(44,'小月月',1,NULL,189),(45,'叶子',1,NULL,189),(47,'沉小鱼',1,NULL,181),(48,'沉小鱼',1,NULL,176);
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdeal`
--

LOCK TABLES `orderdeal` WRITE;
/*!40000 ALTER TABLE `orderdeal` DISABLE KEYS */;
INSERT INTO `orderdeal` VALUES (27,'WO的秘密','我恨','','选择孙类型','test','',0,'26~30'),(38,'WO的秘密','','','','娃哈哈','',0,''),(45,'WO的秘密','','','','江边野火','',0,''),(47,'WO的秘密','','','','大树','',0,''),(48,'WO的秘密','','','','杜雷寺','',0,''),(51,'TA的秘密','','','','小月月','',0,''),(52,'WO的秘密','','','','蟋蟀','',0,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays`
--

LOCK TABLES `pays` WRITE;
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
INSERT INTO `pays` VALUES (1,'蟋蟀','2015102121001004060081543949','20151021344666',0.01),(2,'蟋蟀','2015102121001004680044908379','20151021419355',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replay`
--

LOCK TABLES `replay` WRITE;
/*!40000 ALTER TABLE `replay` DISABLE KEYS */;
INSERT INTO `replay` VALUES (62,'没有故事的人','1',170,'2015-10-26 22:40:32'),(63,'沉小鱼','的',189,'2015-11-02 19:30:18'),(64,'沉小鱼','的',189,'2015-11-02 19:30:21'),(65,'沉小鱼','的',189,'2015-11-02 19:30:24'),(66,'小月月','但是',199,'2015-11-03 23:19:06'),(67,'蟋蟀','的',203,'2015-11-04 09:00:58'),(68,'不是事儿','的',204,'2015-11-04 09:02:20'),(69,'不是事儿','女艺人的富商老公H？',206,'2015-11-04 21:24:05'),(70,'小蚊子','的',214,'2015-11-06 23:00:19'),(71,'不是事儿','的',215,'2015-11-06 23:05:27'),(72,'不是事儿','的',214,'2015-11-06 23:06:26'),(73,'蟋蟀','长得丑也可以勇敢一点找男人，毕竟相貌只是短暂的吸引力。',230,'2015-11-07 15:47:16');
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (25,60,4,'test'),(27,9,6,'test'),(28,52,5,'test'),(29,53,8,'test'),(30,67,9,'test'),(31,66,6,'xishuai'),(32,82,6,'test'),(33,84,8,'test'),(34,84,9,'大树'),(35,63,9,'大树'),(36,86,9,'大树'),(37,82,9,'大树'),(38,81,4,'大树'),(41,60,9,'大树'),(42,58,6,'大树'),(43,86,8,'娃哈哈'),(44,112,5,'江边野火'),(45,10,2,'大树'),(46,122,9,'大树'),(47,127,9,'大树'),(48,155,5,'杜雷寺'),(49,10,10,'杜雷寺'),(50,189,9,'蟋蟀'),(51,185,9,'蟋蟀'),(52,189,10,'笨蛋里挑骨头'),(53,210,10,'小蚊子');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (16,'你有时候上完厕所会不会闻一闻？',NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmsg`
--

LOCK TABLES `systemmsg` WRITE;
/*!40000 ALTER TABLE `systemmsg` DISABLE KEYS */;
INSERT INTO `systemmsg` VALUES (8,'xishuai','好友验证通过','验证通过','已读','您通过了来自test的好友申请','系统消息'),(12,'xishuai','好友验证未通过','验证通过','已读','蟋蟀拒绝了您的好友申请','系统消息'),(15,'test','好友验证通过','验证通过','未读消息','大树通过了您的好友申请','系统消息'),(26,'娟娟细流','好友验证通过','验证通过','未读消息','您通过了来自江边野火的好友申请','系统消息'),(31,'娟娟细流','好友申请验证','等待审核','未读','加','蟋蟀'),(38,'没有人','好友验证通过','验证通过','未读消息','江边野火通过了您的好友申请','系统消息'),(40,'没有人','好友验证通过','验证通过','未读消息','江边野火通过了您的好友申请','系统消息'),(41,'娟娟细流','好友申请验证','等待审核','未读','嘿嘿','大树'),(45,'大树','好友申请验证','等待审核','已读','出','江边野火'),(50,'没有故事的人','好友验证通过','验证通过','未读消息','您通过了来自爱死寂寞人的好友申请','系统消息'),(51,NULL,'好友申请验证','等待审核','未读',NULL,'蟋蟀'),(52,NULL,'好友申请验证','等待审核','未读',NULL,'蟋蟀'),(57,'不是事儿','好友验证通过','验证通过','未读','您通过了来自江边野火的好友申请','系统消息'),(58,'江边野火','好友验证通过','验证通过','未读','不是事儿通过了您的好友申请','系统消息');
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
  `age` varchar(45) DEFAULT NULL,
  `usertype` int(11) DEFAULT '0' COMMENT '0:普通用户；1：广告主；2：咨询师',
  `score` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cityname` varchar(45) DEFAULT NULL,
  `qq` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `userPhoto` varchar(45) DEFAULT 'logo.jpg',
  `address` varchar(200) DEFAULT NULL,
  `mark` varchar(45) DEFAULT NULL,
  `money` float NOT NULL DEFAULT '0',
  `xishuaitui` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (115,'ko','ko',1,'16',1,10,NULL,'广州',NULL,NULL,'logo.jpg',NULL,NULL,0,0),(117,'蟋蟀','knowledge',1,'36~40',1,20,'undefined','广州','undefined','undefined','0.20968210534192622.jpg',NULL,'我是一个小蟋蟀',0,0),(119,'小小美','knowledge',0,'21~25',1,20,'undefined','南京','undefined','undefined','logo.jpg',NULL,'我是一个小蟋蟀',0,10),(120,'小白痴','knowledge',0,'16~20',1,20,'undefined','深圳','undefined','undefined','logo.jpg',NULL,'我是一个小蟋蟀',0,10),(121,'笨蛋里挑骨头','knowledge',0,'26~30',1,15,'undefined','北京','undefined','undefined','logo.jpg',NULL,'我是一个小蟋蟀',0,10),(122,'小蚊子','knowledge',0,'21~25',1,25,'undefined','广州','undefined','undefined','logo.jpg',NULL,'我是一个小蟋蟀',0,10),(123,'不是事儿','knowledge',1,'21~25',1,15,NULL,'天津',NULL,NULL,'logo.jpg',NULL,NULL,0,10),(124,'美丽人生','knowledge',0,'26~30',1,15,NULL,'杭州',NULL,NULL,'logo.jpg',NULL,NULL,0,10),(125,'小月月','knowledge',0,'26~30',1,15,'undefined','上海','undefined','undefined','logo.jpg',NULL,'我是一个小蟋蟀',0,10),(127,'有缘千里','knowledge',0,'26~30',1,15,NULL,'青岛',NULL,NULL,'logo.jpg',NULL,NULL,0,10),(128,'随缘','knowledge',1,'36~40',1,10,NULL,'西安',NULL,NULL,'logo.jpg',NULL,NULL,0,0),(129,'叶子','knowledge',0,'21~25',1,15,NULL,'柳州',NULL,NULL,'logo.jpg',NULL,NULL,0,11),(130,'蕾丝边','knowledge',0,'21~25',1,15,NULL,'佛山',NULL,NULL,'logo.jpg',NULL,NULL,0,10),(131,'爱死寂寞人','knowledge',1,'31~35',1,10,NULL,'上海',NULL,NULL,'logo.jpg',NULL,NULL,0,0),(132,'爽歪歪','knowledge',1,'36~40',1,10,NULL,'镇江',NULL,NULL,'logo.jpg',NULL,NULL,0,0),(133,'江边野火','knowledge',1,'36~40',1,15,NULL,'广州',NULL,NULL,'logo.jpg',NULL,NULL,0,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xishuaituideal`
--

LOCK TABLES `xishuaituideal` WRITE;
/*!40000 ALTER TABLE `xishuaituideal` DISABLE KEYS */;
INSERT INTO `xishuaituideal` VALUES (1,'不是事儿','蟋蟀',203,1,'2015-11-04 01:07:35'),(2,'蟋蟀','叶子',230,1,'2015-11-07 10:14:43');
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

-- Dump completed on 2015-11-07 22:01:05
