""" 
Write a query to get the cost of all transactions by user ordered by total cost descending.

Example:

Input:

transactions table

Column	Type
id	INTEGER
user_id	INTEGER
created_at	DATETIME
product_id	INTEGER
quantity	INTEGER

products table

Column	Type
id	INTEGER
name	VARCHAR
price	FLOAT

users table

Column	Type
id	INTEGER
name	VARCHAR
created_at	DATETIME
Output:

Column	Type
name	VARCHAR
user_id	INTEGER
total_cost	FLOAT


""" 

SELECT u.name, 
       u.id as user_id, 
       ROUND(SUM(t.quantity*p.price),2) AS total_cost 
FROM users u 
LEFT JOIN transactions t 
ON u.id = t.user_id
LEFT JOIN products p 
ON t.id = p.id 
GROUP BY u.name, u.id 
ORDER BY total_cost DESC 