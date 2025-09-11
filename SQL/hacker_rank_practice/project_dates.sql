-- https://www.hackerrank.com/challenges/sql-projects/problem?isFullScreen=true

-- find all start dates
WITH startDates AS (
    SELECT 
        start_date,
        ROW_NUMBER() OVER (ORDER BY start_date) AS project_id
    FROM projects
    WHERE start_date NOT IN (SELECT end_date FROM projects)
),
-- find all end dates
endDates AS (
    SELECT
        end_date,
        ROW_NUMBER() OVER (ORDER BY end_date) AS project_id
    FROM projects
    WHERE end_date NOT IN (SELECT start_date FROM projects)
)
-- join the start and end dates using row number as the project_id
SELECT
    start_date,
    end_date
FROM startDates AS s JOIN endDates AS e ON s.project_id = e.project_id
ORDER BY end_date - start_date, start_date;