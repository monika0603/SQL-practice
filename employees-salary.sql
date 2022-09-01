""" 
Given a employees and departments table, select the top 3 departments with at least ten employees 
and rank them according to the percentage of their employees making over 100K in salary.

Example:

Input:

employees table

Columns	Type
id	INTEGER
first_name	VARCHAR
last_name	VARCHAR
salary	INTEGER
department_id	INTEGER
departments table

Columns	Type
id	INTEGER
name	VARCHAR
Output:

Column	Type
percentage_over_100k	FLOAT
department_name	VARCHAR
number of employees	INTEGER

Algorithm: 
Breaking it down, we can subset this into separate clauses of conditions

Top 3 departments
% of employees making over 100K in salary
Department must have at least 10 employees
"""

SELECT CAST(SUM(
        CASE WHEN 
            salary > 100000 THEN 1 ELSE 0 
        END) AS DECIMAL
      )/COUNT(*) AS percentage_over_100k
      , d.name as department_name
      , COUNT(*) AS number_of_employees
FROM departments AS d
LEFT JOIN employees AS e
    ON d.id = e.department_id
GROUP BY d.name
HAVING COUNT(*) >= 10
ORDER BY 1 DESC
LIMIT 3