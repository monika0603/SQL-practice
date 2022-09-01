""" 
Given a table of transactions and a table of users, write a query to determine if users tend to order more to their primary address versus other addresses.

Note: Return the percentage of transactions ordered to their home address as home_address_percent.

Example:

Input:

transactions table:

Columns	Type
id	INTEGER
user_id	INTEGER
created_at	DATETIME
shipping_address	VARCHAR
users table:

Columns	Type
id	INTEGER
name	VARCHAR
address	VARCHAR
Example Output:

home_address_percent	0.76

"""

SELECT 
    SUM(CASE WHEN t.shipping_address = u.address THEN 1 ELSE 0 END)/COUNT(*) as home_address_percent 
FROM users u 
JOIN transactions t 
on u.id = t.user_id 