-- W6D3.sql - Second problem of student's nomalization
DROP DATABASE IF EXISTS cleaningCompany;

CREATE DATABASE cleaningCompany;
USE cleaningCompany;

DROP TABLE IF EXISTS service;

CREATE TABLE service(
ServiceLevel		varchar(9),
AmountDue		decimal(9,2) NOT NULL,
CONSTRAINT cleaningCompany_PK PRIMARY KEY(ServiceLevel)
);

DROP TABLE IF EXISTS employee;

Create TABLE employee(
EmployeeNumber  tinyint NOT NULL PRIMARY KEY,
EmployeeName    varchar(25) NOT NULL
);

DROP TABLE IF EXISTS client;

Create TABLE client(
ClientName     varchar(12) NOT NULL,
ClientAddress  varchar(30) NOT NULL,
CONSTRAINT client_PK PRIMARY KEY(ClientName)
);

DROP TABLE IF EXISTS work;

Create TABLE work(
ClientName      varchar(12) NOT NULL,
ServiceDate     varchar(8),
EmployeeNumber  tinyint NOT NULL,
ServiceLevel	varchar(9),
CONSTRAINT work_client_FK FOREIGN KEY (ClientName) 
       REFERENCES client(clientName),
CONSTRAINT work_employee_FK FOREIGN KEY (EmployeeNumber) 
      REFERENCES employee(EmployeeNumber),
constraint work_service_FK FOREIGN KEY (ServiceLevel) 
      REFERENCES service(ServiceLevel),
CONSTRAINT work_composite_PK PRIMARY KEY(ClientName,ServiceDate)
);

INSERT INTO employee VALUES(103,"Joey Marx");
INSERT INTO employee VALUES(89,"Mary Whittley");

INSERT INTO service VALUES("Deluxe",255.99);
INSERT INTO service VALUES("Basic",99.99);
INSERT INTO service VALUES("Standard",149.99);

INSERT INTO client VALUES("Express Data","1025 Cobb Place");
INSERT INTO client VALUES("Harry's Co.","432 Dallas St.");
INSERT INTO client VALUES("L's Sandwich","9876 Market Lane");

INSERT INTO work VALUES("Express Data","10/05/09",103,"Deluxe");
INSERT INTO work VALUES("Harry's Co.", "08/09/09",89, "Basic");
INSERT INTO work VALUES("L's Sandwich","09/15/09",103,"Basic");
INSERT INTO work VALUES("Harry's Co.", "11/15/09",89, "Standard");

SELECT * FROM work JOIN service USING(servicelevel);

SELECT * FROM work JOIN employee ON work.employeeNumber = employee.employeeNumber;

SELECT * FROM work JOIN service USING(servicelevel) JOIN employee using(employeeNumber);

SELECT  ClientName, EmployeeNumber, EmployeeName,
        ServiceDate,ServiceLevel,AmountDue
             FROM work JOIN employee using(EmployeeNumber)
                       JOIN service USING(servicelevel);

SELECT  ClientName, EmployeeNumber, EmployeeName,
        ServiceDate,ServiceLevel,AmountDue
             FROM work JOIN service USING(servicelevel) 
               JOIN employee using(EmployeeNumber);           