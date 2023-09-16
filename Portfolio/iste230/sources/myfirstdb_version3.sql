-- Jim Habermas
-- ISTE 230  
-- Modified Spring 2022
-- myfirstdb_version3.sql  
-- Contains TWO Tables/Entities 
DROP DATABASE IF EXISTS  myfirstdb; 

CREATE DATABASE myfirstdb;
USE myfirstdb;

DROP TABLE IF EXISTS  supplier;
CREATE TABLE supplier (
   SupplierID SMALLINT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
   SupplierName VARCHAR(40) NOT NULL,
   Phone VARCHAR(14) NOT NULL,
   Email VARCHAR(60) NULL,
   PRIMARY KEY (SupplierID)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
ALTER TABLE supplier AUTO_INCREMENT = 1; 
 
INSERT INTO supplier (SupplierName,Phone,Email) 
    VALUES("Acme Corporation",'(585)475-6369','sales@acme.com');
INSERT INTO supplier (SupplierName, Phone, Email) 
    VALUES("Hobby Lobby","(555)233-5555","sales@hobby.com");
INSERT INTO supplier (SupplierID,SupplierName, Phone, Email) 
    VALUES(10, "Dicks Sporting Goods","(585)555-1234","sales@sporting_goods.com");
  
DROP TABLE IF EXISTS  Products;
CREATE TABLE Products (
    ProductID SMALLINT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    SupplierID SMALLINT UNSIGNED ZEROFILL NOT NULL,
    ProductName VARchAR(40) NOT NULL,
    UnitPrice DECIMAL(10,2) NULL,  
    PRIMARY KEY (ProductID, SupplierID),
    CONSTRAINT Products_Supplier_FK Foreign Key (SupplierID) 
                                     REFERENCES Supplier(SupplierID)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
ALTER TABLE products AUTO_INCREMENT = 1;
 
INSERT INTO products(ProductID, SupplierID, ProductName, UnitPrice) 
        VALUES(1, 1,"Chocolates",10.52);  
INSERT INTO products (ProductID, SupplierID, ProductName, UnitPrice) 
        VALUES(2, 1, "IPhone ver 11.0",1000.50);
INSERT INTO products(ProductID, SupplierID, ProductName, UnitPrice) 
        VALUES(3, 1,"Toy rockets",975.50);
INSERT INTO products(ProductID, SupplierID, ProductName, UnitPrice)  
        VALUES(4, 1,"Basketball",22.99); 
        
SELECT * FROM products
          ORDER BY supplierID, ProductID;

INSERT INTO products(ProductID, SupplierID, ProductName, UnitPrice)  
        VALUES(1, 2, "Cricut Explore Air",250.00);
INSERT INTO products(ProductID, SupplierID, ProductName, UnitPrice)   
        VALUES(2, 2, "Chalk Paint",11.90);
INSERT INTO products(ProductID, SupplierID, ProductName, UnitPrice)  
        VALUES(3, 2,"Ink Pad",4.50);
        
SELECT * FROM products
          ORDER BY supplierID, ProductID;
          
INSERT INTO products(ProductID, SupplierID, ProductName, UnitPrice)
        VALUES (1, 10, "Baseball Glove",42.00);
INSERT INTO products(ProductID, SupplierID, ProductName, UnitPrice)
        VALUES (2, 10, "Baseball HAT",22.99);
INSERT INTO products(ProductID, SupplierID, ProductName, UnitPrice)
        VALUES (3, 10, "Baseball Bat",31.99);
        
SELECT * FROM products
          ORDER BY supplierID, ProductID;
               
SELECT supplierName,productID,productName,unitPrice FROM supplier
         JOIN products using (supplierID);
         
SELECT supplierID,suppliername,phone,email,productID,productName,UnitPrice
             FROM supplier JOIN products USING (supplierID);
             
SELECT supplierID,suppliername,phone,email,
       group_concat(productName, " " separator ' | ') AS "Products"
	 FROM supplier JOIN products USING (supplierID)
          group by supplierID
             ORDER by supplierID;