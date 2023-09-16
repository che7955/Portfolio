DROP DATABASE IF EXISTS  lawncare; 

CREATE DATABASE lawncare;
USE lawncare;

DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
  customerID    TINYINT UNSIGNED AUTO_INCREMENT,
  name          VARCHAR(50) NOT NULL,
  address       VARCHAR(75) DEFAULT NULL,
  size          SMALLINT DEFAULT NULL,
  day           VARCHAR(10) DEFAULT 'Friday',
  cost          DOUBLE DEFAULT 0.00,
  PRIMARY KEY (customerID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO customer(customerID,name,address,size,day)
           VALUES(1,"Barb Kraft","3246 Arlington",3200,"Friday");

INSERT INTO customer(name,address,size,day)
    VALUES ('Dawn Wilcox','32 North Rd.',2000,'Monday'),('Jim Habermas','31 Captiva',1200,'Friday'),('Nancy Little','162 Mapleshade Rd.',2323,'Monday'),('Norman Malnak','16 Manor Dr.',2500,'Saturday'),('Rita Miller','123 Main St.',2000,'Friday'),('Rocco Capeletti','2 Computer Dr.',1222,'Thursday'),('Steve Rohrman','13 E. Cedar St.',1453,'Wednesday');

UPDATE customer SET COST  = 0.025 * size;

SELECT name AS "Customer_Name", day AS "Day_to_Cut_Lawn"  FROM customer;

SELECT name,address,day, FORMAT(cost,2) AS "Cost" FROM customer
        ORDER BY day;