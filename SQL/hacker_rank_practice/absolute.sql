-- https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=true

SELECT
    TRUNCATE(
        ROUND(
            ABS((SELECT lat_n FROM station ORDER BY lat_n DESC LIMIT 1) - (SELECT lat_n FROM station ORDER BY lat_n LIMIT 1)) + ABS((SELECT long_w FROM station ORDER BY long_w DESC LIMIT 1) - (SELECT long_w FROM station ORDER BY long_w LIMIT 1))
            , 4)
        , 4);

-- https://www.hackerrank.com/challenges/weather-observation-station-19/problem?isFullScreen=true
SELECT
    TRUNCATE(
        ROUND(
            SQRT(
                POWER((SELECT lat_n FROM station ORDER BY lat_n DESC LIMIT 1) - (SELECT lat_n FROM station ORDER BY lat_n LIMIT 1), 2) + POWER((SELECT long_w FROM station ORDER BY long_w DESC LIMIT 1) - (SELECT long_w FROM station ORDER BY long_w LIMIT 1), 2)
                )
        , 4)
    , 4);