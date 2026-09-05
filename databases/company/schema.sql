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

CREATE TABLE company.projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(150) NOT NULL UNIQUE,
    department_id INT REFERENCES company.departments(department_id),
    budget NUMERIC(14,2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    project_status VARCHAR(30) NOT NULL
);

CREATE TABLE company.employee_projects (
    employee_id INT REFERENCES company.employees(employee_id),
    project_id INT REFERENCES company.projects(project_id),
    assigned_date DATE NOT NULL,
    role VARCHAR(100),
    hours_allocated INT,
    PRIMARY KEY (employee_id, project_id)
);