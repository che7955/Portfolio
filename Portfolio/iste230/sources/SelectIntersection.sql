--  SelectIntersection.sql ----------------
-- Had to put salesRep. in front of state or else state is ambigous
SELECT lastname, firstname, salesRep.state FROM salesRep INNER JOIN techSalesRep ON salesRep.empID = techSalesRep.empNum;

SELECT * FROM salesRep INNER JOIN techSalesRep ON salesRep.empID = techSalesRep.empNum;

SELECT * FROM salesRep INNER JOIN salesRep2 ON salesRep.empID = salesRep2.empID; -- not union Compatible

SELECT salesRep.firstName, salesrep.lastName, salesRep.city, salesRep.state 
	FROM salesRep INNER JOIN techSalesRep ON salesRep.empID = techSalesRep.empNum;

SELECT salesRep.firstName, salesrep.lastName, salesRep.city
	FROM techSalesRep INNER JOIN salesRep ON salesRep.empID = techSalesRep.empNum;

SELECT salesRep.firstName, salesrep.lastName, salesRep.city, salesRep.state
FROM salesRep
WHERE empID IN (
	SELECT techSalesRep.empNum
	FROM techSalesRep JOIN salesRep
	ON techSalesRep.empNum = salesRep.empID);
	
SELECT salesRep.firstName, salesrep.lastName, salesRep.city, salesRep.state
 FROM salesRep
    WHERE EXISTS (
	SELECT *
	FROM techSalesRep
	WHERE techSalesRep.empNum = salesRep.empID);

SELECT fname, lname, addr FROM techSalesRep
   WHERE empNum IN (
	SELECT empNum
	FROM salesRep
	WHERE techSalesRep.empNum = salesRep.empID);

-- Intersection is commutative
SELECT * FROM techSalesRep
    WHERE empNum IN 
    (SELECT empNum FROM salesRep where techSalesRep.empNum = salesRep.empID);
	
	
SELECT * FROM salesRep
    WHERE empID IN 
    (SELECT empNum FROM techSalesRep where techSalesRep.empNum = salesRep.empID);