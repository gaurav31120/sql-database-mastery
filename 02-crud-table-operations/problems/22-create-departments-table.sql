-- ============================================================
-- P022 — Create departments table
-- ============================================================
--
-- Problem:
-- Create a departments table with the following columns:
-- department_id, department_name, location, budget.
--
-- Use appropriate PostgreSQL datatypes.
-- Do NOT add constraints yet.
--
-- ============================================================

-- Solution:

CREATE TABLE company.practice_departments (
    department_id INT,
    department_name VARCHAR(50),
    location VARCHAR(50),
    budget NUMERIC(12,2)
);