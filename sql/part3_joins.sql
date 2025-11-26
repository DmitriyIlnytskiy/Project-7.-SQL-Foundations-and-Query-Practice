-- Part 3: Joins Practicing
-- INNER JOIN
EXPLAIN ANALYZE
SELECT b.title, a.name
FROM books b
INNER JOIN authors a ON b.author_id = a.id;

-- LEFT JOIN
EXPLAIN ANALYZE
SELECT b.title, a.name
FROM books b
LEFT JOIN authors a ON b.author_id = a.id;

-- RIGHT JOIN (Postgres supports RIGHT JOIN; if your engine doesn't, swap table order)
EXPLAIN ANALYZE
SELECT b.title, a.name
FROM books b
RIGHT JOIN authors a ON b.author_id = a.id;

-- FULL OUTER JOIN
EXPLAIN ANALYZE
SELECT b.title, a.name
FROM books b
FULL OUTER JOIN authors a ON b.author_id = a.id;
