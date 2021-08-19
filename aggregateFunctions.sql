-- to be used with the book_shop db and the books table

-- COUNT will count whatever you want it to count
SELECT COUNT(*) FROM books;


-- COUNT with DISTINCT to show only distinct authors
SELECT COUNT(DISTINCT(author_fname, author_lname)) FROM books;

-- COUNT to show how many titles contain 'the'
SELECT title FROM books WHERE title LIKE '%the%';
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

-- GROUP BY , This will be essential for the rest of the section.
-- GROUP BY summarizes or aggregates identical data into single rows
SELECT title, author_lname FROM books GROUP BY author_lname;

-- COUNT how many books each author has written
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
SELECT released_year COUNT(*) FROM books GROUP BY released_year;
SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' books released.') AS 'Books released by year' FROM books GROUP BY released_year;

-- MIN and  MAX basics. They identify min and max data from tables
-- find the minimum released year from books
SELECT MIN(released_year) FROM books;
-- or
SELECT MIN(pages) FROM books;
-- find the max released year from books
SELECT MAX(released_year) FROM books;
-- or
SELECT MAX(pages) FROM books;

-- SUBQUERIES, problems with min and max
SELECT * FROM books WHERE pages = (SELECT MAX(pages) FROM books);
SELECT * FROM books WHERE pages = (SELECT MIN(pages) FROM books);
-- The problem, running two queries slows down data display, and this would only be worse and worse with more data
-- 


