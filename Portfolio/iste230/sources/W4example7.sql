-- W4example7.sql  database  from PPT about Third Normal Form

DROP DATABASE IF EXISTS practiceNormalization4;

CREATE DATABASE practiceNormalization4;
USE practiceNormalization4;

DROP TABLE IF EXISTS Distances;

CREATE TABLE Distances(
        Origin             varchar(20)     not null,
	Destination        varchar(20)     not null,
	distance           double unsigned not null,
	PRIMARY KEY (Origin,Destination)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;;

DROP TABLE IF EXISTS Shipto;

Create TABLE Shipto(
     shipNO             int not null,
     Origin             varchar(20) not null,
     Destination        varchar(20),
     PRIMARY KEY(shipNO,Origin,Destination),
     CONSTRAINT Distances_shipto_FK FOREIGN KEY (Origin, Destination)
                REFERENCES  Distances(Origin,Destination)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;;


INSERT INTO Distances VALUES ("Seattle","Denver"     ,1537);
INSERT INTO Distances VALUES ("Chicago","Dallas"     ,1058);
INSERT INTO Distances VALUES ("Boston","Atlanta"     ,1214);
INSERT INTO Distances VALUES ("Denver","Los Angeles" ,1150);

INSERT INTO Shipto VALUES (1,"Seattle","Denver");
INSERT INTO Shipto VALUES (2,"Chicago","Dallas");

SELECT shipNO, distance from shipto 
     JOIN Distances using (Origin, Destination);