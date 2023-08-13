/*
Enter your query here.
*/
SELECT
    c.company_code,
    c.founder,
    COALESCE(lm.lead_managers, 0) AS lead_managers,
    COALESCE(sm.senior_managers, 0) AS senior_managers,
    COALESCE(m.managers, 0) AS managers,
    COALESCE(e.employees, 0) AS employees
FROM Company c
LEFT JOIN (
    SELECT company_code, COUNT(DISTINCT lead_manager_code) AS lead_managers
    FROM Lead_Manager
    GROUP BY company_code
) lm ON c.company_code = lm.company_code
LEFT JOIN (
    SELECT company_code, COUNT(DISTINCT senior_manager_code) AS senior_managers
    FROM Senior_Manager
    GROUP BY company_code
) sm ON c.company_code = sm.company_code
LEFT JOIN (
    SELECT company_code, COUNT(DISTINCT manager_code) AS managers
    FROM Manager
    GROUP BY company_code
) m ON c.company_code = m.company_code
LEFT JOIN (
    SELECT company_code, COUNT(DISTINCT employee_code) AS employees
    FROM Employee
    GROUP BY company_code
) e ON c.company_code = e.company_code
ORDER BY CONVERT(c.company_code, UNSIGNED), c.company_code;
