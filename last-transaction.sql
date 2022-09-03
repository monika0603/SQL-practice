"""
Given a table of bank transactions with columns id, transaction_value, and created_at representing 
the date and time for each transaction, write a query to get the last transaction for each day.

The output should include the id of the transaction, datetime of the transaction, and the transaction 
amount. Order the transactions by datetime.

Example:

Input:

bank_transactions table

Column	Type
id	INTEGER
created_at	DATETIME
transaction_value	FLOAT
Output:

Column	Type
created_at	DATETIME
transaction_value	FLOAT
id	INTEGER

I need help

"""

WITH timed_transactions AS 
       (
	SELECT * , ROW_NUMBER() OVER (PARTITION BY DATE(created_at) ORDER BY created_at DESC) as ordered_time
	FROM bank_transactions
	)
SELECT  created_at,transaction_value, id  FROM timed_transactions
WHERE ordered_time = 1;