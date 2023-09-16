-- Just a sample, you are not responsible to memorize code below.

-- Beginners Guide To Creating Simple MySQL Tables
-- For an explanation about the code below please view the following link

-- Adapted from 
# https://www.dreamincode.net/forums/topic/42301-beginners-guide-to-creating-simple-mysql-tables/

DROP DATABASE IF EXISTS  myfirstdb; 

CREATE DATABASE myfirstdb;
USE myfirstdb;

CREATE TABLE supplier (
   supplierID SMALLINT UNSIGNED AUTO_INCREMENT,
   supplierName VARCHAR(40) NOT NULL,
   phone VARCHAR(14) NOT NULL,
   email VARCHAR(60) NULL,
   CONSTRAINT supplier_supplierID_pk PRIMARY KEY (SupplierID)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
INSERT INTO supplier(supplierName, phone, email) 
     VALUES("ABC_Supplier","(313)112-2334","staff@ABC_Suplier.com"); 
