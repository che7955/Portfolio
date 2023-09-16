-- W6D1.sql creates a table that we are going to check for NF1, NF2, NF3 and BCNF
DROP DATABASE IF EXISTS practice;

DROP TABLE IF EXISTS course;
CREATE DATABASE practice;
USE practice;
CREATE TABLE course(
CourseID		Int,
CourseName		varchar(25) NOT NULL,
StudName		varchar(25) NOT NULL,
SSN              	varchar(9) NOT NULL,
DOB               	date NOT NULL,
Prof                    varchar(10),
Bldg                    char(2),
Floor                   tinyint,
RmNo                    SmallInt,
Grade                   char(1),
CONSTRAINT Bldg CHECK (departmentName <> '00'),
PRIMARY KEY AdvisorTemp_PK (courseID,SSN)
);

DESCRIBE course;

INSERT INTO course  values 
 (10058, "CSIS 2520", "Sam Hall", "254638589", '1959-05-19','Harley','BB',4, 405, 'C'); 
INSERT INTO `practice`.`course` (`CourseID`, `CourseName`, `StudName`, `SSN`, `DOB`, `Prof`, `Bldg`, `Floor`, `RmNo`, `Grade`) VALUES ('10058', 'CSIS 2520', 'Ted Ringly', '752135423', '1972-11-07', 'Harley', 'BB', '4', '405', 'B');

INSERT INTO `practice`.`course` (`CourseID`, `CourseName`, `StudName`, `SSN`, `DOB`, `Prof`, `Bldg`, `Floor`, `RmNo`, `Grade`) VALUES ('25600', 'ART 1101', 'Jane King', '232522654', '1981-01-05', 'Bartett', 'PL', '2', '201', 'A');

INSERT INTO `practice`.`course` (`CourseID`, `CourseName`, `StudName`, `SSN`, `DOB`, `Prof`, `Bldg`, `Floor`, `RmNo`, `Grade`) VALUES ('38569', 'MATH 4454', 'John Smith', '458963232', '1969-08-01', 'Harton', 'CL', '1', '160', 'D');

INSERT INTO `practice`.`course` (`CourseID`, `CourseName`, `StudName`, `SSN`, `DOB`, `Prof`, `Bldg`, `Floor`, `RmNo`, `Grade`) VALUES ('10654', 'CSIS 3600', 'Jane King', '232522654', '1981-01-05', 'Snipes', 'JM', '2', '217', 'A');

