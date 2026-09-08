-- ============================================================
-- P005 — Find employees whose salary is less than 50,000
-- ============================================================
--
-- Problem:
-- Find employees whose salary is less than 50,000.
--
-- ============================================================

-- Solution:

SELECT employee_id
FROM company.employees
WHERE salary < 50000;