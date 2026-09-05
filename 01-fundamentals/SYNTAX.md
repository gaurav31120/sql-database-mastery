# SQL & PostgreSQL Syntax Reference

Quick syntax reference for SQL Fundamentals and PostgreSQL.

---

# 1. Create Database

```sql
CREATE DATABASE database_name;
```

Example:

```sql
CREATE DATABASE backend_lab;
```

---

# 2. Connect / Use Database

In PostgreSQL, select the database through pgAdmin or your client.

```text
backend_lab
```

Then execute SQL inside its Query Tool.

---

# 3. Create Schema

```sql
CREATE SCHEMA schema_name;
```

Example:

```sql
CREATE SCHEMA company;
```

Safer version:

```sql
CREATE SCHEMA IF NOT EXISTS company;
```

---

# 4. Create Table

Basic syntax:

```sql
CREATE TABLE schema_name.table_name (
    column_name DATA_TYPE,
    column_name DATA_TYPE
);
```

Example:

```sql
CREATE TABLE company.departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    budget NUMERIC(14,2)
);
```

---

# 5. Common Data Types

```sql
INTEGER
BIGINT
NUMERIC(precision, scale)
VARCHAR(length)
TEXT
BOOLEAN
DATE
TIMESTAMP
TIMESTAMPTZ
```

Examples:

```sql
employee_id INTEGER

salary NUMERIC(12,2)

first_name VARCHAR(50)

description TEXT

is_active BOOLEAN

joining_date DATE

created_at TIMESTAMPTZ
```

---

# 6. Primary Key

Single-column primary key:

```sql
column_name DATA_TYPE PRIMARY KEY
```

Example:

```sql
employee_id SERIAL PRIMARY KEY
```

Table-level syntax:

```sql
PRIMARY KEY (column_name)
```

Composite primary key:

```sql
PRIMARY KEY (column1, column2)
```

Example:

```sql
PRIMARY KEY (employee_id, project_id)
```

---

# 7. Foreign Key

Inline:

```sql
column_name DATA_TYPE
    REFERENCES other_table(other_column)
```

Example:

```sql
department_id INT
    REFERENCES company.departments(department_id)
```

Table-level:

```sql
FOREIGN KEY (column_name)
REFERENCES other_table(other_column)
```

---

# 8. NOT NULL

```sql
column_name DATA_TYPE NOT NULL
```

Example:

```sql
first_name VARCHAR(50) NOT NULL
```

---

# 9. UNIQUE

```sql
column_name DATA_TYPE UNIQUE
```

Example:

```sql
email VARCHAR(150) UNIQUE
```

---

# 10. DEFAULT

```sql
column_name DATA_TYPE DEFAULT value
```

Example:

```sql
status VARCHAR(20) DEFAULT 'ACTIVE'
```

---

# 11. CHECK

```sql
column_name DATA_TYPE CHECK (condition)
```

Example:

```sql
salary NUMERIC(12,2)
CHECK (salary > 0)
```

---

# 12. INSERT

Basic syntax:

```sql
INSERT INTO schema_name.table_name
(column1, column2, column3)
VALUES
(value1, value2, value3);
```

Example:

```sql
INSERT INTO company.departments
(department_name, location, budget)
VALUES
('Engineering', 'Bangalore', 5000000);
```

---

# 13. INSERT Multiple Rows

```sql
INSERT INTO table_name
(column1, column2)
VALUES
(value1, value2),
(value3, value4),
(value5, value6);
```

---

# 14. INSERT Using SELECT

```sql
INSERT INTO table_name
(column1, column2)
SELECT
    expression1,
    expression2
FROM source_table;
```

Example:

```sql
INSERT INTO company.departments
(department_name, location)
SELECT
    'Department ' || gs,
    'Bangalore'
FROM generate_series(1, 20) AS gs;
```

---

# 15. Generate Series

Generate numbers:

```sql
SELECT *
FROM generate_series(1, 10);
```

Generate rows:

```sql
FROM generate_series(1, 5000) AS gs
```

Generate dates:

```sql
SELECT *
FROM generate_series(
    DATE '2025-01-01',
    DATE '2025-01-10',
    INTERVAL '1 day'
);
```

---

# 16. SELECT

Basic:

```sql
SELECT column1, column2
FROM table_name;
```

Example:

```sql
SELECT first_name, salary
FROM company.employees;
```

---

# 17. SELECT All Columns

```sql
SELECT *
FROM table_name;
```

Example:

```sql
SELECT *
FROM company.employees;
```

---

# 18. SELECT DISTINCT

```sql
SELECT DISTINCT column_name
FROM table_name;
```

Example:

```sql
SELECT DISTINCT job_title
FROM company.employees;
```

Multiple columns:

```sql
SELECT DISTINCT column1, column2
FROM table_name;
```

---

# 19. Column Alias

```sql
SELECT column_name AS alias_name
FROM table_name;
```

Example:

```sql
SELECT
    first_name AS employee_name,
    salary AS monthly_salary
FROM company.employees;
```

---

# 20. Expression / Calculation

```sql
SELECT
    column1,
    column1 * 12 AS calculated_column
FROM table_name;
```

Example:

```sql
SELECT
    first_name,
    salary,
    salary * 12 AS annual_salary
FROM company.employees;
```

---

# 21. Comments

Single-line:

```sql
-- comment
```

Multi-line:

```sql
/*
   comment
*/
```

---

# 22. COUNT

Basic syntax:

```sql
SELECT COUNT(*)
FROM table_name;
```

With alias:

```sql
SELECT COUNT(*) AS total_records
FROM table_name;
```

Example:

```sql
SELECT COUNT(*) AS total_employees
FROM company.employees;
```

---

# 23. Fully Qualified Table Name

Syntax:

```sql
schema_name.table_name
```

Example:

```sql
company.employees
```

Query:

```sql
SELECT *
FROM company.employees;
```

---

# 24. Table Alias

Basic syntax:

```sql
SELECT alias.column_name
FROM table_name AS alias;
```

Example:

```sql
SELECT e.first_name, e.salary
FROM company.employees AS e;
```

`AS` can be omitted:

```sql
FROM company.employees e;
```

---

# 25. SQL Statement

Basic structure:

```sql
SELECT ...
FROM ...
WHERE ...;
```

A semicolon terminates the statement:

```sql
SELECT *
FROM company.employees;
```

---

# 26. Common Query Structure

As we learn more SQL, queries will follow this structure:

```sql
SELECT ...
FROM ...
WHERE ...
GROUP BY ...
HAVING ...
ORDER BY ...
LIMIT ...;
```

Not every clause is required.

---

# 27. Logical Execution Order

Although written like this:

```sql
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT
```

SQL logically processes approximately:

```text
FROM
WHERE
GROUP BY
HAVING
SELECT
DISTINCT
ORDER BY
LIMIT
```

---

# 28. CREATE TABLE — Complete Pattern

```sql
CREATE TABLE schema_name.table_name (
    id DATA_TYPE PRIMARY KEY,
    column1 DATA_TYPE NOT NULL,
    column2 DATA_TYPE UNIQUE,
    column3 DATA_TYPE,
    foreign_key_id DATA_TYPE REFERENCES other_table(id),
    column4 DATA_TYPE DEFAULT default_value,
    column5 DATA_TYPE CHECK (condition)
);
```

---

# 29. Our Company Tables

### Departments

```sql
CREATE TABLE company.departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100),
    budget NUMERIC(14,2)
);
```

### Employees

```sql
CREATE TABLE company.employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    salary NUMERIC(12,2) NOT NULL,
    department_id INT REFERENCES company.departments(department_id),
    manager_id INT,
    joining_date DATE NOT NULL,
    job_title VARCHAR(100),
    employment_status VARCHAR(30)
);
```

### Projects

```sql
CREATE TABLE company.projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(150) NOT NULL UNIQUE,
    department_id INT REFERENCES company.departments(department_id),
    budget NUMERIC(14,2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    project_status VARCHAR(30) NOT NULL
);
```

### Employee Projects

```sql
CREATE TABLE company.employee_projects (
    employee_id INT REFERENCES company.employees(employee_id),
    project_id INT REFERENCES company.projects(project_id),
    assigned_date DATE NOT NULL,
    role VARCHAR(100),
    hours_allocated INT,
    PRIMARY KEY (employee_id, project_id)
);
```

---

# 30. Verification Queries

Count rows:

```sql
SELECT COUNT(*)
FROM company.employees;
```

Preview rows:

```sql
SELECT *
FROM company.employees
LIMIT 10;
```

Order rows:

```sql
SELECT *
FROM company.employees
ORDER BY employee_id;
```

---

# 31. Quick Syntax Cheat Sheet

```text
CREATE DATABASE
CREATE SCHEMA
CREATE TABLE

PRIMARY KEY
FOREIGN KEY
NOT NULL
UNIQUE
DEFAULT
CHECK

INSERT INTO
VALUES
SELECT
DISTINCT
FROM

COUNT(*)
AS
LIMIT
ORDER BY
```

---

# 32. Query Skeleton

Remember this basic pattern:

```sql
SELECT columns
FROM schema.table
WHERE condition
GROUP BY columns
HAVING condition
ORDER BY columns
LIMIT number;
```

We will gradually add each clause as we learn it.

---

# 33. PostgreSQL Data Generation Pattern

For large test data:

```sql
INSERT INTO table_name (columns)
SELECT
    expressions
FROM generate_series(1, number) AS gs;
```

Example:

```sql
INSERT INTO company.employees
(first_name, last_name)
SELECT
    'Employee' || gs,
    'Last' || gs
FROM generate_series(1, 5000) AS gs;
```

---

# 34. Important Reminder

`schema.sql`:

```text
Database structure
```

`seed.sql`:

```text
Data generation / insertion
```

`queries.sql`:

```text
Practice / verification / interview queries
```

`Notes.md`:

```text
Concepts + explanations + interview knowledge
```

`Syntax.md`:

```text
Quick syntax reference
```
