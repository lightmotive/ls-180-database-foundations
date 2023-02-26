-- Init commands:
/*
createdb ls180_l3_a8
wget https://raw.githubusercontent.com/launchschool/sql_course_data/master/sql-and-relational-databases/relational-data-and-joins/one-to-many-relationships/one-to-many.sql
dpsql -d ls180_l3_a8 < one-to-many.sql
 */
INSERT INTO
  calls ("when", duration, contact_id)
VALUES
  ('2016-01-18 14:47:00', 632, 6);

SELECT
  calls."when",
  calls.duration,
  contacts.first_name
FROM
  calls
  INNER JOIN contacts ON contacts.id = calls.contact_id
WHERE
  contact_id <> 6
  -- To filter by name: (contacts.first_name || ' ' || contacts.last_name) <> 'William Swift'
;

INSERT INTO
  contacts (first_name, last_name, "number")
VALUES
  ('Merve', 'Elk', 6343511126);

INSERT INTO
  calls ("when", duration, contact_id)
VALUES
  ('2016-01-17 11:52:00', 175, 26);

INSERT INTO
  contacts (first_name, last_name, "number")
VALUES
  ('Sawa', 'Fyodorov', 6125594874);

INSERT INTO
  calls ("when", duration, contact_id)
VALUES
  ('2016-01-18 21:22:00', 79, 27);

ALTER TABLE contacts
ADD UNIQUE ("number");

-- Now, the following statement would result in an error message:
/* 
ERROR:  duplicate key value violates unique constraint "contacts_number_key"
DETAIL:  Key (number)=(6125594874) already exists. */
INSERT INTO
  contacts (first_name, last_name, "number")
VALUES
  ('Someone', 'Else', 6125594874);