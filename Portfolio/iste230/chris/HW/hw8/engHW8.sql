-- Eng, Chris 
-- HW# 08 
-- 12/1/2022 
-- ISTE230
-- Professor: Habermas, James 

-- verbose
SHOW TABLES;
-- Question 1
SELECT (City, ", ", StateCode) AS location, PublisherID,COUNT(*)
FROM publisher      
GROUP BY location;

-- Question 2
SELECT Title, (COUNT(Rating)) as [total ratings], (MIN(Rating)) AS low, (MAX(rating)) AS high, (AVG(rating)) AS Average
FROM bookreview
ORDER BY total_ratings DESC;

-- Question 3
SELECT MIN(p.name) AS `Publisher Name`, COUNT(b.isbn) AS `Book Count`
  FROM publisher AS p INNER JOIN 
       book      AS b ON p.PublisherID = b.PublisherID
GROUP BY p.publisherID
HAVING COUNT(b.isbn) > 2;

-- Question 4
SELECT Title, (COUNT*(title)) AS length
-- I cant figure out how to display the title of the book, the length of the title, and the part of the title that follows bill.
FROM book 
WHERE (Title LIKE '% bill %' or title like '%bill' or title like 'bill%');

-- Question 5
SELECT title from
(SELECT b.title as title , b.isbn as isbn , i.orderno as orderno
FROM books b
LEFT OUTER JOIN orderitems oi
ON b.isbn = i.isbn) temp
WHERE orderno IS NULL;


