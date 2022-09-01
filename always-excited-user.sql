"""
Let’s say you work at an advertising firm. You have a table of users’ impressions of ad campaigns over time. Each impression_id consists of values of user engagement specified by Excited and Bored.

Write a query to find all users that are currently “Excited” and have never been “Bored” with a campaign.

Example:

Input:

ad_impressions table:

Column	Type
user_id	INTEGER
dt	DATETIME
campaign_id	INTEGER
impression_id	TEXT
Output:

Column	Type
user_id	INTEGER

"""

SELECT user_id 
FROM ad_impressions 
WHERE impression_id = 'Excited' AND user_id NOT IN (
    SELECT user_id 
    FROM ad_impressions 
    WHERE impression_id = 'Bored'
)