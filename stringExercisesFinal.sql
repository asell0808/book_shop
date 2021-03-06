-- Problems are to be used with the book DB and table.

-- Write this sentence backwards and uppercase
-- My dog stopped loving me long ago...
-- Solution:
SELECT REVERSE(UPPER('My dog stopped loving me long ago...'));

-- What will this command print out?
SELECT 
    REPLACE
    (
    CONCAT ('I', ' ', 'eat', ' ', 'pizza.'),
    ' ',
    '-'
    );
-- Solution: This commadn will print out a concatanation of 'I eat pizza.' However, due to the REPLACE string command, each of the ' ' characters will be "replaced" with a '-' character.
-- The final result will be: 'I-like-pizza.'

-- Use REPLACE to change all spaces in the books table to '->'. Alias the title table to read 'title'
-- Solution:
USE book_shop; -- Selects our DB for use.
USE books; -- Se;ects our table for use.
SELECT REPLACE(title, ' ', '->') AS title FROM books;

-- Print the last name of the authors forwards, and then reversed in separate columns labeled appropriately. 
-- Solution:
SELECT author_lname AS 'forwards', REVERSE (author_lname) AS 'backwards' FROM books;

-- Print full name of author all in caps
-- Solution:
SELECT  UPPER(CONCAT(author_fname, ' ', author_lname) AS 'full name in caps' FROM books;
              
-- Print the title of the of the book, add 'was released in ' plus the year
-- Solution:
SELECT CONCAT(title, 'was released in ', released_year) AS 'blurb' FROM books;
              
-- Print the book title and the length of each title, with appropriate aliases
-- Solution:
SELECT title, CHAR_LENGTH(title) AS 'character count' FROM books;
              
-- Print the first 10 characters of the title
-- Solution:
SELECT CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
       CONCAT(author_lname, ', ', author_fname) AS 'author',
       CONCAT(stock_quantity, ' in stock') AS 'quantity' 
FROM books;
       
