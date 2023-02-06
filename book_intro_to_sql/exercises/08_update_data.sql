-- ** encyclopedia DB **
ALTER TABLE animals
ADD COLUMN class varchar(100);

UPDATE animals
SET
  class = 'Aves';

ALTER TABLE animals
ADD COLUMN phylum varchar(100),
ADD COLUMN kingdom varchar(100);

UPDATE animals
SET
  phylum = 'Chordata',
  kingdom = 'Animalia';

ALTER TABLE countries
ADD COLUMN continent varchar(50);

UPDATE countries
SET
  continent = 'Europe'
WHERE
  name = 'France'
  OR name = 'Germany';

UPDATE countries
SET
  continent = 'Asia'
WHERE
  name = 'Japan';

UPDATE countries
SET
  continent = 'North America'
WHERE
  name = 'USA';

UPDATE celebrities
SET
  deceased = TRUE
where
  first_name = 'Elvis';

ALTER TABLE celebrities
ALTER COLUMN deceased
SET NOT NULL;

DELETE FROM celebrities
WHERE
  first_name = 'Tom'
  AND last_name = 'Cruise';

ALTER TABLE celebrities
RENAME TO singers;

SELECT
  *
FROM
  singers
WHERE
  occupation NOT LIKE '%Singer%';

DELETE FROM singers
WHERE
  occupation NOT LIKE '%Singer%';

SELECT
  *
FROM
  countries;

DELETE FROM countries;

-- ** ls_burger DB **
UPDATE orders
SET
  drink = 'Lemonade'
WHERE
  customer_name = 'James Bergman';

UPDATE orders
SET
  side = 'Fries',
  side_cost = 0.99,
  customer_loyalty_points = customer_loyalty_points + 3
WHERE
  id = 4;

UPDATE orders
SET
  side_cost = 1.20
WHERE
  side = 'Fries';