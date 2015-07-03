-- MySQL dump 10.13  Distrib 5.5.25, for Win32 (x86)
--
-- Host: localhost    Database: woho
-- ------------------------------------------------------
-- Server version	5.5.25

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
-- Temporary table structure for view `basic_info`
--

DROP TABLE IF EXISTS `basic_info`;
/*!50001 DROP VIEW IF EXISTS `basic_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `basic_info` (
  `mail` char(50),
  `name` char(20),
  `password` char(32)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `content` text,
  `tweet_id` int(11) DEFAULT NULL,
  `commentor` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_ibfk_2` (`tweet_id`),
  KEY `comment_ibfk_1` (`commentor`),
  KEY `fk1` (`commentor`),
  KEY `fk2` (`tweet_id`),
  CONSTRAINT `fk1` FOREIGN KEY (`commentor`) REFERENCES `user_info` (`mail`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk2` FOREIGN KEY (`tweet_id`) REFERENCES `tweet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `sender` char(50) DEFAULT NULL,
  `recipient` char(50) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `content` text,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk3` (`sender`),
  KEY `fk4` (`recipient`),
  CONSTRAINT `fk3` FOREIGN KEY (`sender`) REFERENCES `user_info` (`mail`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk4` FOREIGN KEY (`recipient`) REFERENCES `user_info` (`mail`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` VALUES ('d@d.com','test@test.com','2012-12-21 00:06:21','你好呀',1),('f@f.com','a@a.com','2012-12-21 00:26:42','你好，我是小f',2),('f@f.com','b@b.com','2012-12-21 00:26:46','你好，我是小f',3),('f@f.com','e@e.com','2012-12-21 00:26:50','你好，我是小f',4),('f@f.com','test@test.com','2012-12-21 00:26:54','你好，我是小f',5),('test@test.com','a@a.com','2012-12-21 00:33:19','你好，我是test',6),('test@test.com','b@b.com','2012-12-21 00:33:24','你好，我是test',7),('test@test.com','e@e.com','2012-12-21 00:33:28','你好，我是test',8),('test@test.com','e@e.com','2012-12-21 00:33:31','你好，我是test',9),('test@test.com','f@f.com','2012-12-21 00:33:36','你好，我是test',10),('a@a.com','b@b.com','2012-12-21 00:35:51','你好我是小a',11),('a@a.com','c@c.com','2012-12-21 00:35:57','你好我是小a',12),('a@a.com','e@e.com','2012-12-21 00:36:00','你好我是小a',13),('a@a.com','f@f.com','2012-12-21 00:36:04','你好我是小a',14),('a@a.com','test@test.com','2012-12-21 00:36:07','你好我是小a',15),('b@b.com','a@a.com','2012-12-21 00:36:40','我是小b',16),('b@b.com','test@test.com','2012-12-21 00:36:44','我是小b',17),('c@c.com','a@a.com','2012-12-21 00:38:20','我是小c',18),('c@c.com','d@d.com','2012-12-21 00:38:23','我是小c',19),('c@c.com','e@e.com','2012-12-21 00:38:27','我是小c',20),('e@e.com','a@a.com','2012-12-21 00:41:17','hello',21),('e@e.com','b@b.com','2012-12-21 00:41:21','hello',22),('e@e.com','d@d.com','2012-12-21 00:41:25','hello',23);
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper_plane`
--

DROP TABLE IF EXISTS `paper_plane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper_plane` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `sender` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`),
  KEY `fk3` (`sender`),
  CONSTRAINT `fk5` FOREIGN KEY (`sender`) REFERENCES `user_info` (`mail`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper_plane`
--

LOCK TABLES `paper_plane` WRITE;
/*!40000 ALTER TABLE `paper_plane` DISABLE KEYS */;
INSERT INTO `paper_plane` VALUES (1,'这是我丢的第一个纸飞机哦，希望我还能收回来哈','c@c.com'),(2,'飞呀，飞呀，飞……','c@c.com'),(3,'我叫小D，今天第一次玩woho，感觉很不错哈','d@d.com'),(4,'大家好哈','d@d.com'),(5,'这是小C的飞机','c@c.com'),(6,'这是小f的纸飞机哈','f@f.com'),(7,'你好，我是小f','f@f.com'),(8,'你好，我是小f','f@f.com'),(9,'这是test的纸飞机','test@test.com'),(10,'小a的','a@a.com'),(11,'aaaa','a@a.com'),(12,'这是小B的','b@b.com');
/*!40000 ALTER TABLE `paper_plane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper_plane_path`
--

DROP TABLE IF EXISTS `paper_plane_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper_plane_path` (
  `paper_plane_id` int(11) DEFAULT NULL,
  `recv_user` char(50) DEFAULT NULL,
  `time` datetime NOT NULL,
  KEY `paper_plane_id` (`paper_plane_id`),
  KEY `user_mail` (`recv_user`),
  KEY `paper_plane_path_ibfk_2` (`recv_user`),
  KEY `fk6` (`recv_user`),
  KEY `fk7` (`paper_plane_id`),
  CONSTRAINT `fk6` FOREIGN KEY (`recv_user`) REFERENCES `user_info` (`mail`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk7` FOREIGN KEY (`paper_plane_id`) REFERENCES `paper_plane` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper_plane_path`
--

LOCK TABLES `paper_plane_path` WRITE;
/*!40000 ALTER TABLE `paper_plane_path` DISABLE KEYS */;
INSERT INTO `paper_plane_path` VALUES (1,'a@a.com','2012-12-20 23:58:32'),(2,'b@b.com','2012-12-21 00:00:11'),(3,'a@a.com','2012-12-21 00:05:59'),(4,'test@test.com','2012-12-21 00:06:37'),(1,'test@test.com','2012-12-21 00:09:01'),(3,'test@test.com','2012-12-21 00:09:13'),(5,'a@a.com','2012-12-21 00:19:59'),(6,'a@a.com','2012-12-21 00:25:45'),(7,'a@a.com','2012-12-21 00:27:01'),(8,'test@test.com','2012-12-21 00:27:05'),(1,'a@a.com','2012-12-21 00:32:07'),(4,'a@a.com','2012-12-21 00:32:12'),(8,'e@e.com','2012-12-21 00:32:15'),(3,'c@c.com','2012-12-21 00:32:18'),(9,'c@c.com','2012-12-21 00:32:28'),(1,'d@d.com','2012-12-21 00:33:55'),(5,'b@b.com','2012-12-21 00:33:59'),(7,'test@test.com','2012-12-21 00:34:02'),(6,'test@test.com','2012-12-21 00:34:06'),(4,'d@d.com','2012-12-21 00:34:08'),(10,'d@d.com','2012-12-21 00:34:22'),(11,'f@f.com','2012-12-21 00:35:31'),(2,'c@c.com','2012-12-21 00:37:40'),(12,'test@test.com','2012-12-21 00:37:57'),(9,'e@e.com','2012-12-21 00:38:59'),(3,'e@e.com','2012-12-21 00:39:04'),(10,'a@a.com','2012-12-21 00:40:06'),(4,'b@b.com','2012-12-21 00:40:10'),(3,'c@c.com','2012-12-21 00:41:31'),(9,'c@c.com','2012-12-21 00:41:37');
/*!40000 ALTER TABLE `paper_plane_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ratee` char(50) DEFAULT NULL,
  `rator` char(50) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `content` text,
  `score` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ratee` (`ratee`),
  KEY `fk8` (`ratee`),
  KEY `fk9` (`rator`),
  CONSTRAINT `fk8` FOREIGN KEY (`ratee`) REFERENCES `user_info` (`mail`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk9` FOREIGN KEY (`rator`) REFERENCES `user_info` (`mail`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,'test@test.com','a@a.com','2012-12-20 23:45:13','这个好友很好哈，我的第一个好友哦',4),(2,'test@test.com','b@b.com','2012-12-20 23:55:22','大好人哈',5),(3,'a@a.com','b@b.com','2012-12-20 23:55:36','这是个帅哥',1),(4,'a@a.com','b@b.com','2012-12-20 23:56:37','他是帅哥',5),(5,'a@a.com','c@c.com','2012-12-20 23:58:53','他是好人哈',5),(6,'b@b.com','c@c.com','2012-12-20 23:59:32','喔，美女哇……',4),(7,'c@c.com','e@e.com','2012-12-21 00:08:21','很不错哈',4),(8,'d@d.com','e@e.com','2012-12-21 00:08:34','挺不错的诶',4),(9,'d@d.com','a@a.com','2012-12-21 00:13:39','',3),(10,'b@b.com','a@a.com','2012-12-21 00:13:44','',4),(11,'a@a.com','c@c.com','2012-12-21 00:19:10','',4),(12,'b@b.com','c@c.com','2012-12-21 00:19:16','',3),(13,'a@a.com','f@f.com','2012-12-21 00:25:58','',5),(14,'b@b.com','f@f.com','2012-12-21 00:26:04','',3),(15,'e@e.com','f@f.com','2012-12-21 00:26:10','',4),(16,'test@test.com','f@f.com','2012-12-21 00:26:15','',5),(17,'a@a.com','test@test.com','2012-12-21 00:32:38','',4),(18,'b@b.com','test@test.com','2012-12-21 00:32:43','',3),(19,'c@c.com','test@test.com','2012-12-21 00:32:48','',3),(20,'f@f.com','test@test.com','2012-12-21 00:32:54','',4),(21,'test@test.com','a@a.com','2012-12-21 00:34:32','',5),(22,'b@b.com','a@a.com','2012-12-21 00:34:38','',4),(23,'d@d.com','a@a.com','2012-12-21 00:34:44','',4),(24,'test@test.com','b@b.com','2012-12-21 00:37:09','',5),(25,'a@a.com','b@b.com','2012-12-21 00:37:15','',3),(26,'d@d.com','b@b.com','2012-12-21 00:37:22','',4),(27,'f@f.com','b@b.com','2012-12-21 00:37:27','',3),(28,'a@a.com','c@c.com','2012-12-21 00:38:36','',4),(29,'b@b.com','c@c.com','2012-12-21 00:38:40','',3),(30,'e@e.com','c@c.com','2012-12-21 00:38:46','',3),(31,'a@a.com','d@d.com','2012-12-21 00:39:26','',4),(32,'test@test.com','d@d.com','2012-12-21 00:39:32','',4),(33,'a@a.com','e@e.com','2012-12-21 00:40:31','',5),(34,'a@a.com','e@e.com','2012-12-21 00:40:41','',5),(35,'b@b.com','e@e.com','2012-12-21 00:40:47','',4),(36,'c@c.com','e@e.com','2012-12-21 00:40:54','',0),(37,'a@a.com','f@f.com','2012-12-21 00:42:00','',5),(38,'b@b.com','f@f.com','2012-12-21 00:42:06','',4),(39,'test@test.com','f@f.com','2012-12-21 00:42:10','',4);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation`
--

DROP TABLE IF EXISTS `relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation` (
  `user` char(50) DEFAULT NULL,
  `friend` char(50) DEFAULT NULL,
  KEY `user_mail` (`user`),
  KEY `fk10` (`user`),
  KEY `fk11` (`friend`),
  CONSTRAINT `fk10` FOREIGN KEY (`user`) REFERENCES `user_info` (`mail`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk11` FOREIGN KEY (`friend`) REFERENCES `user_info` (`mail`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation`
--

LOCK TABLES `relation` WRITE;
/*!40000 ALTER TABLE `relation` DISABLE KEYS */;
INSERT INTO `relation` VALUES ('a@a.com','test@test.com'),('b@b.com','a@a.com'),('b@b.com','test@test.com'),('c@c.com','a@a.com'),('c@c.com','b@b.com'),('d@d.com','a@a.com'),('d@d.com','b@b.com'),('d@d.com','test@test.com'),('e@e.com','a@a.com'),('e@e.com','b@b.com'),('e@e.com','c@c.com'),('e@e.com','d@d.com'),('a@a.com','b@b.com'),('a@a.com','d@d.com'),('c@c.com','d@d.com'),('c@c.com','e@e.com'),('f@f.com','a@a.com'),('f@f.com','b@b.com'),('f@f.com','e@e.com'),('f@f.com','test@test.com'),('test@test.com','a@a.com'),('test@test.com','b@b.com'),('test@test.com','c@c.com'),('test@test.com','e@e.com'),('test@test.com','f@f.com'),('a@a.com','c@c.com'),('a@a.com','e@e.com'),('a@a.com','f@f.com'),('b@b.com','c@c.com'),('b@b.com','d@d.com'),('b@b.com','f@f.com');
/*!40000 ALTER TABLE `relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT NULL,
  `introduction` text,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'woho，大家的最爱','','2012-12-21 00:01:07'),(2,'最爱woho了','woho系统是由北航计算机学院10级两名学生开发的社交系统，该系统具有一定的实用性，欢迎大家注册使用。','2012-12-21 00:03:30'),(3,'woho，未来社交网络的新星','真的很不错，值得信赖','2012-12-21 00:10:56'),(4,'woho.woho','woho.woho.大家一起来','2012-12-21 00:14:24'),(5,'我想大声对你说','woho，我的最爱','2012-12-21 00:18:28'),(6,'世界末日','世界末日了哈……大家都在干嘛呢','2012-12-21 00:23:26'),(7,'我也来了','我也来参加woho了……','2012-12-21 00:27:37'),(8,'woho，我的最爱。人人，微博都弱爆了','woho，我最支持你','2012-12-21 00:29:39');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic_tweet_link`
--

DROP TABLE IF EXISTS `topic_tweet_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic_tweet_link` (
  `topic_id` int(11) DEFAULT NULL,
  `tweet_id` int(11) DEFAULT NULL,
  KEY `topic_id` (`topic_id`),
  KEY `tweet_id` (`tweet_id`),
  KEY `fk12` (`topic_id`),
  KEY `fk13` (`tweet_id`),
  CONSTRAINT `fk12` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk13` FOREIGN KEY (`tweet_id`) REFERENCES `tweet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_tweet_link`
--

LOCK TABLES `topic_tweet_link` WRITE;
/*!40000 ALTER TABLE `topic_tweet_link` DISABLE KEYS */;
INSERT INTO `topic_tweet_link` VALUES (1,8),(2,11),(1,12),(3,13),(1,14),(4,15),(1,16),(1,17),(4,18),(3,19),(3,20),(3,21),(5,22),(4,23),(4,24),(3,25),(2,26),(2,27),(3,28),(6,29),(6,30),(3,32),(3,33),(7,34),(6,35),(5,36),(5,37),(8,38),(5,39),(5,41);
/*!40000 ALTER TABLE `topic_tweet_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweet`
--

DROP TABLE IF EXISTS `tweet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `author` char(50) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `author_mail` (`author`),
  KEY `fk14` (`author`),
  CONSTRAINT `fk14` FOREIGN KEY (`author`) REFERENCES `user_info` (`mail`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweet`
--

LOCK TABLES `tweet` WRITE;
/*!40000 ALTER TABLE `tweet` DISABLE KEYS */;
INSERT INTO `tweet` VALUES (1,'2012-12-20 22:59:46','test@test.com','今天我注册了woho哦，欢迎大家来访！'),(2,'2012-12-20 23:41:05','a@a.com','今天我注册了woho哦，欢迎大家来访！'),(3,'2012-12-20 23:42:28','a@a.com','我叫小a，今天开始玩woho了。人人，微博神马的都弱爆了……'),(4,'2012-12-20 23:53:35','b@b.com','今天我注册了woho哦，欢迎大家来访！'),(5,'2012-12-20 23:54:36','b@b.com','大家好，我是小B，以前玩人人，空间，微博。现在改用woho了，欢迎大家加我哦……'),(6,'2012-12-20 23:57:01','c@c.com','今天我注册了woho哦，欢迎大家来访！'),(7,'2012-12-20 23:57:34','c@c.com','大家好，我是小C。欢迎大家来访问我哦'),(8,'2012-12-21 00:02:14','c@c.com','#woho，大家的最爱#那当然啦，我顶，我顶，我顶顶顶……'),(9,'2012-12-21 00:03:53','d@d.com','今天我注册了woho哦，欢迎大家来访！'),(10,'2012-12-21 00:06:57','e@e.com','今天我注册了woho哦，欢迎大家来访！'),(11,'2012-12-21 00:09:51','a@a.com','#最爱woho了#顶，顶，顶……'),(12,'2012-12-21 00:10:09','a@a.com','#woho，大家的最爱#woho，真心不错诶……'),(13,'2012-12-21 00:11:18','a@a.com','#woho，未来社交网络的新星#欢迎大家和我一起使用woho'),(14,'2012-12-21 00:11:33','a@a.com','#woho，大家的最爱# 我喜欢用它'),(15,'2012-12-21 00:15:01','test@test.com','#woho.woho# woho使用起来真心不错'),(16,'2012-12-21 00:15:24','test@test.com','#woho，大家的最爱# 好热闹哈，大家都喜欢woho'),(17,'2012-12-21 00:15:36','test@test.com','#woho，大家的最爱# 我也要顶一下'),(18,'2012-12-21 00:15:48','test@test.com','#woho.woho# woho一定要顶上去'),(19,'2012-12-21 00:16:18','test@test.com','#woho，未来社交网络的新星# 相信这颗新星一定会璀璨的'),(20,'2012-12-21 00:16:58','test@test.com','#woho，未来社交网络的新星# 顶上去！！！'),(21,'2012-12-21 00:18:03','test@test.com','#woho，未来社交网络的新星#'),(22,'2012-12-21 00:18:42','test@test.com','#我想大声对你说# woho，我喜欢你。'),(23,'2012-12-21 00:20:27','c@c.com','#woho.woho# woho。一定要顶上去'),(24,'2012-12-21 00:20:48','c@c.com','#woho.woho# woho.woho我喜欢'),(25,'2012-12-21 00:21:07','c@c.com','#woho，未来社交网络的新星# 新星，新星。加油'),(26,'2012-12-21 00:21:18','c@c.com','#最爱woho了# 我也最爱woho了'),(27,'2012-12-21 00:22:05','c@c.com','#最爱woho了#'),(28,'2012-12-21 00:22:41','c@c.com','#woho，未来社交网络的新星#'),(29,'2012-12-21 00:23:53','c@c.com','#世界末日#我在看玩woho哈……'),(30,'2012-12-21 00:24:10','c@c.com','#世界末日#世界末日，woho依然陪伴着我'),(31,'2012-12-21 00:24:59','f@f.com','今天我注册了woho哦，欢迎大家来访！'),(32,'2012-12-21 00:27:18','f@f.com','#woho，未来社交网络的新星# 新星，加油哈'),(33,'2012-12-21 00:27:35','f@f.com','#woho，未来社交网络的新星#'),(34,'2012-12-21 00:28:01','f@f.com','#我也来了# 今天我也注册了woho，和大家一起来happy'),(35,'2012-12-21 00:28:21','f@f.com','#世界末日# 世界末日，大家都在狂欢哈'),(36,'2012-12-21 00:29:04','f@f.com','#我想大声对你说# woho，你是我的最爱，renren，微博神马的都弱爆了'),(37,'2012-12-21 00:29:36','f@f.com','#我想大声对你说#'),(38,'2012-12-21 00:30:11','f@f.com','#woho，我的最爱。人人，微博都弱爆了# 以后再也不刷人人了，我刷woho'),(39,'2012-12-21 00:30:24','f@f.com','#我想大声对你说# 今天你woho了吗'),(40,'2012-12-21 00:30:52','f@f.com','今天开始我就要woho了……'),(41,'2012-12-21 00:39:56','d@d.com','#我想大声对你说# woho是最好的');
/*!40000 ALTER TABLE `tweet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `mail` char(50) NOT NULL DEFAULT '',
  `name` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `regist_time` datetime DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES ('a@a.com','a','a','2012-12-20 23:41:05',NULL,NULL,NULL,NULL),('b@b.com','b','b','2012-12-20 23:53:35','1992-06-06','1314258','北航',1),('c@c.com','c','c','2012-12-20 23:57:01',NULL,NULL,NULL,NULL),('d@d.com','d','d','2012-12-21 00:03:53','1993-08-12','','北师',1),('e@e.com','e','e','2012-12-21 00:06:57','1991-09-01','','北影',1),('f@f.com','f','f','2012-12-21 00:24:59','1993-12-01','','',1),('test@test.com','test','test','2012-12-20 22:59:46',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 TRIGGER trig1 AFTER INSERT ON user_info  FOR EACH ROW 
INSERT INTO tweet(time, author, content) VALUE (NOW(), NEW.mail, '今天我注册了woho哦，欢迎大家来访！') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `basic_info`
--

/*!50001 DROP TABLE IF EXISTS `basic_info`*/;
/*!50001 DROP VIEW IF EXISTS `basic_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `basic_info` AS select `user_info`.`mail` AS `mail`,`user_info`.`name` AS `name`,`user_info`.`password` AS `password` from `user_info` */;
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

-- Dump completed on 2012-12-21  0:42:38
