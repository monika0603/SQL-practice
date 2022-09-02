""" 
The events table tracks every time a user performs a certain action (like, post_enter, etc.) on a platform.

Write a query to determine the top 5 actions performed during the week of Thanksgiving 
(11/22/2020 - 11/28/2020), and rank them based on number of times performed.

The output should include the action performed and their rank in ascending order. If two 
actions were performed equally, they should have the same rank. 

Example:

Input:

events table

Column	type
user_id	INTEGER
created_at	DATETIME
action	VARCHAR
platform	VARCHAR
Output:

Column	Type
action	VARCHAR
ranks	INTEGER

""" 

WITH action_ranks AS 
(
    SELECT action, 
        DENSE_RANK() OVER( ORDER BY (COUNT(action))) AS ranks
    FROM events 
    WHERE date(created_at) BETWEEN '2020-11-22' AND '2020-11-28'
    GROUP BY action 
)

SELECT action, ranks 
FROM action_ranks 
LIMIT 5