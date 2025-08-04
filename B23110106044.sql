CREATE DATABASE library_db;


CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    author VARCHAR(50),
    year_published INT,
    isAvailable BOOLEAN,
    price NUMERIC(7,2),
    publication VARCHAR(50)
);

INSERT INTO books (title, author, year_published, isAvailable, price, publication)
VALUES
('The Great Book', 'John Smith', 2001, TRUE, 500.00, 'XYZ'),
('1984', 'George Orwell', 1949, TRUE, 450.00, 'ABC'),
('Book of Secrets', 'Jane Doe', 2005, FALSE, 600.00, 'XYZ'),
('Tech World', 'Elon Tech', 2021, TRUE, 799.99, 'FuturePub'),
('Classic Tales', 'Author Unknown', 1995, TRUE, 399.50, 'OldHouse'),
('Modern Life', 'Alex Green', 2010, TRUE, 550.00, 'XYZ'),
('Dream World', 'Lisa Ray', 2008, FALSE, 599.00, 'DreamPub'),
('Deep Thoughts', 'Socrates', 2020, TRUE, 999.00, 'PhiloHouse'),
('The Startup Way', 'Eric Ries', 2017, TRUE, 299.99, 'LeanPub'),
('Data Driven', 'DJ Patil', 2016, FALSE, 580.75, 'DataPress'),
('Hidden Codes', 'Robert Lang', 2003, TRUE, 475.00, 'XYZ'),
('Winds of Change', 'George R.R.', 1999, FALSE, 620.00, 'FantasyInk'),
('Zebra Nights', 'Aria Stark', 2022, TRUE, 999.99, 'NightHouse'),
('Silent Era', 'Buster Keaton', 1920, FALSE, 200.00, 'SilentPub'),
('AI Future', 'OpenAI Team', 2023, TRUE, 950.00, 'XYZ');

SELECT * FROM books
WHERE year_published > 2000;

SELECT * FROM books
WHERE price < 599.00
ORDER BY price DESC;

SELECT * FROM books
ORDER BY price DESC
LIMIT 3;

SELECT * FROM books
ORDER BY year_published DESC
OFFSET 2
LIMIT 2;

SELECT * FROM books
WHERE publication = 'XYZ'
ORDER BY title ASC;