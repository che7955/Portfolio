DROP DATABASE IF EXISTS practiceNormalization_PE;

CREATE DATABASE practiceNormalization_PE;
USE practiceNormalization_PE;


DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee(
        empID              tinyint unsigned  Primary Key,
	name               varchar(20),
	dept_name          varchar(15),
	salary             decimal(9,2)
);

DROP TABLE IF EXISTS teachers_load_courses;

Create TABLE teachers_load_courses(
     empID              tinyint unsigned,
     course_title       varchar(40),
     date_completed     varchar(10),
     CONSTRAINT teachers_courses_PK PRIMARY KEY(empID, course_title),
     CONSTRAINT courses_employee_FK FOREIGN KEY (empID)
                REFERENCES  employee(empID)
);

INSERT INTO employee VALUES ("100","Simpson, Margaret","Marketing",48000.0);
INSERT INTO employee VALUES ("140","Beeton, Alan","Accounting",52000.0);
INSERT INTO employee VALUES ("110","Lucero, Chris","Info Systems",43000.0);
INSERT INTO employee VALUES ("150","Martin, Susan","Marketing",66000.0);
INSERT INTO employee VALUES ("255","Habermas, Jim","Info Systems",99999.9);



INSERT INTO teachers_load_courses VALUES (100,"SPS","08/19/2019");
INSERT INTO teachers_load_courses VALUES (100,"Surveys","10/07/2018");
INSERT INTO teachers_load_courses VALUES (140,"Tax Acc","12/08/2018");
INSERT INTO teachers_load_courses VALUES (255,"Intro Databse","12/09/2019");
INSERT INTO teachers_load_courses VALUES (255,"ISTE330","12/09/2019");
INSERT INTO teachers_load_courses VALUES (255,"WEB ISTE240","12/09/2019");
INSERT INTO teachers_load_courses VALUES (255,"Grad Class ISTE645","12/09/2019");

SELECT employee.name, employee.salary, 
        teachers_load_courses.course_title
          FROM employee JOIN teachers_load_courses using(empID);
          

SELECT    employee.name as "Employee_Name",
          employee.salary, 
   group_concat(course_title, " " separator' | ') as "Teaching_Load" 
   FROM employee JOIN teachers_load_courses using(empID)
   group by employee.name;
          