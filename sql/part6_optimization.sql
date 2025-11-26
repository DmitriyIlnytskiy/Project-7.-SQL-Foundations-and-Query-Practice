-- Part 6: Query Modification and Optimization
-- Starting query (adapted)
EXPLAIN ANALYZE
SELECT b.title, a.name
FROM books b
JOIN authors a ON b.author_id = a.id
WHERE b.publication_year > 1990
ORDER BY b.publication_year DESC;

-- Modified: add author filter and LIMIT
EXPLAIN ANALYZE
SELECT b.title, a.name
FROM books b
JOIN authors a ON b.author_id = a.id
WHERE b.publication_year > 1990
  AND a.birth_year > 1950
ORDER BY b.publication_year DESC
LIMIT 5;

-- Create helpful composite index for WHERE + ORDER BY (publication_year, author_id)
CREATE INDEX IF NOT EXISTS idx_books_pubyear_author ON books(publication_year, author_id);

-- Final grouped report (count per publisher)
EXPLAIN ANALYZE
SELECT p.name AS publisher, COUNT(b.id) AS books_count
FROM publishers p
LEFT JOIN books b ON b.publisher_id = p.id
GROUP BY p.name
ORDER BY books_count DESC;
