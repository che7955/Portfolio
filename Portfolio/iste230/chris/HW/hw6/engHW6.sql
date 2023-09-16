-- Eng, Chris 
-- HW# 06 
-- 1/2/2022 
-- ISTE230
-- Professor: Habermas, James 

-- verbose
-- Question 1
SELECT title, category as catDescription FROM book
    ORDER BY category DESC, title ASC;

-- Question 2
SELECT name, title, rating FROM book JOIN bookreview USING (ISBN)
        JOIN reviewer USING (ReviewerID)
            WHERE EmployedBy IS NULL;

-- Question 3
SELECT title, LastName, FirstName, from book JOIN bookauthor USING (ISBN)
        JOIN author USING(authorID)
            ORDER BY title, LastName;

-- Question 4


-- Question 5


-- Question 6
SELECT ISBN, title FROM book
    WHERE EXISTS
    (
        SELECT * FROM category
        WHERE book.category = category.catID AND CatDescription LIKE "S%"
    );

