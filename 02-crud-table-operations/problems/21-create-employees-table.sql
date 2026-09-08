-- ============================================================
-- P021 — Create employees table
-- ============================================================
--
-- Problem:
-- Create an employees table.
--
-- ============================================================

-- Solution:

CREATE TABLE company.practice_employees 
(
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(150),
    salary NUMERIC(12,2),
    department_id INT,
    joining_date DATE
);