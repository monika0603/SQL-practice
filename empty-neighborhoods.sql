""" 
We’re given two tables, a users table with demographic information and the neighborhood they 
live in and a neighborhoods table.

Write a query that returns all neighborhoods that have 0 users. 

Example:

Input:

users table

Columns	Type
id	INTEGER
name	VARCHAR
neighborhood_id	INTEGER
created_at	DATETIME
neighborhoods table

Columns	Type
id	INTEGER
name	VARCHAR
city_id	INTEGER
Output:

Columns	Type
name	VARCHAR

"""

SELECT n.name   
FROM neighborhoods AS n 
LEFT JOIN users AS u
    ON n.id = u.neighborhood_id
WHERE u.id IS NULL