# W2D3_Friday_class_example
# Week 2 Class Example
-- Created by Jim Habermas
-- ISTE 230

SHOW DATABASES;

DROP DATABASE IF EXISTS  College; 
CREATE DATABASE College;

USE College;

DROP TABLE Advisor;
CREATE TABLE Advisor(
	employeeID	varchar(9) PRIMARY KEY,
	firstName	varchar(25),
	lastName	varchar(25),
	departmentID	char(4) NOT NULL,
	departmentName	varchar(30) default null
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	

# InsertAdvisor.sql
INSERT INTO Advisor(
	employeeID,
	firstName,
	lastName,
	departmentID,
	departmentName)
VALUES(
	'123456789',
	'Elissa',
	'Weeden',
	'4002',
	'Information Technology');

INSERT INTO Advisor(
	employeeID,
	firstName,
	lastName,
	departmentID,
	departmentName)
VALUES(
	'012345678',
	'Steve',
	'Zilora',
	'4002',
	'Information Technology');

INSERT INTO Advisor(
	employeeID,
	firstName,
	lastName,
	departmentID,
	departmentName)
VALUES(
	'234567890',
	'Ed',
	'Holden',
	'4002',
	'Information Technology');

INSERT INTO Advisor(
	employeeID,
	firstName,
	lastName,
	departmentID,
	departmentName)
VALUES(
	'345678901',
	'Dianne',
	'Bills',
	'4002',
	'Information Technology');

INSERT INTO Advisor(
	employeeID,
	firstName,
	lastName,
	departmentID,
	departmentName)
VALUES(
	'456789012',
	'Bill',
	'Stratton',
	'4002',
	'Information Technology');

INSERT INTO Advisor(
	employeeID,
	firstName,
	lastName,
	departmentID,
	departmentName)
VALUES(
	'567890123',
	'Jai',
	'Kang',
	'4002',
	'Information Technology');
	
INSERT INTO Advisor(
	employeeID,
	firstName,
	lastName,
	departmentID,
	departmentName)
VALUES(
	'678901234',
	'Nick',
	'Therios',
	'4002',
	'Information Technology');

INSERT INTO Advisor(
	employeeID,
	firstName,
	lastName,
	departmentID,
	departmentName)
VALUES(
	'789012345',
	'Joe',
	'Programmer',
	'4003',
	'Computer Science');

INSERT INTO Advisor(
	employeeID,
	firstName,
	lastName,
	departmentID,
	departmentName)
VALUES(
	'890123456',
	'Ima',
	'Engineer',
	'4010',
	'Software Engineering'
	);

INSERT INTO Advisor(
	employeeID,
	firstName,
	lastName,
	departmentID,
	departmentName)
VALUES(
	'901234567',
	'Steve',
	'Engineer',
	'4010',
	'Software Engineering'
	);
	



CREATE TABLE departments(
	departmentID	   char(4) PRIMARY KEY,
	departmentName     varchar(25)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO departments VALUES("4002", "Information Technology");	
INSERT INTO departments VALUES("4003", "Computer Science");
INSERT INTO departments VALUES("4050", "NSSA");
INSERT INTO departments VALUES("4010", "Software Engineering");
INSERT INTO departments values ("2000","BUS - HR");
INSERT INTO departments values ("500","Physician Assistant");


ALTER TABLE advisor drop column departmentname;

SELECT * FROM ADVISOR;

ALTER TABLE advisor add constraint advisor_dept_fk  FOREIGN KEY (departmentID)
         references departments(departmentID);
         
SELECT * FROM ADVISOR JOIN DEPARTMENTS USING (DEPARTMENTID);

-- -----------------------------------------------------------------------------------------

DROP TABLE IF EXISTS student;
CREATE TABLE student(
studentID varchar(9),
lastName varchar(20) NOT NULL,
firstName varchar(20),
homeAddress varchar(30),
collegeAddress varchar(30),
advisorID char(9) COMMENT "WILL BE FK CONNECTING TO ADVISOR TABLE",
departmentID char(4) NOT NULL  DEFAULT "4002" COMMENT "WILL BE FK CONNECTING to departments",
CONSTRAINT chk_deptID CHECK (departmentID <> '0000'),
graduated tinyint(1) unsigned DEFAULT 0 NOT NULL,
CONSTRAINT studentIDPK PRIMARY KEY(studentID),
CONSTRAINT fk_advisorID FOREIGN KEY (advisorID) REFERENCES advisor(employeeID),
CONSTRAINT fk_departmentID FOREIGN KEY (departmentID) REFERENCES departments(departmentID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO student values
("123123123","Burns","Jeff","8015 Arlington, Plymouth, MI", "Haffey Hall Apt 503",
 "345678901","500",1);

INSERT INTO student values
("987654321","Wilcox","Dawn","31 Captiva, Rochester, NY", "Haffey Hall Apt 301",
 "012345678","2000",0);
 
INSERT INTO student values
("233333333","French","Brian","3243 Main, Avon, NY", "Haffey Hall Apt 503",
 "345678901","500",1);

INSERT INTO student values
("120050789","Floeser","Michael","2 Main, Honeoy,Falls NY", "Brigs Hall Apt 503",
 "012345678","4002",0);


INSERT INTO student values
("987659009","Smith","Dawn","202 South St., Rochester, NY", "Haffey Hall Apt 301",
 "012345678","2000",0);

INSERT INTO student values
("133333330","Miller","Guy","32 Oak St., Plymouth, MI", "Haffey Hall Apt 503",
 "345678901","500",1);

INSERT INTO student values
("987220220","Wilcox","Kim","2299 West Main, Rochester, NY", "Haffey Hall Apt 301",
 "012345678","4002",0);
 
 INSERT INTO student values
("121212121","Habermas","Jim","32 Main, Plymouth, MI", "Haffey Hall Apt 503",
 "234567890","4003",1);


-- ------------------------------------------------------------------------------------------

SELECT TABLE_SCHEMA, TABLE_NAME, CONSTRAINT_NAME,  COLUMN_NAME
    FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
     WHERE REFERENCED_TABLE_SCHEMA IS NOT NULL
         ORDER BY TABLE_SCHEMA DESC, TABLE_NAME;
         
         

