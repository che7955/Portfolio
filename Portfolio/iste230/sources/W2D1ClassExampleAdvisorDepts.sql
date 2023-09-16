-- Commands Used Mid-week #2
-- CMDS_2022_05_24.txt  & pdf

-- Key learning outcomes of this class included topics around lines 177-193
--            How to drop a column form a table  ALTER TABLE advisor drop column departmentname;
--            How to create a look-up table
--            How to use ALTER to create a PRIMARY key
--            How to use ALTER to create a FOREIGN key   
--                ALTER TABLE advisor add constraint advisor_dept_fk  FOREIGN KEY (departmentID)
 --                    references departments(departmentID);
# Mid-Week 2 Class Example


SHOW DATABASES;

DROP DATABASE IF EXISTS  College; 
CREATE DATABASE College;

USE College;

SHOW TABLES;

# CreateAdvisor.sql
Drop table if exist advisor;

CREATE TABLE Advisor(
	employeeID	varchar(9)  NOT NULL,
	firstName	varchar(25),
	lastName	varchar(25),
	departmentID	varchar(4)  NOT NULL,
	departmentName	varchar(30) default null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

SHOW TABLES;

DESCRIBE Advisor;

ALTER TABLE Advisor ADD PRIMARY KEY(employeeID);
	

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
	departmentID       varchar(4),
	departmentName     varchar(25),
	PRIMARY KEY (departmentID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO departments VALUES("4002", "Information Technology");	
INSERT INTO departments VALUES("4003", "Computer Science");
INSERT INTO departments VALUES("4050", "NSSA");
INSERT INTO departments VALUES("4010", "Software Engineering");

ALTER TABLE advisor drop column departmentname;
SELECT * FROM ADVISOR;
ALTER TABLE advisor add constraint advisor_dept_fk  FOREIGN KEY (departmentID)
         references departments(departmentID);
         
SELECT * FROM ADVISOR JOIN DEPARTMENTS USING (DEPARTMENTID);