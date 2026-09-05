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