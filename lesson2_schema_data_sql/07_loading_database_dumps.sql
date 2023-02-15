-- Ran commands in this directory:
-- createdb test
-- psql -d test < films1.sql
-- ***
-- films1.sql drops a `films` table if it exists, then creates a `films` table,
-- then inserts data into that table.
-- ***
-- Command output:
-- NOTICE:  table "films" does not exist, skipping
--  - A helpful message!
-- DROP TABLE
--  - Though the table didn't exist per the previous message, this indicates
--    the DROP TABLE command completed successfully.
-- CREATE TABLE
--  - The CREATE TABLE films... command completed successfully.
--  - The following messages indicate, 3 times, that 1 row was inserted into oid 0:
-- INSERT 0 1
-- INSERT 0 1
-- INSERT 0 1
-- ***
-- Complete remaining exercises...
SELECT
  *
FROM
  films;

SELECT
  *
FROM
  films
WHERE
  length(title) < 12;

ALTER TABLE films
ADD COLUMN director varchar(255),
ADD COLUMN duration smallint;

UPDATE films
SET
  director = 'John McTiernan',
  duration = 132
WHERE
  title = 'Die Hard';

UPDATE films
SET
  director = 'Michael Curtiz',
  duration = 102
WHERE
  title = 'Casablanca';

UPDATE films
SET
  director = 'Francis Ford Coppola',
  duration = 113
WHERE
  title = 'The Conversation';

INSERT INTO
  films (title, "year", genre, director, duration)
VALUES
  ('1984', 1956, 'scifi', 'Michael Anderson', 90),
  ('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127),
  ('The Birdcage', 1996, 'comedy', 'Mike Nichols', 118);

SELECT
  title,
  date_part('year', CURRENT_DATE) - "year" AS age
FROM
  films
ORDER BY
  age;

SELECT
  title,
  duration
FROM
  films
WHERE
  duration > 120
ORDER BY
  duration DESC;

SELECT
  title AS longest_film
FROM
  films
ORDER BY
  duration DESC
LIMIT
  1;