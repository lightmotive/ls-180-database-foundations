-- Terminal commands:
/*
dcreatedb ls180_l3_a12
dpsql -d ls180_l3_a12 < many_to_many.sql
 */
ALTER TABLE books_categories
DROP CONSTRAINT books_categories_book_id_fkey,
DROP CONSTRAINT books_categories_category_id_fkey,
ALTER COLUMN book_id
SET NOT NULL,
ALTER COLUMN category_id
SET NOT NULL,
ADD FOREIGN KEY (book_id) REFERENCES books (id) ON DELETE CASCADE,
ADD FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE CASCADE;

SELECT
  b.id as id,
  b.author,
  string_agg(c.name, ', ') AS categories
FROM
  books_categories AS bc
  INNER JOIN books AS b ON b.id = bc.book_id
  INNER JOIN categories AS c ON c.id = bc.category_id
GROUP BY
  b.id
ORDER BY
  b.id;