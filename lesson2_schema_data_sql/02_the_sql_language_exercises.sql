-- SQL is a special purpose declarative language.
-- ***
-- The three SQL sub-languages (at least according to PostgreSQL documentation)
-- are Data Definition Language (DDL), Data Manipulation Language (DML), and
-- Data Control Language (DCL).
-- ***
-- Quoting string values:
SELECT
  'canoe';

SELECT
  'a long road';

SELECT
  'weren''t';

SELECT
  '"No way!"';

-- ***
-- Concatenate strings with `||`, or use the `concat` function.
-- ***
-- Compute the surface area of a sphere:
-- A = 4π r2
SELECT
  trunc(4 * pi() * 26.3 ^ 2);