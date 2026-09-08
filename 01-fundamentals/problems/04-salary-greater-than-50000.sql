-- ============================================================
-- P004 — Find employees whose salary is greater than 50,000
-- ============================================================
--
-- Problem:
-- Find employees whose salary is greater than 50,000.
--
-- ============================================================

-- Solution:

SELECT employee_id
FROM company.employees
WHERE salary > 50000;