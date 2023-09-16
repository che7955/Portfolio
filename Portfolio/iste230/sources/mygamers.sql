CREATE DATABASE  IF NOT EXISTS gamers;
use gamers;
--
-- Table structure for table GameType;
--

DROP TABLE IF EXISTS GameType;

 
CREATE TABLE `GameType` (
  `GameTypeID` tinyint(4) NOT NULL,
  `GameType` varchar(20) NOT NULL,
  PRIMARY KEY (`GameTypeID`,`GameType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sample to add and remove keys';


--
-- Table structure for table `Platform`
--

DROP TABLE IF EXISTS Platform;
CREATE TABLE `Platform` (
  `PlatformID` tinyint(4) NOT NULL,
  `Platform` varchar(20) NOT NULL,
  PRIMARY KEY (`PlatformID`,`Platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='add documentation';

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS player;

CREATE TABLE `player` (
  `Name` varchar(20) NOT NULL,
  `Age` tinyint(4) DEFAULT NULL,
  `PlatformID` tinyint(4) NOT NULL,
  `GameTypeID` tinyint(4) NOT NULL,
  PRIMARY KEY (`Name`,`PlatformID`,`GameTypeID`),
  KEY `PlayerGTID_GameTypeGTID_FK` (`GameTypeID`),
  KEY `PlayerPlatID_PlatformPlatID_FK` (`PlatformID`),
  CONSTRAINT `PlayerGTID_GameTypeGTID_FK` FOREIGN KEY (`GameTypeID`) REFERENCES `GameType` (`GameTypeID`),
  CONSTRAINT `PlayerPlatID_PlatformPlatID_FK` FOREIGN KEY (`PlatformID`) REFERENCES `Platform` (`PlatformID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='add documentation';
