-- ============================================================
-- P026 — Add UNIQUE Constraint on Email
-- ============================================================
--
-- Problem:
-- Add a UNIQUE constraint to the email column
-- of the practice_employees table.
--
-- ============================================================

-- Solution:

ALTER TABLE company.practice_employees
ADD CONSTRAINT unique_email
UNIQUE (email);