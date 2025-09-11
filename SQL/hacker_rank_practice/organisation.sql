https://www.hackerrank.com/challenges/the-company/problem?isFullScreen=true

WITH
    lman AS (SELECT COUNT(DISTINCT lead_manager_code) AS lm_count, company_code FROM lead_manager GROUP BY company_code),
    sman AS (SELECT COUNT(DISTINCT senior_manager_code) AS sm_count, company_code FROM senior_manager GROUP BY company_code),
    man AS (SELECT COUNT(DISTINCT manager_code) AS m_count, company_code FROM manager GROUP BY company_code),
    emp AS (SELECT COUNT(DISTINCT employee_code) AS e_count, company_code FROM employee GROUP BY company_code)
SELECT 
    c.company_code,
    founder,
    lm_count,
    sm_count,
    m_count,
    e_count
FROM company AS c
LEFT JOIN lman ON c.company_code = lman.company_code
LEFT JOIN sman ON c.company_code = sman.company_code
LEFT JOIN man ON c.company_code = man.company_code
LEFT JOIN emp ON c.company_code = emp.company_code
ORDER BY company_code;

-- Simplified solution:
-- SELECT 
--     c.company_code,
--     c.founder,
--     (SELECT COUNT(DISTINCT lead_manager_code) FROM lead_manager lm WHERE lm.company_code = c.company_code) AS lm_count,
--     (SELECT COUNT(DISTINCT senior_manager_code) FROM senior_manager sm WHERE sm.company_code = c.company_code) AS sm_count,
--     (SELECT COUNT(DISTINCT manager_code) FROM manager m WHERE m.company_code = c.company_code) AS m_count,
--     (SELECT COUNT(DISTINCT employee_code) FROM employee e WHERE e.company_code = c.company_code) AS e_count
-- FROM company c
-- ORDER BY c.company_code;