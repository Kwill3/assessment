-- https://www.hackerrank.com/challenges/placements/problem?isFullScreen=true

WITH salaries AS(
    SELECT
        name,
        salary,
        (SELECT salary FROM packages WHERE id = friend_id) AS friend_salary
    FROM students s 
    LEFT JOIN friends f ON s.id = f.id
    LEFT JOIN packages p on s.id = p.id
)
SELECT
    name
FROM salaries
WHERE friend_salary > salary
ORDER BY friend_salary;
