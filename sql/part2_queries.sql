-- Part 2: Basic Data Retrieval and Query Extension (Postgres)
-- Use psql and enable timing with \timing on for simple elapsed times.
-- Example flow: run base query, EXPLAIN ANALYZE, extended join, EXPLAIN ANALYZE after filter.

-- Base Query: titles published after 1990
\timing on
SELECT title FROM books WHERE publication_year > 1990;

-- EXPLAIN ANALYZE for base query
EXPLAIN ANALYZE SELECT title FROM books WHERE publication_year > 1990;

-- Extended: join to authors (bring author name)
EXPLAIN ANALYZE
SELECT b.title, a.name AS author_name
FROM books b
JOIN authors a ON b.author_id = a.id
WHERE b.publication_year > 1990;

-- Add filter on joined table (authors born after 1950)
EXPLAIN ANALYZE
SELECT b.title, a.name AS author_name
FROM books b
JOIN authors a ON b.author_id = a.id
WHERE b.publication_year > 1990
  AND a.birth_year > 1950;

-- Notes: save the two EXPLAIN ANALYZE outputs (before vs after filter)
-- Take screenshots showing 'Total runtime' / 'Execution Time' lines.
