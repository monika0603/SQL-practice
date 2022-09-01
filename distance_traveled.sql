""" 
Given the tables users and rides, write a query to report the distance traveled by each user in 
descending order.

users table

Column	Type
id	INTEGER
name	INTEGER
rides table

Column	Type
id	INTEGER
passenger_user_id	INTEGER
distance	FLOAT
Output:

Column	Type
name	VARCHAR
distance_traveled	FLOAT

"""

SELECT u.name, 
       IFNULL(SUM(r.distance),0) AS distance_traveled
FROM users u
LEFT JOIN rides r
ON u.id = r.passenger_user_id 
GROUP BY u.name 
ORDER BY distance_traveled DESC 