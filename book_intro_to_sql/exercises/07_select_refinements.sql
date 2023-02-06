-- ** encyclopedia DB **
SELECT
  *
FROM
  countries
LIMIT
  1;

SELECT
  name
FROM
  countries
ORDER BY
  population DESC
LIMIT
  1;

SELECT
  name
FROM
  countries
ORDER BY
  population DESC
LIMIT
  1
OFFSET
  1;

SELECT DISTINCT
  binomial_name
FROM
  animals;

SELECT
  binomial_name
FROM
  animals
ORDER BY
  length(binomial_name) DESC
LIMIT
  1;

SELECT
  first_name
FROM
  celebrities
WHERE
  date_part('year', date_of_birth) = 1958;

SELECT
  max(max_age_years)
FROM
  animals;

SELECT
  avg(max_weight_kg)
FROM
  animals;

SELECT
  count(id)
FROM
  countries;

SELECT
  sum(population)
FROM
  countries;

SELECT
  conservation_status,
  count(id)
FROM
  animals
GROUP BY
  conservation_status;

-- ** ls_burger DB **
SELECT
  avg(burger_cost)
FROM
  orders
WHERE
  side = 'Fries';

SELECT
  min(side_cost)
FROM
  orders
WHERE
  side IS NOT NULL;

SELECT
  side,
  count(id) AS order_count
FROM
  orders
WHERE
  side = 'Fries'
  OR side = 'Onion Rings'
GROUP BY
  side;