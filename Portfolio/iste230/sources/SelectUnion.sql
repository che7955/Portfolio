-- UNION's 

SELECT * FROM salesRep;

SELECT * FROM techSalesRep;

SELECT * FROM salesrep
UNION
SELECT * FROM techSalesRep;

SELECT * FROM techSalesRep
UNION
SELECT * FROM salesrep;



SELECT firstName, LastName, City, State FROM salesrep
UNION
SELECT fname, lname, city, state FROM techSalesRep;

SELECT fname, lname, city, state FROM techSalesrep
UNION
SELECT firstName, LastName, City, State FROM salesRep;

//Union NOT COMPATIABLE
SELECT * FROM salesrep
UNION
SELECT * FROM salesrep2;