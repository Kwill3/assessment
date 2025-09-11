/*
===========
QUESTION 2
===========

In order to properly estimate costs, we want to know how often users from each country are sending letters across country borders.
​
(e.g.: Letters to users from other countries)
​
Your task is to write a query that tells us the ratio of letters that are sent across country borders. This query should be **grouped by country of origin**.
​
For example, consider:
​
   user_id|country       |
   -------|--------------|
         1|United States |
         2|United Kingdom|
         3|Brazil        |
         4|United States |
         5|United Kingdom|
         6|Brazil        |
​
and:
​
   letter_id|sender|receiver|
   ---------|------|--------|
           1|     5|       5|
           2|     6|       5|
           3|     4|       2|
           4|     6|       6|
           5|     5|       4|
           6|     1|       5|
           7|     2|       3|
           8|     6|       2|
           9|     5|       6|
          10|     3|       3|
          11|     5|       4|
          12|     6|       5|
          13|     1|       6|
          14|     3|       3|
          15|     6|       3|
          16|     4|       2|
          17|     5|       6|
          18|     1|       1|
          19|     5|       3|
          20|     2|       5|
​
Your query should return:
​
   country       |ratio |
   --------------|------|
   Brazil        |0.4286| -- 3/7. Total of 7 letters sent, 3 across country borders (All 3 to the UK)
   United Kingdom|0.7500| -- 6/8. Total of 8 letters sent, 6 across country borders (4 to Brazil, 2 to the US)
   United States |0.8000| -- 4/5. Total of 5 letters sent, 4 across country borders (1 to Brazil, 3 to the UK)

## Assumptions:

- A user CAN send letters to themselves.
- If a country has no letters sent (local or abroad), it should not be present in the result set.
- Please order your results by country of origin, ascending.
- For the ratio please provide the values using `ROUND(ratio, 4)`.

*/


[+] Expected output:
    country     | ratio  
----------------+--------
 Brazil         | 0.4286
 United Kingdom | 0.7500
 United States  | 0.8000
(3 rows)



=========================================================================
=========================================================================
=========================================================================


SELECT 
    u1.country,
    ROUND(
        SUM(CASE WHEN u1.country != u2.country THEN 1 ELSE 0 END)::float / 
        COUNT(*)::float, 
        4
    ) AS ratio
FROM 
    letters l
    JOIN users u1 ON l.sender = u1.user_id
    JOIN users u2 ON l.receiver = u2.user_id
GROUP BY 
    u1.country
HAVING 
    COUNT(*) > 0
ORDER BY 
    u1.country ASC;