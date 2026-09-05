# SQL PostgreSQL Mastery

A hands-on journey to mastering **SQL, PostgreSQL, Database Design, Performance, Transactions, and Database Development for Java Spring Boot Backend Engineering**.

This repository contains all SQL learning, practice problems, database schemas, datasets, interview preparation, and database engineering work.

---

## 🎯 Goal

Build strong practical and interview-level knowledge of:

* SQL
* PostgreSQL
* Database Design
* Normalization
* Joins
* Subqueries
* CTEs
* Window Functions
* Query Optimization
* Indexes
* Transactions
* ACID
* Concurrency
* JDBC
* JPA
* Hibernate
* Spring Data JPA
* Spring Boot Database Integration

---

# 📚 Learning Roadmap

## 01 — SQL Fundamentals

* Database and DBMS
* Tables, rows and columns
* Primary Keys
* Foreign Keys
* SELECT
* DISTINCT
* Aliases
* WHERE
* Comparison Operators
* AND / OR / NOT
* NULL
* ORDER BY
* LIMIT
* SQL Execution Order

## 02 — CRUD & DDL

* CREATE
* ALTER
* DROP
* INSERT
* UPDATE
* DELETE
* Constraints
* Primary Key
* Foreign Key
* UNIQUE
* NOT NULL
* CHECK
* DEFAULT

## 03 — Filtering & Sorting

* WHERE
* IN
* BETWEEN
* LIKE
* ILIKE
* IS NULL
* IS NOT NULL
* ORDER BY
* LIMIT / OFFSET

## 04 — Aggregation

* COUNT
* SUM
* AVG
* MIN
* MAX
* GROUP BY
* HAVING

## 05 — JOINs

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* FULL JOIN
* CROSS JOIN
* SELF JOIN
* Multiple JOINs

## 06 — Subqueries

* Scalar Subqueries
* Multi-row Subqueries
* Correlated Subqueries
* EXISTS
* NOT EXISTS
* IN
* ANY
* ALL

## 07 — Functions & CASE

* String Functions
* Numeric Functions
* Date Functions
* NULL Handling
* COALESCE
* NULLIF
* CASE
* CAST

## 08 — CTE

* Common Table Expressions
* Multiple CTEs
* Recursive CTEs
* CTE vs Subquery

## 09 — Window Functions

* OVER()
* PARTITION BY
* ORDER BY
* ROW_NUMBER
* RANK
* DENSE_RANK
* LAG
* LEAD
* Running Totals
* Moving Averages

## 10 — Advanced SQL

* Set Operators
* UNION
* UNION ALL
* INTERSECT
* EXCEPT
* Views
* Temporary Tables
* Advanced Query Patterns
* Interview SQL Problems

## 11 — Database Design

* Entities
* Relationships
* ER Diagrams
* One-to-One
* One-to-Many
* Many-to-Many
* Primary Keys
* Foreign Keys
* Constraints

## 12 — Normalization

* 1NF
* 2NF
* 3NF
* BCNF
* Denormalization
* Practical Database Design

## 13 — Indexes & Performance

* Index Fundamentals
* B-Tree Index
* Composite Index
* Unique Index
* Partial Index
* Covering Index
* EXPLAIN
* EXPLAIN ANALYZE
* Query Optimization
* N+1 Problem
* Index Selection

## 14 — Transactions & ACID

* Transactions
* ACID
* COMMIT
* ROLLBACK
* SAVEPOINT
* Isolation Levels
* Dirty Reads
* Non-Repeatable Reads
* Phantom Reads
* Deadlocks
* Concurrency

---

# 🗄️ Practice Databases

We will work with realistic, large datasets instead of tiny toy tables.

### Company Database

* ~20 Departments
* ~5,000 Employees
* ~200 Projects
* ~20,000 Employee-Project relationships
* ~500 Managers

### E-Commerce Database

* ~10,000 Users
* ~15,000 Addresses
* ~100 Categories
* ~5,000 Products
* ~50,000 Orders
* ~150,000 Order Items
* ~50,000 Payments
* ~30,000 Reviews

### Banking Database

* ~10,000 Customers
* ~15,000 Accounts
* ~500,000 Transactions
* ~20,000 Beneficiaries
* ~100,000 Transfers

Data will be generated using PostgreSQL scripts.

---

# 💻 Repository Structure

```text
sql-postgresql-mastery/
│
├── 01-fundamentals/
├── 02-crud-ddl/
├── 03-filtering-sorting/
├── 04-aggregation/
├── 05-joins/
├── 06-subqueries/
├── 07-functions-case/
├── 08-cte/
├── 09-window-functions/
├── 10-advanced-sql/
├── 11-database-design/
├── 12-normalization/
├── 13-indexes-performance/
├── 14-transactions-acid/
│
├── databases/
│   ├── company/
│   ├── ecommerce/
│   └── banking/
│
├── interview-problems/
│
└── README.md
```

---

# 🧠 Learning Method

Every topic follows:

```text
Concept
   ↓
Explanation
   ↓
Real Database Example
   ↓
Problem
   ↓
My Solution
   ↓
Your Attempt
   ↓
Code Review
   ↓
Interview Discussion
   ↓
Spring Boot Relevance
   ↓
Notes
   ↓
Git Commit
```

The goal is not just to memorize SQL syntax.

The goal is to understand:

**Why → How → When → Performance → Real Backend Usage**

---

# 🎯 Interview Preparation

Problems will progress from:

**Beginner → Intermediate → Advanced → Interview-Level**

The practice will cover:

* Aggregation
* JOINs
* Subqueries
* CTEs
* Window Functions
* Ranking
* Deduplication
* Gaps and Islands
* Top-N problems
* Running totals
* Date-based analysis
* Complex business queries
* Query optimization

---

# ☕ Java Spring Boot Connection

After mastering SQL and PostgreSQL, the repository connects database knowledge to backend development through a separate repository:

`spring-boot-database-lab`

Topics include:

* JDBC
* PostgreSQL Driver
* JPA
* Hibernate
* Spring Data JPA
* Entity Mapping
* Relationships
* Transactions
* Pagination
* Specifications
* Native Queries
* Query Optimization

---

# 🚀 Real Projects

Database knowledge will eventually be applied to:

1. Employee Management API
2. Expense Management API
3. E-Commerce Backend

Each major project will have its own repository.

---

# 📈 Progress

* [ ] SQL Fundamentals
* [ ] CRUD & DDL
* [ ] Filtering & Sorting
* [ ] Aggregation
* [ ] JOINs
* [ ] Subqueries
* [ ] Functions & CASE
* [ ] CTEs
* [ ] Window Functions
* [ ] Advanced SQL
* [ ] Database Design
* [ ] Normalization
* [ ] Indexes & Performance
* [ ] Transactions & ACID
* [ ] PostgreSQL Interview Preparation

---

## Philosophy

> Don't just learn SQL. Learn how databases actually work and how backend engineers use them in production.

**SQL → PostgreSQL → Database Engineering → Spring Boot → Production Backend**
