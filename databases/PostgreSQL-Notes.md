# PostgreSQL Notes

## 1. What is PostgreSQL?

PostgreSQL is an open-source relational database management system (RDBMS).

It uses SQL to store, retrieve, modify, and manage relational data.

---

## 2. Create a Database

A PostgreSQL database can be created using pgAdmin or SQL.

```sql
CREATE DATABASE backend_lab;
```

In pgAdmin:

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

## 3. Connect to a Database

After creating a database, open its Query Tool in pgAdmin.

For our learning environment:

```text
Database: backend_lab
```

All queries executed in the Query Tool will run against the selected database.

---

## 4. Create a Schema

A schema is a logical namespace inside a PostgreSQL database.

```sql
CREATE SCHEMA company;
```

We will use:

```text
backend_lab
    └── company
```

The schema will contain our company-related tables.

---

## 5. Create a Table

Example:

```sql
CREATE TABLE company.departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100),
    budget NUMERIC(14,2)
);
```

General structure:

```sql
CREATE TABLE schema_name.table_name (
    column_name DATA_TYPE CONSTRAINT,
    ...
);
```

---

## 6. PostgreSQL SERIAL

`SERIAL` automatically generates sequential integer values when rows are inserted.

Example:

```sql
department_id SERIAL PRIMARY KEY
```

For modern PostgreSQL applications, identity columns are also commonly used:

```sql
department_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
```

We will learn both.

---

## 7. PostgreSQL NUMERIC

`NUMERIC(precision, scale)` is used for exact numeric values.

Example:

```sql
salary NUMERIC(12,2)
```

This means:

* Maximum 12 digits
* 2 digits after the decimal point

Useful for:

* Salary
* Price
* Money-related calculations

---

## 8. Foreign Key

A foreign key creates a relationship between tables.

Example:

```sql
department_id INT
    REFERENCES company.departments(department_id)
```

This means an employee's `department_id` must reference an existing department.

---

## 9. Query Tool

pgAdmin's Query Tool allows us to execute SQL against PostgreSQL.

Common shortcut:

```text
F5 → Execute Query
```

---

## 10. Checking Tables

We can query PostgreSQL system catalogs or use pgAdmin's object browser to inspect tables.

Example:

```sql
SELECT *
FROM company.departments;
```

---

## 11. Count Rows

```sql
SELECT COUNT(*)
FROM company.employees;
```

This is useful for verifying large generated datasets.

---

## 12. Our Main Learning Database

```text
Database:
backend_lab
```

Initial schema:

```text
company
```

Initial database structure:

```text
backend_lab
    │
    └── company
         ├── departments
         ├── employees
         ├── projects
         └── employee_projects
```

The database will grow as we progress through SQL.

---

## 13. Important Rule

We will **not** store the actual large database inside GitHub.

GitHub will contain:

```text
schema.sql
seed.sql
queries.sql
```

These scripts allow us to recreate the database and its data.

The actual PostgreSQL database remains local.

---

## 14. Git Strategy

Database changes will be committed separately from learning notes whenever appropriate.

Example:

```text
feat(sql-company-db): add company database schema
feat(sql-company-db): add department seed data
feat(sql-company-db): add employee seed data
solve(sql-01-fundamentals): add P001-select-all-employees
docs(sql-01-fundamentals): add SQL fundamentals notes
```

---

## 15. Generate Rows with generate_series()

PostgreSQL provides `generate_series()` for generating a sequence of values.

Example:

```sql
SELECT *
FROM generate_series(1, 5);

## 17. Junction Table

A junction table is used to represent a many-to-many relationship.

Our example:

```text
employees
    ↓
employee_projects
    ↓
projects

## 18. Composite Primary Key

A composite primary key consists of two or more columns.

Example:

```sql
PRIMARY KEY (employee_id, project_id)
