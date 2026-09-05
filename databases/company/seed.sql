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

INSERT INTO company.employees
    (
        first_name,
        last_name,
        email,
        salary,
        department_id,
        manager_id,
        joining_date,
        job_title,
        employment_status
    )
SELECT
    'Employee' || gs,
    'Last' || gs,
    'employee' || gs || '@company.com',
    ROUND((30000 + random() * 170000)::numeric, 2),
    ((gs - 1) % 20) + 1,
    CASE
        WHEN gs % 10 = 0 THEN NULL
        ELSE ((gs - 1) % 500) + 1
    END,
    DATE '2015-01-01' + ((random() * 4000)::int),
    CASE
        WHEN gs % 10 = 0 THEN 'Manager'
        WHEN gs % 5 = 0 THEN 'Senior Engineer'
        WHEN gs % 3 = 0 THEN 'Software Engineer'
        ELSE 'Associate Engineer'
    END,
    CASE
        WHEN gs % 20 = 0 THEN 'ON_LEAVE'
        WHEN gs % 15 = 0 THEN 'RESIGNED'
        ELSE 'ACTIVE'
    END
FROM generate_series(1, 5000) AS gs;

INSERT INTO company.projects
(
    project_name,
    department_id,
    budget,
    start_date,
    end_date,
    project_status
)
SELECT
    'Project ' || gs,
    ((gs - 1) % 20) + 1,
    ROUND((100000 + random() * 4900000)::numeric, 2),
    DATE '2020-01-01' + ((random() * 1800)::int),
    CASE
        WHEN gs % 5 = 0 THEN NULL
        ELSE DATE '2022-01-01' + ((random() * 1600)::int)
    END,
    CASE
        WHEN gs % 10 = 0 THEN 'PLANNED'
        WHEN gs % 4 = 0 THEN 'COMPLETED'
        ELSE 'ACTIVE'
    END
FROM generate_series(1, 200) AS gs;

INSERT INTO company.employee_projects
(
    employee_id,
    project_id,
    assigned_date,
    role,
    hours_allocated
)
SELECT
    employee_id,
    project_id,
    DATE '2022-01-01' + ((random() * 1400)::int),
    CASE
        WHEN row_number_value % 5 = 0 THEN 'Project Manager'
        WHEN row_number_value % 4 = 0 THEN 'Tech Lead'
        WHEN row_number_value % 3 = 0 THEN 'Developer'
        WHEN row_number_value % 2 = 0 THEN 'Tester'
        ELSE 'Business Analyst'
    END,
    20 + ((random() * 160)::int)
FROM (
    SELECT
        employee_id,
        project_id,
        ROW_NUMBER() OVER () AS row_number_value
    FROM (
        SELECT
            e.employee_id,
            p.project_id
        FROM company.employees e
        CROSS JOIN company.projects p
        ORDER BY random()
        LIMIT 20000
    ) AS pairs
) AS unique_pairs;