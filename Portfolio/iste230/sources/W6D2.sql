-- W6D2.sql  course_student database after normalization rules applied
DROP DATABASE IF EXISTS practice;
DROP DATABASE IF EXISTS course_student;

CREATE DATABASE course_student;
USE course_student;

DROP TABLE IF EXISTS course;
CREATE TABLE course(
CourseID		Int,
CourseName		varchar(25) NOT NULL,
Prof                    varchar(10),
Bldg                    char(2),
RmNo                    SmallInt,
CONSTRAINT Bldg CHECK (departmentName <> '00'),
PRIMARY KEY course_PK (courseID)
);

DROP TABLE IF EXISTS student;
USE practice;
Create TABLE student(
SSN  varchar(9) NOT NULL PRIMARY KEY,
StudName  varchar(25) NOT NULL,
DOB date NOT NULL
);

DROP TABLE IF EXISTS grade;
USE practice;
Create TABLE grade(
CourseID     int NOT NULL,
SSN  varchar(9) NOT NULL,
Grade char(1),
PRIMARY KEY (CourseID, SSN)
);

DROP TABLE IF EXISTS floor;
USE practice;
Create TABLE floor(
RmNO     SmallInt,
Floor    tinyint,
PRIMARY KEY (RmNO)
);

INSERT INTO `course_student`.`course` (`CourseID`, `CourseName`, `Prof`, `Bldg`, `RmNo`) VALUES ('10058', 'CSIS 2520', 'Harley', 'BB', '405');
INSERT INTO `course_student`.`course` (`CourseID`, `CourseName`, `Prof`, `Bldg`, `RmNo`) VALUES ('25600', 'ART 1101', 'Bartett', 'PL', '201');
INSERT INTO `course_student`.`course` (`CourseID`, `CourseName`, `Prof`, `Bldg`, `RmNo`) VALUES ('38569', 'MATH 4454', 'Harton', 'CL', '106');
INSERT INTO `course_student`.`course` (`CourseID`, `CourseName`, `Prof`, `Bldg`, `RmNo`) VALUES ('10654', 'CSSIS 3600', 'Snipes', 'JM', '217');
INSERT INTO `course_student`.`floor` (`RmNO`, `Floor`) VALUES ('405', '4');
INSERT INTO `course_student`.`floor` (`RmNO`, `Floor`) VALUES ('201', '2');
INSERT INTO `course_student`.`floor` (`RmNO`, `Floor`) VALUES ('106', '1');
INSERT INTO `course_student`.`floor` (`RmNO`, `Floor`) VALUES ('217', '2');

INSERT INTO `course_student`.`grade` (`CourseID`, `SSN`, `Grade`) VALUES ('10058', '254638589', 'C');
INSERT INTO `course_student`.`grade` (`CourseID`, `SSN`, `Grade`) VALUES ('10058', '752135423', 'B');
INSERT INTO `course_student`.`grade` (`CourseID`, `SSN`, `Grade`) VALUES ('25600', '232522654', 'A');
INSERT INTO `course_student`.`grade` (`CourseID`, `SSN`, `Grade`) VALUES ('38569', '458963232', 'D');
INSERT INTO `course_student`.`grade` (`CourseID`, `SSN`, `Grade`) VALUES ('10654', '232522654', 'A');

INSERT INTO `course_student`.`student` (`SSN`, `StudName`, `DOB`) VALUES ('254638589', 'Small Hall', '1959-05-19');
INSERT INTO `course_student`.`student` (`SSN`, `StudName`, `DOB`) VALUES ('752135423', 'Ted Ringly', '1972-11-07');
INSERT INTO `course_student`.`student` (`SSN`, `StudName`, `DOB`) VALUES ('458963232', 'John Smith', '1969-08-01');
INSERT INTO `course_student`.`student` (`SSN`, `StudName`, `DOB`) VALUES ('232522654', 'Jane King', '1981-01-05');

ALTER TABLE course ADD CONSTRAINT cource_floor_FK FOREIGN KEY(RmNO)
   REFERENCES floor(RmNo);
   
ALTER TABLE grade ADD CONSTRAINT grade_course_FK FOREIGN KEY(CourseID)
   REFERENCES course(courseID);   
   
ALTER TABLE grade ADD CONSTRAINT student_grade_FK FOREIGN KEY(SSN)
   REFERENCES student(SSN);

SELECT * FROM information_schema.table_constraints WHERE constraint_schema = 'course_student';

