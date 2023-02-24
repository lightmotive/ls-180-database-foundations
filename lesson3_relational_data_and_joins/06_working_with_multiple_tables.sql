-- In this database, `tickets` represent purchases; each ticket must have
-- (NOT NULL constraints defined):
-- - event_id
-- - seat_id
-- - customer_id
-- Therefore, sold ticket count can simple count the number of `tickets` rows:
SELECT
  count(*)
FROM
  tickets;

SELECT
  count(DISTINCT customer_id)
FROM
  tickets;

-- Percentage of customers who have purchased tickets:
-- count of distinct customers in `tickets` / Total `customers`
SELECT
  round(count(DISTINCT t.customer_id) / count(DISTINCT c.id)::NUMERIC * 100, 2) AS purchasing_customers_percent
FROM
  customers AS c
  LEFT JOIN tickets AS t ON c.id = t.customer_id;

SELECT
  e.name,
  count(t.event_id) AS popularity
FROM
  events AS e
  LEFT OUTER JOIN tickets AS t ON e.id = t.event_id
GROUP BY
  e.name
ORDER BY
  popularity DESC;

SELECT
  c.id,
  c.email,
  count(DISTINCT t.event_id) AS event_count
FROM
  customers AS c
  INNER JOIN tickets AS t ON c.id = t.customer_id
GROUP BY
  c.id
HAVING
  count(DISTINCT t.event_id) = 3;

SELECT
  e.name AS "event",
  e.starts_at,
  sc.name AS section,
  st.row,
  st.number AS seat
FROM
  customers as c
  INNER JOIN tickets AS t ON c.id = t.customer_id
  INNER JOIN events AS e ON e.id = t.event_id
  INNER JOIN seats AS st ON st.id = t.seat_id
  INNER JOIN sections AS sc ON sc.id = st.section_id
WHERE
  c.email = 'gennaro.rath@mcdermott.co';