-- Create DB using CLI: createdb residents
-- Load DB dump using CLI: psql -d residents < residents_with_data.sql
SELECT
  state,
  count(id) AS population
FROM
  people
GROUP BY
  state
ORDER BY
  population DESC
LIMIT
  10;

SELECT
  split_part(email, '@', 2) as email_domain,
  count(id)
FROM
  people
GROUP BY
  email_domain
ORDER BY
  count DESC;

DELETE FROM people
WHERE
  id = 3399;

DELETE FROM people
WHERE
  state = 'CA';

-- Write a SQL statement that will update the given_name values to be all
-- uppercase for all users with an email address that contains teleworm.us.
UPDATE people
SET
  given_name = upper(given_name)
WHERE
  email LIKE '%teleworm.us';

DELETE FROM people;