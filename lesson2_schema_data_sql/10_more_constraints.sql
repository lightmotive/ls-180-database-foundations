-- `psql -d ls180 < films2.sql`
ALTER TABLE films
ALTER COLUMN title
SET NOT NULL,
ALTER COLUMN "year"
SET NOT NULL,
ALTER COLUMN genre
SET NOT NULL,
ALTER COLUMN director
SET NOT NULL,
ALTER COLUMN duration
SET NOT NULL;

ALTER TABLE films
ADD UNIQUE (title);

ALTER TABLE films
DROP CONSTRAINT "films_title_key";

ALTER TABLE films
ADD CONSTRAINT title_length_one_char_minimum CHECK (length(title) > 0);

-- If the CHECK constrain above is violated, e.g.:
INSERT INTO
  films (title, year, genre, director, duration)
VALUES
  ('', 1984, 'sci-fi', 'Denis Villeneuve', 127);

-- ...then the following error is shown:
-- ERROR:  new row for relation "films" violates check constraint "title_length_one_char_minimum"
-- DETAIL:  Failing row contains (, 1984, sci-fi, Denis Villeneuve, 127).
-- That constraint is shown in psql after `\d films` like this:
-- Check constraints:
--     "title_length_one_char_minimum" CHECK (length(title::text) > 0)
ALTER TABLE films
DROP CONSTRAINT "title_length_one_char_minimum";

ALTER TABLE films
ADD CONSTRAINT year_between_1900_and_2100 CHECK (year BETWEEN 1900 AND 2100);

-- Interestingly, Postgres automatically expands that check constraint:
-- "year_between_1900_and_2100" CHECK (year >= 1900 AND year <= 2100)
ALTER TABLE films
ADD CONSTRAINT director_has_3_chars_and_one_space CHECK (
  length(director) >= 3
  AND POSITION(' ' IN director) > 0
);

-- Good to know that Postgres adds type conversions to that check constraint:
-- "director_has_3_chars_and_one_space" CHECK (length(director::text) >= 3 AND POSITION((' '::text) IN (director)) > 0)
UPDATE films
SET
  director = 'Johnny'
WHERE
  title = 'Die Hard';

/* That statement results in the following error:
ERROR:  new row for relation "films" violates check constraint "director_has_3_chars_and_one_space"
DETAIL:  Failing row contains (Die Hard, 1988, action, Johnny, 132). */
-- ***
/* A schema can restrict data in several ways. Here are 5:
- Specify a data type.
- Prevent NULL values with a NOT NULL constraint.
- Ensure unique values with a UNIQUE constraint.
- Ensure a default value when one isn't provided with a DEFAULT constraint.
- Ensure just about anything else with a CHECK constraint.
 */