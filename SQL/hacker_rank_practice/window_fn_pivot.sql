-- https://www.hackerrank.com/challenges/occupations/problem?isFullScreen=true

With IndexedNames AS (
    SELECT
        name,
        occupation,
        ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS rn
    FROM occupations
),
GroupedIndex AS (
    SELECT
        rn,
        MAX(CASE WHEN occupation = 'Doctor' THEN name END) AS Doctor,
        MAX(CASE WHEN occupation = 'Professor' THEN name END) AS Professor,
        MAX(CASE WHEN occupation = 'Singer' THEN name END) AS Singer,
        MAX(CASE WHEN occupation = 'Actor' THEN name END) AS Actor
    FROM IndexedNames
    GROUP BY rn
)
SELECT Doctor, Professor, Singer, Actor FROM GroupedIndex ORDER BY rn;

-- using pivot table
SELECT Doctor, Professor, Singer, Actor
FROM (
    SELECT
        name,
        occupation,
        ROW_NUMBER() OVER(PARTITION BY occupation ORDER BY name) AS rn 
    FROM occupations
)
PIVOT( Max(name) For occupation In (Doctor, Professor, Singer, Actor) ) As Pivot_Table;