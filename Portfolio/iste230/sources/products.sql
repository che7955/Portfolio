-- W14D2.sql creates a data base named WallysWidgets
-- Practice with count, min, max

DROP DATABASE IF EXISTS WallysWidgets;
CREATE DATABASE WallysWidgets;
USE WallysWidgets;
DROP TABLE IF EXISTS products;
CREATE TABLE products(
ProductID		Int,
ProductName		varchar(25) NOT NULL,
list_price              double,
date_added              date,
PRIMARY KEY AdvisorTemp_PK (productID)
);

DESCRIBE products;

INSERT INTO products  values 
 (101, "Widgets", 11.99, '2010-05-19'); 
INSERT INTO `wallyswidgets`.`products` (`ProductID`, `ProductName`, `list_price`, `date_added`) VALUES ('102', 'Gizmos', '8.00', '2011-08-08');
INSERT INTO `wallyswidgets`.`products` (`ProductID`, `ProductName`, `list_price`, `date_added`) VALUES ('103', 'Shirts', '15.99', '2016-01-01');
INSERT INTO `wallyswidgets`.`products` (`ProductID`, `ProductName`, `list_price`, `date_added`) VALUES ('104', 'Pants', '22.50', '2016-01-01');
INSERT INTO `wallyswidgets`.`products` (`ProductID`, `ProductName`, `list_price`, `date_added`) VALUES ('105', 'Wagons', '32.00', '2006-03-04');
INSERT INTO `wallyswidgets`.`products` (`ProductID`, `ProductName`, `list_price`, `date_added`) VALUES ('106', 'Pots', '12.66', '2009-04-28');
INSERT INTO `wallyswidgets`.`products` (`ProductID`, `ProductName`, `list_price`, `date_added`) VALUES ('107', 'Candles', '2.99', '2015-10-07');
INSERT INTO `wallyswidgets`.`products` (`ProductID`, `ProductName`, `list_price`, `date_added`) VALUES ('108', 'Toy Cars', '9.99', '2015-04-30');
INSERT INTO `wallyswidgets`.`products` (`ProductID`, `ProductName`, `list_price`, `date_added`) VALUES ('109', 'Cat Litter', '10.99', '2012-09-01');
INSERT INTO `wallyswidgets`.`products` (`ProductID`, `ProductName`, `list_price`, `date_added`) VALUES ('110', 'Litter Box', '6.00', '2012-09-01');

