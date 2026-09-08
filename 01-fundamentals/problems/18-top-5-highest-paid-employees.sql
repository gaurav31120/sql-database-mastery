-- ============================================================
-- P018 — Display top 5 highest-paid employees
-- ============================================================
--
-- Problem:
-- Display the top 5 highest-paid employees.
--
-- ============================================================

-- Solution:

SELECT employee_id, first_name, salary
FROM company.employees
ORDER BY salary DESC
LIMIT 5;