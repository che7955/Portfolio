-- Class Example 
-- Please notice the CHARSET = utf8;

-- Jim Habermas
-- ISTE 230.01
-- Modified Fall 2020

-- Alter statement is new in this script to widen an attribute

DROP DATABASE IF EXISTS  myfirstdb; 

CREATE DATABASE myfirstdb;
USE myfirstdb;

CREATE TABLE supplier (
   supplierID     SMALLINT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
   supplierName   VARCHAR(40) NOT NULL,
   phone          VARCHAR(14) NOT NULL,
   email          VARCHAR(60) NULL COMMENT "Could be empty",
   PRIMARY KEY (SupplierID)      # Every Record Must have a UNIQUE SupplierID
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
   

   
INSERT INTO supplier (supplierName, phone, email) 
      VALUE ("ABCSupplier","(313)112-2334","abc@dicforum.com"); 

INSERT INTO supplier (supplierName, phone, email)
     VALUES ("Jim's Parts","(555)746-9331","Jim.Habermasuse@rit.edu");
     
INSERT INTO supplier (supplierName, phone)
     VALUES ("Pet Supplier","(585)343-0055");    



-- -------------------------------------------------------
-- Change the width of the email field    

ALTER TABLE supplier MODIFY column email VARCHAR(85);

-- Fall 2020 we are going to have longer email address 
-- -------------------------------------------------------

INSERT INTO supplier 
     values (10,"Paper Unlimited","(585)475-9999","Jim.Habermas@Paper_Unlimited.California.Malibu.office.com");

INSERT INTO supplier values (11,"Acme Corporation","(585)746-9999","sales@acme.com");

INSERT INTO supplier values (12,"Autozone","(313)453-4195",null);

SELECT * FROM supplier\G

SELECT * FROM supplier WHERE supplierName like "A%";