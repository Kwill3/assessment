-- https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true

-- ODD
-- use this query to get median count position
-- SELECT CEIL(COUNT(*)/2) FROM station; 
SELECT TRUNCATE(ROUND(MAX(lat_n), 4), 4) FROM (SELECT lat_n FROM station ORDER BY lat_n limit 250) median_table;

-- EVEN
-- use this query to get the 2 median count positions (x and x+1)
-- SELECT COUNT(*)/2 FROM station;
SELECT lat_n FROM (SELECT lat_n FROM station ORDER BY lat_n limit 250) median_table ORDER BY lat_n DESC LIMIT 2;
-- gives you the 2 median values, then you can get the average of those 2 values
