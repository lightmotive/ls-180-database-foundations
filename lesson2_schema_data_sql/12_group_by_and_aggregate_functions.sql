INSERT INTO
  films (title, "year", genre, director, duration)
VALUES
  ('Wayne''s World', 1992, 'comedy', 'Penelope Spheeris', 95),
  ('Bourne Identity', 2002, 'espionage', 'Doug Liman', 118);

SELECT DISTINCT
  genre
FROM
  films
ORDER BY
  genre;

-- Statement with equivalent results:
SELECT
  genre
FROM
  films
GROUP BY
  genre
ORDER BY
  genre;

SELECT
  ROUND(AVG(duration)) AS duration_average
FROM
  films;

SELECT
  genre,
  ROUND(AVG(duration)) AS duration_average
FROM
  films
GROUP BY
  genre;

SELECT
  (("year" / 10) * 10)::text || 's' AS decade,
  ROUND(AVG(duration)) AS duration_average
FROM
  films
GROUP BY
  decade
ORDER BY
  decade;

SELECT
  *
FROM
  films
WHERE
  director LIKE 'John %';

SELECT
  genre,
  count(id)
FROM
  films
GROUP BY
  genre
ORDER BY
  count DESC;

SELECT
  (("year" / 10) * 10)::text || 's' AS decade,
  genre,
  string_agg(
    title,
    ', '
    -- ORDER BY
    --   title
  )
FROM
  films
GROUP BY
  decade,
  genre
ORDER BY
  decade,
  genre;

SELECT
  genre,
  sum(duration) AS duration_total
FROM
  films
GROUP BY
  genre
ORDER BY
  duration_total;