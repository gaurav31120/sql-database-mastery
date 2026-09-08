-- ============================================================
-- P013 — Find employees whose department is not IT
-- ============================================================
--
-- Problem:
-- Find employees whose department is not IT.
--
-- ============================================================

-- Solution:

SELECT employee_id
FROM company.employees AS emp, company.departments AS dept
WHERE emp.department_id = dept.department_id
  AND dept.department_name <> 'IT';