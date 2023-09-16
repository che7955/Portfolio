-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
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
-- Current Database: `studentdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `studentdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `studentdb`;

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
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `user` varchar(50) NOT NULL,
  `logEntry` int(11) NOT NULL,
  `currentTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `studentRecordChanged` varchar(70) NOT NULL,
  `comment` mediumtext NOT NULL,
  PRIMARY KEY (`user`,`logEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES ('user3',1,'2019-04-08 14:14:49','Habermas','GPA was updated by Biney'),('user3',4,'2019-04-08 14:20:03','Kang','GPA was updated by Biney'),('user4',1,'2019-04-08 14:29:54','Collins','GPA was updated by Habermas'),('user5',3,'2019-04-08 14:17:45','Holdan','GPA was updated by Bell'),('user6',1,'2019-04-08 15:40:07','Zilora','GPA was updated by Daniels'),('user6',2,'2019-04-08 14:16:20','Zilora','GPA was updated by Daniels');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
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
  `departmentID` varchar(4) NOT NULL,
  `gpa` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`studentID`),
  UNIQUE KEY `studentID` (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('12345','Bettinger','Matthew','JR','4002',3.50),('12355','Collins','Andrew','FR','4002',3.80),('12365','Kang','Jay','GR','4003',3.99),('12375','Habermas','Jim','GR','4003',3.66),('22222','Holdan','Edward','SR','4002',3.50),('33343','Zilora','Stephen','GR','4002',4.00);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID` varchar(20) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Access` varchar(7) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('user1','password1','Curly','General'),('user2','password2','Larry','Editor'),('user3','password3','Biney','Admin'),('user4','password4','Habermas','Admin'),('user5','password5','Bell','Admin'),('user6','password6','Daniels','Admin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user2`
--

DROP TABLE IF EXISTS `user2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user2` (
  `ID` varchar(20) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Access` varchar(7) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user2`
--

LOCK TABLES `user2` WRITE;
/*!40000 ALTER TABLE `user2` DISABLE KEYS */;
INSERT INTO `user2` VALUES ('user1','e38ad214943daad1d64c102faec29de4afe9da3d','Curly','General'),('user2','2aa60a8ff7fcd473d321e0146afd9e26df395147','Larry','Editor'),('user3','1119cfd37ee247357e034a08d844eea25f6fd20f','Biney','Admin'),('user4','a1d7584daaca4738d499ad7082886b01117275d8','Habermas','Admin'),('user5','edba955d0ea15fdef4f61726ef97e5af507430c0','Bell','Admin'),('user6','6d749e8a378a34cf19b4c02f7955f57fdba130a5','Daniels','Admin');
/*!40000 ALTER TABLE `user2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-28 13:51:24
