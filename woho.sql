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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper_plane`
--

LOCK TABLES `paper_plane` WRITE;
/*!40000 ALTER TABLE `paper_plane` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweet`
--

LOCK TABLES `tweet` WRITE;
/*!40000 ALTER TABLE `tweet` DISABLE KEYS */;
INSERT INTO `tweet` VALUES (1,'2012-12-20 22:59:46','test@test.com','今天我注册了woho哦，欢迎大家来访！');
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
INSERT INTO `user_info` VALUES ('test@test.com','test','test','2012-12-20 22:59:46',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2012-12-20 23:24:34
