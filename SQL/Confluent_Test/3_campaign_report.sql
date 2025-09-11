-- To generate the Active Campaign Engagement Report, we need to:
-- Include only active campaigns (where is_active = 1 in the campaigns table).

-- Calculate the total number of engagements per campaign (count of rows in the engagements table for each campaign).

-- Sum the views and clicks for those engagements.

-- Return the results with columns campaign_name, total_engagements, and total_views_and_clicks, sorted by campaign_name in ascending order.

SELECT 
    c.name AS campaign_name,
    COUNT(e.campaign_id) AS total_engagements,
    SUM(e.views + e.clicks) AS total_views_and_clicks
FROM 
    campaigns c
    LEFT JOIN engagements e ON c.id = e.campaign_id
WHERE 
    c.is_active = 1
GROUP BY 
    c.name
ORDER BY 
    c.name ASC;


-- Explanation of the Query
-- Joining Tables:
-- campaigns c LEFT JOIN engagements e ON c.id = e.campaign_id: Uses a LEFT JOIN to include all active campaigns, even if they have no engagements (in which case total_engagements and total_views_and_clicks would be 0). This ensures completeness, though the sample data suggests all active campaigns have engagements.

-- Filtering Active Campaigns:
-- WHERE c.is_active = 1: Restricts the results to only active campaigns, as specified by the is_active field.

-- Aggregations:
-- COUNT(e.campaign_id): Counts the number of engagement records for each campaign. Using e.campaign_id ensures we count only actual engagement rows (not null rows from the LEFT JOIN).

-- SUM(e.views + e.clicks): Calculates the total of views and clicks for each campaign by summing the views + clicks for each engagement.

-- c.name AS campaign_name: Selects the campaign name for the output.

-- Grouping and Ordering:
-- GROUP BY c.name: Groups the results by campaign name to aggregate engagements and views/clicks per campaign.

-- ORDER BY c.name ASC: Sorts the results by campaign name in ascending order, as required.

-- Handling the Schema and Data
-- The is_active field is a SMALLINT, where 1 indicates an active campaign and 0 indicates an inactive one, as specified.

-- The engagements table may have multiple rows per campaign (e.g., campaign id=1 has multiple entries in the sample data), which is why we use COUNT and SUM to aggregate.

-- The LEFT JOIN ensures that if an active campaign has no engagements, it would still appear with 0 for total_engagements and total_views_and_clicks, though the sample output suggests all active campaigns have engagements.

-- The sample data includes inactive campaigns (e.g., WeekendWarrior, BigBangBonanza, SavingsSpectacular), which are excluded due to the is_active = 1 condition.