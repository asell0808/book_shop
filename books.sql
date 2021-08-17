CREATE DATABASE book_shop;

CREATE TABLE books
  (
     book_id        INT NOT NULL auto_increment,
     title          VARCHAR(100),
     author_fname   VARCHAR(100),
     author_lname   VARCHAR(100),
     released_year  INT,
     stock_quantity INT,
     pages          INT,
     PRIMARY KEY(book_id)
  );

INSERT INTO books
            (title,
             author_fname,
             author_lname,
             released_year,
             stock_quantity,
             pages)
VALUES      ('The Namesake',
             'Jhumpa',
             'Lahiri',
             2003,
             32,
             291),
            ('Norse Mythology',
             'Neil',
             'Gaiman',
             2016,
             43,
             304),
            ('American Gods',
             'Neil',
             'Gaiman',
             2001,
             12,
             465),
            ('Interpreter of Maladies',
             'Jhumpa',
             'Lahiri',
             1996,
             97,
             198),
            ('A Hologram for the King: A Novel',
             'Dave',
             'Eggers',
             2012,
             154,
             352),
            ('The Circle',
             'Dave',
             'Eggers',
             2013,
             26,
             504),
            ('The Amazing Adventures of Kavalier & Clay',
             'Michael',
             'Chabon',
             2000,
             68,
             634),
            ('Just Kids',
             'Patti',
             'Smith',
             2010,
             55,
             304),
            ('A Heartbreaking Work of Staggering Genius',
             'Dave',
             'Eggers',
             2001,
             104,
             437),
            ('Coraline',
             'Neil',
             'Gaiman',
             2003,
             100,
             208),
            ('What We Talk About When We Talk About Love: Stories',
             'Raymond',
             'Carver',
             1981,
             23,
             176),
            ("where i'm calling from: selected stories",
             'Raymond',
             'Carver',
             1989,
             12,
             526),
            ('White Noise',
             'Don',
             'DeLillo',
             1985,
             49,
             320),
            ('Cannery Row',
             'John',
             'Steinbeck',
             1945,
             95,
             181),
            ('Oblivion: Stories',
             'David',
             'Foster Wallace',
             2004,
             172,
             329),
            ('Consider the Lobster',
             'David',
             'Foster Wallace',
             2005,
             92,
             343);

-- This is a comment for sql
-- CONCAT combines values and is a string function
-- Example for CONCAT 
SELECT Concat ('Hello', 'World');

-- In this example, we are selcting to concatenate the fname and lname of authors in the table
-- We then are setting the author's alias, using AS, to 'full name'
SELECT Concat(author_fname, ' ', author_lname) AS 'full name'
FROM   books;

-- CONCAT_WS allows you to separate data
SELECT Concat_ws(' - ', title, author_fname, author_lname)
FROM   books;

-- SUBSTRING indexes and shows the value of a portion of the string based on the index value
SELECT Substring('Hello World', 7);

-- You can also use portions of the string by adding a beginning and ending index
SELECT Substring('Hello World', 3, 8);

-- Example using our bookshop table
SELECT Substring(title, 1, 10) AS 'short title'
FROM   books;

-- This concats elipse after each short title
SELECT Concat(Substring(title, 1, 10), '...') AS 'short title'
FROM   books;

-- REPLACE, format goes like this, (subject, 'to be replace', 'what replaces it') FROM books;
-- REPLACE is case sensitive
SELECT REPLACE(title, 'e', '3')
FROM   books;

-- REPLACE example for all book titles
SELECT Substring(REPLACE(title, 'e', '3'), 1, 10) AS 'whacky r3plac3m3nt'
FROM   books;

-- REVERSE reverses strings
SELECT Reverse(author_fname) AS 'Reversal'
FROM   books;

-- CHAR_LENGTH reads out the CHAR length of a string
SELECT Concat(author_lname, ' is ', Char_length(author_lname),
       ' characters long') AS
       'Length of Author Last Name'
FROM   books; 
