USE college;
ALTER TABLE advisor DROP COLUMN departmentName;
CREATE TABLE departments(
              departmentID             varchar(4) Primary key,
              departmentName           varchar(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SHOW TABLES;
INSERT INTO departments values("4002","Information Technology");
INSERT INTO departments values("4003","Computer Science");
INSERT INTO departments values("4010","Software Engineering");
INSERT INTO departments values("4050","NSSA");
ALTER TABLE advisor ADD CONSTRAINT departmentID_FK
        FOREIGN KEY (departmentID) REFERENCES departments(departmentID);
SELECT * FROM advisor JOIN departments USING (departmentID);

SELECT CONCAT(lastName,", ",firstName) AS "Advisor_Name", departmentName
         FROM advisor JOIN departments USING(departmentID);
