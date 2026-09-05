-- ============================================
-- COMPANY DATABASE - PRACTICE QUERIES
-- ============================================

-- P001: Display all departments
SELECT *
FROM company.departments
ORDER BY department_id;


-- Verify the number of departments
SELECT COUNT(*) AS total_departments
FROM company.departments;

-- Verify employee count
SELECT COUNT(*) AS total_employees
FROM company.employees;

-- Preview employees
SELECT *
FROM company.employees
ORDER BY employee_id
LIMIT 10;