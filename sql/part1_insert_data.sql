-- Part 1: Insert sample data (at least 5 rows per table)
-- Run: psql -f sql/part1_insert_data.sql

INSERT INTO authors (name, birth_year, country) VALUES
('Haruki Murakami', 1949, 'Japan'),
('Isabel Allende', 1942, 'Chile'),
('Chimamanda Ngozi Adichie', 1977, 'Nigeria'),
('Jane Austen', 1775, 'UK'),
('George R. R. Martin', 1948, 'USA');

INSERT INTO publishers (name, founded_year) VALUES
('Vintage', 1954),
('Penguin Random House', 2013),
('Bloomsbury', 1986),
('Oxford Press', 1586),
('HarperCollins', 1989);

INSERT INTO publisher_profile (publisher_id, website, description) VALUES
(1, 'https://vintage.example', 'Vintage imprint sample'),
(2, 'https://penguin.example', 'Penguin Random House sample');

INSERT INTO categories (name) VALUES
('Fiction'),
('Historical'),
('Fantasy'),
('Biography'),
('Literary Fiction');

INSERT INTO books (title, author_id, publisher_id, publication_year, pages, price) VALUES
('Norwegian Wood', 1, 1, 1987, 296, 12.99),
('The House of the Spirits', 2, 2, 1982, 433, 15.50),
('Half of a Yellow Sun', 3, 2, 2006, 448, 13.00),
('Pride and Prejudice', 4, 4, 1813, 279, 9.99),
('A Game of Thrones', 5, 3, 1996, 694, 22.00);

INSERT INTO book_categories (book_id, category_id) VALUES
(1, 1),(1,5),
(2,1),(2,2),
(3,1),(3,5),
(4,1),(4,2),
(5,1),(5,3);
