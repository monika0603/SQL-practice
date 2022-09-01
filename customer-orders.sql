"""
Write a query to identify customers who placed more than three transactions each in both 2019 and 2020.

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
  Output:

Column	Type
customer_name	VARCHAR

"""

WITH transaction_counts AS (
    SELECT u.id, 
    name,
    SUM(CASE WHEN YEAR(t.created_at)= '2019' THEN 1 ELSE 0 END) AS t_2019,
    SUM(CASE WHEN YEAR(t.created_at)= '2020' THEN 1 ELSE 0 END) AS t_2020
    FROM transactions t
    JOIN users u
    ON u.id = user_id
    GROUP BY 1
    HAVING t_2019 > 3 AND t_2020 > 3
)

SELECT tc.name AS customer_name
FROM transaction_counts tc