DROP DATABASE IF EXISTS join_full_outer_example;
CREATE DATABASE join_full_outer_example;
USE join_full_outer_example;
create table apples (variety char(10) not null primary key, price int not null);
create table oranges (variety char(10) not null primary key, price int not null);
insert into apples(variety, price) values('Fuji',5),('Gala',6);
insert into oranges(variety, price) values('Valencia',4),('Navel',5);


SELECT * from apples as a
    left outer join oranges as o on a.price = o.price
UNION
SELECT * from apples as a
    right outer join oranges as o on a.price = o.price;