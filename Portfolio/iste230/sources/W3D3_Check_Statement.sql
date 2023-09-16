-- W3D3_Check_Statement.sql               # Will server as Commands Used in class in the middle of Week #3
-- End of Week 3/Start of week 4
-- Contains CHECK
-- The CHECK clause will be tested with one insert statement on Line Numbers 66-67

-- AdvisorTemp2 Is a table created from a SELECT from the advisor table;   I wanted to copy the data for testing.

USE college;

DROP TABLE IF EXISTS advisorTemp2;   -- delete an older version of this table before we begin

CREATE TABLE advisorTemp2(
     employeeId       varchar(9),
     firstName        varchar(25) NOT NULL,
     lastName         varchar(25) NOT NULL,
     departmentID     varchar(4),
     departmentName   varchar(30) DEFAULT 'Unknown',
     CONSTRAINT  chk_deptName CHECK (departmentName <> '0000'),
     CONSTRAINT  AdvisorTemp2_PK PRIMARY KEY (employeeID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO advisorTemp2(
    employeeID,
    firstName,
    lastName,
    departmentID)
SELECT 	employeeID,firstName,lastName,departmentID FROM advisor;       
-- ABOVE:  This insert/select statement is NEW.  It populates a table named advisorTemp2
-- with the data from the advisor table.   You might do this if you want to do some testing on
-- on the data without harming the orginal data in advisor.

INSERT INTO advisorTemp2(
	employeeID,
	firstName,
	lastName,
	departmentID
	)
VALUES(
	'512345678',
	'Add',
	'Default',
	'501'
	);

ALTER TABLE advisorTemp2 ADD COLUMN phone VARCHAR(13);

ALTER TABLE advisorTemp2
    ALTER phone SET DEFAULT 'unkn';




-- 2 very different Insert Statements in terms of NULL.  Please notice the use of field names below

INSERT INTO advisorTemp2 VALUES
      ("001","Russ","Shaffer",NULL,NULL,NULL),
      ("002","Paul","Shaffer",501,NULL,NULL);
 
INSERT INTO advisorTemp2(employeeID,firstName,lastName) VALUES
      ("003","Jeff","Burns"),
      ("004","Guy","McClair"); 
     
     
     
-- The insert below will fail, but lecture will be about why the insert below fails!  See CHECK statement
INSERT INTO advisorTemp2(employeeID,firstName,lastName, departmentName) VALUES
      ("005","Will","NOT Work!","0000");





SELECT * FROM advisorTemp2;
DESC AdvisorTemp2;

ALTER TABLE advisorTemp2 ALTER phone DROP DEFAULT;

UPDATE advisorTemp2 SET phone="(000)000-0000";

ALTER TABLE advisorTemp2 DROP COLUMN departmentName;

-- AddAdvisorPK   Demo of how to drop a primary key.  Notice the key word Primary key.

DESCRIBE advisorTemp2;
ALTER TABLE advisorTemp2 DROP PRIMARY KEY;
DESCRIBE advisorTemp2;
ALTER TABLE advisorTemp2
   ADD CONSTRAINT advisor_PK PRIMARY KEY (employeeID);


-- Show the makeup of table advisorTemp2
DESC advisorTemp2;   

SELECT * from advisorTemp2;

UPDATE advisorTemp2
SET phone='(585)475-5361', firstName='Edward'
WHERE	lastName = 'Holden'
AND	firstName='Ed';

SELECT * FROM advisorTemp2;



-- How you create a FK
-- First attempt is wrong, Why?
ALTER TABLE advisorTemp2 ADD CONSTRAINT departmentID_FK   
   FOREIGN KEY (departmentID) REFERENCES departments(departmentID);  

-- UPDATE advisorTemp2 SET departmentID = 501 WHERE departmentID IS NULL;

-- SELECT * FROM departments;

-- INSERT INTO departments VALUES("501","NTID");

-- ALTER TABLE advisorTemp2 ADD CONSTRAINT departmentID_FK   
--   FOREIGN KEY (departmentID) REFERENCES departments(departmentID);  
   
-- ALTER TABLE advisorTemp2 DROP FOREIGN KEY departmentID_FK;
 
SHOW CREATE TABLE advisortemp2;