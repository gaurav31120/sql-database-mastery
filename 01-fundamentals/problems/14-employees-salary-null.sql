-- ============================================================
-- P014 — Find employees whose salary is NULL
-- ============================================================
--
-- Problem:
-- Find employees whose salary is NULL.
--
-- ============================================================

-- Solution:

SELECT employee_id, first_name
FROM company.employees
WHERE salary IS NULL;