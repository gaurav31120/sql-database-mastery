-- ============================================================
-- P015 — Find employees whose salary is NOT NULL
-- ============================================================
--
-- Problem:
-- Find employees whose salary is NOT NULL.
--
-- ============================================================

-- Solution:

SELECT employee_id, first_name
FROM company.employees
WHERE salary IS NOT NULL;