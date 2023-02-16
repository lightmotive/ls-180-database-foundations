-- Expressions that operate on a NULL value will return NULL.
ALTER TABLE employees
ALTER COLUMN department
SET DEFAULT 'unassigned';

UPDATE employees
SET
  department = 'unassigned'
WHERE
  department IS NULL;

ALTER TABLE employees
ALTER COLUMN department
SET NOT NULL;