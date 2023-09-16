CREATE DATABASE  IF NOT EXISTS `tv_guide` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tv_guide`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: tv_guide
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `play`
--

DROP TABLE IF EXISTS `play`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `play` (
  `name` varchar(31) NOT NULL DEFAULT '' COMMENT 'Name of show',
  `playDate` date NOT NULL,
  `playTime` time NOT NULL DEFAULT '00:00:00',
  `channel` int(10) unsigned NOT NULL DEFAULT '0',
  `episodeID` tinyint(1) unsigned zerofill DEFAULT NULL,
  `affiliate` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`name`,`playDate`,`playTime`,`channel`),
  KEY `fk1` (`channel`),
  CONSTRAINT `fk1` FOREIGN KEY (`channel`) REFERENCES `tvstation` (`channel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='constraint fk1 means channel = channel';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `play`
--

LOCK TABLES `play` WRITE;
/*!40000 ALTER TABLE `play` DISABLE KEYS */;
INSERT INTO `play` VALUES ('Becker','2012-11-22','19:00:00',238,1,'REELZ'),('Chopped','2012-09-26','21:00:00',231,19,'FOOD'),('Coach','2012-08-22','15:00:00',238,1,'REELZ'),('Family Guy','2012-09-23','21:00:00',31,1,'FOX'),('Frasier','2012-08-22','09:00:00',252,5,'LIFE'),('Good Morning America','2012-09-26','07:00:00',13,207,'ABC'),('Jerry Springer','2012-09-26','10:00:00',31,255,'FOX'),('Judge Joe Brown','2012-09-26','09:00:00',31,111,'FOX'),('Last Man Standing','2012-08-21','20:30:00',13,5,'ABC'),('Last Man Standing','2016-01-29','22:00:00',247,100,'TBS'),('Man vs Food','2012-09-20','16:00:00',231,13,'FOOD'),('NY Med','2012-06-14','21:00:00',13,6,'ABC'),('Rachael Ray','2012-09-26','09:00:00',13,29,'ABC'),('The Big Bang Theory','2012-08-22','22:00:00',8,200,'CBS'),('The Big Bang Theory','2012-08-22','22:00:00',247,5,'TBS'),('The Big Bang Theory','2016-01-27','22:00:00',8,250,'CBS'),('The Cosby Show','2012-09-22','20:00:00',304,54,'TVland'),('The Doctors','2012-09-26','09:00:00',13,1,'ABC'),('The View','2012-09-26','11:00:00',13,111,'ABC'),('X Factor, The','2012-09-26','20:00:00',31,5,'FOX');
/*!40000 ALTER TABLE `play` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvstation`
--

DROP TABLE IF EXISTS `tvstation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tvstation` (
  `channel` int(10) unsigned NOT NULL DEFAULT '0',
  `callLetters` varchar(12) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `st` varchar(2) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL COMMENT 'Web address for station',
  PRIMARY KEY (`channel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='play.channel = tvstation.channel';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvstation`
--

LOCK TABLES `tvstation` WRITE;
/*!40000 ALTER TABLE `tvstation` DISABLE KEYS */;
INSERT INTO `tvstation` VALUES (8,'WROC-TV','Rochester','NY','(585)288-8400','newsroom@wroctv.com','http://www.rochesterfirst.com'),(10,'WHEC-TV','Rochester','NY','(585)546-5670','news10@whec.com','http://www.whec.com'),(13,'13WHAM','Rochester','NY','(585)334-8743','news@13wham','http://www.13wham.com/'),(31,'FOX','Rochester','NY','(585)232-3700','U/A','http://www.foxrochester.com'),(231,'FOOD','New York','NY','(866)587-4653','U/A','http://www.foodnetwork.com'),(238,'REELZ','Albuquerque','NM','U/A','info@reelz.com','http://www.reelz.com'),(247,'TBS','Atlanta','GA','U/A','tbssuperstation@turner.com','http://www.tbs.com'),(252,'Life','NY','NY','(212)424-7000','lmn@mylifetime.com','http://www.mylifetime.com'),(304,'Nick@Nite',NULL,NULL,NULL,NULL,'http://www.tvland.com');
/*!40000 ALTER TABLE `tvstation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-27 13:19:57
