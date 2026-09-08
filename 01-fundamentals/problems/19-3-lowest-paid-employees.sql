-- ============================================================
-- P019 — Display 3 lowest-paid employees
-- ============================================================
--
-- Problem:
-- Display 3 lowest-paid employees.
--
-- ============================================================

-- Solution:

SELECT employee_id, first_name, salary
FROM company.employees
ORDER BY salary
LIMIT 3;