CREATE TABLE automobile(vin Int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY, make CHAR(15), model char(15), year char(4), color char(15), style char(15), MSRP DECIMAL(7,2));
INSERT INTO automobile( vin, make, model, year, color, style, MSRP) VALUES(001, Chevy, Volt, 2017, White, Hybrid, 39290.99);
INSERT INTO automobile( make, model, year, color, style, MSRP) VALUES( Ford_Mustang, 2019, Blue, Convertible),
(Toyota_Prius, 2018, Silver, Hybrid, 25000.99), (Toyota_Camry, 2008, Blue, Sedan, 2000.50), (Dodge, 1500, 2007, Green, Pickup, 1799.99);
SELECT * FROM automobile;
SELECT make FROM automobile;
