-- ============================================================
-- P009 — Find employees belonging to IT or HR
-- ============================================================
--
-- Problem:
-- Find employees belonging to IT or HR.
--
-- ============================================================

-- Solution:

SELECT employee_id, first_name, last_name
FROM company.employees AS emp, company.departments AS dept
WHERE emp.department_id = dept.department_id
  AND (
      dept.department_name = 'IT'
      OR dept.department_name = 'HR'
  );