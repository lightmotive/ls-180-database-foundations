-- Within psql:
/*
CREATE DATABASE ls180_l3_a7;
\c ls180_l3_a7;
\i orders_products1.sql
 */
-- Postgres automatically sets the foreign key constraint name to
-- "orders_product_id_fkey" with the following statement:
ALTER TABLE orders
ADD FOREIGN KEY (product_id) REFERENCES products (id);

INSERT INTO
  products (name)
VALUES
  ('small bolt'),
  ('large bolt');

INSERT INTO
  orders (product_id, quantity)
VALUES
  (1, 10),
  (1, 25),
  (2, 15);

SELECT
  o.quantity,
  p.name
FROM
  orders AS o
  INNER JOIN products AS p ON p.id = o.product_id;

-- The foreign key constraint in the `orders` table will currently allow
-- inserting an order row without a `product_id` value. E.g.:
INSERT INTO
  orders (quantity)
VALUES
  (10);

-- That's because, while the table has a foreign key constraint, the associated
-- foreign key column doesn't have a NOT NULL constraint. Unlike a primary key
-- constraint, a foreign key constraints doesn't automatically add NOT NULL or
-- UNIQUE constraints.
-- ***
-- Due to the insert statement above, we can't add a NOT NULL constraint to the
-- orders table. Let's fix that, then add the constraint:
DELETE FROM orders
WHERE
  product_id IS NULL;

ALTER TABLE orders
ALTER COLUMN product_id
SET NOT NULL;