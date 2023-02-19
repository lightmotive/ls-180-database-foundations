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