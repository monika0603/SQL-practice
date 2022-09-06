""" 
Write a SQL query to create a histogram of the number of comments per user in the month of January 2020.

Note: Assume bin buckets class intervals of one.

Note: Comments by users that were not created in January 2020 should be counted in a “0” bucket

users table

Columns	Type
id	INTEGER
name	VARCHAR
created_at	DATETIME
neighborhood_id	INTEGER
mail	VARCHAR
comments table

Columns	Type
user_id	INTEGER
body	VARCHAR
created_at	DATETIME
Output:

Column	Type
comment_count	INTEGER
frequency	INTEGER

"""

WITH number_of_comments AS 
(
SELECT users.id, count(*) as comments_count
FROM users 
LEFT JOIN comments 
on users.id = comments.user_id 
WHERE comments.created_at BETWEEN '2020-01-01' AND '2020-01-31'
GROUP BY users.id 
) 

SELECT comments_count, count(*) AS frequency 
FROM number_of_comments
GROUP BY comments_count