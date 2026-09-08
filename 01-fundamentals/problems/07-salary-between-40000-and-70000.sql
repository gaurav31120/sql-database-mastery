-- ============================================================
-- P007 — Find employees whose salary is between 40,000 and 70,000
-- ============================================================
--
-- Problem:
-- Find employees whose salary is between 40,000 and 70,000.
--
-- ============================================================

-- Solution:

SELECT employee_id
FROM company.employees
WHERE salary BETWEEN 40000 AND 70000;