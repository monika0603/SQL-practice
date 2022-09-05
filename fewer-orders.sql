""" 
Write a query to identify the names of users who placed less than 3 orders or ordered less 
than $500 worth of product.

Example:

Input:

transactions table

Column	Type
id	INTEGER
user_id	INTEGER
created_at	DATETIME
product_id	INTEGER
quantity	INTEGER
users table

Column	Type
id	INTEGER
name	VARCHAR
sex	VARCHAR
products table

Column	Type
id	INTEGER
name	VARCHAR
price	FLOAT
Output:

Column	Type
users_less_than	VARCHAR
"""

WITH calculated_fields AS 
(
    SELECT 
        u.name, 
        COUNT(t.id) AS number_of_products, 
        SUM(t.quantity*p.price) AS product_price 
    FROM users u 
    LEFT JOIN transactions t ON u.id = t.user_id 
    LEFT JOIN products p ON t.id = p.id 
)

SELECT name AS users_less_than 
FROM calculated_fields 
WHERE number_of_products < 3 OR product_price < 500