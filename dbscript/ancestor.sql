-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-09-26 10:45:42
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=69 ;

--
-- 转存表中的数据 `advs`
--

INSERT INTO `advs` (`Id`, `owner`, `location`, `images`, `href`) VALUES
(24, '大树', 'firstpage-left-mid', '0.00162194250151515.jpg', ''),
(25, NULL, 'firstpage-top', NULL, 'http://www.baidu.com'),
(29, 'adv', 'innerpage-left-bottom', NULL, 'http://s-199749.abc188.com/'),
(30, 'adv', 'innerpage-left-top', NULL, 'http://s-199749.abc188.com/'),
(31, 'adv', 'firstpage-left-bottom', NULL, 'http://s-199749.abc188.com/'),
(35, NULL, 'firstpage-left-mid', NULL, ''),
(36, 'adv', 'firstpage-top', '0.5842844860162586.jpg', 'http://s-199749.abc188.com/'),
(37, 'adv', 'firstpage-left-top', '0.5842844860162586.jpg', 'http://s-199749.abc188.com/'),
(38, 'adv', 'firstpage-left-mid', '0.5842844860162586.jpg', ''),
(39, '大树', 'firstpage-left-bottom', '0.7764171380549669.jpg', 'http://s-199749.abc188.com/'),
(40, '大树', 'innerpage-left-top', '0.7764171380549669.jpg', 'http://s-199749.abc188.com/'),
(41, '大树', 'innerpage-left-bottom', '0.596074185334146.jpg', 'http://s-199749.abc188.com/'),
(51, 'admin', 'innerpage-left-bottom', '0.040140360593795776.jpg', 'http://www.google.com'),
(53, 'admin', 'firstpage-left-mid', '0.30263520451262593.jpg', 'http://s-199749.abc188.com/'),
(54, 'admin', 'firstpage-left-bottom', '0.28310156147927046.jpg', 'http://s-199749.abc188.com/'),
(55, 'admin', 'innerpage-left-top', '0.7139146942645311.jpg', 'http://s-199749.abc188.com/'),
(57, 'ok', 'firstpage-top', NULL, NULL),
(58, 'ok', 'firstpage-left-top', NULL, NULL),
(59, 'ok', 'firstpage-left-mid', NULL, NULL),
(60, 'ok', 'firstpage-left-bottom', NULL, NULL),
(61, 'ok', 'innerpage-left-top', NULL, NULL),
(62, 'ok', 'firstpage-top', NULL, NULL),
(63, 'ok', 'firstpage-left-top', NULL, NULL),
(67, 'admin', 'firstpage-left-top', '0.11562165687792003.jpg', 'http://s-199749.abc188.com/'),
(68, 'admin', 'firstpage-top', '0.22036425047554076.jpg', 'http://s-199749.abc188.com/');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `advscore`
--

INSERT INTO `advscore` (`scoreId`, `advId`, `score`, `username`, `location`) VALUES
(4, 56, 8, 'test', 'firstpage-top'),
(5, 56, 5, '大树', 'firstpage-top'),
(6, 24, 8, '大树', 'firstpage-left-mid'),
(7, 39, 7, '大树', 'firstpage-left-bottom');

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
(2, 'admin', 'admin', 'admin', 'firstpage-top,firstpage-left-top,firstpage-left-mid,firstpage-left-bottom,innerpage-left-top,innerpage-left-bottom'),
(4, 'adv', '1234', 'advvvvv', 'firstpage-top,firstpage-left-top,firstpage-left-mid,firstpage-left-bottom,innerpage-left-top'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `chatgroups`
--

INSERT INTO `chatgroups` (`id`, `name`, `members`, `owner`, `createTime`) VALUES
(9, '与大树,蟋蟀,xishuai群聊中', '大树,蟋蟀,xishuai', 'test', '2015-09-25 18:51:01');

-- --------------------------------------------------------

--
-- 表的结构 `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `notice` varchar(5000) DEFAULT NULL,
  `system` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `config`
--

INSERT INTO `config` (`Id`, `notice`, `system`) VALUES
(13, '<font color="#000000" face="微软雅黑" size="3">我们都是好孩子，异想天开的孩子</font>', 'system');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='帖子' AUTO_INCREMENT=112 ;

--
-- 转存表中的数据 `files`
--

INSERT INTO `files` (`Id`, `secretType`, `secretSubType`, `secretGrandSubType`, `secretLimit`, `secretMainType`, `secretHope`, `secretCity`, `secretDate`, `secretKeyWord`, `secretTitle`, `secretBackground`, `secretContent`, `secretKnown`, `othername`, `othersex`, `otherage`, `otherBuildName`, `otheraddress`, `secretPrice`, `owner`, `secretLimitTime`, `longstory`, `islongstory`, `score`, `goodNum`, `badNum`, `advimg`, `advlink`, `advlocation`, `filetype`, `createTime`) VALUES
(10, '我恨', '爱人', '', 2, 'WO的秘密', '求祝福', '南京', '2015-08-04', '这是第一个秘密哦', '这是第一个秘密哦', '这是第一个秘密哦', '这是第一个秘密哦', '这是第一个秘密哦', '', 0, '', '', '', 0, 'william wang', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(98, '', '', '', 1, '漂流瓶', '', '广州', '2015-09-22', '测试', '', '', '的', '', '', 0, '10~15', '', '', 0, '大树', '', '', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-09-22 15:02:02'),
(99, '商家秘密\r\n                  ', '餐馆', '材料', 0, 'TA的秘密', '', '广州', '2015-09', '测试', '测', '测', '测', '测', '', 0, '', '', '广州', 0, '蟋蟀', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-09-22 22:31:09'),
(100, '我爱', '亲情', '', 0, 'WO的秘密', '求祝福', '广州', '2015-09', '测试', '测试', '测', '测', '测', '', 0, '', '', '', 0, '娃哈哈', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-09-22 22:33:04'),
(102, '\r\n                  私人秘密\r\n                  \r', '其他', '其他', 1, '悬赏秘密', '', '工作', '2015-09', '得到', '测', '测', '测', '测', '的', 0, '16~20', '', '', 2147483647, '大树', '2015-09', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-09-24 09:36:25'),
(103, '商家秘密\r\n                  ', '商铺', '真假', 3, 'TA的秘密', '', '广州', '2015-09', '测试', '测', '测', '测', '测', '', 0, '', '', '广州', 0, '大树', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-09-24 09:46:39'),
(104, '我爱', '亲情', '', 1, 'WO的秘密', '求祝福', '广州', '2015-09', '测试', '测试', '测', '测', '测', '', 0, '', '', '', 0, '大树', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-09-24 09:49:47'),
(105, '', '', '', 1, '漂流瓶', '', '广州', '2015-09-24', '约吗', '', '', '', '', '', 0, '26~30', '', '', 0, '大树', '', '', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-09-24 09:55:07'),
(106, '\r\n                  商家秘密\r\n                  \r', '其他', '其他', 1, '出售秘密', '', '', '2015-08', '测试', '测试', '测试', '测试', '测试', '', 0, '', '云浮', '新兴', 2147483647, '大树', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-09-20 09:18:43'),
(107, '私人秘密\r\n                ', '亲人', '怪癖', 2, 'TA的秘密', '', '广州', '2015-05', '的', '测', '测', '出', '测', '出纯纯粹', 0, '10~15', '', '', 0, '蟋蟀', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-09-25 10:05:28'),
(108, '我爱', '亲情', '', 1, 'WO的秘密', '求指点', '广州', '2015-09', '出', '出', '出', '出', '出', '', 0, '', '', '', 0, '娃哈哈', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-09-25 10:27:54'),
(109, '我恨', '上司', '', 1, 'WO的秘密', '求赞', '广州', '2015-09', '测', '测', '测', '测', '测', '', 0, '', '', '', 0, '娃哈哈', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-09-25 10:32:27'),
(110, '', '', '', 1, '漂流瓶', '', '', '2015-09-25', '', '', '', '的', '', '', 0, '', '', '', 0, '娃哈哈', '', '', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-09-25 10:35:51'),
(111, '', '', '', 1, '漂流瓶', '', '', '2015-09-25', '', '', '', '的', '', '', 0, '', '', '', 0, '娃哈哈', '', '', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-09-25 10:37:04');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `friends`
--

INSERT INTO `friends` (`Id`, `userid`, `friendid`, `friendname`, `username`) VALUES
(3, NULL, NULL, 'test', '蟋蟀'),
(5, NULL, NULL, '蟋蟀', 'test'),
(6, NULL, NULL, 'test', 'xishuai'),
(7, NULL, NULL, 'xishuai', 'test'),
(8, NULL, NULL, 'test', '大树'),
(9, NULL, NULL, '大树', 'test'),
(10, NULL, NULL, '大树', '娃哈哈'),
(11, NULL, NULL, '娃哈哈', '大树'),
(14, NULL, NULL, '蟋蟀', '大树'),
(15, NULL, NULL, '大树', '蟋蟀'),
(16, NULL, NULL, '江边野火', '娟娟细流'),
(17, NULL, NULL, '娟娟细流', '江边野火'),
(18, NULL, NULL, '江边野火', '大树'),
(19, NULL, NULL, '大树', '江边野火');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `isbad`
--

INSERT INTO `isbad` (`isbadId`, `username`, `bad`, `fileid`) VALUES
(16, 'test', 1, 52),
(17, 'test', 1, 60),
(18, 'test', 1, 67),
(19, 'xishuai', 1, 66),
(20, 'test', 1, 79),
(21, '大树', 1, 101);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `isgood`
--

INSERT INTO `isgood` (`isgoodId`, `username`, `good`, `bad`, `fileid`) VALUES
(3, 'test', 1, NULL, 9);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `orderdeal`
--

INSERT INTO `orderdeal` (`Id`, `maintype`, `type`, `subtype`, `grandsubtype`, `owner`, `cityname`, `sex`, `age`) VALUES
(27, 'WO的秘密', '我恨', '', '选择孙类型', 'test', '', 0, '26~30'),
(37, 'WO的秘密', '我爱', '', '', '大树', '', 0, ''),
(38, 'WO的秘密', '', '', '', '娃哈哈', '', 0, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `replay`
--

INSERT INTO `replay` (`replayId`, `replayer`, `content`, `fileid`, `replayTime`) VALUES
(1, 'test', 'asdfasdfasdf', 60, NULL),
(2, 'test', 'sadfasdfasdfasdf', 60, NULL),
(3, 'test', 'sadfasdfasdfasdf', 60, NULL),
(4, 'test', 'sadfasdfasdfasdf', 60, NULL),
(5, 'test', 'sadfasdfasdfasdf', 60, NULL),
(6, 'test', 'sadfasdfasdfasdf', 60, NULL),
(7, 'test', 'sadfasdfasdfasdf', 60, NULL),
(8, 'test', 'sadfasdfasdfasdf', 60, NULL),
(9, 'test', 'sadfasdfasdfasdf', 60, NULL),
(10, 'test', 'sderterwer', 60, NULL),
(11, 'test', 'sadfasdfasdfasdf', 60, NULL),
(12, 'test', 'sadfasdfasdfasdf', 60, NULL),
(13, 'test', 'dfsdfsdfsdf', 60, NULL),
(14, 'test', 'sadfasdfasdfasdf', 60, NULL),
(15, 'test', 'sadfasdfasdfasdf', 60, NULL),
(16, 'test', 'sadfasdfasdfasdf', 60, NULL),
(17, 'test', 'sadfasdfasdfasdf', 60, NULL),
(18, 'test', '', 9, ''),
(19, 'test', '', 9, ''),
(20, 'test', '', 9, ''),
(21, 'test', '', 9, ''),
(22, 'test', '', 9, ''),
(23, 'test', '', 9, ''),
(24, 'test', '', 9, ''),
(25, 'test', '', 9, ''),
(26, 'test', '', 9, ''),
(27, 'test', '', 9, ''),
(28, 'test', '', 9, ''),
(29, 'test', '$(this).prev().find', 60, '2015-08-14 22:03:06'),
(30, 'test', 'dfdfsasdfasdf', 52, '2015-08-15 12:56:52'),
(31, 'test', 'asdfasdfasdf', 52, '2015-08-15 12:57:11'),
(32, 'test', 'asdfasdfasdf', 52, '2015-08-15 12:57:12'),
(33, 'test', '阿萨德发生的发生', 61, '2015-08-18 18:42:29'),
(34, 'test', '阿萨德发生的发生', 61, '2015-08-18 18:42:31'),
(35, 'test', '阿萨德发生的发生', 61, '2015-08-18 18:42:38'),
(36, 'test', '你好啊', 84, '2015-09-13 20:12:13'),
(37, '大树', '是', 91, '2015-09-16 14:09:21'),
(38, '娃哈哈', '的', 98, '2015-09-22 22:35:49'),
(39, '娃哈哈', '约', 105, '2015-09-24 09:59:23'),
(40, '大树', '的', 104, '2015-09-24 10:06:44'),
(41, '大树', '的', 104, '2015-09-24 10:07:00'),
(42, '大树', '的', 104, '2015-09-24 10:08:20'),
(43, '大树', '的', 107, '2015-09-25 10:06:06');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

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
(43, 86, 8, '娃哈哈');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `survey`
--

INSERT INTO `survey` (`Id`, `question`, `answer1`, `answer2`, `answer3`, `answer4`, `answer5`, `answer6`) VALUES
(7, '你看过姜文的《鬼子来了》吗？', NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `systemmsg`
--

INSERT INTO `systemmsg` (`Id`, `username`, `msgtype`, `isOk`, `isReaded`, `msg`, `comefrom`) VALUES
(8, 'xishuai', '好友验证通过', '验证通过', '已读', '您通过了来自test的好友申请', '系统消息'),
(12, 'xishuai', '好友验证未通过', '验证通过', '已读', '蟋蟀拒绝了您的好友申请', '系统消息'),
(15, 'test', '好友验证通过', '验证通过', '未读消息', '大树通过了您的好友申请', '系统消息'),
(17, '娃哈哈', '好友验证通过', '验证通过', '未读消息', '您通过了来自大树的好友申请', '系统消息'),
(23, '大树', '好友验证通过', '验证通过', '未读消息', '您通过了来自蟋蟀的好友申请', '系统消息'),
(24, '蟋蟀', '好友验证通过', '验证通过', '未读消息', '大树通过了您的好友申请', '系统消息'),
(26, '娟娟细流', '好友验证通过', '验证通过', '未读消息', '您通过了来自江边野火的好友申请', '系统消息'),
(27, '江边野火', '好友验证通过', '验证通过', '未读消息', '娟娟细流通过了您的好友申请', '系统消息'),
(29, '大树', '好友验证通过', '验证通过', '未读消息', '您通过了来自江边野火的好友申请', '系统消息'),
(30, '江边野火', '好友验证通过', '验证通过', '未读消息', '大树通过了您的好友申请', '系统消息');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=89 ;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`Id`, `username`, `password`, `sex`, `usertype`, `score`, `email`, `cityname`, `qq`, `phone`, `userPhoto`, `address`, `mark`) VALUES
(1, 'test', 'test', 0, 1, 20, 'happyhour7@163.com', '南京', '251619896', '13813994215', '0.8322701726574451.jpg', 'asdfasdf2323', 'asdfasdfasdfas'),
(71, 'asdfasdf', 'asdfasdf', 1, 1, 10, 'happyhour7@163.com', '南京', '2516198663', '13813994215', 'demo_logo.png', NULL, NULL),
(72, 'xishuai', 'ww3ww3', 1, 1, 10, 'happyhour7@163.com', '南京', '2516198663', '13813994215', 'demo_logo.png', NULL, NULL),
(83, '蟋蟀', 'xishuai', 1, 1, 20, NULL, '南京', NULL, NULL, 'demo_logo.png', NULL, NULL),
(84, 'william wang', 'test', 1, 1, 10, NULL, '南京', NULL, NULL, 'demo_logo.png', 'g', '这里是个性签名'),
(85, '大树', '1234', 1, 1, 45, 'undefined', '广州', 'undefined', 'undefined', '0.38356967456638813.jpg', NULL, '当当当'),
(86, '娃哈哈', '1234', 1, 1, 20, 'undefined', '广州', 'undefined', 'undefined', '0.3461962011642754.jpg', NULL, '555'),
(87, '娟娟细流', '1234', 0, 1, 10, NULL, '临沂', NULL, NULL, 'demo_logo.png', NULL, NULL),
(88, '江边野火', 'knowledge', 1, 1, 10, NULL, '广州', NULL, NULL, 'demo_logo.png', NULL, NULL);

-- --------------------------------------------------------

--
-- 视图结构 `agvscore`
--
DROP TABLE IF EXISTS `agvscore`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `agvscore` AS select sum(`score`.`score`) AS `total`,avg(`score`.`score`) AS `avgScore`,`score`.`fileid` AS `fileid` from `score` group by `score`.`fileid`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
