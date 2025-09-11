WITH VoteCounts AS (
    SELECT 
        r.state,
        c.first_name || ' ' || c.last_name AS full_name,
        COUNT(*) AS vote_count
    FROM Results r
    JOIN Candidates c ON r.candidate_id = c.id
    GROUP BY r.state, c.first_name, c.last_name
),
FormattedVotes AS (
    SELECT 
        state,
        full_name || ' x ' || vote_count AS vote_string
    FROM VoteCounts
)
SELECT 
    state AS states,
    GROUP_CONCAT(vote_string, ',') AS votes
FROM FormattedVotes
GROUP BY state
ORDER BY state ASC;