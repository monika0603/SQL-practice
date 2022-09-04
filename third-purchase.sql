""" 
Given the transactions table below, write a query that finds the third purchase of every user.

Note: Sort the results by the user_id in ascending order. If a user purchases two products at the same time, the lower id field is used to determine which is the first purchase.

Example:

Input:

transactions table

Columns	Type
id	INTEGER
user_id	INTEGER
created_at	DATETIME
product_id	INTEGER
quantity	INTEGER
Output:

Columns	Type
user_id	INTEGER
created_at	DATETIME
product_id	INTEGER
quantity	INTEGER

"""

WITH product_rank_user AS 
(
    SELECT *, 
        RANK() OVER(PARTITION BY user_id ORDER BY created_at ASC) AS rnk 
    FROM transactions 
)

SELECT user_id, 
    created_at, 
    product_id, 
    quantity 
FROM product_rank_user 
WHERE rnk = 3 
ORDER BY user_id ASC 