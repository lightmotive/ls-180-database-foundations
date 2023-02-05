-- ** encyclopedia DB **
SELECT
  population
FROM
  countries
WHERE
  name = 'USA';

SELECT
  population,
  capital
FROM
  countries;

SELECT
  name
FROM
  countries
ORDER BY
  name;

SELECT
  name,
  capital
FROM
  countries
ORDER BY
  population;

SELECT
  name,
  capital
FROM
  countries
ORDER BY
  population DESC;

SELECT
  name,
  binomial_name,
  max_weight_kg,
  max_age_years
FROM
  animals
ORDER BY
  max_age_years,
  max_weight_kg,
  name DESC;

SELECT
  name
FROM
  countries
WHERE
  population > 70000000;

SELECT
  name
FROM
  countries
WHERE
  population > 70000000
  AND population < 200000000;

SELECT
  first_name,
  last_name
FROM
  celebrities
WHERE
  deceased <> TRUE
  OR deceased IS NULL;

SELECT
  first_name,
  last_name
FROM
  celebrities
WHERE
  occupation LIKE '%Singer%';

SELECT
  first_name,
  last_name
FROM
  celebrities
WHERE
  occupation LIKE '%Actor%';

SELECT
  first_name,
  last_name
FROM
  celebrities
WHERE
  occupation LIKE '%Singer%'
  AND occupation LIKE '%Actor%';

-- ** ls_burger DB **
SELECT
  burger
FROM
  orders
WHERE
  burger_cost < 5
ORDER BY
  burger_cost;

SELECT
  customer_name,
  customer_email,
  customer_loyalty_points
FROM
  orders
WHERE
  customer_loyalty_points >= 20
ORDER BY
  customer_loyalty_points DESC;

SELECT
  burger
FROM
  orders
WHERE
  customer_name = 'Natasha O''Shea';

SELECT
  customer_name
FROM
  orders
WHERE
  drink IS NULL;

SELECT
  burger,
  side,
  drink
FROM
  orders
WHERE
  side IS NULL
  OR side <> 'Fries';

SELECT
  burger,
  side,
  drink
FROM
  orders
WHERE
  side IS NOT NULL
  AND drink IS NOT NULL;