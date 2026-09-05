# SQL & PostgreSQL Fundamentals

This document contains the concepts, syntax, PostgreSQL commands, and practical knowledge learned during the SQL Fundamentals stage.

---

# 1. SQL

## What is SQL?

SQL (Structured Query Language) is used to communicate with relational databases.

SQL is used to:

* Retrieve data
* Insert data
* Update data
* Delete data
* Create tables
* Modify database structures
* Define relationships
* Analyze data

Example:

```sql
SELECT *
FROM company.employees;
```

---

# 2. PostgreSQL

## What is PostgreSQL?

PostgreSQL is an open-source relational database management system (RDBMS).

It supports SQL and provides additional features such as:

* Advanced data types
* Schemas
* JSON/JSONB
* Arrays
* Window functions
* CTEs
* Powerful indexing
* Transactions
* Query optimization
* Extensions

### SQL vs PostgreSQL

| SQL                                                  | PostgreSQL                                    |
| ---------------------------------------------------- | --------------------------------------------- |
| Query language                                       | Database management system                    |
| Defines how we communicate with relational databases | Stores and manages the actual data            |
| Standard language                                    | Implements SQL + PostgreSQL-specific features |

---

# 3. Database

A database is a structured collection of data managed by a database management system.

Our main learning database:

```text
backend_lab
```

We created it using pgAdmin.

---

# 4. Create a Database

A PostgreSQL database can be created using SQL:

```sql
CREATE DATABASE backend_lab;
```

It can also be created through pgAdmin:

```text
Servers
    ↓
PostgreSQL
    ↓
Databases
    ↓
Right Click
    ↓
Create
    ↓
Database
```

---

# 5. Schema

A schema is a logical namespace inside a database.

It helps organize related tables and other database objects.

Our structure:

```text
backend_lab
    ↓
company
    ↓
tables
```

We created the `company` schema:

```sql
CREATE SCHEMA company;
```

---

# 6. Schema vs Database

```text
Database
    ↓
    Schema
        ↓
        Tables
```

Our example:

```text
backend_lab
    └── company
         ├── departments
         ├── employees
         ├── projects
         └── employee_projects
```

A database is a larger container.

A schema is a namespace/organizational layer inside a database.

---

# 7. pgAdmin Query Tool

pgAdmin is a graphical administration tool for PostgreSQL.

The Query Tool allows us to execute SQL statements.

Typical workflow:

```text
pgAdmin
    ↓
backend_lab
    ↓
Query Tool
    ↓
Write SQL
    ↓
Execute / F5
```

### Important

Closing pgAdmin or Query Tool does **not** delete PostgreSQL data.

PostgreSQL stores the actual database data.

The Query Tool is only an interface used to execute SQL.

---

# 8. Create a Table

General syntax:

```sql
CREATE TABLE schema_name.table_name (
    column_name DATA_TYPE CONSTRAINT,
    column_name DATA_TYPE CONSTRAINT
);
```

Example:

```sql
CREATE TABLE company.departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100),
    budget NUMERIC(14,2)
);
```

---

# 9. PostgreSQL Data Types Used

## SERIAL

`SERIAL` automatically generates sequential integer values when rows are inserted.

Example:

```sql
department_id SERIAL PRIMARY KEY
```

Modern PostgreSQL also supports identity columns:

```sql
department_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
```

We will learn identity columns in more detail later.

---

## VARCHAR

Stores variable-length strings.

Example:

```sql
first_name VARCHAR(50)
```

---

## NUMERIC

Used for exact numeric values.

Example:

```sql
salary NUMERIC(12,2)
```

Meaning:

```text
12 → total number of digits
2  → digits after decimal point
```

Useful for:

* Salary
* Price
* Financial values
* Precise calculations

---

## DATE

Stores a calendar date.

Example:

```sql
joining_date DATE
```

---

# 10. Constraints

Constraints enforce rules on table data.

Important constraints:

```text
PRIMARY KEY
FOREIGN KEY
NOT NULL
UNIQUE
CHECK
DEFAULT
```

---

# 11. Primary Key

A primary key uniquely identifies each row.

Example:

```sql
department_id SERIAL PRIMARY KEY
```

Important properties:

* Uniquely identifies a row
* Cannot contain NULL
* Prevents duplicate values
* A table has one primary key constraint
* A primary key can contain multiple columns

Example composite primary key:

```sql
PRIMARY KEY (employee_id, project_id)
```

---

# 12. NOT NULL

`NOT NULL` means a column must contain a value.

Example:

```sql
department_name VARCHAR(100) NOT NULL
```

This is not allowed:

```text
department_name = NULL
```

---

# 13. UNIQUE

`UNIQUE` prevents duplicate values in a column.

Example:

```sql
department_name VARCHAR(100) UNIQUE
```

Our employee table uses:

```sql
email VARCHAR(150) UNIQUE NOT NULL
```

Therefore two employees cannot have the same email.

---

# 14. Foreign Key

A foreign key creates a relationship between tables.

Example:

```sql
department_id INT
    REFERENCES company.departments(department_id)
```

This means an employee's `department_id` must reference an existing department.

Relationship:

```text
departments
    ↓
department_id
    ↑
employees
```

---

# 15. Company Database

Our first realistic practice database is the Company Database.

Current structure:

```text
backend_lab
└── company
    ├── departments
    ├── employees
    ├── projects
    └── employee_projects
```

Dataset size:

```text
Departments          → 20
Employees            → 5,000
Projects             → 200
Employee assignments → 20,000
```

This gives us enough data for realistic SQL practice.

---

# 16. Departments Table

```sql
CREATE TABLE company.departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100),
    budget NUMERIC(14,2)
);
```

Columns:

```text
department_id
department_name
location
budget
```

---

# 17. Generate Large Datasets

PostgreSQL provides:

```sql
generate_series()
```

for generating sequences of values.

Example:

```sql
SELECT *
FROM generate_series(1, 5);
```

Result:

```text
1
2
3
4
5
```

This is extremely useful for:

* Test data generation
* Large datasets
* Number sequences
* Date ranges
* Database testing

---

# 18. Generate Departments

We generated 20 departments:

```sql
INSERT INTO company.departments
    (department_name, location, budget)
SELECT
    'Department ' || gs,
    CASE
        WHEN gs % 5 = 0 THEN 'Bangalore'
        WHEN gs % 5 = 1 THEN 'Hyderabad'
        WHEN gs % 5 = 2 THEN 'Pune'
        WHEN gs % 5 = 3 THEN 'Mumbai'
        ELSE 'Delhi'
    END,
    ROUND((500000 + random() * 4500000)::numeric, 2)
FROM generate_series(1, 20) AS gs;
```

Important PostgreSQL concepts used here:

```text
generate_series()
random()
ROUND()
CASE
|| concatenation
::numeric casting
```

We will study these properly later.

---

# 19. Employees Table

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

The table contains:

```text
employee_id
first_name
last_name
email
salary
department_id
manager_id
joining_date
job_title
employment_status
```

---

# 20. Generate 5,000 Employees

We used PostgreSQL's `generate_series()` to generate thousands of records automatically.

The important concept is:

```sql
FROM generate_series(1, 5000) AS gs;
```

This produces 5,000 generated rows.

We then use `gs` to create different employee values.

---

# 21. Projects Table

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

We generated:

```text
200 projects
```

---

# 22. Many-to-Many Relationship

An employee can work on many projects.

A project can contain many employees.

Therefore:

```text
employees
    ↕
projects
```

is a **many-to-many relationship**.

We use a junction table:

```text
employees
    ↓
employee_projects
    ↓
projects
```

---

# 23. Employee Projects Table

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

The junction table stores:

```text
employee_id
project_id
assigned_date
role
hours_allocated
```

---

# 24. Composite Primary Key

Our junction table uses:

```sql
PRIMARY KEY (employee_id, project_id)
```

This means the combination must be unique.

Allowed:

```text
employee_id | project_id
------------|-----------
1           | 10
1           | 20
2           | 10
```

Not allowed:

```text
employee_id | project_id
------------|-----------
1           | 10
1           | 10
```

because `(1,10)` already exists.

---

# 25. Important Lesson: DISTINCT

We encountered a duplicate-key error while generating employee-project relationships.

The important lesson:

```sql
SELECT DISTINCT employee_id, project_id, role
```

does **not** guarantee that only:

```text
employee_id + project_id
```

is unique.

`DISTINCT` applies to the **entire selected row**.

If `role` or another selected value differs, the rows are considered different.

Therefore, when a specific combination must be unique, the query must explicitly generate unique combinations.

---

# 26. SELECT

`SELECT` is used to retrieve data.

Basic syntax:

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

# 27. SELECT Multiple Columns

```sql
SELECT
    first_name,
    last_name,
    salary
FROM company.employees;
```

The order of columns in the SELECT list determines their order in the result.

---

# 28. SELECT All Columns

Use:

```sql
SELECT *
FROM company.employees;
```

`*` means all columns.

### Production Note

Avoid using `SELECT *` unnecessarily in production applications.

Reasons:

* Retrieves unnecessary columns
* Can increase network/data transfer
* Makes queries less explicit
* Can become problematic when table structure changes
* Can reduce efficiency when only a few columns are needed

For learning and exploration, `SELECT *` is perfectly fine.

---

# 29. SELECT DISTINCT

`DISTINCT` removes duplicate result rows.

Example:

```sql
SELECT DISTINCT job_title
FROM company.employees;
```

Instead of:

```text
Developer
Developer
Tester
Developer
Tester
```

we get each distinct job title once.

---

# 30. DISTINCT With Multiple Columns

```sql
SELECT DISTINCT
    department_id,
    job_title
FROM company.employees;
```

DISTINCT applies to the **combination** of:

```text
department_id + job_title
```

It does not independently make each column unique.

---

# 31. Column Alias

An alias gives a temporary name to a result column.

Syntax:

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

The database column is NOT renamed.

Only the result heading is changed.

---

# 32. Alias Without AS

PostgreSQL also allows:

```sql
SELECT
    first_name employee_name,
    salary monthly_salary
FROM company.employees;
```

However, using `AS` is generally clearer while learning:

```sql
first_name AS employee_name
```

---

# 33. Expressions in SELECT

We can perform calculations inside SELECT.

Example:

```sql
SELECT
    first_name,
    salary,
    salary * 12 AS annual_salary
FROM company.employees;
```

This calculates:

```text
annual_salary = salary × 12
```

It does not modify the stored salary.

---

# 34. Comments

### Single-line comment

```sql
-- This is a comment
SELECT *
FROM company.employees;
```

### Multi-line comment

```sql
/*
   This is a
   multi-line comment
*/
SELECT *
FROM company.employees;
```

Comments are useful for organizing practice queries.

---

# 35. Semicolon

SQL statements are generally terminated with:

```sql
;
```

Example:

```sql
SELECT *
FROM company.employees;
```

Multiple statements:

```sql
SELECT COUNT(*)
FROM company.employees;

SELECT COUNT(*)
FROM company.departments;
```

The semicolon separates the statements.

---

# 36. Fully Qualified Table Name

Our structure is:

```text
backend_lab
    ↓
company
    ↓
employees
```

Therefore:

```sql
company.employees
```

means:

```text
schema.table
```

Example:

```sql
SELECT *
FROM company.employees;
```

Using the schema explicitly is useful because it makes the table location clear.

---

# 37. SQL Logical Execution Order

A query may be written as:

```sql
SELECT ...
FROM ...
WHERE ...
GROUP BY ...
HAVING ...
ORDER BY ...
LIMIT ...;
```

The logical processing order is approximately:

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

This becomes very important when we learn:

* WHERE
* GROUP BY
* HAVING
* aliases
* window functions
* CTEs

---

# 38. SQL vs Database Changes

A useful distinction:

### Reading data

```sql
SELECT ...
```

Does not modify stored data.

### Changing structure

```sql
CREATE TABLE ...
ALTER TABLE ...
DROP TABLE ...
```

Changes database structure.

### Changing data

```sql
INSERT ...
UPDATE ...
DELETE ...
```

Changes stored records.

We will study CRUD and DDL properly in the next stages.

---

# 39. Our Repository Database Files

The Company database is stored in GitHub as SQL scripts.

```text
databases/
└── company/
    ├── schema.sql
    ├── seed.sql
    └── queries.sql
```

### schema.sql

Contains database structure:

```text
CREATE SCHEMA
CREATE TABLE
constraints
relationships
```

### seed.sql

Contains data-generation/insertion scripts.

### queries.sql

Contains practice, verification, and interview queries.

---

# 40. Important Git Rule

The actual PostgreSQL database is stored locally by PostgreSQL.

We do **not** upload the entire database into GitHub.

Instead, GitHub stores the scripts required to recreate it:

```text
schema.sql
seed.sql
queries.sql
```

This keeps the repository clean and reproducible.

---

# 41. Current Company Database

Our current database:

```text
Database:
backend_lab

Schema:
company
```

Tables:

```text
departments
    ↓
employees
    ↓
employee_projects
    ↑
projects
```

Current approximate dataset:

```text
20 departments
5,000 employees
200 projects
20,000 employee-project assignments
```

This database will be used throughout our SQL interview preparation.

---

# 42. Quick Revision

Remember these fundamentals:

```text
SQL
 ↓
PostgreSQL
 ↓
Database
 ↓
Schema
 ↓
Tables
 ↓
Rows + Columns
```

Basic SELECT:

```sql
SELECT column1, column2
FROM schema.table;
```

All columns:

```sql
SELECT *
FROM company.employees;
```

Distinct values:

```sql
SELECT DISTINCT job_title
FROM company.employees;
```

Alias:

```sql
SELECT salary AS monthly_salary
FROM company.employees;
```

Calculation:

```sql
SELECT salary * 12 AS annual_salary
FROM company.employees;
```

Primary key:

```sql
PRIMARY KEY (id)
```

Foreign key:

```sql
REFERENCES other_table(id)
```

Many-to-many:

```text
Table A
   ↓
Junction Table
   ↓
Table B
```

---

# 43. What We Have Learned

* SQL basics
* PostgreSQL basics
* Database creation
* Schemas
* pgAdmin Query Tool
* Tables
* Data types
* Primary keys
* Foreign keys
* NOT NULL
* UNIQUE
* Composite primary keys
* Large data generation
* `generate_series()`
* Many-to-many relationships
* `SELECT`
* `SELECT *`
* `DISTINCT`
* Aliases
* Expressions
* Comments
* SQL statement termination
* Schema-qualified table names
* SQL logical execution order
* GitHub database organization

---

# Next Topic

## WHERE Clause

We will learn:

```sql
SELECT ...
FROM ...
WHERE ...;
```

including:

* Comparison operators
* `=`
* `<>`
* `!=`
* `>`
* `<`
* `>=`
* `<=`
* `AND`
* `OR`
* `NOT`
* `IN`
* `BETWEEN`
* `LIKE`
* `ILIKE`
* `IS NULL`
* `IS NOT NULL`

After the complete topic is taught, you will solve the problems **yourself**.
