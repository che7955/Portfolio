CREATE DATABASE  IF NOT EXISTS `company` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `company`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: company
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
-- Table structure for table `salesrep2`
--

DROP TABLE IF EXISTS `salesrep2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrep2` (
  `empID` varchar(9) NOT NULL DEFAULT '',
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` varchar(5) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`empID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrep2`
--

LOCK TABLES `salesrep2` WRITE;
/*!40000 ALTER TABLE `salesrep2` DISABLE KEYS */;
INSERT INTO `salesrep2` VALUES ('123456789','Ed','Holden','102 Lomb Memorial Dr.','Rochester','NY','14623','(123)454-5555'),('888888888','Jim','Habermas','123 Main St.','Rochester','NY','14650','(716)453-4199');
/*!40000 ALTER TABLE `salesrep2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrep`
--

DROP TABLE IF EXISTS `salesrep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrep` (
  `empID` varchar(9) NOT NULL DEFAULT '',
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`empID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrep`
--

LOCK TABLES `salesrep` WRITE;
/*!40000 ALTER TABLE `salesrep` DISABLE KEYS */;
INSERT INTO `salesrep` VALUES ('123456789','Ed','Holden','102 Lomb Memorial Dr.','Rochester','NY','14623'),('234567890','Susan','Holden','123 Sesame St.','Rochester','NY','14650'),('345678901','Buster','Crabbe','231 Penny Lane','Utica','NY','13501'),('456789012','George','Reeves','57 Lois Lane','Woolstock','IA','50599'),('567890123','Buddy','Hackett','1 Mermaid lane','Brooklyn','NY','11201');
/*!40000 ALTER TABLE `salesrep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `territory`
--

DROP TABLE IF EXISTS `territory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `territory` (
  `terrID` varchar(5) NOT NULL DEFAULT '',
  `terrName` varchar(50) DEFAULT NULL,
  `salesRepID` varchar(9) DEFAULT NULL,
  `distID` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`terrID`),
  KEY `district_territory_FK` (`distID`),
  CONSTRAINT `district_territory_FK` FOREIGN KEY (`distID`) REFERENCES `district` (`distID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `territory`
--

LOCK TABLES `territory` WRITE;
/*!40000 ALTER TABLE `territory` DISABLE KEYS */;
INSERT INTO `territory` VALUES ('chi','Chicago, IL','456789012','cent'),('dal','Dallas, TX',NULL,'cent'),('nor','New Orleans, LA','567890123','cent'),('roc','Rochester, NY','234567890','east'),('sfr','San Francisco, CA','345678901','west');
/*!40000 ALTER TABLE `territory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techsalesrep`
--

DROP TABLE IF EXISTS `techsalesrep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techsalesrep` (
  `empNum` varchar(9) NOT NULL DEFAULT '',
  `fName` varchar(25) DEFAULT NULL,
  `lName` varchar(25) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`empNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techsalesrep`
--

LOCK TABLES `techsalesrep` WRITE;
/*!40000 ALTER TABLE `techsalesrep` DISABLE KEYS */;
INSERT INTO `techsalesrep` VALUES ('123456789','Ed','Holden','102 Lomb Memorial Dr.','Rochester','NY','14623'),('567890123','Buddy','Hackett','1 Mermaid lane','Brooklyn','NY','11201'),('934567890','Mark','Trail','983 Forest Path','Stratford','NY','13429'),('945678901','Johnny','Weissmuller','342 Treetop Lane','Hollywood','CA','90028'),('956789012','Sonny','Bono','45 Any Street','Palm Springs','CA','92262');
/*!40000 ALTER TABLE `techsalesrep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `distID` varchar(5) NOT NULL DEFAULT '',
  `distName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`distID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES ('cent','Central USA'),('east','Eastern USA'),('mount','Mountain USA'),('natac','National Accounts USA'),('west','Western USA');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-21 18:11:56
