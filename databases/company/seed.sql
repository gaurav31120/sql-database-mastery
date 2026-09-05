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