   DROP DATABASE IF EXISTS Pets; 
   
   CREATE DATABASE Pets;
   Use Pets;
   
   CREATE TABLE PetStore( 
   StoreNum SMALLINT NOT NULL PRIMARY KEY,
   StoreName varchar(20) NOT NULL,
   StoreAddress varchar(30) NOT NULL,
   StoreHours varchar(30) NOT NULL);
   
   CREATE TABLE PetsForSale(
   StoreNum SMALLINT NOT NULL,
   PetName varchar(15) NOT NULL,
   PetType varchar(20) NOT NULL,
   Description varchar(40),
   PetAge varchar(15) NOT NULL,
   CONSTRAINT petsforsale_pk PRIMARY KEY (StoreNum, PetName),
	CONSTRAINT petstore_petsforsale_fk FOREIGN KEY (StoreNum) REFERENCES PetStore (StoreNum) ON DELETE CASCADE
);
	
INSERT INTO PetStore VALUES ('101', 'PetSmart','987 Hylan Dr, Henrietta NY', '8am-9pm');
INSERT INTO PetStore VALUES ('102', 'Petco', '20 War Memorial Rd, Batavia NY', '9am-8pm');
INSERT INTO PetStore VALUES ('103', 'Country Critters', '1400 Main St, Avon NY', '11am-8pm');
INSERT INTO PetStore VALUES ('104', 'Neptunes Garden', '53 South Side Ln, Batavia NY', '9am-8pm');
INSERT INTO PetStore VALUES ('105', 'Pet Haven', '122 Browncroft, Caledonia NY', '8am-9pm');
INSERT INTO PetStore VALUES ('106', 'Walmart', '299 Hylan Dr, Henrietta NY', '24 hours');
INSERT INTO PetStore VALUES ('107', 'Country Max', '5 York Rd, York NY', '10am-6pm');



INSERT INTO PetsForSale VALUES('101', 'Bailey', 'Dog', 'Chihuahua-Yorkie', '6 months');
INSERT INTO PetsForSale VALUES('101', 'Maizy', 'Dog', 'Black Labrador', '13 years');
INSERT INTO PetsForSale VALUES('102', 'Peanut', 'Bird', 'Cockatiel', '2 months');
INSERT INTO PetsForSale VALUES('103', 'Arthur', 'Turtle', 'Painted', '3 years');
INSERT INTO PetsForSale VALUES('103', 'Baby', 'Cat', 'Callico', '3 months');
INSERT INTO PetsForSale VALUES('103', 'Noodle', 'Hamster', 'Teddy Bear', '7 months');
INSERT INTO PetsForSale VALUES('104', 'Princess', 'Dog', 'Poodle', '1 year');
INSERT INTO PetsForSale VALUES('104', 'Henry', 'Fish', 'King Beta', '1 year');
INSERT INTO PetsForSale VALUES('105', 'Nemo', 'Fish', 'Clown', '2 years');
INSERT INTO PetsForSale VALUES('106', 'Wiggles', 'Ferret', 'Black Sable', '4 months');
INSERT INTO PetsForSale VALUES('106', 'ChiChi', 'Chinchilla', 'Albino', '10 months');
INSERT INTO PetsForSale VALUES('106', 'Squeaks', 'Mouse', 'Wood', '2 months');
INSERT INTO PetsForSale VALUES('107', 'Squeaks', 'Guinea Pig', 'Sheltie', '1.5 years');
INSERT INTO PetsForSale VALUES('107', 'Bailey', 'Dog', 'Golden Retriever', '1 year');

SELECT * FROM petstore;

SELECT * FROM petsForSale;

SELECT StoreNum, StoreName, PetName, PetType,description, PetAge
      FROM petstore join petsForSale using(StoreNum);








