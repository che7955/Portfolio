-- W4D2.sql  database  from PPT after normalization rules applied

DROP DATABASE IF EXISTS practiceNormalization;

CREATE DATABASE practiceNormalization;
USE practiceNormalization;

CREATE TABLE departments(
	departmentID        char(4)  PRIMARY KEY,
	departmentName      varchar(25)
);

INSERT INTO departments VALUES("1002", "Marketing");	
INSERT INTO departments VALUES("1003", "Accounting");
INSERT INTO departments VALUES("1050", "Info Systems");
INSERT INTO departments VALUES("1060", "Finance");

DROP TABLE IF EXISTS employee;
CREATE TABLE employee(
emp_id		       tinyint unsigned PRIMARY KEY,
name		       varchar(25) NOT NULL,
departmentID           char(4),
salary                 decimal(5,0),
CONSTRAINT employee_departments_FK FOREIGN KEY (departmentID)
    REFERENCES departments(departmentID)

);

Create TABLE course(
emp_id             tinyint unsigned,
course_title       varchar(25) NOT NULL,
date_completed     date NOT NULL,
CONSTRAINT emp_course_PK PRIMARY KEY(emp_id, course_title),
CONSTRAINT emp_FK FOREIGN KEY (emp_id)
    REFERENCES employee(emp_id)
);

INSERT INTO employee VALUES (100, 'Margaret Simpson', '1002', 48000);
INSERT INTO employee VALUES (140, 'Alan Beeton', '1003', 52000);
INSERT INTO employee VALUES (110, 'Chris Lucero', '1050', 43000);
INSERT INTO employee VALUES (190, 'Lorenzo Davis', '1060', 55000);
INSERT INTO employee VALUES (150, 'Susan Martin', '1002', 42000);

INSERT INTO course VALUES ('100', 'SPSS','2017-05-19');
INSERT INTO course VALUES ('100', 'Surveys','2017-03-17');
INSERT INTO course VALUES ('140', 'Tax Acc','2017-05-19');
INSERT INTO course VALUES ('110', 'SPSS','2017-05-19');
INSERT INTO course VALUES ('110', 'C++','2017-03-17');
INSERT INTO course VALUES ('150', 'SPSS','2017-05-19');
INSERT INTO course VALUES ('150', 'Java','2017-03-17');