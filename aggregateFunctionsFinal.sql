-- Problems are to be used with the book DB and table.

-- Print out how many books were released in each year
-- Solution:
SELECT title, released_year, COUNT(*) FROM books GROUP BY released_year;

-- Print out the total number of books in stock
-- Solution:
SELECT SUM(stock_quantity) FROM books;

-- Find the average relase year by author
-- Solution:
SELECT CONCAT(author_fname, ' ', author_lname) AS 'Author', AVG(released_year) AS 'Average year of release' FROM books GROUP BY author_lname, author_fname;

-- Find the full name of the author with the longest book written
-- Solution: 
SELECT CONCAT(author_fname, ' ', author_lname) AS 'Author full name', MAX(pages) FROM books LIMIT 1;

-- Display year release, # of books, and avg pages for the year 
-- Solution:
SELECT released_year AS 'year', COUNT(title) AS '# of books', AVG(pages) AS 'avg pages' FROM books GROUP BY released_year;
