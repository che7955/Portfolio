CREATE DATABASE  IF NOT EXISTS `studentdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `studentdb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: studentdb
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `course_Num` varchar(10) NOT NULL,
  `course_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`course_Num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('4002-218','Programming for IT II'),('4002-360','Intro to Database');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment` (
  `course_num` varchar(10) NOT NULL DEFAULT '',
  `section_num` char(2) DEFAULT NULL,
  `studentID` char(5) NOT NULL DEFAULT '',
  `qtr` char(3) NOT NULL DEFAULT '',
  `grade` char(1) DEFAULT NULL,
  PRIMARY KEY (`course_num`,`studentID`,`qtr`),
  KEY `stu_FK` (`studentID`),
  CONSTRAINT `course_FK` FOREIGN KEY (`course_num`) REFERENCES `section` (`course_num`),
  CONSTRAINT `stu_FK` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES ('4002-360','01','12345','093','A'),('4002-360','02','12355','093','B'),('4002-360','03','12365','093','A'),('4002-360','04','12375','093','C');
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `major` (
  `maj` varchar(10) NOT NULL,
  `maj_desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`maj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES ('CS','Computer Science'),('IT','Information Technology'),('NSSA','Network Security & Systems Admin'),('SE','Software Engineering');
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `majora`
--

DROP TABLE IF EXISTS `majora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `majora` (
  `major` varchar(10) NOT NULL,
  `major_desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`major`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `majora`
--

LOCK TABLES `majora` WRITE;
/*!40000 ALTER TABLE `majora` DISABLE KEYS */;
INSERT INTO `majora` VALUES ('CE','Computer Engineering'),('CS','Computer Science'),('IT','Information Technology'),('MIS','Management Information System'),('SE','Software Engineering');
/*!40000 ALTER TABLE `majora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `course_num` varchar(10) NOT NULL DEFAULT '',
  `section_num` char(2) NOT NULL DEFAULT '',
  `qtr` char(3) NOT NULL DEFAULT '',
  `room` varchar(10) DEFAULT NULL,
  `meetingtime` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`course_num`,`section_num`,`qtr`),
  CONSTRAINT `course_numFK` FOREIGN KEY (`course_num`) REFERENCES `course` (`course_Num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES ('4002-360','01','093','T204','8-10am'),('4002-360','02','093','T204','10-11am'),('4002-360','03','093','E124','12-4pm'),('4002-360','04','093','E124','2-4pm');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `studentID` char(5) NOT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `class` char(2) DEFAULT NULL,
  `major` varchar(10) DEFAULT NULL,
  `gpa` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`studentID`),
  UNIQUE KEY `index_name` (`lastName`,`firstName`),
  KEY `maj_FK` (`major`),
  CONSTRAINT `maj_FK` FOREIGN KEY (`major`) REFERENCES `major` (`maj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('12345','Bettinger','Matthew','JR','IT',3.50),('12355','Collins','Andrew','FR','IT',3.80),('12365','kang','jimmy','GR','CS',4.00),('12375','Miller','Cliff','JR','CS',3.00),('12385','Harris','Mark','JR','SE',2.00),('12395','Robinson','Linda','FR','SE',3.50),('12405','Smith','Mary','FR','IT',3.99),('12415','Lee','jimmy','FR','CS',4.00),('12425','Williams','Craig','SO','NSSA',2.80),('12435','Hoffman','Joe','SO','NSSA',2.20),('20000','Taylor','Tim','FR','CS',1.20),('20010','Boice','Bradley','FR','CS',2.10),('20020','Deng','Kate','SE','IT',4.00),('20030','Farynyk','Lynn','SE','IT',3.40),('20040','Gaspar','Eric','SE','IT',3.00),('20050','Puts','Kim','GR','CS',2.90),('20060','Nelson','Jim','JR','CS',2.24),('20070','Singh','Yuvraj','FR','CS',1.75);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-20  7:19:14
