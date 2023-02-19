-- Expressions that operate on a NULL value will return NULL.
ALTER TABLE employees
ALTER COLUMN department
SET DEFAULT 'unassigned';

UPDATE employees
SET
  department = 'unassigned'
WHERE
  department IS NULL;

ALTER TABLE employees
ALTER COLUMN department
SET NOT NULL;

CREATE TABLE
  temperatures ("date" date NOT NULL, low smallint NOT NULL, high smallint NOT NULL);

INSERT INTO
  temperatures ("date", low, high)
VALUES
  ('2016-03-01', 34, 43),
  ('2016-03-02', 32, 44),
  ('2016-03-03', 31, 47),
  ('2016-03-04', 33, 42),
  ('2016-03-05', 39, 46),
  ('2016-03-06', 32, 43),
  ('2016-03-07', 29, 32),
  ('2016-03-08', 23, 31),
  ('2016-03-09', 17, 28);

SELECT
  "date",
  round((low + high) / 2.0, 1) AS average
FROM
  temperatures
WHERE
  "date" BETWEEN '2016-03-02' AND '2016-03-08';

ALTER TABLE temperatures
ADD COLUMN rainfall integer DEFAULT 0;

UPDATE temperatures
SET
  rainfall = floor((low + high) / 2) - 35
WHERE
  (low + high) / 2 > 35;

SELECT
  *
FROM
  temperatures;

ALTER TABLE temperatures
ALTER COLUMN rainfall
TYPE double precision USING CAST(rainfall / 25.4 AS double precision);

SELECT
  *
FROM
  temperatures;

ALTER TABLE temperatures
RENAME TO weather;

-- To see the new table schema in `psql`, use metacommand `\d weather`.
-- To generate a SQL file that generates schemata of a Postgres DB, use
-- the `pg_dump` app. Sample command to regenerate the weather table:
--   `pg_dump -d sql-course -t weather > weather.sql`