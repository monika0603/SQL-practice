"""
You’re given two tables, users and events. The events table holds values of all of the user 
events in the action column (‘like’, ‘comment’, or ‘post’).

Write a query to get the percentage of users that have never liked or commented. Round 
to two decimal places.

Example:

Input:

users table

Column	Type
id	INTEGER
name	VARCHAR
created_at	DATETIME
events table

Column	Type
user_id	INTEGER
action	VARCHAR
created_at	DATETIME
Output:

Column	Type
percent_never	FLOAT
"""

WITH like_comment AS 
(
    SELECT user_id 
    FROM events 
    WHERE action IN ('like', 'comment')
)

SELECT 
    ROUND(SUM((CASE WHEN loc.user_id IS NULL THEN 1 ELSE 0 END)/count(*)) ,2) AS percent_never 
FROM users u 
LEFT JOIN like_comment loc ON u.id = loc.user_id 
