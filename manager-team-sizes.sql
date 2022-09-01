""" 
Write a query to identify the manager with the biggest team size.

You may assume there is only one manager with the largest team size.

Example:

Input:

employees table

Column	Type
id	INTEGER
name	VARCHAR
manager_id	INTEGER
managers table

Column	Type
id	INTEGER
name	VARCHAR
team	VARCHAR
Output:

Column	Type
manager	VARCHAR
team_size	INTEGER


"""

WITH manager_team_size AS 
(
    SELECT manager_id, COUNT(*) as team_size
    FROM employees
    GROUP BY manager_id
)

SELECT m.name as manager, mt.team_size
FROM managers m 
LEFT JOIN manager_team_size mt 
ON m.id = mt.manager_id 
GROUP BY m.name 
ORDER BY mt.team_size DESC 
LIMIT 1 