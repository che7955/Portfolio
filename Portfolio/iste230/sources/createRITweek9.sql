DROP DATABASE IF EXISTS rit;
CREATE DATABASE  IF NOT EXISTS `rit` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE rit;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: rit
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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `deptNum` varchar(4) NOT NULL DEFAULT '',
  `courseNum` varchar(3) NOT NULL DEFAULT '',
  `courseDesc` varchar(50) NOT NULL,
  `creditHrs` int(11) DEFAULT NULL,
  PRIMARY KEY (`deptNum`,`courseNum`),
  CONSTRAINT `course_department_FK` FOREIGN KEY (`deptNum`) REFERENCES `department` (`deptNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('0301','219','Intro to Circuits',4),('4002','217','Java Programming For IT I',4),('4002','218','Java Programming For IT II',4),('4002','219','Java Programming for IT III',4),('4002','360','Intro to Databases',4),('4003','317','Data Structures',4),('4010','340','Intro to Networking',4);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college` (
  `collegeID` varchar(5) NOT NULL DEFAULT '',
  `collegeName` varchar(70) NOT NULL,
  PRIMARY KEY (`collegeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
INSERT INTO `college` VALUES ('COE','Kate Gleason College of Engineering'),('GCCIS','Golisano College of Computing and Information Sciences'),('NTID','National Technical Institute for the Deaf');
/*!40000 ALTER TABLE `college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `studentID` varchar(9) NOT NULL DEFAULT '',
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deptphone`
--

DROP TABLE IF EXISTS `deptphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deptphone` (
  `deptNum` varchar(4) NOT NULL DEFAULT '',
  `type` varchar(6) NOT NULL DEFAULT '',
  `phoneNum` varchar(13) NOT NULL,
  PRIMARY KEY (`deptNum`,`type`),
  CONSTRAINT `deptPhone_department_FK` FOREIGN KEY (`deptNum`) REFERENCES `department` (`deptNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deptphone`
--

LOCK TABLES `deptphone` WRITE;
/*!40000 ALTER TABLE `deptphone` DISABLE KEYS */;
INSERT INTO `deptphone` VALUES ('0301','fax','585-475-3152'),('0301','office','585-475-6102'),('0306','office','585-475-7453'),('0308','fax','585-475-1235'),('0308','office','585-475-1234'),('4002','cell','585-475-5557'),('4002','fax','585-475-5556'),('4002','office','585-475-5555'),('4003','office','585-475-6666'),('4010','office','585-475-2222'),('4050','office','585-475-3333');
/*!40000 ALTER TABLE `deptphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `deptNum` varchar(4) NOT NULL DEFAULT '',
  `deptName` varchar(50) NOT NULL,
  `collegeID` varchar(5) NOT NULL,
  PRIMARY KEY (`deptNum`),
  KEY `department_college_FK` (`collegeID`),
  CONSTRAINT `department_college_FK` FOREIGN KEY (`collegeID`) REFERENCES `college` (`collegeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('0301','Electrical Engineering','COE'),('0306','Computer Engineering','COE'),('0308','Microsystems Engineering','COE'),('4002','Information Technology','GCCIS'),('4003','Computer Science','GCCIS'),('4010','Software Engineering','GCCIS'),('4050','NSSA','GCCIS');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `deptNum` varchar(4) NOT NULL DEFAULT '',
  `courseNum` varchar(3) NOT NULL DEFAULT '',
  `sectionNum` varchar(2) NOT NULL DEFAULT '',
  `quarter` varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`deptNum`,`courseNum`,`sectionNum`,`quarter`),
  CONSTRAINT `section_course_FK` FOREIGN KEY (`deptNum`, `courseNum`) REFERENCES `course` (`deptNum`, `courseNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentsection`
--

DROP TABLE IF EXISTS `studentsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentsection` (
  `studentID` varchar(9) NOT NULL DEFAULT '',
  `deptNum` varchar(4) NOT NULL DEFAULT '',
  `courseNum` varchar(3) NOT NULL DEFAULT '',
  `sectionNum` varchar(2) NOT NULL DEFAULT '',
  `quarter` varchar(5) NOT NULL DEFAULT '',
  `grade` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`studentID`,`deptNum`,`courseNum`,`sectionNum`,`quarter`),
  KEY `studentSection_section_FK` (`deptNum`,`courseNum`,`sectionNum`,`quarter`),
  CONSTRAINT `studentSection_section_FK` FOREIGN KEY (`deptNum`, `courseNum`, `sectionNum`, `quarter`) REFERENCES `section` (`deptNum`, `courseNum`, `sectionNum`, `quarter`),
  CONSTRAINT `studentSection_student_FK` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentsection`
--

LOCK TABLES `studentsection` WRITE;
/*!40000 ALTER TABLE `studentsection` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentsection` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-01  7:37:18

SELECT "College & department Tables" AS "RIT";

