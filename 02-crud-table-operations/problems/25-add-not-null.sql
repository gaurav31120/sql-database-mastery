-- ============================================================
-- P025 — Add NOT NULL
-- ============================================================
--
-- Problem:
-- Add a NOT NULL constraint to the first_name column
-- of the practice_employees table.
--
-- ============================================================

-- Solution:

ALTER TABLE company.practice_employees
ALTER COLUMN first_name SET NOT NULL;