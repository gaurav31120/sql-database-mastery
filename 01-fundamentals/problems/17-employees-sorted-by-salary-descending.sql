-- ============================================================
-- P017 — Display employees ordered by salary descending
-- ============================================================
--
-- Problem:
-- Display employees ordered by salary descending.
--
-- ============================================================

-- Solution:

SELECT employee_id, first_name
FROM company.employees
ORDER BY salary DESC;