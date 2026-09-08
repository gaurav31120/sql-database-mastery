# SQL CRUD + Table Operations — Syntax

> Quick syntax/reference sheet for P021–P040.

---

# 1. CREATE TABLE

## Basic Syntax

```sql
CREATE TABLE table_name (
    column1 data_type,
    column2 data_type,
    column3 data_type
);
```

## Example

```sql
CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary NUMERIC(12,2)
);
```

---

# 2. PostgreSQL Data Types

## Integer

```sql
INT
```

Example:

```sql
employee_id INT
```

For larger integers:

```sql
BIGINT
```

Example:

```sql
account_number BIGINT
```

---

## String

```sql
VARCHAR(length)
```

Example:

```sql
first_name VARCHAR(50)
email VARCHAR(150)
```

Unlimited-length text:

```sql
TEXT
```

Example:

```sql
description TEXT
```

---

## Exact Decimal

```sql
NUMERIC(precision, scale)
```

Example:

```sql
salary NUMERIC(12,2)
```

Meaning:

```text
12 → total digits
2  → digits after decimal
```

---

## Date

```sql
DATE
```

Example:

```sql
joining_date DATE
```

---

## Date + Time

```sql
TIMESTAMP
```

Example:

```sql
created_at TIMESTAMP
```

---

## Boolean

```sql
BOOLEAN
```

Example:

```sql
active BOOLEAN
```

Values:

```sql
TRUE
FALSE
NULL
```

---

# 3. CREATE TABLE With Multiple Columns

```sql
CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(150),
    salary NUMERIC(12,2),
    department_id INT,
    joining_date DATE
);
```

---

# 4. PRIMARY KEY

## During Table Creation

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    salary NUMERIC(12,2)
);
```

## Add Later

```sql
ALTER TABLE employees
ADD PRIMARY KEY (employee_id);
```

### Rule

A primary key:

```text
UNIQUE
NOT NULL
```

and identifies each row.

---

# 5. FOREIGN KEY

## During Table Creation

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);
```

## Inline Syntax

```sql
department_id INT
    REFERENCES departments(department_id)
```

## Add Later

```sql
ALTER TABLE employees
ADD FOREIGN KEY (department_id)
REFERENCES departments(department_id);
```

---

# 6. NOT NULL

## During Creation

```sql
CREATE TABLE employees (
    first_name VARCHAR(50) NOT NULL
);
```

## Add Later

```sql
ALTER TABLE employees
ALTER COLUMN first_name SET NOT NULL;
```

## Remove NOT NULL

```sql
ALTER TABLE employees
ALTER COLUMN first_name DROP NOT NULL;
```

---

# 7. UNIQUE

## During Creation

```sql
CREATE TABLE employees (
    email VARCHAR(150) UNIQUE
);
```

## Add Later

```sql
ALTER TABLE employees
ADD CONSTRAINT unique_employee_email
UNIQUE (email);
```

---

# 8. CHECK

## During Creation

```sql
CREATE TABLE employees (
    salary NUMERIC(12,2)
        CHECK (salary >= 0)
);
```

## Add Later

```sql
ALTER TABLE employees
ADD CONSTRAINT salary_check
CHECK (salary >= 0);
```

---

# 9. DEFAULT

## During Creation

```sql
CREATE TABLE employees (
    employment_status VARCHAR(30)
        DEFAULT 'ACTIVE'
);
```

## Add Later

```sql
ALTER TABLE employees
ALTER COLUMN employment_status
SET DEFAULT 'ACTIVE';
```

## Remove Default

```sql
ALTER TABLE employees
ALTER COLUMN employment_status
DROP DEFAULT;
```

---

# 10. INSERT — Single Row

## Syntax

```sql
INSERT INTO table_name
    (column1, column2, column3)
VALUES
    (value1, value2, value3);
```

## Example

```sql
INSERT INTO company.employees
    (first_name, last_name, salary)
VALUES
    ('Aarav', 'Sharma', 75000);
```

---

# 11. INSERT — Multiple Rows

```sql
INSERT INTO company.employees
    (first_name, last_name, salary)
VALUES
    ('Aarav', 'Sharma', 75000),
    ('Ankit', 'Kumar', 65000),
    ('Rohan', 'Singh', 85000);
```

---

# 12. INSERT Without Listing All Columns

Possible when the values correspond exactly to the table's column order:

```sql
INSERT INTO table_name
VALUES
    (value1, value2, value3);
```

### Recommendation

Prefer explicitly listing columns:

```sql
INSERT INTO table_name
    (column1, column2, column3)
VALUES
    (value1, value2, value3);
```

This is safer and clearer.

---

# 13. INSERT With DEFAULT

If a column has a default:

```sql
CREATE TABLE employees (
    employee_id INT,
    employment_status VARCHAR(30)
        DEFAULT 'ACTIVE'
);
```

You can omit the column:

```sql
INSERT INTO employees
    (employee_id)
VALUES
    (1);
```

The database uses:

```text
ACTIVE
```

---

# 14. UPDATE

## Basic Syntax

```sql
UPDATE table_name
SET column_name = value
WHERE condition;
```

## Example

```sql
UPDATE company.employees
SET salary = 80000
WHERE employee_id = 10;
```

---

# 15. UPDATE Multiple Columns

```sql
UPDATE company.employees
SET
    salary = 80000,
    job_title = 'Senior Engineer'
WHERE employee_id = 10;
```

---

# 16. UPDATE Using Existing Value

```sql
UPDATE company.employees
SET salary = salary + 5000
WHERE employee_id = 10;
```

---

# 17. UPDATE Percentage

Increase salary by 10%:

```sql
UPDATE company.employees
SET salary = salary * 1.10
WHERE department_id = 1;
```

Equivalent concept:

```text
new salary = old salary + 10%
```

---

# 18. UPDATE Without WHERE

```sql
UPDATE company.employees
SET salary = 80000;
```

⚠️ This updates **every row**.

Always verify your `WHERE` condition before executing an UPDATE.

---

# 19. DELETE

## Basic Syntax

```sql
DELETE FROM table_name
WHERE condition;
```

## Example

```sql
DELETE FROM company.employees
WHERE employee_id = 10;
```

---

# 20. DELETE Multiple Rows

```sql
DELETE FROM company.employees
WHERE department_id = 5;
```

All employees satisfying the condition are deleted.

---

# 21. DELETE All Rows

```sql
DELETE FROM company.employees;
```

The table remains, but all rows are removed.

---

# 22. DROP TABLE

```sql
DROP TABLE table_name;
```

Example:

```sql
DROP TABLE employees;
```

This removes the table itself.

---

# 23. DROP TABLE IF EXISTS

Useful when a table may or may not exist.

```sql
DROP TABLE IF EXISTS employees;
```

---

# 24. TRUNCATE

```sql
TRUNCATE TABLE employees;
```

Removes all rows while keeping the table structure.

---

# 25. DELETE vs TRUNCATE vs DROP

```text
DELETE
→ removes rows
→ WHERE can be used
→ table remains

TRUNCATE
→ removes all rows
→ table remains

DROP
→ removes table
→ structure and data are removed
```

Quick memory:

```text
DELETE     → selected/all rows
TRUNCATE   → all rows
DROP       → table
```

---

# 26. ALTER TABLE — ADD COLUMN

```sql
ALTER TABLE table_name
ADD COLUMN column_name data_type;
```

Example:

```sql
ALTER TABLE company.employees
ADD COLUMN phone_number VARCHAR(20);
```

---

# 27. ALTER TABLE — ADD Column With DEFAULT

```sql
ALTER TABLE employees
ADD COLUMN employment_status VARCHAR(30)
DEFAULT 'ACTIVE';
```

---

# 28. ALTER TABLE — DROP COLUMN

```sql
ALTER TABLE table_name
DROP COLUMN column_name;
```

Example:

```sql
ALTER TABLE company.employees
DROP COLUMN phone_number;
```

⚠️ Dropping a column removes its data.

---

# 29. ALTER TABLE — RENAME COLUMN

```sql
ALTER TABLE table_name
RENAME COLUMN old_name TO new_name;
```

Example:

```sql
ALTER TABLE company.employees
RENAME COLUMN first_name TO given_name;
```

---

# 30. ALTER TABLE — Change Data Type

```sql
ALTER TABLE table_name
ALTER COLUMN column_name
TYPE new_data_type;
```

Example:

```sql
ALTER TABLE employees
ALTER COLUMN salary
TYPE NUMERIC(14,2);
```

If PostgreSQL cannot automatically convert the existing data, you may need `USING`.

Example:

```sql
ALTER TABLE employees
ALTER COLUMN salary TYPE NUMERIC(12,2)
USING salary::NUMERIC(12,2);
```

---

# 31. ALTER TABLE — Add Primary Key

```sql
ALTER TABLE employees
ADD CONSTRAINT employees_pkey
PRIMARY KEY (employee_id);
```

---

# 32. ALTER TABLE — Add Foreign Key

```sql
ALTER TABLE employees
ADD CONSTRAINT employees_department_fk
FOREIGN KEY (department_id)
REFERENCES departments(department_id);
```

---

# 33. ALTER TABLE — Add UNIQUE Constraint

```sql
ALTER TABLE employees
ADD CONSTRAINT employees_email_unique
UNIQUE (email);
```

---

# 34. ALTER TABLE — Add CHECK Constraint

```sql
ALTER TABLE employees
ADD CONSTRAINT employees_salary_check
CHECK (salary >= 0);
```

---

# 35. ALTER TABLE — Set NOT NULL

```sql
ALTER TABLE employees
ALTER COLUMN first_name
SET NOT NULL;
```

---

# 36. ALTER TABLE — Remove NOT NULL

```sql
ALTER TABLE employees
ALTER COLUMN first_name
DROP NOT NULL;
```

---

# 37. ALTER TABLE — Set DEFAULT

```sql
ALTER TABLE employees
ALTER COLUMN employment_status
SET DEFAULT 'ACTIVE';
```

---

# 38. ALTER TABLE — Remove DEFAULT

```sql
ALTER TABLE employees
ALTER COLUMN employment_status
DROP DEFAULT;
```

---

# 39. CREATE TABLE AS

## Basic Syntax

```sql
CREATE TABLE new_table AS
SELECT ...
FROM ...;
```

## Example

```sql
CREATE TABLE high_salary_employees AS
SELECT employee_id, first_name, salary
FROM company.employees
WHERE salary > 100000;
```

---

# 40. CREATE TABLE AS With SELECT *

```sql
CREATE TABLE employee_backup AS
SELECT *
FROM company.employees;
```

This creates a new table containing the query result.

---

# 41. CREATE TABLE AS With WHERE

```sql
CREATE TABLE it_employees AS
SELECT *
FROM company.employees
WHERE department_id = 1;
```

---

# 42. CREATE TABLE IF NOT EXISTS

```sql
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT,
    first_name VARCHAR(50)
);
```

This avoids an error if the table already exists.

---

# 43. Schema-Qualified Table Names

Our practice database uses the `company` schema.

```sql
CREATE TABLE company.practice_employees (
    employee_id INT,
    first_name VARCHAR(50)
);
```

Query:

```sql
SELECT *
FROM company.practice_employees;
```

---

# 44. String Values

Strings use single quotes:

```sql
'Aarav'
'Sharma'
'IT'
'ACTIVE'
```

Example:

```sql
INSERT INTO employees (first_name)
VALUES ('Aarav');
```

---

# 45. Numeric Values

Numeric values do not require quotes:

```sql
75000
50000.50
100
```

Correct:

```sql
salary = 75000
```

Avoid:

```sql
salary = '75000'
```

when a numeric value is intended.

---

# 46. DATE Values

PostgreSQL date literal:

```sql
DATE '2026-09-08'
```

Example:

```sql
INSERT INTO employees
    (first_name, joining_date)
VALUES
    ('Aarav', DATE '2026-09-08');
```

---

# 47. BOOLEAN Values

```sql
TRUE
FALSE
```

Example:

```sql
INSERT INTO users (active)
VALUES (TRUE);
```

---

# 48. NULL Values

Use:

```sql
NULL
```

Example:

```sql
INSERT INTO employees
    (first_name, salary)
VALUES
    ('Aarav', NULL);
```

For checking NULL:

```sql
WHERE salary IS NULL
```

or:

```sql
WHERE salary IS NOT NULL
```

Do not use:

```sql
salary = NULL
```

---

# 49. Naming Convention

For this repository, use:

```text
snake_case
```

Examples:

```text
employee_id
first_name
last_name
department_id
joining_date
employment_status
```

Avoid:

```text
employeeId
FirstName
department-ID
```

for our SQL practice schema.

---

# 50. Safe Workflow for UPDATE

Before:

```sql
UPDATE company.employees
SET salary = salary * 1.10
WHERE department_id = 1;
```

First check:

```sql
SELECT employee_id, salary
FROM company.employees
WHERE department_id = 1;
```

Then perform the UPDATE.

This is a good real-world habit.

---

# 51. Safe Workflow for DELETE

Before:

```sql
DELETE FROM company.employees
WHERE department_id = 5;
```

First check:

```sql
SELECT employee_id, first_name
FROM company.employees
WHERE department_id = 5;
```

Then execute the DELETE.

---

# 52. Useful Inspection Commands

List tables:

```sql
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'company';
```

Inspect columns:

```sql
SELECT
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'company'
  AND table_name = 'employees';
```

Count rows:

```sql
SELECT COUNT(*)
FROM company.employees;
```

---

# 53. Complete Basic Table Example

```sql
CREATE TABLE company.practice_employees (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(150),
    salary NUMERIC(12,2),
    department_id INT,
    joining_date DATE
);
```

Insert:

```sql
INSERT INTO company.practice_employees
    (
        employee_id,
        first_name,
        last_name,
        email,
        salary,
        department_id,
        joining_date
    )
VALUES
    (
        1,
        'Aarav',
        'Sharma',
        'aarav.sharma@example.com',
        75000.00,
        1,
        DATE '2026-01-15'
    );
```

Update:

```sql
UPDATE company.practice_employees
SET salary = 80000
WHERE employee_id = 1;
```

Delete:

```sql
DELETE FROM company.practice_employees
WHERE employee_id = 1;
```

---

# 54. Quick Cheat Sheet

```text
CREATE TABLE
→ Create table

ALTER TABLE
→ Modify table structure

INSERT INTO
→ Add rows

UPDATE
→ Modify existing rows

DELETE FROM
→ Delete rows

TRUNCATE TABLE
→ Delete all rows

DROP TABLE
→ Delete table

CREATE TABLE AS
→ Create table from query result
```

---

# 55. Constraint Cheat Sheet

```text
PRIMARY KEY
→ uniquely identifies each row

FOREIGN KEY
→ references another table

NOT NULL
→ value cannot be NULL

UNIQUE
→ prevents duplicate values

CHECK
→ enforces a condition

DEFAULT
→ provides a value when one isn't supplied
```

---

# 56. Most Important Syntax to Memorize

```sql
CREATE TABLE table_name (
    column_name data_type
);
```

```sql
INSERT INTO table_name
    (column1, column2)
VALUES
    (value1, value2);
```

```sql
UPDATE table_name
SET column_name = value
WHERE condition;
```

```sql
DELETE FROM table_name
WHERE condition;
```

```sql
ALTER TABLE table_name
ADD COLUMN column_name data_type;
```

```sql
ALTER TABLE table_name
DROP COLUMN column_name;
```

```sql
ALTER TABLE table_name
RENAME COLUMN old_name TO new_name;
```

```sql
ALTER TABLE table_name
ALTER COLUMN column_name TYPE new_data_type;
```

```sql
DROP TABLE table_name;
```

```sql
TRUNCATE TABLE table_name;
```

```sql
CREATE TABLE new_table AS
SELECT ...
FROM ...;
```