mysql> CREATE DATABASE HW2;
Query OK, 1 row affected (0.00 sec)

mysql> USE HW2;
Database changed
mysql> CREATE TABLE ITEM(itemID INT(10) PRIMARY KEY, name VARCHAR(25)NOT NULL, street VARCHAR(25)NOT NULL, city VARCHAR(25)NOT NULL, state Char, zipcode INT(6), cost DECIMAL(10,2), retailprice DECIMAL(10,2), notes MEDIUMTEXT,shelfQty SMALLINT, perishabe BOOL, description MEDIUMTEXT);