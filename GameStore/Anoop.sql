-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `cname` varchar(40) DEFAULT NULL,
  `purchase_no` int(11) NOT NULL AUTO_INCREMENT,
  `paid_cost` int(11) DEFAULT NULL,
  `activation_key` varchar(40) DEFAULT NULL,
  `distributor` varchar(40) DEFAULT NULL,
  `gname` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`purchase_no`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digital_copy`
--

DROP TABLE IF EXISTS `digital_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `digital_copy` (
  `distributor` varchar(40) DEFAULT NULL,
  `activation_key` varchar(40) NOT NULL,
  `gname` varchar(40) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `key_expiry` date DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`activation_key`),
  KEY `gname_idx` (`gname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digital_copy`
--

LOCK TABLES `digital_copy` WRITE;
/*!40000 ALTER TABLE `digital_copy` DISABLE KEYS */;
INSERT INTO `digital_copy` VALUES ('Origin','1CODWA1','Call of duty:World at war',26,'2090-09-18','A'),('GOG','1ESOLI2','The Elder Scrolls Online',20,'2019-03-02','A'),('uPlay','1FARCR1','Far Cry 5',40,'2019-04-02','A'),('Steam','1GOTTA1','Game Of Thrones',5,'2019-08-02','A'),('Origins','1NFSPA1','NFS:Payback',60,'2019-02-02','A'),('Origins','1NFSPA2','NFS:Payback',60,'2019-02-02','A'),('Steam','1WITCH1','Witcher 3:Wild Hunt',36,'2019-11-17','A'),('Steam','1WITCH3','Witcher 3:Wild Hunt Starter',36,'2020-11-17','A');
/*!40000 ALTER TABLE `digital_copy` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `digital_copy_AFTER_INSERT` AFTER INSERT ON `digital_copy` FOR EACH ROW BEGIN
update game set no_of_online_copies=no_of_online_copies+1 where gname=new.gname;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `game` (
  `gname` varchar(40) NOT NULL,
  `company` varchar(40) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `serial_no` int(11) NOT NULL,
  `platform` varchar(30) DEFAULT NULL,
  `edition` varchar(20) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `no_of_online_copies` int(11) DEFAULT NULL,
  `no_of_physical_copies` int(11) DEFAULT NULL,
  `genre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`serial_no`,`gname`),
  KEY `edition` (`edition`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`edition`) REFERENCES `gameedition` (`edition_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES ('Witcher 3:Wild Hunt','CD project Red','2015-05-15',1,'PC','Collectors',1500,1,1,'RPG'),('Witcher 3:Wild Hunt Starter','CD project Red','2015-05-15',1,'PC','Normal',1500,1,2,'RPG'),('Call of duty:World at war','EA','2013-11-15',2,'XBOX','Gold',500,1,1,'FPS'),('NFS:Payback','EA','2017-04-02',4,'PC','Gold',2000,2,2,'Racing'),('The Elder Scrolls Online','Bethesda','2014-04-02',4,'PC','Enhanced',999,1,1,'MMORPG'),('Far Cry 5','Ubisoft','2018-04-02',5,'PS4','Enhanced',1500,1,1,'Action'),('Game Of Thrones','Telltale','2015-04-02',6,'XBOX','Normal',700,1,1,'Adventure');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameedition`
--

DROP TABLE IF EXISTS `gameedition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gameedition` (
  `edition_name` varchar(20) NOT NULL,
  `inclusive_of_dlcs` char(1) DEFAULT NULL,
  `merchandise` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`edition_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameedition`
--

LOCK TABLES `gameedition` WRITE;
/*!40000 ALTER TABLE `gameedition` DISABLE KEYS */;
INSERT INTO `gameedition` VALUES ('Collectors','Y','Exclusive soundtracks,movie,Guidebook,skins,complete'),('Enhanced','Y','Exclusive soundtracks,development images'),('Gold','Y','Nil'),('Normal','N','Nil'),('Silver','P','Nil');
/*!40000 ALTER TABLE `gameedition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physical_copy`
--

DROP TABLE IF EXISTS `physical_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `physical_copy` (
  `copy_id` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(40) DEFAULT NULL,
  `protection` varchar(20) DEFAULT NULL,
  `no_of_discs` int(11) DEFAULT NULL,
  PRIMARY KEY (`copy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physical_copy`
--

LOCK TABLES `physical_copy` WRITE;
/*!40000 ALTER TABLE `physical_copy` DISABLE KEYS */;
INSERT INTO `physical_copy` VALUES (1,'Game Of Thrones','Denuvo',2);
/*!40000 ALTER TABLE `physical_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `no_of_copies_sold` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'project'
--

--
-- Dumping routines for database 'project'
--
/*!50003 DROP PROCEDURE IF EXISTS `copies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `copies`(IN igname CHAR(40))
BEGIN
  SELECT no_of_online_copies FROM game
  WHERE gname=igname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `minuscopy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `minuscopy`(IN igname VARCHAR(40))
BEGIN
update game g
set g.no_of_online_copies=g.no_of_online_copies-1
where g.gname=igname
and no_of_online_copies>0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-12 21:10:15
