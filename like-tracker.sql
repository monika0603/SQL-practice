""" 
The events table tracks every time a user performs a certain action (like, post_enter, etc.) on a platform.

Write a query to determine how many different users gave a like on June 6, 2020. 

Example:

Input:

events table

Column	Type
user_id	INTEGER
created_at	DATETIME
action	VARCHAR
platform	VARCHAR
Output

Column	Type
num_users_gave_like	INTEGER


"""

SELECT COUNT(DISTINCT user_id) as num_users_gave_like 
FROM events 
WHERE created_at = '2020-06-06' AND action = 'like'