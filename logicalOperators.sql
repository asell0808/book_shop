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
