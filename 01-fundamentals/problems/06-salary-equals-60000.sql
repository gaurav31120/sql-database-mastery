-- ============================================================
-- P006 — Find employees earning exactly 60,000
-- ============================================================
--
-- Problem:
-- Find employees earning exactly 60,000.
--
-- ============================================================

-- Solution:

SELECT employee_id
FROM company.employees
WHERE salary = 60000;