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