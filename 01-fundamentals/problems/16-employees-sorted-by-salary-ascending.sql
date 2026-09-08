-- ============================================================
-- P016 — Display employees ordered by salary ascending
-- ============================================================
--
-- Problem:
-- Display employees ordered by salary ascending.
--
-- ============================================================

-- Solution:

SELECT employee_id, first_name
FROM company.employees
ORDER BY salary;