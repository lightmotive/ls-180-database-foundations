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

-- Continue with exercise 4...