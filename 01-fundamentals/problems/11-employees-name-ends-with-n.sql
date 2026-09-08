-- ============================================================
-- P011 — Find employees whose name ends with n
-- ============================================================
--
-- Problem:
-- Find employees whose name ends with n.
--
-- ============================================================

-- Solution:

SELECT employee_id, first_name
FROM company.employees
WHERE first_name LIKE '%n';