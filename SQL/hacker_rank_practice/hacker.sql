-- https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true

WITH ChallengeCount AS (
    SELECT c.hacker_id, h.name, COUNT(c.challenge_id) AS challenge_count
    FROM challenges c
    LEFT JOIN hackers h ON c.hacker_id = h.hacker_id
    GROUP BY c.hacker_id, h.name
),
MaxCount AS (
    SELECT MAX(challenge_count) AS max_count
    FROM ChallengeCount
),
DuplicateCount AS (
    SELECT challenge_count
    FROM ChallengeCount
    GROUP BY challenge_count
    HAVING COUNT(*) > 1
)
SELECT cc.hacker_id, cc.name, cc.challenge_count
FROM ChallengeCount cc, MaxCount mc
WHERE cc.challenge_count = mc.max_count
   OR cc.challenge_count NOT IN (SELECT challenge_count FROM DuplicateCount)
ORDER BY cc.challenge_count DESC, cc.hacker_id;

-- https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true

WITH MaxScores AS (
    SELECT MAX(score) max_score, hacker_id, challenge_id FROM submissions GROUP BY hacker_id, challenge_id
),
SumMaxScores AS (
    SELECT SUM(max_score) total_score, hacker_id FROM MaxScores GROUP BY hacker_id
)
SELECT sm.hacker_id, h.name, sm.total_score
FROM SumMaxScores sm LEFT JOIN hackers h ON sm.hacker_id = h.hacker_id
WHERE sm.total_score > 0
ORDER BY sm.total_score DESC, hacker_id;

-- https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true

WITH FullScores AS (
    SELECT 
        s.hacker_id,
        s.challenge_id,
        s.score
    FROM submissions s 
    LEFT JOIN challenges c ON s.challenge_id = c.challenge_id
    LEFT JOIN difficulty d ON c.difficulty_level = d.difficulty_level
    WHERE s.score = d.score
)
SELECT fs.hacker_id, h.name
FROM FullScores fs
LEFT JOIN hackers h ON fs.hacker_id = h.hacker_id
GROUP BY fs.hacker_id, h.name HAVING COUNT(*) > 1
ORDER BY COUNT(fs.hacker_id) DESC, hacker_id;


-- Using CTE with window function (unrelated solution)
-- WITH cte AS (
--    SELECT Contestant, Game, Score,
--             RANK() OVER ( PARTITION BY Contestant
--             ORDER BY Score DESC
--             ) AS r
--     FROM Gameshow
-- )
-- SELECT Contestant, Game, Score
-- FROM cte
-- WHERE r = 1
-- ORDER BY Contestant ASC;