-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-11-11 23:56:29
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ancestor`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `userphoto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`Id`, `username`, `password`, `logintime`, `userid`, `userphoto`) VALUES
(1, '管理员', 'admin', NULL, 'admin', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `advs`
--

CREATE TABLE IF NOT EXISTS `advs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=93 ;

--
-- 转存表中的数据 `advs`
--

INSERT INTO `advs` (`Id`, `owner`, `location`, `images`, `href`) VALUES
(24, '大树', 'firstpage-left-mid', '0.00162194250151515.jpg', ''),
(25, NULL, 'firstpage-top', NULL, 'http://www.baidu.com'),
(35, NULL, 'firstpage-left-mid', NULL, ''),
(39, '大树', 'firstpage-left-bottom', '0.7764171380549669.jpg', 'http://s-199749.abc188.com/'),
(40, '大树', 'innerpage-left-top', '0.7764171380549669.jpg', 'http://s-199749.abc188.com/'),
(41, '大树', 'innerpage-left-bottom', '0.596074185334146.jpg', 'http://s-199749.abc188.com/'),
(57, 'ok', 'firstpage-top', NULL, NULL),
(58, 'ok', 'firstpage-left-top', NULL, NULL),
(59, 'ok', 'firstpage-left-mid', NULL, NULL),
(60, 'ok', 'firstpage-left-bottom', NULL, NULL),
(61, 'ok', 'innerpage-left-top', NULL, NULL),
(62, 'ok', 'firstpage-top', NULL, NULL),
(63, 'ok', 'firstpage-left-top', NULL, NULL),
(73, 'admin', 'firstpage-left-bottom', '0.21615187032148242.jpg', 'http://s-199749.abc188.com/'),
(77, 'admin', 'firstpage-left-top', '0.3502621138468385.jpg', 'http://s-199749.abc188.com/'),
(78, 'admin', 'firstpage-left-mid', '0.5885099745355546.jpg', 'http://s-199749.abc188.com/'),
(80, 'admin', 'innerpage-left-top', '0.48899485846050084.jpg', 'http://s-199749.abc188.com/'),
(82, 'admin', 'innerpage-left-bottom', '0.6240886847954243.jpg', 'http://s-199749.abc188.com/'),
(84, 'admin', 'firstpage-top', '0.44608689355663955.jpg', 'http://s-199749.abc188.com/'),
(86, 'adv', 'firstpage-top', '0.4237996495794505.jpg', 'http://s-199749.abc188.com/'),
(88, 'adv', 'firstpage-left-mid', '0.9696883431170136.jpg', 'http://s-199749.abc188.com/'),
(89, 'adv', 'firstpage-left-top', '0.5417921037878841.jpg', 'http://s-199749.abc188.com/'),
(90, 'adv', 'firstpage-left-bottom', '0.02691914327442646.jpg', 'http://s-199749.abc188.com/'),
(91, 'adv', 'innerpage-left-top', '0.6197059678379446.jpg', 'http://s-199749.abc188.com/'),
(92, 'adv', 'innerpage-left-bottom', '0.5442114630714059.jpg', 'http://s-199749.abc188.com/');

-- --------------------------------------------------------

--
-- 表的结构 `advscore`
--

CREATE TABLE IF NOT EXISTS `advscore` (
  `scoreId` int(11) NOT NULL AUTO_INCREMENT,
  `advId` int(11) DEFAULT NULL COMMENT '广告ID',
  `score` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`scoreId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `advscore`
--

INSERT INTO `advscore` (`scoreId`, `advId`, `score`, `username`, `location`) VALUES
(4, 56, 8, 'test', 'firstpage-top'),
(5, 56, 5, '大树', 'firstpage-top'),
(6, 24, 8, '大树', 'firstpage-left-mid'),
(7, 39, 7, '大树', 'firstpage-left-bottom'),
(8, 68, 8, 'test', 'firstpage-top'),
(9, 67, 7, 'test', 'firstpage-left-top'),
(10, 68, 7, '大树', 'firstpage-top'),
(11, 84, 9, '大树', 'firstpage-top'),
(12, 77, 9, '大树', 'firstpage-left-top'),
(13, 78, 6, '大树', 'firstpage-left-mid'),
(14, 73, 6, '大树', 'firstpage-left-bottom'),
(16, 82, 9, '/', 'innerpage-left-bottom'),
(18, 80, 5, '/', 'innerpage-left-top'),
(19, 89, 9, '江边野火', 'firstpage-left-top'),
(20, 88, 2, '江边野火', 'firstpage-left-mid'),
(21, 89, 10, '杜雷寺', 'firstpage-left-top');

-- --------------------------------------------------------

--
-- 表的结构 `advuser`
--

CREATE TABLE IF NOT EXISTS `advuser` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `advuser`
--

INSERT INTO `advuser` (`Id`, `userid`, `password`, `username`, `location`) VALUES
(2, 'admin', 'knowledge', '管理员', ''),
(4, 'adv', '1234', 'advvvvv', 'firstpage-top,firstpage-left-top,firstpage-left-mid,firstpage-left-bottom,innerpage-left-top,innerpage-left-bottom'),
(7, 'adv1', '1234', 'adv1', 'firstpage-top'),
(8, 'adv2', '12345', 'adv2', 'firstpage-left-top'),
(9, 'adv3', '123456', 'adv3', 'firstpage-left-mid');

-- --------------------------------------------------------

--
-- 替换视图以便查看 `agvscore`
--
CREATE TABLE IF NOT EXISTS `agvscore` (
`total` decimal(65,0)
,`avgScore` decimal(65,4)
,`fileid` int(255)
);
-- --------------------------------------------------------

--
-- 表的结构 `chatgroups`
--

CREATE TABLE IF NOT EXISTS `chatgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `members` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `createTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=171 ;

--
-- 转存表中的数据 `chatgroups`
--

INSERT INTO `chatgroups` (`id`, `name`, `members`, `owner`, `createTime`) VALUES
(122, '与大树,蟋蟀群聊中', '大树,蟋蟀', 'test', '2015-09-26 19:53:37'),
(123, '与test群聊中', 'test', '蟋蟀', '2015-09-28 19:03:46'),
(140, '与蟋蟀,test,江边野火群聊中', '蟋蟀,test,江边野火', '大树', '2015-09-28 19:17:58'),
(162, '与江边野火群聊中', '江边野火', '没有人', '2015-10-05 21:17:09'),
(170, '与没有人群聊中', '没有人', '江边野火', '2015-10-14 12:20:40');

-- --------------------------------------------------------

--
-- 表的结构 `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `notice` varchar(5000) DEFAULT NULL,
  `system` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `config`
--

INSERT INTO `config` (`Id`, `notice`, `system`) VALUES
(22, '<font size="4">欢迎光临本网站！您可以在本网站发布、出售、悬赏各种秘密，可以加好友聊天、群聊、偷好友蟋蟀腿！一周内蟋蟀腿增长最多的前5名用户将会获得本网站广告分成！</font>', 'system');

-- --------------------------------------------------------

--
-- 表的结构 `files`
--

CREATE TABLE IF NOT EXISTS `files` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='帖子' AUTO_INCREMENT=193 ;

--
-- 转存表中的数据 `files`
--

INSERT INTO `files` (`Id`, `secretType`, `secretSubType`, `secretGrandSubType`, `secretLimit`, `secretMainType`, `secretHope`, `secretCity`, `secretDate`, `secretKeyWord`, `secretTitle`, `secretBackground`, `secretContent`, `secretKnown`, `othername`, `othersex`, `otherage`, `otherBuildName`, `otheraddress`, `secretPrice`, `owner`, `secretLimitTime`, `longstory`, `islongstory`, `score`, `noReply`, `goodNum`, `badNum`, `advimg`, `advlink`, `advlocation`, `filetype`, `createTime`) VALUES
(176, '私人的\r\n                ', '其他', '其他', 1, 'TA的秘密', '', '哈尔滨', '2015-10', '刺死身亡', '女研究生在导师办公室内被刺身亡', '东北网10月26日讯。', '哈尔滨商业大学一在读研二女生被人用刀刺死。据称嫌犯是校外人。', '可叹', '女研究生', 0, '26~30', '', '', 0, '蟋蟀', '0000-00-00', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '2015-10-27 08:57:50'),
(181, '私人的\r\n                ', '其他', '其他', 1, 'TA的秘密', '', '巴西', '2015-10', '3人结婚', '巴西3名女性结婚', '巴西三名女性在一个公证处正式确立她们的关系。', '签订公证书意味着她们的家庭关系获得她们自己的承认，巴西并无法律规定此类婚姻应该得到保护还是', '开创先河', '三名女性', 0, '26~30', '', '', 0, '蟋蟀', '0000-00-00', '巴西三名女性在一个公证处正式确立她们的关系。签订公证书意味着她们的家庭关系获得承认——获她们自己的承认，巴西并无法律规定此类婚姻应该得到保护还是宣告无效。', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '2015-10-28 20:10:10'),
(184, '私人的\r\n                ', '邻居', '其他', 1, 'TA的秘密', '', '重庆', '2015-09', '偷窥洗澡', '两兄弟在女职工浴室安装摄像头偷窥', '重庆两兄弟租赁房紧邻铁路女职工浴室。', '两兄弟在女职工浴室百叶窗上安装摄像头偷窥。', '被细心的女职工发现报警抓获。', '刘', 1, '21~25', '', '', 0, '蟋蟀', '0000-00-00', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '2015-10-28 21:50:00'),
(185, '我做过', '人', '', 1, 'WO的秘密', '求祝福', '北京', '2015-10', '寂寞', '有时候感觉好寂寞', '亲朋好友也很多', '总觉得寂寞，自己也不是什么多深刻的人啊，为什么有寂寞感呢', '好想来个说走就走没人认识的旅行', '', 0, '', '', '', 0, '笨蛋里挑骨头', '0000-00-00', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '2015-10-28 22:02:35'),
(189, '我喜欢做', '人', '', 1, 'WO的秘密', '求约', '西安', '2015-10', '翘臀', '喜欢翘臀', '很多男人都喜欢咪咪', '我对咪咪没感觉，但是超喜欢女人的翘臀，喜欢在后面看着女人翘臀扭来扭去，看到就很兴奋', '有和我一样的吗？', '', 0, '', '', '', 0, '随缘', '0000-00-00', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '2015-10-29 07:44:12'),
(190, '\r\n                  私人的\r\n                  \r\n', '其他', '其他', 1, '悬赏秘密', '', '深圳', '2015-10', '逃犯', '惠州嫌犯指认现场时戴镣铐逃脱', '10月30日，嫌犯被深圳警方带到博罗指认丢弃作案工具现场。', '跳车逃脱，穿囚服，戴手铐脚镣。身高1.65米贵州人中等身材。', '警方悬赏20万。', '潘明滩', 1, '21~25', '', '', 1, '蟋蟀', '2015-10-30', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '2015-11-02 23:03:29'),
(191, '\r\n                  私人的\r\n                  \r\n', '邻居', '其他', 1, '出售秘密', '', '河源', '2015-10', '杀童嫌犯', '河源警方悬赏10万缉凶', '10月24日广东河源源城区客家文化公园发生致2童死1童伤故意杀人案。', '嫌疑人男性，30岁左右，高约170cm，偏瘦，短发，朝天鼻，肤色黑。', '警方悬赏10万。', '嫌疑人', 1, '26~30', '', '', 1, '蟋蟀', '2015-12-30', '10月24日广东河源源城客家文化公园北端山坡发生致2童死1童伤故意杀人案。警方初步确定嫌疑人男性，30岁左右，高约170cm，偏瘦，短发，朝天鼻，肤色烧黑', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '2015-11-02 23:10:47'),
(192, '我爱', '物', '', 3, 'WO的秘密', '求指点', '对对', '2015-11', '的的顶顶', '爱迪生', '俺是', ' 啊', '啥', '', 0, '', '', '', 0, '蟋蟀', '0000-00-00', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '2015-11-06 10:48:22');

-- --------------------------------------------------------

--
-- 表的结构 `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `friendid` int(11) DEFAULT NULL,
  `friendname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `friends`
--

INSERT INTO `friends` (`Id`, `userid`, `friendid`, `friendname`, `username`) VALUES
(3, NULL, NULL, '爱死寂寞人', '没有故事的人'),
(4, NULL, NULL, '没有故事的人', '爱死寂寞人');

-- --------------------------------------------------------

--
-- 表的结构 `heimingdan`
--

CREATE TABLE IF NOT EXISTS `heimingdan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `othername` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isbad`
--

CREATE TABLE IF NOT EXISTS `isbad` (
  `isbadId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `bad` int(11) DEFAULT NULL,
  `fileid` int(11) DEFAULT NULL,
  PRIMARY KEY (`isbadId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

--
-- 转存表中的数据 `isbad`
--

INSERT INTO `isbad` (`isbadId`, `username`, `bad`, `fileid`) VALUES
(16, 'test', 1, 52),
(17, 'test', 1, 60),
(18, 'test', 1, 67),
(19, 'xishuai', 1, 66),
(20, 'test', 1, 79),
(21, '大树', 1, 101),
(22, '江边野火', 1, 112),
(27, 'test', 1, 107),
(29, '江边野火', 1, 151),
(30, '江边野火', 1, 150),
(32, '蟋蟀', 1, 158),
(35, '没有故事的人', 1, 170),
(36, '随缘', 1, 184),
(37, '随缘', 1, 176),
(38, '笨蛋里挑骨头', 1, 184),
(39, '叶子', 1, 185),
(40, '叶子', 1, 184),
(41, '叶子', 1, 181),
(42, '叶子', 1, 176),
(43, '沉小鱼', 1, 189),
(44, '沉小鱼', 1, 185),
(45, '沉小鱼', 1, 184),
(46, '杜雷寺', 1, 189);

-- --------------------------------------------------------

--
-- 表的结构 `isgood`
--

CREATE TABLE IF NOT EXISTS `isgood` (
  `isgoodId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `good` int(255) DEFAULT NULL,
  `bad` int(11) DEFAULT NULL,
  `fileid` int(11) DEFAULT NULL,
  PRIMARY KEY (`isgoodId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- 转存表中的数据 `isgood`
--

INSERT INTO `isgood` (`isgoodId`, `username`, `good`, `bad`, `fileid`) VALUES
(3, 'test', 1, NULL, 9),
(4, '没有人', 1, NULL, 109),
(7, 'test', 1, NULL, 108),
(8, '江边野火', 1, NULL, 149),
(19, '杜雷寺', 1, NULL, 161),
(20, '小月月', 1, NULL, 161),
(22, '蟋蟀', 1, NULL, 161),
(23, '爱死寂寞人', 1, NULL, 156),
(24, '爱死寂寞人', 1, NULL, 155),
(25, '爱死寂寞人', 1, NULL, 158),
(26, '随缘', 1, NULL, 185),
(27, '随缘', 1, NULL, 181),
(28, '笨蛋里挑骨头', 1, NULL, 189),
(36, '蟋蟀', 1, NULL, 181),
(37, '不是事儿', 1, NULL, 189),
(38, '不是事儿', 1, NULL, 185),
(39, '不是事儿', 1, NULL, 184),
(40, '不是事儿', 1, NULL, 181),
(41, '不是事儿', 1, NULL, 176),
(44, '小月月', 1, NULL, 189),
(45, '叶子', 1, NULL, 189),
(47, '沉小鱼', 1, NULL, 181),
(48, '沉小鱼', 1, NULL, 176);

-- --------------------------------------------------------

--
-- 表的结构 `orderdeal`
--

CREATE TABLE IF NOT EXISTS `orderdeal` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- 转存表中的数据 `orderdeal`
--

INSERT INTO `orderdeal` (`Id`, `maintype`, `type`, `subtype`, `grandsubtype`, `owner`, `cityname`, `sex`, `age`) VALUES
(27, 'WO的秘密', '我恨', '', '选择孙类型', 'test', '', 0, '26~30'),
(38, 'WO的秘密', '', '', '', '娃哈哈', '', 0, ''),
(45, 'WO的秘密', '', '', '', '江边野火', '', 0, ''),
(47, 'WO的秘密', '', '', '', '大树', '', 0, ''),
(48, 'WO的秘密', '', '', '', '杜雷寺', '', 0, ''),
(50, 'TA的秘密', '', '', '', '蟋蟀', '', 0, ''),
(51, 'TA的秘密', '', '', '', '小月月', '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `pays`
--

CREATE TABLE IF NOT EXISTS `pays` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `trade_no` varchar(100) NOT NULL COMMENT '支付宝订单号',
  `out_trade_no` varchar(100) NOT NULL COMMENT '网站订单号',
  `total_fee` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `pays`
--

INSERT INTO `pays` (`id`, `username`, `trade_no`, `out_trade_no`, `total_fee`) VALUES
(1, '蟋蟀', '2015102121001004060081543949', '20151021344666', 0.01),
(2, '蟋蟀', '2015102121001004680044908379', '20151021419355', 1);

-- --------------------------------------------------------

--
-- 表的结构 `replay`
--

CREATE TABLE IF NOT EXISTS `replay` (
  `replayId` int(11) NOT NULL AUTO_INCREMENT,
  `replayer` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `fileid` int(11) DEFAULT NULL,
  `replayTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replayId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- 转存表中的数据 `replay`
--

INSERT INTO `replay` (`replayId`, `replayer`, `content`, `fileid`, `replayTime`) VALUES
(62, '没有故事的人', '1', 170, '2015-10-26 22:40:32'),
(63, '沉小鱼', '的', 189, '2015-11-02 19:30:18'),
(64, '沉小鱼', '的', 189, '2015-11-02 19:30:21'),
(65, '沉小鱼', '的', 189, '2015-11-02 19:30:24');

-- --------------------------------------------------------

--
-- 表的结构 `score`
--

CREATE TABLE IF NOT EXISTS `score` (
  `scoreId` int(11) NOT NULL AUTO_INCREMENT,
  `fileid` int(255) DEFAULT NULL,
  `score` int(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`scoreId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- 转存表中的数据 `score`
--

INSERT INTO `score` (`scoreId`, `fileid`, `score`, `username`) VALUES
(25, 60, 4, 'test'),
(27, 9, 6, 'test'),
(28, 52, 5, 'test'),
(29, 53, 8, 'test'),
(30, 67, 9, 'test'),
(31, 66, 6, 'xishuai'),
(32, 82, 6, 'test'),
(33, 84, 8, 'test'),
(34, 84, 9, '大树'),
(35, 63, 9, '大树'),
(36, 86, 9, '大树'),
(37, 82, 9, '大树'),
(38, 81, 4, '大树'),
(41, 60, 9, '大树'),
(42, 58, 6, '大树'),
(43, 86, 8, '娃哈哈'),
(44, 112, 5, '江边野火'),
(45, 10, 2, '大树'),
(46, 122, 9, '大树'),
(47, 127, 9, '大树'),
(48, 155, 5, '杜雷寺'),
(49, 10, 10, '杜雷寺'),
(50, 189, 9, '蟋蟀'),
(51, 185, 9, '蟋蟀'),
(52, 189, 10, '笨蛋里挑骨头');

-- --------------------------------------------------------

--
-- 表的结构 `survey`
--

CREATE TABLE IF NOT EXISTS `survey` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `answer1` varchar(255) DEFAULT NULL,
  `answer2` varchar(255) DEFAULT NULL,
  `answer3` varchar(255) DEFAULT NULL,
  `answer4` varchar(255) DEFAULT NULL,
  `answer5` varchar(255) DEFAULT NULL,
  `answer6` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `survey`
--

INSERT INTO `survey` (`Id`, `question`, `answer1`, `answer2`, `answer3`, `answer4`, `answer5`, `answer6`) VALUES
(14, '本网站有特色吗？', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `surveyanswer`
--

CREATE TABLE IF NOT EXISTS `surveyanswer` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `good` varchar(11) DEFAULT NULL,
  `choose` int(11) DEFAULT NULL,
  `bad` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `surveyanswer`
--

INSERT INTO `surveyanswer` (`Id`, `username`, `good`, `choose`, `bad`) VALUES
(1, 'test', 'haha', 1, NULL),
(2, '蟋蟀', NULL, 1, 'haha'),
(3, '娃哈哈', 'haha', 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `systemmsg`
--

CREATE TABLE IF NOT EXISTS `systemmsg` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `msgtype` varchar(255) DEFAULT NULL,
  `isOk` varchar(255) DEFAULT NULL,
  `isReaded` varchar(255) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `comefrom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- 转存表中的数据 `systemmsg`
--

INSERT INTO `systemmsg` (`Id`, `username`, `msgtype`, `isOk`, `isReaded`, `msg`, `comefrom`) VALUES
(8, 'xishuai', '好友验证通过', '验证通过', '已读', '您通过了来自test的好友申请', '系统消息'),
(12, 'xishuai', '好友验证未通过', '验证通过', '已读', '蟋蟀拒绝了您的好友申请', '系统消息'),
(15, 'test', '好友验证通过', '验证通过', '未读消息', '大树通过了您的好友申请', '系统消息'),
(26, '娟娟细流', '好友验证通过', '验证通过', '未读消息', '您通过了来自江边野火的好友申请', '系统消息'),
(31, '娟娟细流', '好友申请验证', '等待审核', '未读', '加', '蟋蟀'),
(38, '没有人', '好友验证通过', '验证通过', '未读消息', '江边野火通过了您的好友申请', '系统消息'),
(40, '没有人', '好友验证通过', '验证通过', '未读消息', '江边野火通过了您的好友申请', '系统消息'),
(41, '娟娟细流', '好友申请验证', '等待审核', '未读', '嘿嘿', '大树'),
(45, '大树', '好友申请验证', '等待审核', '已读', '出', '江边野火'),
(50, '没有故事的人', '好友验证通过', '验证通过', '未读消息', '您通过了来自爱死寂寞人的好友申请', '系统消息');

-- --------------------------------------------------------

--
-- 表的结构 `talk`
--

CREATE TABLE IF NOT EXISTS `talk` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `senduserid` int(11) DEFAULT NULL,
  `receiveruserid` int(11) DEFAULT NULL,
  `msg` varchar(500) DEFAULT NULL,
  `sendtime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `userconfig`
--

CREATE TABLE IF NOT EXISTS `userconfig` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `addscore` int(11) DEFAULT '10',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=113 ;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`Id`, `username`, `password`, `sex`, `age`, `usertype`, `score`, `email`, `cityname`, `qq`, `phone`, `userPhoto`, `address`, `mark`, `money`, `xishuaitui`) VALUES
(95, '蟋蟀', 'test', 1, '26~30', 1, 70, 'undefined', '广州', 'undefined', 'undefined', '0.6728981563355774.jpg', NULL, '我是一个小蟋蟀', 1.01, 10),
(96, '不是事儿', 'knowledge', 1, '0', 1, 10, NULL, '天津', NULL, NULL, 'demo_logo.png', NULL, NULL, 0, 0),
(97, '小小美', 'knowledge', 0, '0', 1, 10, NULL, '南京', NULL, NULL, 'demo_logo.png', NULL, NULL, 0, 0),
(98, '小白痴', 'knowledge', 0, '0', 1, 10, NULL, '深圳', NULL, NULL, 'demo_logo.png', NULL, NULL, 0, 0),
(99, '笨蛋里挑骨头', 'knowledge', 0, '0', 1, 20, NULL, '北京', NULL, NULL, 'demo_logo.png', NULL, NULL, 0, 10),
(100, '小蚊子', 'knowledge', 0, '0', 1, 10, NULL, '广州', NULL, NULL, 'demo_logo.png', NULL, NULL, 0, 0),
(101, '美丽人生', 'knowledge', 0, '0', 1, 10, NULL, '杭州', NULL, NULL, 'demo_logo.png', NULL, NULL, 0, 0),
(102, '小月月', 'knowledge', 0, '0', 1, 10, NULL, '上海', NULL, NULL, 'demo_logo.png', NULL, NULL, 0, 0),
(103, '爱死寂寞人', 'knowledge', 1, '0', 1, 15, NULL, '上海', NULL, NULL, '0.5632450312841684.jpg', NULL, NULL, 0, 10),
(104, '有缘千里', 'knowledge', 0, '0', 1, 10, NULL, '青岛', NULL, NULL, 'demo_logo.png', NULL, NULL, 0, 0),
(105, '随缘', 'knowledge', 1, '0', 1, 15, NULL, '西安', NULL, NULL, 'demo_logo.png', NULL, NULL, 0, 10),
(106, '沉小鱼', 'knowledge', 0, '0', 1, 10, NULL, '苏州', NULL, NULL, 'demo_logo.png', NULL, NULL, 0, 1),
(107, '叶子', 'knowledge', 0, '0', 1, 10, NULL, '柳州', NULL, NULL, 'demo_logo.png', NULL, NULL, 0, 0),
(108, '我要减肥', 'knowledge', 0, '0', 1, 10, NULL, '广州', NULL, NULL, 'demo_logo.png', NULL, NULL, 0, 0),
(109, '蕾丝边', 'knowledge', 0, '0', 1, 10, NULL, '佛山', NULL, NULL, 'demo_logo.png', NULL, NULL, 0, 0),
(110, '杜雷寺', 'knowledge', 1, '0', 1, 10, NULL, '南昌', NULL, NULL, 'demo_logo.png', NULL, NULL, 0, 1),
(111, '没有故事的人', '245132416', 0, '25', 1, 10, NULL, '小城', NULL, NULL, '0.6852732768747956.jpg', NULL, NULL, 0, 1),
(112, '无知无畏', 'knowledge', 1, '40', 1, 10, NULL, '广州', NULL, NULL, 'demo_logo.png', NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `xishuaituideal`
--

CREATE TABLE IF NOT EXISTS `xishuaituideal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sender` varchar(200) NOT NULL,
  `receiver` varchar(200) NOT NULL,
  `fieldid` int(11) NOT NULL,
  `xishuaitui` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 视图结构 `agvscore`
--
DROP TABLE IF EXISTS `agvscore`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `agvscore` AS select sum(`score`.`score`) AS `total`,avg(`score`.`score`) AS `avgScore`,`score`.`fileid` AS `fileid` from `score` group by `score`.`fileid`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
