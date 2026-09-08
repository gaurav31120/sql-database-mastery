-- ============================================================
-- P030 — Increase IT Employee Salaries by 10%
-- ============================================================
--
-- Problem:
-- Increase the salary of every employee in the IT department
-- by 10%.
--
-- ============================================================

-- Solution:

UPDATE company.practice_employees
SET salary = salary * 1.10
WHERE department_id = (
    SELECT department_id
    FROM company.practice_departments
    WHERE department_name = 'IT'
);