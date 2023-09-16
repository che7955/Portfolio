# Week 2 Class Example
-- Jim Habermas
-- ISTE 230


DROP DATABASE IF EXISTS  College; 
CREATE DATABASE College;

USE College;



# CreateAdvisor.sql

CREATE TABLE advisor(
	employeeID      varchar(9) NOT NULL,
	firstName       varchar(25) DEFAULT NULL,
	lastName        varchar(25),
	departmentID    varchar(4)  NOT NULL,
	departmentName  varchar(30)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;



describe advisor;

ALTER TABLE advisor ADD PRIMARY KEY(employeeID);


# InsertAdvisor.sql
INSERT INTO advisor(
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

INSERT INTO advisor(
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

INSERT INTO advisor(
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

INSERT INTO advisor(
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

INSERT INTO advisor(
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

INSERT INTO advisor(
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
	
INSERT INTO advisor(
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

INSERT INTO advisor(
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

INSERT INTO advisor(
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

INSERT INTO advisor(
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
	
# CreateOtherDeptFac.sql


CREATE TABLE otherDeptFac(
	empID		varchar(9),
	nameF		varchar(25),
	nameL		varchar(25),
	advisingCode	boolean,
	PRIMARY KEY (empID)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;

show tables;

describe otherDeptFac;

INSERT INTO otherDeptFac(
	empID,
	nameF,
	nameL,
	advisingCode)
VALUES(
	'987651234',
	'Jane',
	'Torre',
	true);

INSERT INTO otherDeptFac(
	empID,
	nameF,
	nameL,
	advisingCode)
VALUES(
	'876543210',
	'Joe',
	'Nonadvisor',
	false);


SELECT empID, nameF, nameL FROM otherDeptfac
          WHERE advisingCode=true;


-- INSERT INTO advisor (
--			employeeID,
--			firstName,
--			lastName,
--			departmentID,
--			departmentName)
--	SELECT empID, nameF, nameL, '4050', 'NSSA'
--		FROM otherDeptFac
--		WHERE (advisingCode = true);


SELECT * FROM advisor;
