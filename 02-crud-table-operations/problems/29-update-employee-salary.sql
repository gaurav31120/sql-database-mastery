-- ============================================================
-- P029 — Update Employee Salary
-- ============================================================
--
-- Problem:
-- Update the salary of the employee whose employee_id is 3
-- and set the salary to 75000.
--
-- ============================================================

-- Solution:

UPDATE company.practice_employees
SET salary = 100000
WHERE employee_id = 3;