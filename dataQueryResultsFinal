-- Problems are to be used with the book DB and table.

-- Select all titles with stories in them
-- Solution:
SELECT title FROM books WHERE title LIKE '%stories%' LIMIT 3;

-- Find the longest book based on the pages and display its title.
-- Solution:
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

-- Print the summary containing the title and year for the 3 most recent books, order by newest book
-- Solution:
SELECT CONCAT(title, ' - ', released_year) AS 'summary' FROM books ORDER BY released_year DESC LIMIT 4;

-- Find all books with an author_lname that conains a ' ' character.
-- Solution:
SELECT title, author_lname FROM books WHERE author_lname LIKE'% %' LIMIT 2;

-- Find the 3 books with the lowest stock quantity
-- Solution:
SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity ASC LIMIT 4;

-- Print title and author_lname, sorted by author_lname and then by title
-- Solution:
SELECT title, author_lname FROM books ORDER BY author_lname, title;

-- this string"MY FAVORITE AUTHOR IS " + sort by author_lname, with alias yell
-- Solution:
SELECT CONCAT('MY FAVORITE AUTHOR IS ', UPPER(author_fname), ' ', UPPER(author_lname), '!') AS 'yell' FROM books ORDER BY author_lname;
