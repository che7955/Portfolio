# myfirstdb with table suppliers
-- Jim Habermas
-- ISTE 230

-- This Script introduces the MySql key word UPDATE

SHOW DATABASES;

DROP DATABASE IF EXISTS  myfirstdb; 
CREATE DATABASE myfirstdb;

USE myfirstdb;

CREATE TABLE suppliers (
   SupplierID SMALLINT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
   SupplierName VARCHAR(40) NOT NULL,
   Phone VARCHAR(14) NOT NULL,
   Email VARCHAR(60) NULL,
   PRIMARY KEY (SupplierID));
   
 INSERT INTO suppliers (SupplierName, Phone, Email) 
 VALUE ("ABCSupplier","(123)456-7890","abc@dicforum.com"); 
 
 INSERT INTO suppliers  
 VALUE (2, "Delco Auto Parts","(716)555-1234","info@delco.com");
 
 INSERT INTO suppliers (SupplierID, SupplierName, Phone, Email) 
 VALUE (3,"Carquest Auto Parts","(585)888-1000",NULL);
 
 INSERT INTO suppliers (SupplierName, Phone, Email) 
 VALUE ("Nu-Way Auto Parts","(313)455-1890","info@nuwayparts.com"); 
 
 INSERT INTO suppliers VALUE (5,"A-Line Auto Parts","(616)453-4195","sales@a-line.com"); 
 
 INSERT INTO suppliers VALUE (6,"McGuire Auto Center","(585)111-1111","staff@mcguire.com");
 
 UPDATE suppliers SET Email = "sales@A-LineAutoParts.com" WHERE SupplierName LIKE "A-Line%";
 
 UPDATE suppliers SET Email = "info@DelcoAutoParts" WHERE SupplierID = 2;
 
 ALTER TABLE suppliers
  CHANGE COLUMN Email Email VARCHAR(100);
  
 SELECT * FROM suppliers;
 
 DESCRIBE suppliers;
 


