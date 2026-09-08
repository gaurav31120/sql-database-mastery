# SQL CRUD + Table Operations — Notes

## 1. SQL Command Categories

### DQL — Data Query Language

Used to retrieve data.

```sql
SELECT
```

Example:

```sql
SELECT first_name, salary
FROM company.employees;
```

---

### DDL — Data Definition Language

Used to define or modify database structures.

Important commands:

```sql
CREATE
ALTER
DROP
TRUNCATE
```

Examples:

```sql
CREATE TABLE ...
ALTER TABLE ...
DROP TABLE ...
TRUNCATE TABLE ...
```

DDL primarily deals with the structure of database objects.

---

### DML — Data Manipulation Language

Used to modify data stored inside tables.

```sql
INSERT
UPDATE
DELETE
```

Examples:

```sql
INSERT INTO employees ...
```

```sql
UPDATE employees ...
```

```sql
DELETE FROM employees ...
```

---

### TCL — Transaction Control Language

Used to control database transactions.

```sql
COMMIT
ROLLBACK
SAVEPOINT
```

---

### DCL — Data Control Language

Used to manage permissions.

```sql
GRANT
REVOKE
```

---

## 2. DDL vs DML vs DQL

| Category | Commands | Purpose |
|---|---|---|
| DQL | SELECT | Read data |
| DDL | CREATE, ALTER, DROP, TRUNCATE | Define/change database structure |
| DML | INSERT, UPDATE, DELETE | Modify table data |
| TCL | COMMIT, ROLLBACK, SAVEPOINT | Control transactions |
| DCL | GRANT, REVOKE | Manage permissions |

### Interview point

```text
DDL → Structure
DML → Data
DQL → Query/read
TCL → Transaction
DCL → Permission
```

---

## 3. CREATE TABLE

`CREATE TABLE` is used to create a new table.

### General Syntax

```sql
CREATE TABLE table_name (
    column1 data_type,
    column2 data_type,
    column3 data_type
);
```

Example:

```sql
CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary NUMERIC(12,2)
);
```

This creates a table named `employees` with four columns.

---

## 4. Column Definition

A column definition normally contains:

```text
column_name + data_type + optional constraints
```

Example:

```sql
employee_id INT
```

Later, constraints can be added:

```sql
employee_id INT PRIMARY KEY
```

Another example:

```sql
first_name VARCHAR(50) NOT NULL
```

For P021, we focus on creating columns.

Constraints are introduced separately in the later problems.

---

## 5. PostgreSQL Data Types

Important PostgreSQL data types for backend development:

```text
INT
BIGINT
VARCHAR
TEXT
NUMERIC
DECIMAL
DATE
TIMESTAMP
BOOLEAN
```

---

## 6. INT

`INT` stores whole numbers.

```sql
employee_id INT
```

Example values:

```text
1
25
1000
5000
```

Useful for IDs and other integer values.

---

## 7. BIGINT

`BIGINT` stores larger whole numbers than `INT`.

Example:

```sql
account_number BIGINT
```

Use it when the possible value range exceeds what `INT` can safely represent.

---

## 8. VARCHAR

`VARCHAR(n)` stores variable-length character strings.

```sql
first_name VARCHAR(50)
```

The `50` specifies the maximum number of characters.

Example:

```text
Aarav
Ananya
Rahul
Gaurav
```

Another example:

```sql
email VARCHAR(150)
```

---

## 9. TEXT

`TEXT` stores variable-length text without specifying a maximum length.

Example:

```sql
description TEXT
```

Useful for longer textual information.

Example:

```sql
project_description TEXT
```

---

## 10. VARCHAR vs TEXT

For PostgreSQL, both `VARCHAR` and `TEXT` are commonly used for strings.

Example:

```sql
name VARCHAR(100)
```

and:

```sql
name TEXT
```

are both valid.

Use `VARCHAR(n)` when you intentionally want to express a maximum length.

Use `TEXT` when no specific maximum length is required.

---

## 11. NUMERIC

`NUMERIC` stores exact numeric values.

Syntax:

```sql
NUMERIC(precision, scale)
```

Example:

```sql
salary NUMERIC(12,2)
```

Meaning:

```text
12 → total number of digits
2  → digits after decimal point
```

Example values:

```text
50000.00
75000.50
125000.75
```

---

## 12. Why NUMERIC is Important

For financial or monetary values, exact numeric types are generally preferred over floating-point types.

Examples:

```sql
salary NUMERIC(12,2)
price NUMERIC(10,2)
account_balance NUMERIC(15,2)
```

This is especially important in backend applications dealing with money.

---

## 13. DATE

`DATE` stores a calendar date.

Example:

```sql
joining_date DATE
```

Example value:

```text
2026-09-08
```

---

## 14. TIMESTAMP

`TIMESTAMP` stores date and time.

Example:

```sql
created_at TIMESTAMP
```

Example:

```text
2026-09-08 20:15:00
```

---

## 15. BOOLEAN

`BOOLEAN` stores true/false values.

Example:

```sql
active BOOLEAN
```

Possible values:

```text
TRUE
FALSE
NULL
```

---

## 16. INSERT

`INSERT` adds rows to a table.

### Single Row

```sql
INSERT INTO table_name
    (column1, column2, column3)
VALUES
    (value1, value2, value3);
```

Example:

```sql
INSERT INTO employees
    (first_name, last_name, salary)
VALUES
    ('Aarav', 'Sharma', 75000);
```

### Multiple Rows

```sql
INSERT INTO employees
    (first_name, last_name, salary)
VALUES
    ('Aarav', 'Sharma', 75000),
    ('Ankit', 'Kumar', 65000),
    ('Rohan', 'Singh', 85000);
```

---

## 17. UPDATE

`UPDATE` modifies existing rows.

### Syntax

```sql
UPDATE table_name
SET column_name = value
WHERE condition;
```

Example:

```sql
UPDATE company.employees
SET salary = 80000
WHERE employee_id = 10;
```

### ⚠️ Important

Always carefully check the `WHERE` clause.

Without `WHERE`:

```sql
UPDATE company.employees
SET salary = 80000;
```

Every employee's salary will be changed.

---

## 18. DELETE

`DELETE` removes rows from a table.

### Syntax

```sql
DELETE FROM table_name
WHERE condition;
```

Example:

```sql
DELETE FROM company.employees
WHERE employee_id = 10;
```

Without `WHERE`:

```sql
DELETE FROM company.employees;
```

All rows are deleted, but the table itself remains.

---

## 19. ALTER TABLE

`ALTER TABLE` changes an existing table's structure.

### Add Column

```sql
ALTER TABLE table_name
ADD COLUMN column_name data_type;
```

Example:

```sql
ALTER TABLE employees
ADD COLUMN phone_number VARCHAR(20);
```

### Drop Column

```sql
ALTER TABLE table_name
DROP COLUMN column_name;
```

### Rename Column

```sql
ALTER TABLE table_name
RENAME COLUMN old_name TO new_name;
```

### Change Data Type

```sql
ALTER TABLE table_name
ALTER COLUMN column_name TYPE new_data_type;
```

---

## 20. DROP TABLE

`DROP TABLE` removes the table itself.

```sql
DROP TABLE table_name;
```

This removes:

```text
Table structure
+
Table data
```

⚠️ Use carefully.

---

## 21. TRUNCATE

`TRUNCATE` removes all rows while keeping the table structure.

```sql
TRUNCATE TABLE table_name;
```

---

## 22. DELETE vs TRUNCATE vs DROP

### DELETE

```sql
DELETE FROM employees
WHERE employee_id = 10;
```

Removes selected rows.

The table remains.

---

### TRUNCATE

```sql
TRUNCATE TABLE employees;
```

Removes all rows.

The table structure remains.

---

### DROP

```sql
DROP TABLE employees;
```

Removes the table itself.

### Remember

```text
DELETE     → selected rows
TRUNCATE   → all rows
DROP       → table itself
```

This distinction is frequently asked in interviews.

---

## 23. CREATE TABLE AS

`CREATE TABLE AS` creates a new table from the result of a query.

### Syntax

```sql
CREATE TABLE new_table AS
SELECT ...
FROM ...;
```

Example:

```sql
CREATE TABLE high_salary_employees AS
SELECT employee_id, first_name, salary
FROM company.employees
WHERE salary > 100000;
```

This creates a new table containing the result of the query.

### Important

`CREATE TABLE AS` copies the query result into a new table.

It should not be confused with creating an identical table definition including all constraints and indexes.

---

## 24. Constraints Preview

Important constraints we will learn in this level:

```text
PRIMARY KEY
FOREIGN KEY
NOT NULL
UNIQUE
CHECK
DEFAULT
```

These constraints help enforce data integrity.

Examples:

```sql
employee_id INT PRIMARY KEY
```

```sql
first_name VARCHAR(50) NOT NULL
```

```sql
email VARCHAR(150) UNIQUE
```

```sql
salary NUMERIC(12,2) CHECK (salary > 0)
```

We will study each one in the appropriate problem.

---

## 25. Primary Key Preview

A primary key uniquely identifies each row.

Example:

```sql
employee_id INT PRIMARY KEY
```

Important properties:

- Unique
- Cannot be NULL
- Identifies a row

Example:

```text
employee_id
-----------
1
2
3
4
```

No two rows can have the same primary key.

---

## 26. Foreign Key Preview

A foreign key creates a relationship between tables.

Example:

```sql
department_id INT REFERENCES departments(department_id)
```

This can connect:

```text
employees
    ↓
departments
```

Example:

```text
employees.department_id
        ↓
departments.department_id
```

Foreign keys help maintain referential integrity.

---

## 27. NOT NULL Preview

`NOT NULL` means a column must have a value.

Example:

```sql
first_name VARCHAR(50) NOT NULL
```

The database will reject an INSERT that does not provide a value for this column, unless another mechanism supplies one.

---

## 28. UNIQUE Preview

`UNIQUE` prevents duplicate values.

Example:

```sql
email VARCHAR(150) UNIQUE
```

This is commonly used for values such as:

```text
email
username
phone number
```

depending on application requirements.

---

## 29. CHECK Preview

`CHECK` enforces a condition.

Example:

```sql
salary NUMERIC(12,2)
    CHECK (salary >= 0)
```

This prevents values that violate the condition.

---

## 30. DEFAULT Preview

`DEFAULT` provides a value when an INSERT does not provide one.

Example:

```sql
employment_status VARCHAR(30)
    DEFAULT 'ACTIVE'
```

If no employment status is supplied, PostgreSQL can use:

```text
ACTIVE
```

---

# 31. CREATE TABLE Example for Backend

A basic employee table might look like:

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

This is intentionally a simple version.

We will add constraints in the upcoming problems.

---

# 32. Safe Practice Database Strategy

Our main company database contains thousands of rows.

Do not experiment destructively with:

```text
company.employees
company.departments
company.projects
company.employee_projects
```

when learning CREATE, ALTER, DROP, DELETE, etc.

For table-operation exercises, use dedicated practice tables where appropriate.

This protects the main interview dataset.

---

# 33. Backend Relevance

These SQL operations are directly relevant to Java/Spring Boot.

A simplified architecture looks like:

```text
Spring Boot Application
        ↓
JPA / Hibernate
        ↓
SQL
        ↓
PostgreSQL
        ↓
Tables
```

Even when using JPA/Hibernate, a backend developer should understand what happens at the database level.

For example:

```java
@Entity
class Employee {
    ...
}
```

can ultimately correspond to a database table.

Understanding SQL makes it easier to:

- Design entities
- Understand relationships
- Debug database issues
- Write efficient queries
- Understand Hibernate-generated SQL
- Optimize application performance
- Work with transactions
- Diagnose production problems

---

# 34. Common Mistakes

## Mistake 1 — Missing Data Type

Incorrect:

```sql
CREATE TABLE employees (
    employee_id,
    first_name
);
```

Correct:

```sql
CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(50)
);
```

---

## Mistake 2 — UPDATE Without WHERE

Dangerous:

```sql
UPDATE employees
SET salary = 50000;
```

This modifies every row.

---

## Mistake 3 — DELETE Without WHERE

Dangerous:

```sql
DELETE FROM employees;
```

This removes all rows.

---

## Mistake 4 — Confusing DROP, TRUNCATE and DELETE

Remember:

```text
DELETE     → rows
TRUNCATE   → all rows
DROP       → table
```

---

## Mistake 5 — Confusing NULL With Empty String

These are different:

```text
NULL
```

means no/unknown value.

While:

```text
''
```

is an empty string.

Example:

```sql
first_name = ''
```

is not the same as:

```sql
first_name IS NULL
```

---

# 35. Interview Questions to Know

You should be able to explain:

### Q1. What is DDL?

DDL defines and modifies database structures.

Examples:

```text
CREATE
ALTER
DROP
TRUNCATE
```

---

### Q2. What is DML?

DML modifies data.

Examples:

```text
INSERT
UPDATE
DELETE
```

---

### Q3. Difference between DELETE and TRUNCATE?

```text
DELETE
→ removes rows
→ can use WHERE

TRUNCATE
→ removes all rows
→ keeps table structure
→ cannot be used like DELETE with a row-level WHERE condition
```

---

### Q4. Difference between DROP and TRUNCATE?

```text
DROP
→ removes table structure and data

TRUNCATE
→ removes data but keeps table structure
```

---

### Q5. What is a primary key?

A primary key uniquely identifies a row and cannot contain NULL.

---

### Q6. What is a foreign key?

A foreign key references a key in another table and helps maintain referential integrity.

---

### Q7. Why use NUMERIC for money?

Because exact numeric representation is important for financial values.

---

### Q8. What happens if UPDATE has no WHERE?

All rows matching the table are updated.

---

### Q9. What happens if DELETE has no WHERE?

All rows in the table are deleted.

---

### Q10. What does CREATE TABLE AS do?

It creates a new table using the result of a query.

---

# 36. Level 2 Learning Order

We will solve these problems in order:

```text
P021 → CREATE employees table
P022 → CREATE departments table
P023 → PRIMARY KEY
P024 → FOREIGN KEY
P025 → NOT NULL
P026 → UNIQUE
P027 → INSERT employees
P028 → INSERT departments
P029 → UPDATE salary
P030 → Increase IT salary by 10%
P031 → Change department
P032 → DELETE employee
P033 → DELETE department employees
P034 → ADD email column
P035 → ADD joining_date
P036 → RENAME column
P037 → CHANGE datatype
P038 → DEFAULT value
P039 → CHECK constraint
P040 → CREATE TABLE AS
```

Each problem will be:

```text
Learn concept
    ↓
Understand syntax
    ↓
Create problem .sql file
    ↓
Solve independently
    ↓
Review
    ↓
Commit solution
    ↓
Update PROBLEMS.md
    ↓
Commit tracker
    ↓
Push
```

---

# 37. Final Revision Cheat Sheet

```text
CREATE TABLE
→ create table

ALTER TABLE
→ modify table structure

INSERT
→ add rows

UPDATE
→ modify rows

DELETE
→ remove rows

TRUNCATE
→ remove all rows

DROP TABLE
→ remove table

CREATE TABLE AS
→ create table from query result

PRIMARY KEY
→ uniquely identify row

FOREIGN KEY
→ establish relationship

NOT NULL
→ value required

UNIQUE
→ prevent duplicate values

CHECK
→ enforce condition

DEFAULT
→ provide automatic value
```

---

# 38. Key Backend Mindset

As a Java/Spring Boot backend developer, don't think of SQL as just writing queries.

Think in terms of:

```text
Application
    ↓
Business logic
    ↓
Entities
    ↓
Relationships
    ↓
Database tables
    ↓
Constraints
    ↓
Queries
    ↓
Indexes
    ↓
Transactions
    ↓
Performance
```

The goal of this SQL track is to understand the complete database side of backend development, not merely memorize SQL syntax.