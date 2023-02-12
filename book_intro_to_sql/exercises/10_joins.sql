-- ** encyclopedia DB **
ALTER TABLE continents
RENAME COLUMN continent_name TO name;

SELECT
  country.name AS country_name,
  continent.name AS continent_name
FROM
  countries AS country
  INNER JOIN continents AS continent ON continent.id = country.continent_id;

SELECT
  country.name,
  country.capital
FROM
  countries AS country
  INNER JOIN continents AS continent ON continent.id = country.continent_id
where
  continent.id = 1;

SELECT DISTINCT
  singer.first_name AS "Warner Bros Singer First Name"
FROM
  singers as singer
  INNER JOIN albums as album ON singer.id = album.singer_id
WHERE
  album.label LIKE '%Warner Bros%';

SELECT
  singer.first_name,
  singer.last_name,
  album.name AS album_name,
  album.release_date
FROM
  singers as singer
  INNER JOIN albums as album ON singer.id = album.singer_id
WHERE
  singer.deceased = FALSE
  AND date_part('year', album.release_date) BETWEEN 1980 AND 1989
ORDER BY
  singer.date_of_birth DESC;

-- The repetitive table aliasing makes it obvious why a table naming convention
-- includes using the singular form of the noun.
SELECT
  singer.first_name,
  singer.last_name
FROM
  singers as singer
  LEFT JOIN albums as album on singer.id = album.singer_id
WHERE
  album.id IS NULL;

-- `NOT EXISTS (subquery WHERE)` is more efficient than
-- `singer.id NOT IN (subquery singer_id)`, though some RDBMSes automatically
-- rewrite inefficient queries when possible.
SELECT
  singer.first_name,
  singer.last_name
FROM
  singers as singer
WHERE
  NOT EXISTS (
    SELECT
      1
    FROM
      albums
    WHERE
      singer.id = singer_id
  );

-- ** ls_burger DB **
SELECT
  o.*,
  p.*
FROM
  order_items AS oi
  INNER JOIN orders AS o ON o.id = oi.order_id
  INNER JOIN products AS p ON p.id = oi.product_id;

SELECT DISTINCT
  o.id
FROM
  order_items AS oi
  INNER JOIN orders AS o ON o.id = oi.order_id
  INNER JOIN products AS p ON p.id = oi.product_id
WHERE
  p.id = 5;

SELECT DISTINCT
  c.name AS "Customers who like Fries"
FROM
  order_items AS oi
  INNER JOIN orders AS o ON o.id = oi.order_id
  INNER JOIN products AS p ON p.id = oi.product_id
  INNER JOIN customers AS c ON c.id = o.customer_id
WHERE
  p.id = 5;

SELECT
  p.name,
  count(oi.id)
FROM
  order_items AS oi
  INNER JOIN products AS p ON p.id = oi.product_id
GROUP BY
  p.name
ORDER BY
  p.name;