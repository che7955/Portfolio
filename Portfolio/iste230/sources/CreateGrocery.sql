DROP DATABASE IF EXISTS grocery;
CREATE DATABASE grocery;
USE grocery;

DROP TABLE IF EXISTS location;

CREATE TABLE location (
  Product varchar(25) NOT NULL,
  Aisle smallint(6) DEFAULT NULL,
  PRIMARY KEY (Product)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO location VALUES ('Canned Tomatoes',3),('Ketchup',5);

DROP TABLE IF EXISTS item;

CREATE TABLE item (
  Brand varchar(25) NOT NULL DEFAULT '',
  Product varchar(25) NOT NULL DEFAULT '',
  Size varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (Brand,Product,Size),
  CONSTRAINT product_FK FOREIGN KEY (Product) REFERENCES location(Product)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO item VALUES ('Contadina','Canned tomatoes','#3 can'),('Hunt\'s','Canned Tomatoes','#2 can'),('Hunt\'s','Canned tomatoes','#3 can'),('Hunt\'s','Ketchup','12 oz.');
