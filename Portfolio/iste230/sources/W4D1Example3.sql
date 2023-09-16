-- Normalization, W4D1Example3.sql  database  from PPT about Second Normal Form

DROP DATABASE IF EXISTS practiceNormalization3;

CREATE DATABASE practiceNormalization3;
USE practiceNormalization3;

DROP TABLE IF EXISTS moviesExample3;
CREATE TABLE moviesExample3(
        title              varchar(25),
	year               char(4),
	length             tinyint unsigned,
	type               varchar(4),
	studio             varchar(16),
	star               varchar(25),
	PRIMARY KEY (title, star)
	
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS moviesExample3;

DROP TABLE IF EXISTS Movies;
CREATE TABLE Movies(
        title              varchar(25),
	year               char(4),
	length             tinyint unsigned,
	type               varchar(5),
	studio             varchar(16),
	PRIMARY KEY (title)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS MovieStar;

Create TABLE MovieStar(
     title              varchar(25),
     star               varchar(25),
     CONSTRAINT title_star_PK PRIMARY KEY(title, star),
     CONSTRAINT MovieStar_Movies_FK FOREIGN KEY (title)
                REFERENCES  Movies(title)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Movies VALUES ("Star Wars","1977",124,"Color","Fox");
INSERT INTO Movies VALUES ("Alien","1979",117,"Color","Paramount");
INSERT INTO Movies VALUES ("Aliens","1986",137,"Color","Paramount");
INSERT INTO Movies VALUES ("Alien3","1992",113,"Color","Paramount");
INSERT INTO Movies VALUES ("Annie Hall","1977",93,"Color","Warner Bros");
INSERT INTO Movies VALUES ("Chaplin","1992",124,"B&W","MGM");
INSERT INTO Movies VALUES ("Dr. Strangelove","1964",93,"B&W","R Torn");

INSERT INTO MovieStar VALUES ("Star Wars", "C.Fisher");
INSERT INTO MovieStar VALUES ("Star Wars", "M.Hamil");
INSERT INTO MovieStar VALUES ("Star Wars", "H.Ford");
INSERT INTO MovieStar VALUES ("Alien", "S.Weaver");
INSERT INTO MovieStar VALUES ("Aliens", "S.Weaver");
INSERT INTO MovieStar VALUES ("Alien3", "S.Weaver");
INSERT INTO MovieStar VALUES ("Annie Hall", "W.Allen");
INSERT INTO MovieStar VALUES ("Annie Hall", "D.Keaton");
INSERT INTO MovieStar VALUES ("Chaplin", "R.Downey");
INSERT INTO MovieStar VALUES ("Dr. Strangelove", "R Torn");

SELECT Movies.Title, year, length, Star FROM Movies 
             Join MovieStar using(title);