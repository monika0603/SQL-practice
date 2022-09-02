""" 
Let’s say you work at Amazon. With the annual_payments table below, answer the following three 
questions via SQL queries and output them as a table with the answers to each question.

How many total transactions are in this table?
How many different users made transactions?
How many transactions listed as "paid" have an amount greater or equal to 100?
Which product made the highest revenue? (use only transactions with a "paid" status)
Example:

Input:

annual_payments table

Column	Type
id	INTEGER
amount	FLOAT
created_at	DATETIME
status	VARCHAR
user_id	INTEGER
amount_refunded	FLOAT
product	VARCHAR
last_updated	DATETIME
Output:

Column	Type
question_id	INTEGER
answer	TEXT

""" 

SELECT 1 AS question_id, COUNT(*) AS answer 
	FROM annual_payments
UNION ALL
SELECT 2 AS question_id, COUNT(DISTINCT user_id) AS answer 
	FROM annual_payments
UNION ALL 
SELECT 3 AS question_id, COUNT(*) AS answer 
	FROM annual_payments 
	WHERE STATUS = 'paid' 
		AND amount>=100
UNION ALL 
SELECT * FROM (
	SELECT 4 AS question_id, product AS answer 
		FROM annual_payments 
		WHERE STATUS = 'paid' 
		GROUP BY product 
		ORDER BY SUM(amount) DESC
		LIMIT 1 
	) x