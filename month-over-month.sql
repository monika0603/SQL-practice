""" 
Given a table of transactions and products, write a function to get the month_over_month 
change in revenue for the year 2019. Make sure to round month_over_month to 2 decimal places.

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
Output:

Column	Type
month	INTEGER
month_over_month	FLOAT
"""

WITH revenue_calculations AS 
(
    SELECT MONTH(created_at) AS month, 
        ROUND(SUM(t.quantity*p.price),2) as revenue
    FROM transactions t 
    INNER JOIN products p 
    ON t.product_id = p.id 
    GROUP BY 1 
)

SELECT
    month
    , ROUND((revenue - previous_revenue)/previous_revenue, 2) AS month_over_month
FROM (
SELECT 
    month,
    revenue,
    LAG(revenue,1) OVER (
        ORDER BY month
    ) previous_revenue
    FROM monthly_transactions
) AS t
