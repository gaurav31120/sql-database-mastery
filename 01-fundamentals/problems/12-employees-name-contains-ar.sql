-- ============================================================
-- P012 — Find employees whose name contains ar
-- ============================================================
--
-- Problem:
-- Find employees whose name contains ar.
--
-- ============================================================

-- Solution:

SELECT employee_id, first_name
FROM company.employees
WHERE first_name LIKE '%ar%';