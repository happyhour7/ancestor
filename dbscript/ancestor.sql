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
-- Table structure for table `awardrecord`
--

DROP TABLE IF EXISTS `awardrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awardrecord` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awardrecord`
--

LOCK TABLES `awardrecord` WRITE;
/*!40000 ALTER TABLE `awardrecord` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (27,'<h2><font face=\"微软雅黑\" style=\"background-color: rgb(255, 255, 255);\" size=\"4\" color=\"#000000\">本站是小群体网站，请只介绍给你信任的朋友！</font></h2>','system'),(28,'5','rankpay');
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
) ENGINE=InnoDB AUTO_INCREMENT=352 DEFAULT CHARSET=utf8 COMMENT='帖子';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (210,'私人的\r\n                ','其他','其他',1,'TA的秘密','','美国','1995-01','一夫三妻','美三姐妹同嫁一夫','美三姐妹同嫁一夫，其中两个孪生姐妹，另外一个是她们表姐。','共生24个孩子，其乐融融！你们羡慕吗？','估计是什么教徒吧。摩门？','乔',1,'41~45','','',0,'蟋蟀','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-06 10:51:15'),(220,'我喜欢做','人','',1,'WO的秘密','求约','天津','2015-11','翘臀','喜欢女人的翘臀','很多男人喜欢女人的咪咪。','我更喜欢女人的翘臀，喜欢在女人的后面看着翘臀扭来扭去。','看到就很兴奋。','',0,'','','',0,'不是事儿','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-07 14:49:35'),(237,'我最近','人','',1,'WO的秘密','求指点','南京','2015-11','性幻想','我是女孩，有时候会性幻想，正常吗','分手有一年多了，最近经常发呆，也有做梦的，梦到和前男友，还有模糊的男人影子。看电影也会想象到。我这么年轻，这样正常吗？','有没有别人也这样的？','有没有别人也这样的？','',0,'','','',0,'小小美','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-08 10:15:05'),(240,'我喜欢做','物','',1,'WO的秘密','求安慰','北京','2015-11','强迫症','有点强迫症，忍不了一点点乱七八糟','有点秩序强迫症，家里有一点点乱都受不了，都要马上整理好。','男朋友经常被我碎碎嘴，为这个都拌嘴了。可是我还是忍不了，从小习惯东西放在固定的地方，应该没错吧。','又不是洁癖，有秩序不好吗？','',0,'','','',0,'笨蛋里挑骨头','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-08 14:29:29'),(246,'我喜欢做','事','',1,'WO的秘密','求祝福','广州','2015-11','揭痂之癖','我喜欢揭伤口的痂，喜欢撕死皮','有个成语叫嗜痂之癖，我喜欢揭痂，撕死皮，但是不吃，如果有伤口，还没好我就会揭，然后又流血，再揭。剪指甲也喜欢剪指甲旁边的那些皮。','有时候还会揭别人的，知道我这爱好的人都会留着给我揭。都觉得好有意思。','有和我一样的吗？','',0,'','','',0,'小蚊子','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-08 17:55:39'),(247,'我想','人','',1,'WO的秘密','求助','上海','2015-11','小姨子','老婆太强势，小姨子温柔','老婆和丈母娘一样，太强势。小姨子和岳父性格相似，比较温和温顺。','小姨子还没有男朋友，有时候忍不住意淫小姨子，经常想到她的眼神、她的身体，她应该也看到我看她的眼神不一样了，但是她没表现出什么态度。','要是被老婆知道了就是作死的节奏了，真是煎熬啊','',0,'','','',0,'爱死寂寞人','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-08 19:41:52'),(277,'组织的\r\n                  ','饮食','质量',1,'TA的秘密','','北京','2015-11','食品卫生','庆丰包子铺频频被曝卫生问题','庆丰包子铺前期走红。','人民网11月16日。9月15日，网友爆料在庆丰包子中吃出蟑螂。一个月后有网友称大慧寺店的醋里吃出腻虫。庆丰包子铺回应称经核实上述情况属实。11月14日，有顾客反映南瓜粥里有钢丝球的钢丝。','光环效应。','',0,'','','顺义区宏城国泰庆丰包子铺',0,'蟋蟀','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-16 22:50:04'),(286,'\r\n                  私人的\r\n                  \r\n','其他','其他',1,'悬赏秘密','','天津','1997-10','英文歌','求一首英文歌的歌名','大概1997年的时候买过一个碟，里面是MTV集锦，里面的所有歌都很好听，后来被朋友拿走了。','其中一个女歌手唱的歌，高潮部分是tonight，tonight，two become one。歌手唱的时候俯身朝前抬头，很诱惑的表情。','如果知道碟里面的其他歌曲就更赞了。','女歌手',0,'26~30','','',5,'江边野火','2015-11-19','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-11-18 23:52:25'),(345,'我做过','人','',1,'WO的秘密','求祝福','扬中','1994-07','回忆','回忆之一——邻居老老','','','','',0,'','','',0,'江边野火','0000-00-00','0000前面一家的老人姓倪，我叫他老老——我们当地方言，就是爷爷——据说是从江北（我们那里四面环江，江那边都叫江北）逃难过来的，小时候过年的时候经常看到他的许多亲戚过来拜年。老人前几年刚离世，活了90岁，这在我们那个长江下游癌症强县属于绝对的高龄了，这让我又诧异又异常钦佩。<br>0000老老给我印象最深的画面是在傍晚到处高声叫喊“宝宝”寻找他的上门女婿和第二个老婆生的小孩。每当其他邻居听到的时候，邻居们都互相会心一笑说“聋子又在叫宝宝了”。他们会特别加重“宝宝”两个字的音，里面充满了促狭和取笑的意味，尤其是那些玲珑先富的人。“宝宝”是他女婿和第二个老婆生的孩子，第二个老婆是他女婿在他女儿逝世之后“买”的媳妇——而且，这个媳妇后来还跑了。他们取笑的是“宝宝”不是他的血脉，可他却叫的那么关切、那么着急。但他们都只是在他背后笑，老老是生产队时候的老队长，年轻的时候很有威严，虽然老了耳朵聋了，他们也不敢在他面前笑，见了面还是会表面尊重的笑着做做问候的口型和手势，他也会讪讪的大声的笑着回应。我想，他应该也知道别人在他背后嘲讽他，不仅嘲讽他的聋，嘲讽他的女儿早逝，还会嘲讽他只叫的出“宝宝”而叫不出名字。然而，他在生产队的时候做队长，那么严厉，不可能没有让别人不痛快过，现在他女儿早逝了，上门女婿又重建了家庭，他还能怎么样呢，孩子能随他姓他就满足了。因此，他还是高声叫喊着“宝宝”去寻找他的孙子，见到人就大声询问：“有没有看见我家宝宝”，要是没找到，就会着急的皱着眉头自言自语：“去了哪里呢，这么晚还不回家”。等他的孙子出现在他的视线里时，他就会又焦急又略带责备的说：“宝宝，这么晚了，怎么还不回家吃夜饭呢”。 <br>0000老老是个异常勤劳的人，一直勤劳到他去世。每年的夏天是他攒钱的时候。江南的气候四季分明，每到晚春初夏，黄鳝刚出洞他也就出动了。常常可以看到他背着个铁皮桶和锄头，到处寻找可以挖到青蚯蚓的地方。逮到蚯蚓回来用竹签穿住，放进专门套黄鳝的竹笼里，近黄昏的时候，挑着两担黄鳝笼，沿着小河、小沟渠、水稻田放黄鳝笼，第二天早上天不亮就去取起来。不管刮风下雨，除非生病，每天都是如此，有时候看到他可能是因为不小心掉进河里而浑身湿透，我妈就会忍不住惋惜的说：“老棺材又掉河里了”。逮到的黄鳝养在家里，攒到一定数量，一大早他就挑着走个四五公里去街上卖。卖回来的钱他都藏在家里，谁也不知道藏在哪里——偶尔他也借个三两百给他信任的人。我小时候很喜欢早上起来去看他倒黄鳝，只要摇到沉沉的竹笼，我就会挑起来拿给他让他先倒这个，倒出来的黄鳝果然很大，我就会啧啧赞叹，他也会探头朝塑料桶里多看一眼，笑一笑。<br>0000我一直都喜欢看到人的笑容，也很喜欢看到他逮到黄鳝后的笑，不过，他很少笑，更多的是很严肃甚至很凶的表情。印象最深的一次是他的上门女婿和他吵架要回自己家，他女儿拉着她丈夫的自行车不让他走——从让宝宝跟着他姓倪就可以看出来，他女婿是个很厚道的人，做瓦工每天拿到的烟都带回来给他抽，而且是个脾气非常好的男人，就这样的还能被他逼得要回自己家，可想而知，他是个多凶的人了。好在这样的场景我就记得一次，那个时候他还不是很老，他女儿还很年轻还健在。<br>0000慢慢的，他聋了，他老了，变得没那么凶了，后来，他女儿也过逝了，老伴也过逝了，他的表情和眼神变得很平静，平静的叼着根烟，平静的走着，平静的说话，平静的去放黄鳝。他女婿花钱买了个老婆，他也只是来我家平静的询问我妈的看法。再后来，有了“宝宝”，黄昏的路上，也多了他佝偻着瘦瘦的身躯声嘶力竭的找寻“宝宝”的声音。<br>2015-12-7<br>',1,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-12-15 18:34:52'),(350,'我做过','人','',1,'WO的秘密','求祝福','扬中','1984-08','回忆','回忆之三——童年拾趣','','','','',0,'','','',0,'江边野火','0000-00-00','人生中有很多奇妙的事情，比如，我的孩子马上就要开始他的童年时光，我自己的童年往事却也像刚过去不久，在我眼前浮现的时候清晰的很，而且，许多在小时候未必快乐的事情，现在记起来就多了很多快乐的感觉。<br>在我小时候，我们吃的东西都还是天然的、有机的，远比现在的加工食品要美味而健康。且不说清甜的芦苇根、野青菱，也不说肥美的无数的野螃蟹，更不要说鲜美的鱼虾蚌螺，就连青涩的拐枣、酸酸的野草莓也都能把人馋的想起来就会流口水。我记不清放学的路上在麦田埂上偷吃了多少蚕豆，在小河边偷剥了多少茭白，在田边偷拔了多少胡萝卜。那个时候，河港里还能钓上来鳗鱼、甲鱼，还能钓上来叫不上名字的鱼，我家的小河里也可以钓到筷子长的大泥鳅，在稻田里、沟渠里逮到七八两乃至一两斤的黄鳝也毫不稀奇，各种红烧绝不会吃厌。<br>那个时候，我们没有玩具车、没有电视，我们滚铁圈、打纸炮，自己削陀螺、打陀螺，我们经常把木片削成木刀木剑，和小伙伴们嘶吼着拼杀。我们也会截一段竹管做炮筒，削一根筷子做推子，做成小炮，用一种小果子做子弹，前后端塞两个小果子，推子在后面用力一推，前面小果子就在清脆的“啪”声中发射出去。那个时候总是很容易找到开心的事情。春天在土垛边静静的等候采完蜜的蜜蜂爬进土垛上的孔，拿玻璃罐盖住孔，用小枝条一点点的把蜜蜂捅进罐里。夏天可以到处逮知了，可以看哥哥们在河里游水，他们一个猛子钻到很远，得意的看着他们的父母拿着不够长的竹竿无可奈何的怒吼让他们上岸。秋天可以去江堤上看大船，看野鸡，点燃茅草放野火。冬天在结冰的地面上滑溜，下雪后打雪仗，趁小伙伴经过竹子下方时把竹子上的雪摇进他们的脖子。种水稻的季节，大片大片的野苜蓿开着紫色的、红色的花，在田里疯长，无数小蜜蜂嗡嗡的在上面飞舞。到了收割的时候，我们就在上面嬉戏玩耍。随便就能逮到肥大的田鸡（貌似青蛙，型小，色灰），两个手指捏着它背上软软的皮，看着它白白的肚子一鼓一鼓的，大眼睛被我们一下一下的吹的闭上、睁开、闭上、睁开，呆头呆脑的样子逗的我们哈哈大笑，我们朝天空一扔，看着它落在松软的苜蓿上，失魂落魄的发怔，然后惊慌失措的逃走。一年级的时候，不知哪个同学说学校要给学生打针，还说打了针就会死。我们不敢去上学，回到家，大人们都在田里收割野苜蓿，我们也跑到田里，跳跃、追逐、打滚，层层野苜蓿如棉被一般松软，我们踩着扯着拽着，打仗一般的乱扔，完全忘记了去担心第二天会被责罚。<br>要说最开心的事还数过年，不仅父母和蔼，而且有各种美餐，还有新衣服穿。腊月二十几就蒸萝卜馅馒头、水糕、糯米丸子，煮骨头、炸肉丸、腌咸鱼，还没等到除夕的大餐，就已经饱了，连美味的馄饨也吃不下多少。除夕晚上，平时少听的鞭炮声彻夜响个不停，正月初一大早上就会被锣鼓声、鞭炮声吵醒。急冲冲的穿好新衣服，带上个布袋，约上小伙伴，一家一家的去拜年。叫完每一个人，磕磕巴巴的背完祝福的话，在“祝你以后考大学”的回祝福声中开心的笑着，腼腆的张开袋子兜住花生、瓜子、糖，运气好时还能有一两条上海云片糕。回来的一路上和小伙伴比谁的东西多，到家了跟父母说上一声，带上铁榔头，到处找没炸尽的小鞭炮，放在大石头上，把鞭炮砸响，小伙伴们一边吓的捂住耳朵一边哈哈大笑。初一那天，父母基本上不会打骂，就像脱缰的野马一样肆意玩耍，雪天的时候摔的衣服脏了也不用担心。要是看到舞龙灯、舞狮子、唱凤凰的，就一路跟着看，一路追着闻人家欢迎龙灯上门放鞭炮后弥漫在空气中的火药味。<br>除了没拿到过奖状、父母吵架以外，已经不记得小时候还有什么事情会让我不太开心——或许只有杨辣子了。到现在，我离家多年，已经多年没见过杨辣子，倒也有些怀念。杨辣子是一种夏天的时候长在杨树上的毛毛虫，身上长满毛，一碰到它——甚至不用碰到，有时候风里就有——就会有毛钻进毛孔，带来钻心的痛，接下来的几天，疼痛持续不止。如果碰到那一片地方，疼痛还会加剧，直到皮肤把它那根毛融化掉。夏天的时候穿的少，我又经常在树下乱窜，稍不小心，就会中标。它如此令人讨厌，以致消灭它就成了一个独特的乐趣。只要发现了杨辣子，就用树枝夹住或者用没有毛孔的指面捏住，把它扔进水里，看着它肥肥的身子浮在水面，扭来扭去，不用一会儿就会有小鱼过来一口把它吞下去。<br>那个时候常常有稀奇古怪的想法，比如，鱼儿吞了杨辣子会不会被它蛰死，刚看到的蛇会不会在后面突然过来追我，放学路上那个竹林里的坟有没有住着一个鬼，但可以肯定的是，没有想过要好好的记住当时，那个时候天天盼着的就是快点长大。幸运的很，我的记忆力虽然不好，但是记人记事却是轻而易举。到现在，童年的趣事如一副副图片一部部电影牢牢的存储在大脑里，有时厌了、倦了、痛了，就打开来看看，再感受一下那时那种快乐，就会轻松很多。',1,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-12-20 22:21:52'),(351,'我做过','人','',1,'WO的秘密','求祝福','测试','2015-11','测','测','测','测','测','',0,'','','',0,'江边野火','0000-00-00','',0,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'2015-12-21 22:39:49');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
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
INSERT INTO `friends` VALUES (7,NULL,NULL,'江边野火','温柔一梦'),(8,NULL,NULL,'温柔一梦','江边野火');
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isgood`
--

LOCK TABLES `isgood` WRITE;
/*!40000 ALTER TABLE `isgood` DISABLE KEYS */;
INSERT INTO `isgood` VALUES (3,'test',1,NULL,9),(4,'没有人',1,NULL,109),(7,'test',1,NULL,108),(8,'江边野火',1,NULL,149),(19,'杜雷寺',1,NULL,161),(20,'小月月',1,NULL,161),(22,'蟋蟀',1,NULL,161),(23,'爱死寂寞人',1,NULL,156),(24,'爱死寂寞人',1,NULL,155),(25,'爱死寂寞人',1,NULL,158),(26,'随缘',1,NULL,185),(27,'随缘',1,NULL,181),(28,'笨蛋里挑骨头',1,NULL,189),(36,'蟋蟀',1,NULL,181),(37,'不是事儿',1,NULL,189),(38,'不是事儿',1,NULL,185),(39,'不是事儿',1,NULL,184),(40,'不是事儿',1,NULL,181),(41,'不是事儿',1,NULL,176),(44,'小月月',1,NULL,189),(45,'叶子',1,NULL,189),(47,'沉小鱼',1,NULL,181),(48,'沉小鱼',1,NULL,176),(50,'不是事儿',1,NULL,233),(51,'不是事儿',1,NULL,231),(52,'不是事儿',1,NULL,225),(53,'不是事儿',1,NULL,223),(54,'蕾丝边',1,NULL,233),(55,'蕾丝边',1,NULL,231),(56,'蕾丝边',1,NULL,230),(57,'蕾丝边',1,NULL,229),(58,'蕾丝边',1,NULL,221),(59,'爱死寂寞人',1,NULL,233),(60,'爱死寂寞人',1,NULL,231),(61,'爱死寂寞人',1,NULL,224),(62,'爱死寂寞人',1,NULL,221),(63,'温柔一梦',1,NULL,281),(64,'温柔一梦',1,NULL,280),(65,'江边野火',1,NULL,280),(66,'江边野火',1,NULL,247),(67,'江边野火',1,NULL,246),(68,'江边野火',1,NULL,240),(69,'江边野火',1,NULL,237),(70,'江边野火',1,NULL,220),(71,'江边野火',1,NULL,210);
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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdeal`
--

LOCK TABLES `orderdeal` WRITE;
/*!40000 ALTER TABLE `orderdeal` DISABLE KEYS */;
INSERT INTO `orderdeal` VALUES (27,'WO的秘密','我恨','','选择孙类型','test','',0,'26~30'),(38,'WO的秘密','','','','娃哈哈','',0,''),(47,'WO的秘密','','','','大树','',0,''),(48,'WO的秘密','','','','杜雷寺','',0,''),(52,'WO的秘密','','','','蟋蟀','',0,''),(54,'WO的秘密','','','','小月月','',0,''),(59,'TA的秘密','私人的','其他','','不是事儿','',2,''),(72,'','','','','小白痴','',0,'21~25'),(77,'WO的秘密','私人的','其他','其他','江边野火','',0,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replay`
--

LOCK TABLES `replay` WRITE;
/*!40000 ALTER TABLE `replay` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (25,60,4,'test'),(27,9,6,'test'),(28,52,5,'test'),(29,53,8,'test'),(30,67,9,'test'),(31,66,6,'xishuai'),(32,82,6,'test'),(33,84,8,'test'),(34,84,9,'大树'),(35,63,9,'大树'),(36,86,9,'大树'),(37,82,9,'大树'),(38,81,4,'大树'),(41,60,9,'大树'),(42,58,6,'大树'),(43,86,8,'娃哈哈'),(44,112,5,'江边野火'),(45,10,2,'大树'),(46,122,9,'大树'),(47,127,9,'大树'),(48,155,5,'杜雷寺'),(49,10,10,'杜雷寺'),(50,189,9,'蟋蟀'),(51,185,9,'蟋蟀'),(52,189,10,'笨蛋里挑骨头'),(53,210,10,'小蚊子'),(54,233,10,'小月月'),(55,231,10,'小月月'),(56,230,7,'小月月'),(57,229,9,'小月月'),(58,228,9,'小月月'),(59,225,8,'小月月'),(60,223,9,'小月月'),(61,222,9,'小月月'),(62,221,9,'小月月'),(63,220,9,'小月月'),(64,210,9,'小月月'),(65,233,10,'不是事儿'),(66,231,10,'不是事儿'),(67,230,9,'不是事儿'),(68,229,10,'不是事儿'),(69,228,10,'不是事儿'),(70,226,8,'不是事儿'),(71,225,9,'不是事儿'),(72,224,10,'不是事儿'),(73,223,9,'不是事儿'),(74,222,9,'不是事儿'),(75,233,9,'蕾丝边'),(76,230,10,'蕾丝边'),(77,229,10,'蕾丝边'),(78,228,10,'蕾丝边'),(79,226,10,'蕾丝边'),(80,225,10,'蕾丝边'),(81,224,8,'蕾丝边'),(82,223,9,'蕾丝边'),(83,222,9,'蕾丝边'),(84,221,9,'蕾丝边'),(85,220,9,'蕾丝边'),(86,210,8,'蕾丝边'),(87,233,10,'爱死寂寞人'),(88,231,9,'爱死寂寞人'),(89,230,9,'爱死寂寞人'),(90,229,9,'爱死寂寞人'),(91,226,9,'爱死寂寞人'),(92,225,9,'爱死寂寞人'),(93,224,8,'爱死寂寞人'),(94,223,10,'爱死寂寞人'),(95,222,10,'爱死寂寞人'),(96,221,8,'爱死寂寞人'),(97,220,10,'爱死寂寞人'),(98,210,8,'爱死寂寞人'),(99,280,10,'温柔一梦'),(100,281,10,'江边野火'),(101,286,10,'小月月'),(102,247,10,'江边野火'),(103,246,10,'江边野火'),(104,240,10,'江边野火'),(105,237,10,'江边野火');
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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmsg`
--

LOCK TABLES `systemmsg` WRITE;
/*!40000 ALTER TABLE `systemmsg` DISABLE KEYS */;
INSERT INTO `systemmsg` VALUES (8,'xishuai','好友验证通过','验证通过','已读','您通过了来自test的好友申请','系统消息'),(12,'xishuai','好友验证未通过','验证通过','已读','蟋蟀拒绝了您的好友申请','系统消息'),(15,'test','好友验证通过','验证通过','未读消息','大树通过了您的好友申请','系统消息'),(26,'娟娟细流','好友验证通过','验证通过','未读消息','您通过了来自江边野火的好友申请','系统消息'),(31,'娟娟细流','好友申请验证','等待审核','未读','加','蟋蟀'),(38,'没有人','好友验证通过','验证通过','未读消息','江边野火通过了您的好友申请','系统消息'),(40,'没有人','好友验证通过','验证通过','未读消息','江边野火通过了您的好友申请','系统消息'),(41,'娟娟细流','好友申请验证','等待审核','未读','嘿嘿','大树'),(45,'大树','好友申请验证','等待审核','已读','出','江边野火'),(50,'没有故事的人','好友验证通过','验证通过','未读消息','您通过了来自爱死寂寞人的好友申请','系统消息'),(51,NULL,'好友申请验证','等待审核','未读',NULL,'蟋蟀'),(52,NULL,'好友申请验证','等待审核','未读',NULL,'蟋蟀'),(59,NULL,'好友申请验证','等待审核','未读',NULL,'江边野火'),(63,'小月月','好友验证通过','验证通过','已读','您通过了来自江边野火的好友申请','系统消息'),(67,'爱死寂寞人','好友验证通过','验证通过','未读','您通过了来自江边野火的好友申请','系统消息'),(75,'小蚊子','好友验证通过','验证通过','未读','您通过了来自江边野火的好友申请','系统消息');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourecord`
--

LOCK TABLES `tourecord` WRITE;
/*!40000 ALTER TABLE `tourecord` DISABLE KEYS */;
INSERT INTO `tourecord` VALUES (1,'江边野火','蟋蟀',27,'2015-12-06 15:20:00'),(2,'蟋蟀','江边野火',21,'2015-12-07 05:27:13'),(3,'江边野火','温柔一梦',15,'2015-12-16 14:18:06');
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
  `xishuaitui` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (115,'ko','ko',1,'16',1,10,NULL,'广州',NULL,NULL,'logo.jpg',NULL,NULL,0,0),(117,'蟋蟀','knowledge',1,'36~40',1,80,'undefined','广州','undefined','undefined','0.20968210534192622.jpg',NULL,'我是一个小蟋蟀',0,226),(119,'小小美','knowledge',0,'21~25',1,25,'undefined','南京','undefined','undefined','0.639867514371872.jpg',NULL,'我是一个小蟋蟀',0,6),(120,'小白痴','knowledge',0,'16~20',1,20,'undefined','深圳','undefined','undefined','0.34694396262057126.jpg',NULL,'我是一个小蟋蟀',0,10),(121,'笨蛋里挑骨头','knowledge',0,'26~30',1,20,'undefined','北京','undefined','undefined','0.8328178711235523.jpg',NULL,'我是一个小蟋蟀',0,10),(122,'小蚊子','knowledge',0,'21~25',1,30,'undefined','广州','undefined','undefined','0.31903971498832107.jpg',NULL,'我是一个小蟋蟀',0,16),(123,'不是事儿','knowledge',1,'21~25',1,20,NULL,'天津',NULL,NULL,'0.7469870562199503.jpg',NULL,NULL,0,20),(124,'美丽人生','knowledge',0,'26~30',1,15,NULL,'杭州',NULL,NULL,'0.532550600823015.jpg',NULL,NULL,0,10),(125,'小月月','knowledge',0,'26~30',1,30,'undefined','上海','undefined','undefined','0.8088674764148891.jpg',NULL,'我是一个小蟋蟀',0,32),(127,'有缘千里','knowledge',0,'26~30',1,15,NULL,'青岛',NULL,NULL,'0.4399007686879486.jpg',NULL,NULL,0,10),(128,'随缘','knowledge',1,'36~40',1,10,NULL,'西安',NULL,NULL,'logo.jpg',NULL,NULL,0,0),(129,'叶子','knowledge',0,'21~25',1,15,NULL,'柳州',NULL,NULL,'logo.jpg',NULL,NULL,0,11),(130,'蕾丝边','knowledge',0,'21~25',1,15,NULL,'佛山',NULL,NULL,'0.1979770192410797.jpg',NULL,NULL,0,10),(131,'爱死寂寞人','knowledge',1,'31~35',1,15,NULL,'上海',NULL,NULL,'0.39070191816426814.jpg',NULL,NULL,0,10),(133,'江边野火','knowledge',1,'36~40',1,135,'undefined','广州','undefined','undefined','0.05786626157350838.jpg',NULL,'撒欢的野鸭',2,244),(134,'杜雷寺','knowledge',1,'26~30',1,10,NULL,'南昌',NULL,NULL,'logo.jpg',NULL,NULL,0,0),(135,'死胖子','knowledge',1,'31~35',1,15,NULL,'南京',NULL,NULL,'logo.jpg',NULL,NULL,0,20),(136,'温柔一梦','740860638hcm210',0,'',1,15,'undefined','在这里等你','undefined','undefined','0.07583917793817818.jpg',NULL,'我是一个小蟋蟀',0,16),(137,'虾扯蛋','knowledge',1,'31~35',1,10,NULL,'月球',NULL,NULL,'logo.jpg',NULL,NULL,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xishuaituideal`
--

LOCK TABLES `xishuaituideal` WRITE;
/*!40000 ALTER TABLE `xishuaituideal` DISABLE KEYS */;
INSERT INTO `xishuaituideal` VALUES (1,'不是事儿','蟋蟀',203,1,'2015-11-04 01:07:35'),(2,'蟋蟀','叶子',230,1,'2015-11-07 10:14:43'),(3,'小小美','江边野火',233,1,'2015-11-07 17:12:03'),(4,'江边野火','小月月',255,1,'2015-11-09 14:11:33'),(5,'不是事儿','蟋蟀',260,1,'2015-11-12 14:40:50'),(6,'温柔一梦','江边野火',280,5,'2015-11-17 16:20:28'),(7,'温柔一梦','江边野火',280,5,'2015-11-17 16:25:37'),(8,'江边野火','温柔一梦',281,1,'2015-11-18 01:30:08'),(9,'江边野火','江边野火',286,5,'2015-12-05 05:54:31'),(10,'不是事儿','江边野火',286,1,'2015-12-04 01:36:54'),(11,'system','江边野火',0,10,'2015-12-10 14:00:55'),(12,'system','江边野火',0,10,'2015-12-10 14:03:31'),(13,'system','江边野火',0,10,'2015-12-10 14:04:17'),(14,'system','江边野火',0,10,'2015-12-10 14:05:51'),(15,'system','江边野火',0,10,'2015-12-10 14:07:08'),(16,'system','江边野火',0,10,'2015-12-10 14:09:07'),(17,'system','江边野火',0,10,'2015-12-10 14:12:06'),(18,'system','江边野火',0,10,'2015-12-10 14:16:49'),(19,'system','江边野火',0,10,'2015-12-15 04:31:27'),(20,'system','江边野火',0,10,'2015-12-15 04:32:41'),(21,'江边野火','蟋蟀',277,100,'2015-12-15 06:43:14'),(22,'system','蟋蟀',0,10,'2015-12-15 06:54:22'),(23,'system','江边野火',0,10,'2015-12-15 06:57:03'),(24,'system','江边野火',0,10,'2015-12-15 07:16:10'),(25,'system','蟋蟀',0,10,'2015-12-15 07:18:37'),(26,'system','蟋蟀',0,10,'2015-12-15 07:19:51'),(27,'system','蟋蟀',0,10,'2015-12-15 07:27:21'),(28,'system','江边野火',0,10,'2015-12-15 10:34:54'),(29,'system','江边野火',0,10,'2015-12-15 10:36:19'),(30,'system','江边野火',0,10,'2015-12-15 14:08:23'),(31,'system','江边野火',0,10,'2015-12-17 13:23:16'),(32,'system','江边野火',0,10,'2015-12-20 14:21:42'),(33,'system','江边野火',0,10,'2015-12-21 14:39:32');
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

-- Dump completed on 2015-12-22  4:38:57
