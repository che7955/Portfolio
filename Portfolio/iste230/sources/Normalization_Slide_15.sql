# Week 3 &  4 - Database
-- https://www.tutorialspoint.com/mysql/mysql-data-types.htm

DROP DATABASE IF EXISTS Normalization_Slide_15;

Create DATABASE Normalization_Slide_15;
USE Normalization_Slide_15;

DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee(
    EmpID     SMALLINT    UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name      varchar(70) NOT NULL,
    DeptName  varchar(100), 
    Salary    Decimal(9,2) default 50000.00   COMMENT "Big enough to store millions of dollars."
    ) ENGINE  = InnoDB DEFAULT CHARSET=utf8 
      COMMENT = "Employee table from Normalization PowerPoint Slide 15";
    
DROP TABLE IF EXISTS Course;

CREATE TABLE Course(
    EmpID SMALLINT UNSIGNED ZEROFILL NOT NULL,
    CourseTitle varchar(100) NOT NULL,
    DateCompleted  date NOT NULL default '2021-08-06' COMMENT 'ISTE230 Final Exam part 1',
    Primary Key (EmpID, CourseTitle),
    CONSTRAINT Course_FK FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
    )  ENGINE  = InnoDB DEFAULT CHARSET=utf8 
       COMMENT = "Course table from Normalization PowerPoint Slide 15";

INSERT INTO Employee(Name,DeptName,Salary)
         values("Dr. David C. Munson Jr.","Administration", 2000100.00);
         
INSERT INTO Employee(Name,DeptName,Salary)
         values("James R. Habermas","Information Sciences & Technologies", 75000.99);         

INSERT INTO Employee(Name,DeptName,Salary)
         values("Dr. Zack Butler","Computer Science", 74000.00);

INSERT INTO Course(EmpID,CourseTitle)
         values("0002","ISTE 230 Introduction to Database and Data Modeling");         

INSERT INTO Course(EmpID,CourseTitle,DateCompleted)
         values("0002","ISTE 645 Foundations of Web Technologies I","2021-12-06");         

INSERT INTO Course(EmpID,CourseTitle,DateCompleted)
         values("0003","Computer Science II","2018-12-10"); 
         
SELECT * FROM Employee;
SELECT * FROM Course;

SELECT * FROM Employee JOIN Course
           USING(EmpID) 
              Order by Employee.EmpID, Course.CourseTitle \G
         
         

