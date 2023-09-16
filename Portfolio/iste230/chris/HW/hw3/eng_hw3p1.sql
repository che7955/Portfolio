-- Chris Eng
-- hw3p1
-- verbose
-- Question #1
SELECT headOfState FROM country WHERE name='United States';
-- Question #2
UPDATE country SET headOfState = "Joe R. Biden" WHERE name='United States';
SELECT headOfState FROM country WHERE name='United States';
-- Question 3
SELECT localName FROM country WHERE indepYear IS NULL;
-- Question 4
SELECT name, continent FROM country WHERE population>= '1000000000' AND lifeExpectancy >'70' AND  lifeExpectancy < '80' ;
-- Question 5
SELECT name FROM country WHERE continent='South America' OR continent= 'North America';