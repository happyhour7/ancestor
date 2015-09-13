-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-09-14 00:54:31
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `advs`
--

INSERT INTO `advs` (`Id`, `owner`, `location`, `images`, `href`) VALUES
(5, 'admin', 'firstpage-top', '0.15174923790618777.jpg', 'http://www.baidu.com'),
(8, 'admin', 'firstpage-left-top', '0.15174923790618777.jpg', 'http://www.baidu.com'),
(9, 'admin', 'firstpage-left-mid', '0.17376918881200254.jpg', 'http://www.baidu.com'),
(10, 'admin', 'firstpage-left-bottom', '0.2883514794521034.jpg', 'http://www.baidu.com'),
(11, 'admin', 'innerpage-left-bottom', '0.8332570656202734.jpg', 'http://www.google.com');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `advuser`
--

INSERT INTO `advuser` (`Id`, `userid`, `password`, `username`, `location`) VALUES
(2, 'admin', 'ww3ww3', 'admin', 'firstpage-top,firstpage-left-top,firstpage-left-mid,firstpage-left-bottom,innerpage-left-top,innerpage-left-bottom');

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
-- 表的结构 `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `notice` varchar(5000) DEFAULT NULL,
  `system` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `config`
--

INSERT INTO `config` (`Id`, `notice`, `system`) VALUES
(4, '这是我的网站的公告<div>这是我的网站的公告<br></div><div>这是我的网站的公告<br></div><div>这是我的网站的公告<br></div><div>这是我的网站的公告<br></div><div>这是我的网站的公告<br></div>', 'system');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='帖子' AUTO_INCREMENT=86 ;

--
-- 转存表中的数据 `files`
--

INSERT INTO `files` (`Id`, `secretType`, `secretSubType`, `secretGrandSubType`, `secretLimit`, `secretMainType`, `secretHope`, `secretCity`, `secretDate`, `secretKeyWord`, `secretTitle`, `secretBackground`, `secretContent`, `secretKnown`, `othername`, `othersex`, `otherage`, `otherBuildName`, `otheraddress`, `secretPrice`, `owner`, `secretLimitTime`, `longstory`, `islongstory`, `score`, `goodNum`, `badNum`, `advimg`, `advlink`, `advlocation`, `filetype`, `createTime`) VALUES
(9, '我爱', '友情', '', 0, 'WO的秘密', '求祝福', '南京', '2015-08-04', '关键词', '标题', '背景', '正文', '感悟', 'undefined', 0, 'undefined', 'undefined', 'undefined', 0, 'test', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(10, '我恨', '爱人', '', 2, 'WO的秘密', '求祝福', '南京', '2015-08-04', '这是第一个秘密哦', '这是第一个秘密哦', '这是第一个秘密哦', '这是第一个秘密哦', '这是第一个秘密哦', '', 0, '', '', '', 0, 'william wang', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(48, '', '', '', 1, '', '', '南京', '', '关键词', '', '', '', '', '', 0, '21~25', '', '', 0, 'test', '', '阿萨德法师打发撒的发生的发生地方', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(49, '', '', '', 1, '', '', '南京', '', '关键词', '', '', '', '', '', 0, '26~30', '', '', 0, 'test', '', 'asdfasdfasdfasdfasdfasdfadsf', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(50, '', '', '', 1, '', '', '南京', 'Tue Aug 11 2015 20:05:21 GMT+0800 (中国标准时间)', '关键词', '', '', '', '', '', 0, '21~25', '', '', 0, 'test', '', 'asdfasdfasdfasdf', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(51, '', '', '', 1, '', '', '南京', '2015-08-11 20:07', '关键词', '', '', '', '', '', 0, '21~25', '', '', 0, 'test', '', 'asdfasdfasdfasdfasdfasdf', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(52, '我恨', '老师', '', 0, 'WO的秘密', '求指点', '南京', '2015-08-14', '关键词', '标题', '背景', '正文', '感悟', '', 0, '', '', '', 0, 'test', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(53, '我爱', '爱情', '', 0, 'WO的秘密', '求治疗', '南京', '2015-08-12', '关键词', '标题', '', '', '', '', 0, '', '', '', 0, 'test', '', '这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！这是内容哦！长文！', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(54, '私人秘密\r\n                ', '同学', '身体', 0, 'TA的秘密', '', '南京', '2015-08-12', '关键词', '标题', '', '', '', '不知道', 0, '21~25', '', '', 0, 'test', '', 'ta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_buttonta_secret_submit_', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(55, '私人秘密\r\n                ', '爱人', '品德', 0, 'TA的秘密', '', '南京', '2015-08-12', '关键词', 'TA的秘密测试', '刚刚发的背景', '刚刚发的正文', '刚刚发的感悟', '不知道', 0, '10~15', '', '', 0, 'test', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(56, '商家秘密\r\n                  ', '酒店', '特殊服务', 0, 'TA的秘密', '', '南京', '2015-08-11', '关键词', '商家秘密长文', '', '', '', '', 0, '', '地标或大楼', '街道信息', 0, 'test', '', '商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文商家秘密长文', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(57, '\r\n                  私人秘密\r\n                  \r', '本人', '技能', 1, '出售秘密', '', '', '', '关键词', '出售秘密长文', '', '', '', '', 0, '', '', '', 23, 'test', '', '出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文出售秘密长文', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(58, '\r\n                  商家秘密\r\n                  \r', '咖啡馆', '真假', 1, '出售秘密', '', '', '2015-08-12', '关键词', '出售商家秘密长文', '', '', '', '', 0, '', '地标或大楼', '街道信息', 12, 'test', '', '出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文出售商家秘密长文', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(59, '\r\n                  私人秘密\r\n                  \r', '亲人', '品德', 1, '悬赏秘密', '', '南京', '2015-08-12', '关键词', '标题', '', '', '', '不知道', 0, '16~20', '', '', 12, 'test', '2015-08-12', '悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文悬赏私人秘密长文', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(60, '\r\n                  商家秘密\r\n                  \r', '咖啡馆', '其他', 1, '悬赏秘密', '', '南京', '2015-08-12', '关键词', '标题', '', '', '', '', 0, '', '地标或大楼', '街道信息', 12, 'test', '2015-08-12', '悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文悬赏商家秘密长文', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(61, '我恨', '爱人', '', 0, 'WO的秘密', '求指点', '南京', '2015-08-16', '南京', '南京', '背景', '正文', '感悟', '', 0, '', '', '', 0, 'test', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(62, '我想', '破处', '', 0, 'WO的秘密', '求指点', '南京', '2015-08-05', '南京', '南京', '啊撒的发生的发大水', '阿萨德发的说法', '阿萨德发生的发生地方', '', 0, '', '', '', 0, 'test', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(63, '我想', '破处', '', 0, 'WO的秘密', '求指点', '南京', '2015-08-05', '南京', '南京', '啊撒的发生的发大水', '阿萨德发的说法', '阿萨德发生的发生地方', '', 0, '', '', '', 0, 'test', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(64, '我恨', '爱人', '', 0, 'WO的秘密', '求骂醒', '南京', '2015-08-13', '这是登陆', '这是登陆后发布的', '这是登陆后发布的', '这是登陆后发布的', '这是登陆后发布的', '', 0, '', '', '', 0, 'test', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(65, '我恨', '爱人', '', 0, 'WO的秘密', '求骂醒', '南京', '2015-08-13', '这是登陆', '这是登陆后发布的', '这是登陆后发布的', '这是登陆后发布的', '这是登陆后发布的', '', 0, '', '', '', 0, 'test', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(67, '我爱', '友情', '', 0, 'WO的秘密', '求指点', '南京', '2015-08-17', '南京', '南京', '这是先发表再登陆', '这是先发表再登陆', '这是先发表再登陆', '', 0, '', '', '', 0, 'test', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(68, '我做过', '欺骗', '', 0, 'WO的秘密', '求祝福', '南京', '2015-08-16', '南京', '南京', 'asdfasdf', 'asdfasd', 'fasdfasdfdas', '', 0, '', '', '', 0, 'test', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(69, '我做过', '欺骗', '', 0, 'WO的秘密', '求祝福', '南京', '2015-08-16', '南京', '南京', 'asdfasdf', 'asdfasd', 'fasdfasdfdas', '', 0, '', '', '', 0, 'test', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(70, '我做过', '欺骗', '', 0, 'WO的秘密', '求祝福', '南京', '2015-08-16', '南京', '南京', 'asdfasdf', 'asdfasd', 'fasdfasdfdas', '', 0, '', '', '', 0, 'test', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(71, '我做过', '欺骗', '', 0, 'WO的秘密', '求祝福', '南京', '2015-08-16', '南京', '南京', 'asdfasdf', 'asdfasd', 'fasdfasdfdas', '', 0, '', '', '', 0, 'test', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(72, '我做过', '欺骗', '', 0, 'WO的秘密', '求祝福', '南京', '2015-08-16', '南京', '南京', 'asdfasdf', 'asdfasd', 'fasdfasdfdas', '', 0, '', '', '', 0, 'test', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(73, '我做过', '欺骗', '', 0, 'WO的秘密', '求祝福', '南京', '2015-08-16', '南京', '南京', 'asdfasdf', 'asdfasd', 'fasdfasdfdas', '', 0, '', '', '', 0, 'test', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(74, '我做过', '欺骗', '', 0, 'WO的秘密', '求祝福', '南京', '2015-08-16', '南京', '南京', 'asdfasdf', 'asdfasd', 'fasdfasdfdas', '', 0, '', '', '', 0, 'test', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(75, '我恨', '同学', '', 0, 'WO的秘密', '求祝福', '南京', '2015-08-12', '关键词', '标题', 'asdfasdfasdfasdfasdfasdfasdfasdfasdf', 'asdfasdf', 'asdfasdfasdf', '', 0, '', '', '', 0, '2015-08-18 14:20:39', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(76, '我恨', '同学', '', 0, 'WO的秘密', '求祝福', '南京', '2015-08-12', '关键词', '标题', 'asdfasdfasdfasdfasdfasdfasdfasdfasdf', 'asdfasdf', 'asdfasdfasdf', '', 0, '', '', '', 0, '2015-08-18 14:20:39', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(77, '我恨', '爱人', '', 0, 'WO的秘密', '求治疗', '南京', '2015-08-05', '关键词', '2015-8-18日秘密', '2015-8-18日秘密', '2015-8-18日秘密', '2015-8-18日秘密', '', 0, '', '', '', 0, '2015-08-18 14:23:11', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(78, '我想', '破处', '', 0, 'WO的秘密', '求指点', '南京', '2015-08-18', '关键词', '2015-8-18日秘密', '2015-8-18日秘密', '2015-8-18日秘密', '2015-8-18日秘密', '', 0, '', '', '', 0, '2015-08-18 14:24:06', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(79, '我恨', '爱人', '', 0, 'WO的秘密', '求指点', '南京', '2015-08-20', '关键词', '2015-8-18日秘密', '阿萨德发生的发大水的', '阿萨德法师打发是的', '阿萨德法师打发', '', 0, '', '', '', 0, 'test', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-08-20 21:41:01'),
(80, '我恨', '爱人', '', 0, 'WO的秘密', '求指点', '南京', '2015-08-20', '关键词', '标题', '啊撒的发生的发生地方', '啊撒的发生地方撒', '阿萨德法师打发', '', 0, '', '', '', 0, 'test', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-08-20 21:42:14'),
(81, '我爱', '友情', '', 0, 'WO的秘密', '求祝福', '南京', '2015-08-20', '关键词', '标题', '啊撒的发生的发生地方', '阿萨德发生的发生发的', '阿双方大是大非', '', 0, '', '', '', 0, 'test', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-08-20 21:43:46'),
(82, '我恨', '爱人', '', 0, 'WO的秘密', '求祝福', '南京', '2015-08-20', '关键词', '标题', '啊撒的发生的发生地方', '阿萨德法师打发', '阿萨德法师打发', '', 0, '', '', '', 0, 'test', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-08-20 21:44:32'),
(84, '我喜欢', '哥特式KK', '', 0, '漂流瓶', '求祝福', '南京', '2015-08-22', '关键词', '标题', '啊撒的发生的发生地方', '阿萨德法师打发', '阿萨德法师打发', '', 0, '', '', '', 0, '蟋蟀', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-08-22 21:44:32'),
(85, '', '', '', 1, '漂流瓶', '', '南京', '2015-09-13', '约约约', '', '', '来，妹子，约一下', '', '', 1, '26~30', '', '', 0, 'test', '', '', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-09-13 20:09:21');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `friends`
--

INSERT INTO `friends` (`Id`, `userid`, `friendid`, `friendname`, `username`) VALUES
(3, NULL, NULL, 'test', '蟋蟀'),
(5, NULL, NULL, '蟋蟀', 'test'),
(6, NULL, NULL, 'test', 'xishuai'),
(7, NULL, NULL, 'xishuai', 'test');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `isbad`
--

INSERT INTO `isbad` (`isbadId`, `username`, `bad`, `fileid`) VALUES
(16, 'test', 1, 52),
(17, 'test', 1, 60),
(18, 'test', 1, 67),
(19, 'xishuai', 1, 66),
(20, 'test', 1, 79);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `orderdeal`
--

INSERT INTO `orderdeal` (`Id`, `maintype`, `type`, `subtype`, `grandsubtype`, `owner`, `cityname`, `sex`, `age`) VALUES
(7, 'WO的秘密', '我想', '大人', '', 'test', 'aasdf', 1, '26~30');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

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
(36, 'test', '你好啊', 84, '2015-09-13 20:12:13');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

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
(33, 84, 8, 'test');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `survey`
--

INSERT INTO `survey` (`Id`, `question`, `answer1`, `answer2`, `answer3`, `answer4`, `answer5`, `answer6`) VALUES
(3, '这是调查问题', '这是选项一', '这是选项二2', '这是选项三3', '', '', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `surveyanswer`
--

INSERT INTO `surveyanswer` (`Id`, `username`, `good`, `choose`, `bad`) VALUES
(1, 'test', 'haha', 1, NULL),
(2, '蟋蟀', NULL, 1, 'haha');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `systemmsg`
--

INSERT INTO `systemmsg` (`Id`, `username`, `msgtype`, `isOk`, `isReaded`, `msg`, `comefrom`) VALUES
(8, 'xishuai', '好友验证通过', '验证通过', '已读', '您通过了来自test的好友申请', '系统消息'),
(12, 'xishuai', '好友验证未通过', '验证通过', '已读', '蟋蟀拒绝了您的好友申请', '系统消息');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=85 ;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`Id`, `username`, `password`, `sex`, `usertype`, `score`, `email`, `cityname`, `qq`, `phone`, `userPhoto`, `address`, `mark`) VALUES
(1, 'test', 'test', 0, 1, 15, 'happyhour7@163.com', '南京', '251619896', '13813994215', '0.06278088735416532.jpg', 'asdfasdf2323', 'asdfasdfasdfas'),
(71, 'asdfasdf', 'asdfasdf', 1, 1, 10, 'happyhour7@163.com', '南京', '2516198663', '13813994215', 'demo_logo.png', NULL, NULL),
(72, 'xishuai', 'ww3ww3', 1, 1, 10, 'happyhour7@163.com', '南京', '2516198663', '13813994215', 'demo_logo.png', NULL, NULL),
(83, '蟋蟀', 'xishuai', 1, 1, 10, NULL, '南京', NULL, NULL, 'demo_logo.png', NULL, NULL),
(84, 'william wang', 'test', 1, 1, 10, NULL, '南京', NULL, NULL, 'demo_logo.png', 'g', '这里是个性签名');

-- --------------------------------------------------------

--
-- 视图结构 `agvscore`
--
DROP TABLE IF EXISTS `agvscore`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `agvscore` AS select sum(`score`.`score`) AS `total`,avg(`score`.`score`) AS `avgScore`,`score`.`fileid` AS `fileid` from `score` group by `score`.`fileid`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
