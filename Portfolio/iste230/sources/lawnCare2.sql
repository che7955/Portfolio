-- Toro         Toro 21 inch 60-Volt Lithium-Ion Brushless Cordless Battery Walk Behind Mower                          $529.00
-- JD           John Deere 17.5-HP 42-inch Riding Lawn Mower                                                         $2,299.00
-- Kubota       Kubota's BX Series sub-compact tractor. The BX is available in a 4WD 24.8-HP 64-inch Riding Tractor $10,791.99 
--                                                                                                                DECIMAL(7,2)

# Pictures of Mowers
#      Toro   https://www.homedepot.com/p/Toro-21-in-Recycler-SmartStow-60-Volt-Lithium-Ion-Brushless-Cordless-Battery-Walk-Behind-Mower-RWD-5-0-Ah-w-Battery-Charger-21357/317276851#overlay
#      JD     https://www.lowes.com/pd/John-Deere-S100-17-5-HP-Side-By-Side-Hydrostatic-42-in-Riding-Lawn-Mower-with-Mulching-Capability-Kit-Sold-Separately/5001418905?cm_mmc=shp-_-c-_-prd-_-sol-_-ggl-_-LIA_SOL_146_Riders-Powersports-Chore-_-5001418905-_-local-_-0-_-0&gclid=CjwKCAjwp7eUBhBeEiwAZbHwkV-jHD7gpk0USg3QYfa3VoRZaKfCeDSD8PiUQrOGKZqhfL4cz_PHtxoCSCgQAvD_BwE&gclsrc=aw.ds
#      Kubota https://www.kubotausa.com/products/tractors/sub-compact/bx-series


DROP DATABASE IF EXISTS  lawncare; 

-- two websites that Professor Habermas uses
--   www.textpad.com
--      doPDF


CREATE DATABASE lawncare;
USE lawncare;

CREATE TABLE equipment(
   equipmentID            CHAR(6) NOT NULL PRIMARY KEY,
   equipmentDescription   VARCHAR(300) NOT NULL,
   equipmentPrice         DECIMAL(10,2) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
   

DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
  customerID    TINYINT UNSIGNED AUTO_INCREMENT,
  name          VARCHAR(50) NOT NULL,
  address       VARCHAR(75) DEFAULT NULL,
  size          SMALLINT DEFAULT NULL,
  day           VARCHAR(10) DEFAULT 'Friday',
  cost          DOUBLE DEFAULT 0.00,
  equipmentID   CHAR(6) NOT NULL  COMMENT 'Equipment required to cut the grass.',
  CONSTRAINT Customer_Equipment_FK Foreign Key (equipmentID) 
                                     REFERENCES equipment(equipmentID),
  PRIMARY KEY (customerID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO equipment VALUES
  ("Toro","Toro 21 inch 60-Volt Lithium-Ion Brushless Cordless Battery Walk Behind Mower",529.00),
  ("JD","John Deere 17.5-HP 42-inch Riding Lawn Mower",2299.00),
  ("Kubota","Kubota's BX Series sub-compact tractor. The BX is available in a 4WD 24.8-HP 64-inch Riding Tractor",10791.99);





INSERT INTO customer(customerID,name,address,size,day,equipmentID)
           VALUES(1,"Barb Kraft","3246 Arlington",3900,"Friday","Kubota");

INSERT INTO customer(name,address,size,day,equipmentID)
    VALUES ('Dawn Wilcox','32 North Rd.',2000,'Monday','JD'),
           ('Jim Habermas','31 Captiva',1200,'Friday','Toro'),
           ('Nancy Little','162 Mapleshade Rd.',2323,'Monday','JD'),
           ('Norman Malnak','16 Manor Dr.',3100,'Saturday','Kubota'),
           ('Rita Miller','123 Main St.',1090,'Friday','Toro'),
           ('Rocco Capeletti','2 Computer Dr.',1220,'Thursday','Toro'),
           ('Steve Rohrman','13 E. Cedar St.',900,'Wednesday','Toro');

UPDATE customer SET COST  = 0.025 * size WHERE customerID >=1;

SELECT name AS "Customer_Name", day AS "Day_to_Cut_Lawn", equipmentID AS "Lawn mower to use" FROM customer;

SELECT name,address,day, FORMAT(cost,2) AS "Cost" FROM customer
        ORDER BY day;
        
SELECT day,name,address,LEFT(equipment.equipmentDescription,45) AS "Equipment_Needed" FROM customer JOIN equipment
                USING(equipmentID)
                   ORDER BY day;