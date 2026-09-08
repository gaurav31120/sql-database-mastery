-- ============================================================
-- P020 — Display employees sorted by department and then salary
-- ============================================================
--
-- Problem:
-- Display employees sorted by department and then salary.
--
-- ============================================================

-- Solution:

SELECT employee_id, first_name, salary
FROM company.employees
ORDER BY department_id, salary;