-- ============================================================
-- P028 — Insert 5 Departments
-- ============================================================
--
-- Problem:
-- Insert 5 departments into the practice_departments table.
--
-- ============================================================

-- Solution:

INSERT INTO company.practice_departments
    (department_id, department_name, location, budget)
VALUES
    (6, 'Engineering', 'Bangalore', 5000000.00),
    (7, 'Product', 'Hyderabad', 4000000.00),
    (8, 'Operations', 'Pune', 3500000.00),
    (9, 'Customer Support', 'Mumbai', 3000000.00),
    (10, 'Research', 'Delhi', 4500000.00);