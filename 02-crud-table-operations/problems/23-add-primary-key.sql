-- ============================================================
-- P023 — Add Primary Key
-- ============================================================
--
-- Problem:
-- Add a PRIMARY KEY to the department_id column
-- of the practice_departments table.
--
-- ============================================================

-- Solution:

ALTER TABLE company.practice_departments
ADD PRIMARY KEY (department_id);