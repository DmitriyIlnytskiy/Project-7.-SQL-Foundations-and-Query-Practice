-- Part 4: Indexes and Query Performance
-- Identify frequently filtered column and create index if missing.

-- Check existing indexes (in psql run: \di)
-- Before creating index: run EXPLAIN ANALYZE for a filter
EXPLAIN ANALYZE SELECT * FROM books WHERE publication_year = 1996;

-- Create index on publication_year to speed such queries
CREATE INDEX IF NOT EXISTS idx_books_publication_year ON books(publication_year);

-- Also create index on author_id to help joins
CREATE INDEX IF NOT EXISTS idx_books_author_id ON books(author_id);

-- After index: run EXPLAIN ANALYZE again
EXPLAIN ANALYZE SELECT * FROM books WHERE publication_year = 1996;

-- Notes: capture screenshots pre/post showing Total runtime differences.
