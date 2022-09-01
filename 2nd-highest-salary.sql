"""
Write a SQL query to select the 2nd highest salary in the engineering department. If more than one 
person shares the highest salary, the query should select the next highest salary.

Example:

Input:

employees table

Column	Type
id	INTEGER
first_name	VARCHAR
last_name	VARCHAR
salary	INTEGER
department_id	INTEGER
departments table

Column	Type
id	INTEGER
name	VARCHAR
Output:

Column	Type
salary	INTEGER
"""

SELECT salary FROM 
(
SELECT salary 
FROM employees e 
JOIN departments d 
ON e.department_id = d.id 
WHERE d.name = 'engineering' 
GROUP BY 1 
ORDER BY 1 DESC
LIMIT 2 
) t 
ORDER BY 1 
LIMIT 1 