-- to be used with the book_shop DB and books table 

-- Not equal !=
SELECT title, released_year FROM books WHERE released_year != 2017;
SELECT title, released_year, author_lname FROM books WHERE author_lname != 'Harris';

-- NOT LIKE, LIKE
SELECT title FROM books NOT LIKE 'W%';
SELECT title FROM books LIKE 'W%';

-- Greater than
SELECT * FROM books WHERE released_year > 2000;
SELECT title, released_year FROM books WHERE released_year > 2000 ORDER BY released_year;

-- Greater than or equal to 
-- >=
SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100 ORDER BY stock_quantity;
-- Boolean logic 
SELECT 99 > 1; -- true 
SELECT 99 > 567; -- false 

-- exercise to determine if these logical problems are true or false 
100 > 5
-- My Answer: True 
-- Correct Answer: True 
-15 > 15
-- My Answer: False 
-- Correct Answer: False 
9 > -10
-- My Answer: True 
-- Correct Answer: True  
1 > 1
-- My Answer: False  
-- Correct Answer: False 
'a' > 'b'
-- My Answer: True 
-- Correct Answer: False 
'A' > 'a'
-- My Answer: True 
-- Correct Answer: False 

-- Less than
SELECT * FROM books WHERE released_year < 2000;
SELECT title, released_year FROM books WHERE released_year < 2000 ORDER BY released_year;

-- Logical AND 
-- or you will see it as &&
-- Select all books from author eggers that were released after 2010
SELECT *  FROM books WHERE author_lname='Eggers' AND released_year > 2010;
-- same result, different and 
SELECT *  FROM books WHERE author_lname='Eggers' && released_year > 2010;
SELECT *  FROM books WHERE author_lname='Eggers' && released_year > 2010 && title LIKE '%novel%';
-- exercises with AND
-10 > -20 && 0<=0
-- My Answer: True 
-- Correct Answer: True 
-40 <= -0 AND 10 > 40
-- My Answer: False 
-- Correct Answer: False 
54 <= 54 && 'a' = 'A'
-- My Answer: False 
-- Correct Answer: True 

-- Logical OR, the brother and sister of AND / && 
-- you can also use || to say OR 
SELECT *  FROM books WHERE author_lname='Eggers' || released_year > 2010;
-- Only one side must be true for OR to work 
SELECT title, author_lname, released_year, stock_quantity FROM books WHERE author_lname = 'Eggers' || released_year > 2010 OR stock_quantity > 100;

-- BETWEEN 
-- Allows you to select between the upper and lower values, or two values 
-- This is equal to using <,>, and AND/&&. 
SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2015;
-- The AND used with BETWEEN, is different from AND/&& by itself. This AND has to be used with BETWEEN
SELECT title, released_year FROM books WHERE released_year NOT BETWEEN 2004 AND 2015;

-- CAST()
-- CAST() can change data types into other data types
SELECT CAST('2017-05-02' AS DATETIME);

show databases;
use new_testing_db;
SELECT name, birthdt FROM people WHERE birthdt BETWEEN '1980-01-01' AND '2000-01-01';
SELECT name, birthdt FROM people WHERE birthdt BETWEEN CAST('1980-01-01' AS DATETIME) AND CAST('2000-01-01' AS DATETIME);


-- IN 
-- allows you to provide values and then check if a value is in the set of values 
SELECT title, author_lname FROM books WHERE author_lname IN('Carver', 'Lahiri', 'Smith');
SELECT title, author_lname, released_year FROM books WHERE released_year IN('2017', '2000', '2007', '2010');
-- NOT IN
SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year NOT IN ('2001','2003','2005','2007','2009','2011','2013','2015','2017');
-- This can be written more intuitvely with a MODULO, which is expressed as '%' and it is the remainder operator 
SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year % 3 != 0; -- remainder of 1 for most even numbers in our data 
SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year % 2 != 0; -- remainder of 0 for even numbers

-- CASE STATEMENTS 
-- These allow you to make decisions because they allow you to make conditional statemeents 
SELECT title, released_year, 
    CASE
        WHEN released_year >= 2000 THEN 'Modern Lit'
        ELSE '20th Century Lit'
    END AS GENRE
FROM books;

SELECT title, stock_quantity, 
    CASE
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;

-- or you can do
SELECT title, stock_quantity, 
    CASE
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;


-- Logical operators exercises final 

-- Evaluate the following 
-- SELECT 10 != 10;
-- SELECT 15 > 14 && 99 - 5 <= 94;
-- SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;
-- Solution: 
-- False 
-- True 
-- True 

-- Select all book written before 1980 
-- Solution: 
SELECT title, released_year FROM books WHERE released_year < 1980;

-- Select all books written by egger or chabon 
-- Solution: 
SELECT title, author_lname FROM books WHERE author_lname LIKE '%Eggers%' || author_lname LIKE '%Chabon%';

-- SELECT all books written by Lahiri published after 2000
-- Solution: 
SELECT title, author_lname, released_year FROM books WHERE author_lname LIKE '%Lahiri%' AND released_year > 2000;

-- SELECT all books where the page count is between 100 and 200 
-- Solution: 
SELECT title, pages FROM books WHERE pages BETWEEN 100 and 200;

-- SELECT all books where the author last name starts with C or S
-- Solution: 
SELECT title, author_lname FROM books WHERE author_lname LIKE 'C%' || author_lname LIKE 'S%';

-- SELECT If title contains 'stories'   -> Short Stories, Just Kids and A Heartbreaking Work  -> Memoir, Everything Else -> Novel
-- Solution: 
SELECT title, author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title LIKE '%Just Kids%' || title LIKE '%A Heartbreaking Work%' THEN 'Memoir'
        ELSE 'Novel'
    END AS GENRE
FROM books;
    
-- select title and author_lname and display how many books the author_lname has written 
-- Hints, you need to use group by and a case statement 
-- Solution: 
SELECT author_fname, author_lname, 
    CASE 
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT 
FROM books
GROUP BY author_lname, author_fname;

