-- Part 5: Aggregation Functions Practice
-- AVG, MIN, MAX
EXPLAIN ANALYZE
SELECT AVG(price) AS avg_price, MIN(price) AS min_price, MAX(price) AS max_price FROM books;

-- COUNT with GROUP BY and HAVING
EXPLAIN ANALYZE
SELECT a.name, COUNT(b.id) AS books_count
FROM authors a
LEFT JOIN books b ON b.author_id = a.id
GROUP BY a.name
HAVING COUNT(b.id) > 0;

-- Proposed optimization strategies (include these bullets in your assignment document):
-- 1) Add indexes on join/filter columns (books.author_id, books.publication_year)
-- 2) Use materialized views for expensive aggregates updated periodically
-- 3) Partition large tables by range (e.g., publication_year)
-- 4) Maintain summary tables updated by triggers or scheduled jobs
