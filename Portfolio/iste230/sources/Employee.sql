-- Normalization PowerPoint Slides 14 & 15

DROP DATABASE IF EXIST practice;
CREATE DATABASE PRACTICE;
USE PRACTICE;

DROP TABLE IF EXISTS Employee;

-- Create Employee TABLE

CREATE TABLE Employee (
EmpID INT PRIMARY KEY,
Name VARCHAR(25) NOT NULL,
DeptName VARCHAR(25),
Salary DOUBLE);  


-- Create Course TABLE

DROP TABLE IF EXISTS Course;
CREATE TABLE Course (
EmpID INT,
CourseTitle VARCHAR(25) NOT NULL,
DateCompleted DATE,
PRIMARY KEY (EmpID, CourseTitle),
CONSTRAINT Employee_EmpID_FK FOREIGN KEY (EmpID) references Employee(EmpID)); 

-- INSERT RECORDS IN Employee Table

INSERT INTO Employee (EmpID, Name, DeptName, Salary) VALUES (1111, 'Sharon Semon', 'CIS', 120000.00);
INSERT INTO Employee (EmpID, Name, DeptName, Salary) VALUES (2222, 'Conner Peters', 'CSN', 55000.00);
INSERT INTO Employee (EmpID, Name, DeptName, Salary) VALUES (3333, 'John Smith', 'ADMIN', 65000.00);
INSERT INTO Employee (EmpID, Name, DeptName, Salary) VALUES (4444, 'Jim Habermas', 'CIS', 150000.00);


-- INSERT RECORDS IN Course Table	
INSERT INTO Course (EmpID, CourseTitle, DateCompleted) VALUES (1111, 'SQL 101', '2012-06-15');
INSERT INTO Course (EmpID, CourseTitle, DateCompleted) VALUES (2222, 'COMPUTER REPAIR 101', '2014-3-25');
INSERT INTO Course (EmpID, CourseTitle, DateCompleted) VALUES (3333, 'ACCOUNTING 101', '2010-09-05');
INSERT INTO Course (EmpID, CourseTitle, DateCompleted) VALUES (4444, 'JAVA 101', '2010-02-01');

-- Query records joining EmpID and using Table Alais Names

SELECT E.EmpID, E.Name, E.DeptName, E.Salary, C.CourseTitle, C.DateCompleted FROM Employee E JOIN Course C using (EmpID);