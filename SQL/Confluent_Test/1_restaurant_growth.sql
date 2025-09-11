WITH daily_totals AS (
    SELECT 
        visited_on,
        SUM(amount) as amount
    FROM customers
    GROUP BY visited_on
)
SELECT 
    visited_on,
    amount,
    ROUND(AVG(amount) OVER (
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ), 4) as avg_amount
FROM daily_totals
WHERE visited_on >= (
    SELECT MIN(visited_on) + INTERVAL '6 days'
    FROM daily_totals
)
ORDER BY visited_on;

-- Let's break down how this query works:
-- Common Table Expression (CTE) - daily_totals:
-- Groups the data by visited_on and calculates the total amount spent each day

-- This handles cases where multiple customers visit on the same day

-- Main Query:
-- Uses a window function to calculate the moving average

-- AVG(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) computes the average over the current day and 6 previous days

-- ROUND(..., 4) formats the average to 4 decimal places as shown in the expected output

-- Filtering:
-- The WHERE clause ensures we only show results starting from the 7th day (when we have a full 7-day window)

-- Uses a subquery to find the minimum date plus 6 days

-- Ordering:
-- Results are ordered by visited_on to show the progression over time

-- This query will produce output matching the expected format, with:
-- visited_on: The date

-- amount: Total amount spent on that day

-- avg_amount: 7-day moving average rounded to 4 decimal places

-- The query handles the sample data correctly and should produce the expected output for the larger dataset, accounting for days with multiple customer visits by summing their amounts first.