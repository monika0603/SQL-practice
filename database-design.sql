""" 
Design a database for a stand-alone fast food restaurant. 

Based on the above database schema, write a SQL query to find the top three highest 
revenue items sold yesterday. 

Write a SQL query using the database schema to find the percentage of customers 
that order drinks with their meal.
"""
user: 
user_id (pk) | created_date | user_type
1 | '2022-09-01 10:15:00' | 'walkin'

orders:
order_id | user_id | created_date | item_id | quantity 
1 | 1 | '2022-09-01 10:15:00' | 1 | 1 

items: 
item_id (pk) | description | price 

-- top three highest revenue items 

SELECT 
    items.item_id, 
    (items.price*orders.quantity) as revenue 
FROM orders 
JOIN items ON orders.item_id = items.item_id 
GROUP BY 1 
ORDER BY revenue DESC 
LIMIT 3 

--- Number of customers who ordered drinks with their meals 
WITH drink_orders AS 
(
    SELECT 
        COUNT(DISTINCT u.user_id)
    FROM users u 
    LEFT JOIN orders o ON u.user_id = o.user_id 
    LEFT JOIN items i ON o.item_id = i.item_id 
    WHERE i.description LIKE '%drinks%'
)