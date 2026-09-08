-- ============================================================
-- P027 — Insert 10 Employees
-- ============================================================
--
-- Problem:
-- Insert 10 employees into the practice_employees table.
--
-- ============================================================

-- Solution:

-- ============================================================
-- P027 — Insert 10 Employees
-- ============================================================
--
-- Problem:
-- Insert 10 employees into the practice_employees table.
--
-- ============================================================

-- Solution:

INSERT INTO company.practice_employees
    (employee_id, first_name, last_name, email, salary, department_id, joining_date)
VALUES
    (1, 'Aarav', 'Sharma', 'aarav.sharma@gmail.com', 65000.00, 1, '2022-01-15'),
    (2, 'Ananya', 'Kumar', 'ananya.kumar@gmail.com', 72000.00, 2, '2021-06-20'),
    (3, 'Rohan', 'Singh', 'rohan.singh@gmail.com', 58000.00, 2, '2023-03-10'),
    (4, 'Priya', 'Verma', 'priya.verma@gmail.com', 85000.00, 3, '2020-11-05'),
    (5, 'Karan', 'Gupta', 'karan.gupta@gmail.com', 62000.00, 4, '2022-08-12'),
    (6, 'Neha', 'Mishra', 'neha.mishra@gmail.com', 91000.00, 4, '2019-04-18'),
    (7, 'Arjun', 'Patel', 'arjun.patel@gmail.com', 78000.00, 5, '2021-12-01'),
    (8, 'Sneha', 'Shah', 'sneha.shah@gmail.com', 69000.00, 5, '2023-01-25'),
    (9, 'Gaurav', 'Kumar', 'gaurav.kumar@gmail.com', 105000.00, 1, '2018-07-09'),
    (10, 'Kavya', 'Reddy', 'kavya.reddy@gmail.com', 74000.00, 3, '2022-05-16');