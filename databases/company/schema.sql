CREATE SCHEMA company;

CREATE TABLE company.departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100),
    budget NUMERIC(14,2)
);

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