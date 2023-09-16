-- Difference
SELECT * FROM salesRep
WHERE empID NOT IN (
	SELECT techSalesRep.empNum
	FROM techSalesRep JOIN salesRep
	ON techSalesRep.empNum = salesRep.empID);
	
-- not UNION compatible
SELECT * FROM salesRep
WHERE salesRep.empID NOT IN (
	SELECT salesRep2.empID
	FROM salesRep2 JOIN salesRep
	ON salesRep2.empID = salesRep.empID);

SELECT * FROM salesRep
WHERE NOT EXISTS (
	SELECT *
	FROM techSalesRep
	WHERE techSalesRep.empNum = salesRep.empID);
	
-- Difference is NOT commutative	
SELECT * FROM techSalesRep
WHERE NOT EXISTS (
	SELECT *
	FROM salesRep
	WHERE techSalesRep.empNum = salesRep.empID);

SELECT lastname, firstName, address from salesRep
WHERE NOT EXISTS (
	SELECT *
	FROM techSalesRep
	WHERE techSalesRep.empNum = salesRep.empID);
