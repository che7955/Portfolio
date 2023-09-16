-- SELF JOIN     

DROP DATABASE IF EXITS sjemployees;
CREATE DATABASE sjemployees;

USE sjemployees;

CREATE TABLE employee(empID varchar(9) primary key, name varchar(30), 
	                  title varchar(40), supervisorID varchar(9));

INSERT INTO employee VALUES ('222','Jim Habermas','lecturer',333),
                            ('333','Jai Kang','Database supervisor',444),
                            ('335','Jim Leone','Professor',444),
                            ('444','Steve Zilora','Department Chair',999),
                            ('999','Dr. Anne R. Haake','Dean of Golisano College',NULL),
                            ('123','John Smith','programmer','125'),
		            ('124','Joe Blow','programmer','125'),
		            ('125','Sue Supervisor','manager',null);

SELECT e.name as Employee, e.title, s.name as Supervisor, s.title as 'Supervisor Title'
		FROM employee e JOIN employee s
		ON e.supervisorID = s.empID;

SELECT e.name as Employee, e.title, s.name as Supervisor, s.title as 'Supervisor Title'
		FROM employee e LEFT JOIN employee s
		ON e.supervisorID = s.empID;
