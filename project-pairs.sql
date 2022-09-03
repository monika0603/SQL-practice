""" 
Write a query to return pairs of projects where the end date of one project matches the start 
date of another project. 

Example:

Input:

projects table

Columns	Type
id	INTEGER
title	VARCHAR
start_date	DATETIME
end_date	DATETIME
budget	FLOAT
Output

Columns	Type
project_title_end	VARCHAR
project_title_start	VARCHAR
date	DATETIME
"""

SELECT pp.title AS project_title_end, 
    pe.title AS project_title_start, 
    pp.end_date AS date 
FROM projects pp 
JOIN projects pe 
ON pp.end_date = pe.start_date 