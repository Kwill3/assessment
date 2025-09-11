-- https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true

SELECT
    CASE 
        WHEN g.grade >= 8 THEN s.Name 
        ELSE 'NULL' 
    END AS name,
    grade,
    marks
FROM students s
LEFT JOIN grades g ON s.marks BETWEEN g.min_mark AND g.max_mark
ORDER BY g.grade DESC,
    CASE
        WHEN g.grade >= 8 THEN s.name
        ELSE s.marks
    END ASC;