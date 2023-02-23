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