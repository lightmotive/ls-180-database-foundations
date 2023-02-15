CREATE TABLE
  people (name varchar(255) NOT NULL, age smallint CHECK (age > 0), occupation varchar(255));

INSERT INTO
  people (name, age, occupation)
VALUES
  ('Abby', 34, 'biologist'),
  ('Mu''nisah', 26, NULL),
  ('Mirabelle', 40, 'contractor');

SELECT
  *
FROM
  people
WHERE
  name = 'Mu''nisah';

SELECT
  *
FROM
  people
WHERE
  occupation IS NULL;

SELECT
  *
FROM
  people
LIMIT
  1
OFFSET
  1;

CREATE TABLE
  birds (
    id integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name varchar(75) NOT NULL,
    length decimal(3, 1) NOT NULL,
    wingspan decimal(3, 1) NOT NULL,
    family varchar(25) NOT NULL,
    extinct boolean NOT NULL
  );

INSERT INTO
  birds (name, length, wingspan, family, extinct)
VALUES
  ('Spotted Towhee', 21.6, 26.7, 'Emberizidae', FALSE),
  ('American Robin', 25.5, 36.0, 'Turdidae', FALSE),
  ('Greater Koa Finch', 19.0, 24.0, 'Fringillidae', TRUE),
  ('Carolina Parakeet', 33.0, 55.8, 'Psittacidae', TRUE),
  ('Common Kestrel', 35.5, 73.5, 'Falconidae', FALSE);

SELECT
  name,
  family
FROM
  birds
WHERE
  extinct = FALSE
ORDER BY
  length DESC;

SELECT
  round(avg(wingspan), 1),
  min(wingspan),
  max(wingspan)
FROM
  birds;

CREATE TABLE
  menu_items (
    item text,
    prep_time integer,
    ingredient_cost numeric(4, 2),
    sales integer,
    menu_price numeric(4, 2)
  );

INSERT INTO
  menu_items (item, prep_time, ingredient_cost, sales, menu_price)
VALUES
  ('omelette', 10, 1.50, 182, 7.99),
  ('tacos', 5, 2.00, 254, 8.99),
  ('oatmeal', 1, 0.50, 79, 5.99);

SELECT
  item,
  menu_price - ingredient_cost AS profit
FROM
  menu_items
ORDER BY
  profit DESC
LIMIT
  1;

SELECT
  item,
  labor_cost,
  (menu_price - ingredient_cost - labor_cost) AS profit
FROM
  (
    SELECT
      *,
      round((13.0 / 60.0) * prep_time, 2) AS labor_cost
    FROM
      menu_items
  ) AS menu_items_with_calculations
ORDER BY
  profit DESC;