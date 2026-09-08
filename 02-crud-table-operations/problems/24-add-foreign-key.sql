-- ============================================================
-- P024 — Add Foreign Key
-- ============================================================
--
-- Problem:
-- Add a FOREIGN KEY on practice_employees.department_id
-- that references practice_departments.department_id.
--
-- ============================================================

-- Solution:

ALTER TABLE company.practice_employees
ADD CONSTRAINT fk_emp_department_id
FOREIGN KEY (department_id)
REFERENCES company.practice_departments(department_id);