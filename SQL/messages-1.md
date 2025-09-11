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

     user_id | sent | received 
    ---------+------+----------
           1 |    3 |        1
           2 |    2 |        3
           3 |    2 |        5
           4 |    2 |        2
           5 |    6 |        5
           6 |    5 |        4

## Assumptions:

- A user CAN send letters to themselves.
- Please order your results by user_id, ascending.

*/


Expected output:
 user_id | sent | received 
---------+------+----------
       1 |    3 |        1
       2 |    2 |        3
       3 |    2 |        5
       4 |    2 |        2
       5 |    6 |        5
       6 |    5 |        4


=========================================================================
=========================================================================
=========================================================================

Solution:

SELECT t1.user_id, t1.sent, t2.received
FROM 
    (SELECT sender as user_id, count(sender) as sent FROM letters group by user_id) t1
LEFT JOIN
    (SELECT receiver as user_id, count(receiver) as received FROM letters group by user_id) t2
ON (t1.user_id = t2.user_id) 
ORDER BY user_id asc