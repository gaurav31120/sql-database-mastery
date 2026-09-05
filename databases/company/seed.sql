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