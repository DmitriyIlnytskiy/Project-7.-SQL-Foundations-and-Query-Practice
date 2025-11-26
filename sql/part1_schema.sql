-- Part 1: Schema creation (PostgreSQL dialect)
-- Run: psql -f sql/part1_schema.sql

DROP TABLE IF EXISTS book_categories CASCADE;
DROP TABLE IF EXISTS publisher_profile CASCADE;
DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS publishers CASCADE;
DROP TABLE IF EXISTS authors CASCADE;

CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  birth_year INT,
  country VARCHAR(100)
);

CREATE TABLE publishers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  founded_year INT
);

-- one-to-one optional table for publisher profile
CREATE TABLE publisher_profile (
  publisher_id INT PRIMARY KEY REFERENCES publishers(id) ON DELETE CASCADE,
  website VARCHAR(255),
  description TEXT
);

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title VARCHAR(300) NOT NULL,
  author_id INT NOT NULL REFERENCES authors(id),
  publisher_id INT REFERENCES publishers(id),
  publication_year INT,
  pages INT,
  price NUMERIC(8,2)
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE book_categories (
  book_id INT NOT NULL REFERENCES books(id) ON DELETE CASCADE,
  category_id INT NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
  PRIMARY KEY (book_id, category_id)
);
