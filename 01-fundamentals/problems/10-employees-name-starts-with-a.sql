-- ============================================================
-- P010 — Find employees whose name starts with A
-- ============================================================
--
-- Problem:
-- Find employees whose name starts with A.
--
-- ============================================================

-- Solution:

SELECT employee_id
FROM company.employees
WHERE first_name LIKE 'A%';