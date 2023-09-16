-- Chris Eng HW5
-- verbose

USE jobs;
-- Question 1
SELECT companyName, division, listing FROM interview
WHERE listing='y'
UNION ALL
SELECT companyName, division, listing FROM interview
WHERE listing='n'
ORDER BY listing;

-- Question 2
SELECT employer.companyName, employer.division, employer.stateCode FROM employer
INNER JOIN interview USING(companyName);

-- Question 3
SELECT stateCode, state.description FROM employer
LEFT JOIN state USING(stateCode);

-- Question 4
SELECT location, qtrcode FROM quarter;

-- Question 5
SELECT * FROM quarter WHERE qtrcode IN(20201 , 20204);

-- Question 6
SELECT companyName, state.stateCode, description
FROM state INNER JOIN employer
ON state.statecode = employer.statecode;

-- Question 7
SELECT description, companyName
FROM state LEFT JOIN employer
ON state.statecode = employer.statecode;