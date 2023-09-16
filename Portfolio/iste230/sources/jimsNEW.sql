DROP DATABASE IF EXISTS jimsNEW;
CREATE DATABASE  IF NOT EXISTS jimsNEW /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE jimsNEW;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: jims
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advisortemp2`
--

DROP TABLE IF EXISTS `advisortemp2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advisortemp2` (
  `employeeId` varchar(9) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `departmentID` varchar(4) DEFAULT NULL,
  `phone` varchar(13),
  PRIMARY KEY (`employeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisortemp2`
--

LOCK TABLES `advisortemp2` WRITE;
/*!40000 ALTER TABLE `advisortemp2` DISABLE KEYS */;
INSERT INTO `advisortemp2` VALUES ('512345678','Add','Default','501','(000)000-0000');
/*!40000 ALTER TABLE `advisortemp2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apples`
--

DROP TABLE IF EXISTS `apples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apples` (
  `variety` char(20) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`variety`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apples`
--

LOCK TABLES `apples` WRITE;
/*!40000 ALTER TABLE `apples` DISABLE KEYS */;
INSERT INTO `apples` VALUES ('Fuji',5),('Gala',6);
/*!40000 ALTER TABLE `apples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `companyID` tinyint(4) NOT NULL DEFAULT '0',
  `companyName` varchar(20) DEFAULT NULL,
  `companyCity` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (15,'Jack Hill Ltd','London'),(16,'Akas Foods','Delhi'),(17,'Foodies.','London'),(18,'Order All','Boston'),(19,'sip-n-Bite.','New York');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Dept` varchar(4) NOT NULL,
  `Location` varchar(20) DEFAULT NULL,
  `Students` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`Dept`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('ART','Bldg 56',70),('CS','Bldg 10',700),('HIS','Bldg 13',67),('IT','Bldg 70',1250),('SE','Bldg 9',500);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept` (
  `departNO` tinyint(1) unsigned NOT NULL,
  `name` tinytext,
  PRIMARY KEY (`departNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Jim''s sample DEPT - PowerPoint';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES (1,'Sys Admin'),(2,'Programming'),(3,'Finance'),(4,'Management'),(5,'Planning');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp` (
  `empNO`    tinyint unsigned  NOT NULL AUTO_INCREMENT,
  `name`     varchar(35)       NOT NULL,
  `departNO` smallint          DEFAULT 20,
  PRIMARY KEY (`empNO`),
  KEY `fk1_dept_no` (`departNO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Jim''s sample EMP - PowerPoint';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES (00001,'Bruce Halfpence',1),(00002,'Keith Beer',2),(00003,'Kevin Whittling',2),(00004,'Ed Holdup',3),(00005,'Larry Molehill',1),(00006,'Bruce Halfpence',1),(00007,'Jim Habermas',11);
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
  `itemID` tinyint(4) NOT NULL DEFAULT '0',
  `itemName` varchar(20) DEFAULT NULL,
  `lastUnit` varchar(8) DEFAULT NULL,
  `companyID` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`itemID`),
  UNIQUE KEY `itemName` (`itemName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (1,'Chex Mix','Pcs',16),(2,'Mighty Munch','Pcs',17),(3,'Pot Rice','Pcs',15),(4,'Cheez-lt','Pcs',15),(5,'Jaffa Cakes','Pcs',18),(6,'BN Biscuit','Pcs',15),(7,'Salt n Shake','Pcs',NULL);
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oranges`
--

DROP TABLE IF EXISTS `oranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oranges` (
  `variety` char(20) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`variety`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oranges`
--

LOCK TABLES `oranges` WRITE;
/*!40000 ALTER TABLE `oranges` DISABLE KEYS */;
INSERT INTO `oranges` VALUES ('Navel',5),('Valencia',4);
/*!40000 ALTER TABLE `oranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `orderNumber` int(11) NOT NULL,
  `productCode` varchar(15) NOT NULL,
  `quantityOrdered` int(11) NOT NULL,
  `priceEach` decimal(10,2) NOT NULL,
  `orderLineNumber` smallint(6) NOT NULL,
  PRIMARY KEY (`orderNumber`,`productCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (10100,'S18_1749',30,136.00,3),(10100,'S18_2248',50,55.09,2),(10100,'S18_4409',22,75.46,4),(10100,'S24_3969',49,35.29,1),(10101,'S18_2325',25,108.06,4),(10101,'S18_2795',26,167.06,1),(10101,'S24_1937',45,32.53,3),(10101,'S24_2022',46,44.35,2),(10102,'S18_1342',39,95.55,2),(10102,'S18_1367',41,43.13,1),(10103,'S10_1949',26,214.30,11),(10103,'S10_4962',42,119.67,4),(10103,'S12_1666',27,121.64,8),(10103,'S18_1097',35,94.50,10),(10103,'S18_2432',22,58.34,2),(10103,'S18_2949',27,92.19,12),(10103,'S18_2957',35,61.84,14),(10103,'S18_3136',25,86.92,13),(10103,'S18_3320',46,86.31,16),(10103,'S18_4600',36,98.07,5),(10103,'S18_4668',41,40.75,9),(10103,'S24_2300',36,107.34,1),(10103,'S24_4258',25,88.62,15),(10103,'S32_1268',31,92.46,3),(10103,'S32_3522',45,63.35,7),(10103,'S700_2824',42,94.07,6),(10104,'S12_3148',34,131.44,1),(10104,'S12_4473',41,111.39,9),(10104,'S18_2238',24,135.90,8),(10104,'S18_2319',29,122.73,12),(10104,'S18_3232',23,165.95,13),(10104,'S18_4027',38,119.20,3),(10104,'S24_1444',35,52.02,6),(10104,'S24_2840',44,30.41,10),(10104,'S24_4048',26,106.45,5),(10104,'S32_2509',35,51.95,11),(10104,'S32_3207',49,56.55,4),(10104,'S50_1392',33,114.59,7),(10104,'S50_1514',32,53.31,2),(10105,'S10_4757',50,127.84,2),(10105,'S12_1108',41,205.72,15),(10105,'S12_3891',29,141.88,14),(10105,'S18_3140',22,136.59,11),(10105,'S18_3259',38,87.73,13),(10105,'S18_4522',41,75.48,10),(10105,'S24_2011',43,117.97,9),(10105,'S24_3151',44,73.46,4),(10105,'S24_3816',50,75.47,1),(10105,'S700_1138',41,54.00,5),(10105,'S700_1938',29,86.61,12),(10105,'S700_2610',31,60.72,3),(10105,'S700_3505',39,92.16,6),(10105,'S700_3962',22,99.31,7),(10105,'S72_3212',25,44.77,8),(10106,'S18_1662',36,134.04,12),(10106,'S18_2581',34,81.10,2),(10106,'S18_3029',41,80.86,18),(10106,'S18_3856',41,94.22,17),(10106,'S24_1785',28,107.23,4),(10106,'S24_2841',49,65.77,13),(10106,'S24_3420',31,55.89,14),(10106,'S24_3949',50,55.96,11),(10106,'S24_4278',26,71.00,3),(10106,'S32_4289',33,65.35,5),(10106,'S50_1341',39,35.78,6),(10106,'S700_1691',31,91.34,7),(10106,'S700_2047',30,85.09,16),(10106,'S700_2466',34,99.72,9),(10106,'S700_2834',32,113.90,1),(10106,'S700_3167',44,76.00,8),(10106,'S700_4002',48,70.33,10),(10106,'S72_1253',48,43.70,15),(10107,'S10_1678',30,81.35,2),(10107,'S10_2016',39,105.86,5),(10107,'S10_4698',27,172.36,4),(10107,'S12_2823',21,122.00,1),(10107,'S18_2625',29,52.70,6),(10107,'S24_1578',25,96.92,3),(10107,'S24_2000',38,73.12,7),(10107,'S32_1374',20,88.90,8),(10108,'S12_1099',33,165.38,6),(10108,'S12_3380',45,96.30,4),(10108,'S12_3990',39,75.81,7),(10108,'S12_4675',36,107.10,3),(10108,'S18_1889',38,67.76,2),(10108,'S18_3278',26,73.17,9),(10108,'S18_3482',29,132.29,8),(10108,'S18_3782',43,52.84,12),(10108,'S18_4721',44,139.87,11),(10108,'S24_2360',35,64.41,15),(10108,'S24_3371',30,60.01,5),(10108,'S24_3856',40,132.00,1),(10108,'S24_4620',31,67.10,10),(10108,'S32_2206',27,36.21,13),(10108,'S32_4485',31,87.76,16),(10108,'S50_4713',34,74.85,14),(10109,'S18_1129',26,117.48,4),(10109,'S18_1984',38,137.98,3),(10109,'S18_2870',26,126.72,1),(10109,'S18_3232',46,160.87,5),(10109,'S18_3685',47,125.74,2),(10109,'S24_2972',29,32.10,6),(10110,'S18_1589',37,118.22,16),(10110,'S18_1749',42,153.00,7),(10110,'S18_2248',32,51.46,6),(10110,'S18_2325',33,115.69,4),(10110,'S18_2795',31,163.69,1),(10110,'S18_4409',28,81.91,8),(10110,'S18_4933',42,62.00,9),(10110,'S24_1046',36,72.02,13),(10110,'S24_1628',29,43.27,15),(10110,'S24_1937',20,28.88,3),(10110,'S24_2022',39,40.77,2),(10110,'S24_2766',43,82.69,11),(10110,'S24_2887',46,112.74,10),(10110,'S24_3191',27,80.47,12),(10110,'S24_3432',37,96.37,14),(10110,'S24_3969',48,35.29,5),(10111,'S18_1342',33,87.33,6),(10111,'S18_1367',48,48.52,5),(10111,'S18_2957',28,53.09,2),(10111,'S18_3136',43,94.25,1),(10111,'S18_3320',39,91.27,4),(10111,'S24_4258',26,85.70,3),(10112,'S10_1949',29,197.16,1),(10112,'S18_2949',23,85.10,2),(10113,'S12_1666',21,121.64,2),(10113,'S18_1097',49,101.50,4),(10113,'S18_4668',50,43.27,3),(10113,'S32_3522',23,58.82,1),(10114,'S10_4962',31,128.53,8),(10114,'S18_2319',39,106.78,3),(10114,'S18_2432',45,53.48,6),(10114,'S18_3232',48,169.34,4),(10114,'S18_4600',41,105.34,9),(10114,'S24_2300',21,102.23,5),(10114,'S24_2840',24,28.64,1),(10114,'S32_1268',32,88.61,7),(10114,'S32_2509',28,43.83,2),(10114,'S700_2824',42,82.94,10),(10115,'S12_4473',46,111.39,5),(10115,'S18_2238',46,140.81,4),(10115,'S24_1444',47,56.64,2),(10115,'S24_4048',44,106.45,1),(10115,'S50_1392',27,100.70,3),(10116,'S32_3207',27,60.28,1),(10117,'S12_1108',33,195.33,9),(10117,'S12_3148',43,148.06,10),(10117,'S12_3891',39,173.02,8),(10117,'S18_3140',26,121.57,5),(10117,'S18_3259',21,81.68,7),(10117,'S18_4027',22,122.08,12),(10117,'S18_4522',23,73.73,4),(10117,'S24_2011',41,119.20,3),(10117,'S50_1514',21,55.65,11),(10117,'S700_1938',38,75.35,6),(10117,'S700_3962',45,89.38,1),(10117,'S72_3212',50,52.42,2),(10118,'S700_3505',36,86.15,1),(10119,'S10_4757',46,112.88,11),(10119,'S18_1662',43,151.38,3);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `qty` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('123451','Park\'s Great Hits','Music',19.99,10),('123452','Silly Puddy','Toy',3.99,1),('123453','Playstation','Toy',89.95,2),('123454','Men\'s T-Shirt','Clothing',32.50,3),('123455','Blouse','Clothing',34.97,4),('123456','Electronica 2002','Music',3.99,5),('123457','Country Tunes','Music',21.55,6),('123458','Watermelon','Food',8.73,10);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--


--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `SupplierID` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `SupplierName` varchar(40) NOT NULL,
  `Phone` varchar(14) NOT NULL,
  `Email` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (00001,'ABCSupplier','1122334455','abc@dicforum.com');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'jims'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-23 15:41:50
Drop table if exist student;
-- Create student table
CREATE TABLE student(
	StudentID int(3),
	Name varchar(10),
	Major char(3),
	PRIMARY KEY (StudentID)
);

-- Insert data into student
INSERT INTO student (StudentID, Name, Major)
	VALUES
		(123, "Bill", "IT"),
		(234, "Sue", "CS"),
		(345, "Tom", "SE"),
		(456, "Ann", "BUS"),
		(567, "Linda", "IT"),
		(678, "Tom", "IT"),
		(789, "Sue", "LA");


Drop table if exist itstudent;
-- Create itstudent table
CREATE TABLE itstudent(
	StudentID int(3),
	Name varchar(10),
	Major char(3),
	PRIMARY KEY (StudentID)
);
		
-- Insert data into itstudent
INSERT INTO itstudent (StudentID, Name, Major)
	VALUES
		(123, "Bill", "IT"),
		(567, "Linda", "IT"),
		(678, "Tom", "IT"),
		(890, "Jon", "IT"),
		(901, "Lynn", "IT");
		
-- Union statement (STUDENT ? ITSTUDENT)
SELECT "Sample Union" As "Students";

SELECT student.StudentID, student.Name, student.Major FROM student
UNION
SELECT itstudent.StudentID, itstudent.Name, itstudent.Major FROM itstudent;
