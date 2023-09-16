DROP DATABASE IF EXISTS myfirstdb;

CREATE DATABASE myfirstdb;
USE myfirstdb;

CREATE TABLE suppliers (
   SupplierID SMALLINT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
   SupplierName VARCHAR(40) NOT NULL,
   Phone VARCHAR(14) NOT NULL,
   Email VARCHAR(60) NULL,
   ProductID SMALLINT,
   ProductName varchar(40) NOT NULL, 
   UnitPrice Decimal(10,2) NOT NULL,
   PRIMARY KEY (SupplierID, ProductID)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
ALTER TABLE suppliers AUTO_INCREMENT = 1;  
 
INSERT INTO suppliers(SupplierID,SupplierName,Phone,Email, ProductID, ProductName,UnitPrice)
       VALUES (1,'Acme Corporation','(585)475-6369','sales@acme.com',"1","Chocolates","10.50");

INSERT INTO suppliers(SupplierID,SupplierName,Phone,Email, ProductID, ProductName,UnitPrice)
       VALUES (1,'Acme Corporation','(585)475-6369','sales@acme.com',"2","Iphone","1000.50");
       
INSERT INTO suppliers(SupplierID,SupplierName,Phone,Email, ProductID, ProductName,UnitPrice)
       VALUES (1,'Acme Corporation','(585)475-6369','sales@acme.com',"3","Toy rockets","975.50");   
    
 INSERT INTO suppliers(SupplierID,SupplierName,Phone,Email, ProductID, ProductName,UnitPrice)
       VALUES (1,'Acme Corporation','(585)475-6369','sales@acme.com',"4","Basketball",22.99); 
 
 
 
INSERT INTO suppliers (SupplierID,SupplierName, Phone, Email,ProductID, ProductName,UnitPrice) 
    VALUES (2,"Hobby Lobby","(555)233-5555","sales@hobby_lobby.com", 1,"Cricut Explore Air",250.00);
    
INSERT INTO suppliers (SupplierID,SupplierName, Phone, Email,ProductID, ProductName,UnitPrice) 
    VALUES (2,"Hobby Lobby","(555)233-5555","sales@hobby_lobby.com", 2,"Chalk Paint",9.95);

INSERT INTO suppliers (SupplierID,SupplierName, Phone, Email,ProductID, ProductName,UnitPrice) 
    VALUES (2,"Hobby Lobby","(555)233-5555","sales@hobby_lobby.com", 3,"Ink Pad",4.50);


INSERT INTO suppliers 
    VALUES (10,"Dicks Sporting Goods","(585)555-1234","sales@sporting_goods.com", 1, "Baseball Glove",42.00);
INSERT INTO suppliers 
    VALUES (10,"Dicks Sporting Goods","(585)555-1234","sales@sporting_goods.com", 2, "Baseball HAT",22.99);
INSERT INTO suppliers 
    VALUES (10,"Dicks Sporting Goods","(585)555-1234","sales@sporting_goods.com", 3, "Baseball Bat",31.99);
    