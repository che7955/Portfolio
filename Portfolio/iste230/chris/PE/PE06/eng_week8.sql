-- Chris Eng 
-- PE06
-- verbose
DROP DATABASE IF EXISTS product;
CREATE DATABASE product;
USE product;

CREATE TABLE customer (
    CustID INT(10) NOT NULL AUTO_INCREMENT,
    CustName VARCHAR(20),
    CustContact VARCHAR(20),
    PRIMARY KEY (CustID)
);

CREATE TABLE product (
    ProdID INT(10) NOT NULL AUTO_INCREMENT,
    ProdDescription VARCHAR(200),
    UnitPrice INT(10),
    PRIMARY KEY (ProdID)
);

CREATE TABLE PO_Detail (
    PO INT NOT NULL,
    CustID INT,
    ProdID INT,
    UnitPrice INT(10),
    PRIMARY KEY (PO),
    FOREIGN KEY (CustID) REFERENCES customer(CustID),
    FOREIGN KEY (ProdID) REFERENCES product(ProdID)
);

CREATE TABLE PO (
    PO INT NOT NULL,
    OrderDate DATE,
    BillToAdress TINYTEXT,
    ShipToAdress TINYTEXT,
    PRIMARY KEY (PO),
    FOREIGN KEY (PO) REFERENCES PO_Detail(PO)
);

CREATE TABLE PO (
    PO INT NOT NULL,
    Date DATE,
    Ammount INT(10),
    PRIMARY KEY (PO),
    PRIMARY KEY (Date),
    FOREIGN KEY (PO) REFERENCES PO_Detail(PO)
);