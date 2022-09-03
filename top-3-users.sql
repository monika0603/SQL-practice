"""
Let’s say you work at a file-hosting website. You have information on user’s daily downloads in the download_facts table

Use the window function RANK to display the top three users by downloads each day. Order your data by date, and then by daily_rank

Example:

Input:

download_facts table

Column	Type
user_id	INTEGER
date	DATE
downloads	INTEGER
Output:

Column	Type
daily_rank	INTEGER
user_id	INTEGER
date	DATE
downloads	INTEGER
"""


WITH cte_1 AS (
	SELECT
		RANK() OVER (PARTITION BY date ORDER BY downloads DESC) AS daily_rank,
		user_id,
		date,
		downloads
	FROM
		download_facts
)
SELECT
	daily_rank,
	user_id,
	date,
	downloads
FROM
	cte_1
WHERE
	daily_rank <= 3 ORDER BY
		date, daily_rank