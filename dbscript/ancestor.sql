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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advscore`
--

LOCK TABLES `advscore` WRITE;
/*!40000 ALTER TABLE `advscore` DISABLE KEYS */;
INSERT INTO `advscore` VALUES (4,56,8,'test','firstpage-top'),(5,56,5,'大树','firstpage-top'),(6,24,8,'大树','firstpage-left-mid'),(7,39,7,'大树','firstpage-left-bottom'),(8,68,8,'test','firstpage-top'),(9,67,7,'test','firstpage-left-top'),(10,68,7,'大树','firstpage-top'),(11,84,9,'大树','firstpage-top'),(12,77,9,'大树','firstpage-left-top'),(13,78,6,'大树','firstpage-left-mid'),(14,73,6,'大树','firstpage-left-bottom'),(16,82,9,'/','innerpage-left-bottom'),(18,80,5,'/','innerpage-left-top'),(19,89,9,'江边野火','firstpage-left-top'),(20,88,2,'江边野火','firstpage-left-mid'),(21,89,10,'杜雷寺','firstpage-left-top'),(22,133,10,'江边野火','firstpage-left-top'),(23,131,9,'江边野火','firstpage-left-mid'),(24,132,9,'江边野火','firstpage-left-bottom');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (27,'<h2><font face=\"微软雅黑\" style=\"background-color: rgb(255, 255, 255);\" size=\"4\" color=\"#000000\">本站是小群体网站，请只介绍给你信任的朋友！</font></h2>','system');
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
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8 COMMENT='帖子';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (210,'私人的\r\n                ','其他','其他',1,'TA的秘密','','美国','1995-01','一夫三妻','美三姐妹同嫁一夫','美三姐妹同嫁一夫，其中两个孪生姐妹，另外一个是她们表姐。','共生24个孩子，其乐融融！你们羡慕吗？','估计是什么教徒吧。摩门？','乔',1,'41~45','','',0,'蟋蟀','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-06 10:51:15'),(220,'我喜欢做','人','',1,'WO的秘密','求约','天津','2015-11','翘臀','喜欢女人的翘臀','很多男人喜欢女人的咪咪。','我更喜欢女人的翘臀，喜欢在女人的后面看着翘臀扭来扭去。','看到就很兴奋。','',0,'','','',0,'不是事儿','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-07 14:49:35'),(237,'我最近','人','',1,'WO的秘密','求指点','南京','2015-11','性幻想','我是女孩，有时候会性幻想，正常吗','分手有一年多了，最近经常发呆，也有做梦的，梦到和前男友，还有模糊的男人影子。看电影也会想象到。我这么年轻，这样正常吗？','有没有别人也这样的？','有没有别人也这样的？','',0,'','','',0,'小小美','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-08 10:15:05'),(240,'我喜欢做','物','',1,'WO的秘密','求安慰','北京','2015-11','强迫症','有点强迫症，忍不了一点点乱七八糟','有点秩序强迫症，家里有一点点乱都受不了，都要马上整理好。','男朋友经常被我碎碎嘴，为这个都拌嘴了。可是我还是忍不了，从小习惯东西放在固定的地方，应该没错吧。','又不是洁癖，有秩序不好吗？','',0,'','','',0,'笨蛋里挑骨头','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-08 14:29:29'),(246,'我喜欢做','事','',1,'WO的秘密','求祝福','广州','2015-11','揭痂之癖','我喜欢揭伤口的痂，喜欢撕死皮','有个成语叫嗜痂之癖，我喜欢揭痂，撕死皮，但是不吃，如果有伤口，还没好我就会揭，然后又流血，再揭。剪指甲也喜欢剪指甲旁边的那些皮。','有时候还会揭别人的，知道我这爱好的人都会留着给我揭。都觉得好有意思。','有和我一样的吗？','',0,'','','',0,'小蚊子','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-08 17:55:39'),(247,'我想','人','',1,'WO的秘密','求助','上海','2015-11','小姨子','老婆太强势，小姨子温柔','老婆和丈母娘一样，太强势。小姨子和岳父性格相似，比较温和温顺。','小姨子还没有男朋友，有时候忍不住意淫小姨子，经常想到她的眼神、她的身体，她应该也看到我看她的眼神不一样了，但是她没表现出什么态度。','要是被老婆知道了就是作死的节奏了，真是煎熬啊','',0,'','','',0,'爱死寂寞人','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-08 19:41:52'),(277,'组织的\r\n                  ','饮食','质量',1,'TA的秘密','','北京','2015-11','食品卫生','庆丰包子铺频频被曝卫生问题','庆丰包子铺前期走红。','人民网11月16日。9月15日，网友爆料在庆丰包子中吃出蟑螂。一个月后有网友称大慧寺店的醋里吃出腻虫。庆丰包子铺回应称经核实上述情况属实。11月14日，有顾客反映南瓜粥里有钢丝球的钢丝。','光环效应。','',0,'','','顺义区宏城国泰庆丰包子铺',0,'蟋蟀','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-16 22:50:04'),(280,'\r\n                  私人的\r\n                  \r\n','其他','其他',1,'悬赏秘密','','天津','1997-07','英文歌','求一首歌名','大概1997年左右，买过一个mtv碟，里面都是好听的歌，后来弄丢了。','里面有首歌，记得女歌手唱的，高潮部分是：tonight，tonight，two become one。主唱的动作是俯身朝前抬头，比较诱惑。','百度不到。不知道歌名是什么。要是知道这个碟的其他歌就更赞了。','一首歌',0,'21~25','','',5,'江边野火','2015-11-18','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-17 23:56:43'),(281,'我做过','事','',2,'WO的秘密','求指点','南方小城','2015-11','温柔一梦','温柔一梦','','','','',0,'','','',0,'温柔一梦','0000-00-00','一段网恋，一个忘年之交的故事。当我写下这段文字的时候，脑海里浮现出许多过去的画面，只是太零碎了，碎到我已经不能完整的拼接出这个故事是如何开始，又是为何结束的，也许还没有结束，我也不知道。我只记得我们年龄相差16，他喜欢红烧肉，不喜欢水果和蔬菜。夏天的时候他天气太湿热，他会把下面的毛~拔掉。他喜欢古龙的小说。他从小写字就很好看。他喜欢爱笑的女孩子。他有一个可爱的儿子。他曾一点点教会我男欢女爱的事……只是，我们未曾见过。一切就像一场梦一样，温柔的，虚幻的，残酷的。也许会再见，也许再不见。',1,NULL,1,NULL,NULL,NULL,NULL,NULL,1,'2015-11-18 00:21:11');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floaterowner`
--

LOCK TABLES `floaterowner` WRITE;
/*!40000 ALTER TABLE `floaterowner` DISABLE KEYS */;
INSERT INTO `floaterowner` VALUES (1,274,'不是事儿','2015-11-16 10:43:52'),(2,275,'小月月','2015-11-16 10:44:54'),(3,276,'不是事儿','2015-11-16 14:07:20');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (3,NULL,NULL,'江边野火','小月月'),(4,NULL,NULL,'小月月','江边野火');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heimingdan`
--

LOCK TABLES `heimingdan` WRITE;
/*!40000 ALTER TABLE `heimingdan` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isgood`
--

LOCK TABLES `isgood` WRITE;
/*!40000 ALTER TABLE `isgood` DISABLE KEYS */;
INSERT INTO `isgood` VALUES (3,'test',1,NULL,9),(4,'没有人',1,NULL,109),(7,'test',1,NULL,108),(8,'江边野火',1,NULL,149),(19,'杜雷寺',1,NULL,161),(20,'小月月',1,NULL,161),(22,'蟋蟀',1,NULL,161),(23,'爱死寂寞人',1,NULL,156),(24,'爱死寂寞人',1,NULL,155),(25,'爱死寂寞人',1,NULL,158),(26,'随缘',1,NULL,185),(27,'随缘',1,NULL,181),(28,'笨蛋里挑骨头',1,NULL,189),(36,'蟋蟀',1,NULL,181),(37,'不是事儿',1,NULL,189),(38,'不是事儿',1,NULL,185),(39,'不是事儿',1,NULL,184),(40,'不是事儿',1,NULL,181),(41,'不是事儿',1,NULL,176),(44,'小月月',1,NULL,189),(45,'叶子',1,NULL,189),(47,'沉小鱼',1,NULL,181),(48,'沉小鱼',1,NULL,176),(50,'不是事儿',1,NULL,233),(51,'不是事儿',1,NULL,231),(52,'不是事儿',1,NULL,225),(53,'不是事儿',1,NULL,223),(54,'蕾丝边',1,NULL,233),(55,'蕾丝边',1,NULL,231),(56,'蕾丝边',1,NULL,230),(57,'蕾丝边',1,NULL,229),(58,'蕾丝边',1,NULL,221),(59,'爱死寂寞人',1,NULL,233),(60,'爱死寂寞人',1,NULL,231),(61,'爱死寂寞人',1,NULL,224),(62,'爱死寂寞人',1,NULL,221),(63,'温柔一梦',1,NULL,281),(64,'温柔一梦',1,NULL,280);
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdeal`
--

LOCK TABLES `orderdeal` WRITE;
/*!40000 ALTER TABLE `orderdeal` DISABLE KEYS */;
INSERT INTO `orderdeal` VALUES (27,'WO的秘密','我恨','','选择孙类型','test','',0,'26~30'),(38,'WO的秘密','','','','娃哈哈','',0,''),(47,'WO的秘密','','','','大树','',0,''),(48,'WO的秘密','','','','杜雷寺','',0,''),(52,'WO的秘密','','','','蟋蟀','',0,''),(53,'TA的秘密','','','','江边野火','',0,''),(54,'WO的秘密','','','','小月月','',0,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replay`
--

LOCK TABLES `replay` WRITE;
/*!40000 ALTER TABLE `replay` DISABLE KEYS */;
INSERT INTO `replay` VALUES (81,'江边野火','选择',269,'2015-11-16 18:24:40'),(82,'江边野火','宣恩',268,'2015-11-16 18:24:45'),(83,'小月月','dv',268,'2015-11-16 18:25:34'),(84,'江边野火','111',270,'2015-11-16 18:28:24'),(85,'小月月','地点',270,'2015-11-16 18:28:37'),(86,'小月月','的',271,'2015-11-16 18:31:01'),(87,'江边野火','的',272,'2015-11-16 18:32:56'),(88,'小月月','的',278,'2015-11-17 23:14:33'),(89,'小小美','的',278,'2015-11-17 23:14:51'),(90,'江边野火','的',279,'2015-11-17 23:18:46'),(91,'小蚊子','采纳我吧',280,'2015-11-18 01:05:18'),(92,'江边野火','看看',281,'2015-11-18 09:12:58'),(93,'江边野火','的',283,'2015-11-18 09:22:52'),(94,'小月月','的',284,'2015-11-18 09:27:17'),(95,'小小美','的',284,'2015-11-18 09:27:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (25,60,4,'test'),(27,9,6,'test'),(28,52,5,'test'),(29,53,8,'test'),(30,67,9,'test'),(31,66,6,'xishuai'),(32,82,6,'test'),(33,84,8,'test'),(34,84,9,'大树'),(35,63,9,'大树'),(36,86,9,'大树'),(37,82,9,'大树'),(38,81,4,'大树'),(41,60,9,'大树'),(42,58,6,'大树'),(43,86,8,'娃哈哈'),(44,112,5,'江边野火'),(45,10,2,'大树'),(46,122,9,'大树'),(47,127,9,'大树'),(48,155,5,'杜雷寺'),(49,10,10,'杜雷寺'),(50,189,9,'蟋蟀'),(51,185,9,'蟋蟀'),(52,189,10,'笨蛋里挑骨头'),(53,210,10,'小蚊子'),(54,233,10,'小月月'),(55,231,10,'小月月'),(56,230,7,'小月月'),(57,229,9,'小月月'),(58,228,9,'小月月'),(59,225,8,'小月月'),(60,223,9,'小月月'),(61,222,9,'小月月'),(62,221,9,'小月月'),(63,220,9,'小月月'),(64,210,9,'小月月'),(65,233,10,'不是事儿'),(66,231,10,'不是事儿'),(67,230,9,'不是事儿'),(68,229,10,'不是事儿'),(69,228,10,'不是事儿'),(70,226,8,'不是事儿'),(71,225,9,'不是事儿'),(72,224,10,'不是事儿'),(73,223,9,'不是事儿'),(74,222,9,'不是事儿'),(75,233,9,'蕾丝边'),(76,230,10,'蕾丝边'),(77,229,10,'蕾丝边'),(78,228,10,'蕾丝边'),(79,226,10,'蕾丝边'),(80,225,10,'蕾丝边'),(81,224,8,'蕾丝边'),(82,223,9,'蕾丝边'),(83,222,9,'蕾丝边'),(84,221,9,'蕾丝边'),(85,220,9,'蕾丝边'),(86,210,8,'蕾丝边'),(87,233,10,'爱死寂寞人'),(88,231,9,'爱死寂寞人'),(89,230,9,'爱死寂寞人'),(90,229,9,'爱死寂寞人'),(91,226,9,'爱死寂寞人'),(92,225,9,'爱死寂寞人'),(93,224,8,'爱死寂寞人'),(94,223,10,'爱死寂寞人'),(95,222,10,'爱死寂寞人'),(96,221,8,'爱死寂寞人'),(97,220,10,'爱死寂寞人'),(98,210,8,'爱死寂寞人'),(99,280,10,'温柔一梦'),(100,281,10,'江边野火');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyanswer`
--

LOCK TABLES `surveyanswer` WRITE;
/*!40000 ALTER TABLE `surveyanswer` DISABLE KEYS */;
INSERT INTO `surveyanswer` VALUES (1,'test','haha',1,NULL),(2,'蟋蟀',NULL,1,'haha'),(3,'娃哈哈','haha',1,NULL),(4,'江边野火',NULL,1,'haha'),(5,'小月月',NULL,1,'haha'),(6,'小小美','haha',1,NULL),(7,'小蚊子',NULL,1,'haha'),(8,'爱死寂寞人',NULL,1,'haha');
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmsg`
--

LOCK TABLES `systemmsg` WRITE;
/*!40000 ALTER TABLE `systemmsg` DISABLE KEYS */;
INSERT INTO `systemmsg` VALUES (8,'xishuai','好友验证通过','验证通过','已读','您通过了来自test的好友申请','系统消息'),(12,'xishuai','好友验证未通过','验证通过','已读','蟋蟀拒绝了您的好友申请','系统消息'),(15,'test','好友验证通过','验证通过','未读消息','大树通过了您的好友申请','系统消息'),(26,'娟娟细流','好友验证通过','验证通过','未读消息','您通过了来自江边野火的好友申请','系统消息'),(31,'娟娟细流','好友申请验证','等待审核','未读','加','蟋蟀'),(38,'没有人','好友验证通过','验证通过','未读消息','江边野火通过了您的好友申请','系统消息'),(40,'没有人','好友验证通过','验证通过','未读消息','江边野火通过了您的好友申请','系统消息'),(41,'娟娟细流','好友申请验证','等待审核','未读','嘿嘿','大树'),(45,'大树','好友申请验证','等待审核','已读','出','江边野火'),(50,'没有故事的人','好友验证通过','验证通过','未读消息','您通过了来自爱死寂寞人的好友申请','系统消息'),(51,NULL,'好友申请验证','等待审核','未读',NULL,'蟋蟀'),(52,NULL,'好友申请验证','等待审核','未读',NULL,'蟋蟀'),(59,NULL,'好友申请验证','等待审核','未读',NULL,'江边野火'),(61,'温柔一梦','好友申请验证','等待审核','未读','我看到你写的了','江边野火'),(63,'小月月','好友验证通过','验证通过','已读','您通过了来自江边野火的好友申请','系统消息'),(64,'江边野火','好友验证通过','验证通过','未读','小月月通过了您的好友申请','系统消息');
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
  `score` int(11) DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (115,'ko','ko',1,'16',1,10,NULL,'广州',NULL,NULL,'logo.jpg',NULL,NULL,0,0),(117,'蟋蟀','knowledge',1,'36~40',1,70,'undefined','广州','undefined','undefined','0.20968210534192622.jpg',NULL,'我是一个小蟋蟀',0,16),(119,'小小美','knowledge',0,'21~25',1,25,'undefined','南京','undefined','undefined','0.639867514371872.jpg',NULL,'我是一个小蟋蟀',0,6),(120,'小白痴','knowledge',0,'16~20',1,20,'undefined','深圳','undefined','undefined','0.34694396262057126.jpg',NULL,'我是一个小蟋蟀',0,10),(121,'笨蛋里挑骨头','knowledge',0,'26~30',1,20,'undefined','北京','undefined','undefined','0.8328178711235523.jpg',NULL,'我是一个小蟋蟀',0,10),(122,'小蚊子','knowledge',0,'21~25',1,30,'undefined','广州','undefined','undefined','0.31903971498832107.jpg',NULL,'我是一个小蟋蟀',0,16),(123,'不是事儿','knowledge',1,'21~25',1,15,NULL,'天津',NULL,NULL,'0.7469870562199503.jpg',NULL,NULL,0,9),(124,'美丽人生','knowledge',0,'26~30',1,15,NULL,'杭州',NULL,NULL,'0.532550600823015.jpg',NULL,NULL,0,10),(125,'小月月','knowledge',0,'26~30',1,30,'undefined','上海','undefined','undefined','0.8088674764148891.jpg',NULL,'我是一个小蟋蟀',0,26),(127,'有缘千里','knowledge',0,'26~30',1,15,NULL,'青岛',NULL,NULL,'0.4399007686879486.jpg',NULL,NULL,0,10),(128,'随缘','knowledge',1,'36~40',1,10,NULL,'西安',NULL,NULL,'logo.jpg',NULL,NULL,0,0),(129,'叶子','knowledge',0,'21~25',1,15,NULL,'柳州',NULL,NULL,'logo.jpg',NULL,NULL,0,11),(130,'蕾丝边','knowledge',0,'21~25',1,15,NULL,'佛山',NULL,NULL,'0.1979770192410797.jpg',NULL,NULL,0,10),(131,'爱死寂寞人','knowledge',1,'31~35',1,15,NULL,'上海',NULL,NULL,'0.39070191816426814.jpg',NULL,NULL,0,10),(133,'江边野火','knowledge',1,'36~40',1,55,'undefined','广州','undefined','undefined','0.05786626157350838.jpg',NULL,'撒欢的野鸭',2,8),(134,'杜雷寺','knowledge',1,'26~30',1,10,NULL,'南昌',NULL,NULL,'logo.jpg',NULL,NULL,0,0),(135,'死胖子','knowledge',1,'31~35',1,15,NULL,'南京',NULL,NULL,'logo.jpg',NULL,NULL,0,20),(136,'温柔一梦','740860638hcm210',0,'',1,15,'undefined','在这里等你','undefined','undefined','0.07583917793817818.jpg',NULL,'我是一个小蟋蟀',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xishuaituideal`
--

LOCK TABLES `xishuaituideal` WRITE;
/*!40000 ALTER TABLE `xishuaituideal` DISABLE KEYS */;
INSERT INTO `xishuaituideal` VALUES (1,'不是事儿','蟋蟀',203,1,'2015-11-04 01:07:35'),(2,'蟋蟀','叶子',230,1,'2015-11-07 10:14:43'),(3,'小小美','江边野火',233,1,'2015-11-07 17:12:03'),(4,'江边野火','小月月',255,1,'2015-11-09 14:11:33'),(5,'不是事儿','蟋蟀',260,1,'2015-11-12 14:40:50'),(6,'温柔一梦','江边野火',280,5,'2015-11-17 16:20:28'),(7,'温柔一梦','江边野火',280,5,'2015-11-17 16:25:37'),(8,'江边野火','温柔一梦',281,1,'2015-11-18 01:30:08');
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

-- Dump completed on 2015-11-18 13:48:19
