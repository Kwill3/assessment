-- https://www.hackerrank.com/challenges/draw-the-triangle-1/problem?isFullScreen=true

WITH RECURSIVE numbers AS (
    SELECT 20 AS n
    UNION ALL
    SELECT n - 1
    FROM numbers
    WHERE n > 1
)
SELECT REPEAT('* ', n) AS pattern
FROM numbers;

-- https://www.hackerrank.com/challenges/print-prime-numbers/problem?isFullScreen=true
WITH RECURSIVE numbers AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 1
    FROM numbers
    WHERE num < 1000
),
primes AS (
    SELECT num
    FROM numbers n
    WHERE NOT EXISTS (
        SELECT 1
        FROM numbers d
        WHERE d.num <= SQRT(n.num) AND d.num > 1 AND n.num % d.num = 0
    )
)
SELECT GROUP_CONCAT(num SEPARATOR '&') AS prime_numbers
FROM primes;