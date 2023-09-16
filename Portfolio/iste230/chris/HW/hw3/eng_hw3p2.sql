-- Chris Eng 
-- hw3p2
-- verbose
-- TASK #1
INSERT INTO contactInfo
(contactID,
firstName,
middleInitial,
lastName,
email,
url,
birthday,
notes)
VALUES
(2,
'Chris',
'E',
'Eng',
'che7955@rit.edu',
'http://www.rit.edu/me',
NULL,
'student 2022');
INSERT INTO contactInfo
(contactID,
firstName,
middleInitial,
lastName,
email,
url,
birthday,
notes)
VALUES
(3,
'Eli',
'T',
'Wallowby',
'etwallowby@concor.com ',
'www.concor.com/~wallowby',
'1956-03-26',
'All meetings must be
scheduled through his
assistant.');
INSERT INTO contactInfo
(contactID,
firstName,
middleInitial,
lastName,
email,
url,
birthday,
notes)
VALUES
(4,
'Eve',
'C',
'Sampson',
'esampson@concor.com ',
NULL,
'1972-05-11',
'Very helpful.');
INSERT INTO contactInfo
(contactID,
firstName,
middleInitial,
lastName,
email,
url,
birthday,
notes)
VALUES
(5,
'Carson',
'B',
'Campbell',
'cbc232@mvch.org',
NULL,
'1955-01-05',
'Wife: Lisa Kids:
Lucas, Lucy, and
Lucinda.');
-- TASK #2
ALTER TABLE contactInfo 
ADD nickname TINYTEXT;
-- TASK #3
ALTER TABLE contactInfo 
MODIFY firstName VARCHAR(15) NOT NULL;
ALTER TABLE contactInfo
MODIFY lastName VARCHAR(25) NOT NULL;
-- TASK #4
UPDATE contactInfo
SET nickname='Dave' WHERE contactID='1';
-- TASK #5
UPDATE contactInfo
SET url=NULL WHERE contactID='3';