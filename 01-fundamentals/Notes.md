# SQL Fundamentals

## 1. What is SQL?

SQL (Structured Query Language) is used to communicate with relational databases.

We use SQL to:

* Read data
* Insert data
* Update data
* Delete data
* Create tables
* Modify database structures
* Analyze data

---

## 2. Relational Database

A relational database stores data in tables.

A table contains:

* Rows → individual records
* Columns → attributes of records

Example:

```text
employees

employee_id | first_name | salary
------------|------------|--------
1           | Rahul      | 75000
2           | Priya      | 82000
3           | Amit       | 68000
```

---

## 3. Primary Key

A primary key uniquely identifies every row.

Example:

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    salary NUMERIC(10,2)
);
```

Rules:

* Must be unique
* Cannot be NULL
* One primary key constraint per table
* Can contain multiple columns (composite key)

---

## 4. SELECT

Used to retrieve data.

```sql
SELECT first_name, salary
FROM employees;
```

Retrieve every column:

```sql
SELECT *
FROM employees;
```

---

## 5. DISTINCT

Removes duplicate results.

```sql
SELECT DISTINCT department_id
FROM employees;
```

---

## 6. Column Alias

Aliases give columns a temporary readable name.

```sql
SELECT
    first_name AS employee_name,
    salary AS monthly_salary
FROM employees;
```

`AS` is optional:

```sql
SELECT first_name employee_name
FROM employees;
```

---

## 7. SQL Execution Order

Although we usually write:

```sql
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT
```

Conceptually, SQL processes a query approximately as:

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

This becomes extremely important in interviews.

---

## 8. Important PostgreSQL Data Types

Common types:

```text
INTEGER
BIGINT
NUMERIC
VARCHAR
TEXT
BOOLEAN
DATE
TIMESTAMP
TIMESTAMPTZ
```

Examples:

```sql
salary NUMERIC(12,2)

first_name VARCHAR(100)

joining_date DATE

created_at TIMESTAMPTZ
```

---

## 9. NULL

`NULL` means the value is unknown/missing.

Incorrect:

```sql
WHERE manager_id = NULL
```

Correct:

```sql
WHERE manager_id IS NULL
```

Or:

```sql
WHERE manager_id IS NOT NULL
```

---

## 10. Interview Points

### What is SQL?

A language used to interact with relational databases.

### What is a primary key?

A constraint that uniquely identifies each row and does not allow NULL.

### Difference between SQL and PostgreSQL?

SQL is a language/specification.

PostgreSQL is a relational database management system that implements SQL and provides additional features.

### Why should we avoid SELECT * in production?

Because it:

* Retrieves unnecessary columns
* Increases data transfer
* Can reduce performance
* Makes applications less resilient to schema changes

---

## Spring Boot Relevance

These SQL fundamentals become the foundation for:

```text
Spring Boot
    ↓
Spring Data JPA / Hibernate / JDBC
    ↓
SQL Queries
    ↓
PostgreSQL
```

Backend developers must understand SQL even when using JPA/Hibernate.
