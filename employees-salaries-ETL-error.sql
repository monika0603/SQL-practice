""" 
Let’s say we have a table representing a company payroll schema.

Due to an ETL error, the employees table instead of updating the salaries every year when doing 
compensation adjustments, did an insert instead. The head of HR still needs the current salary of 
each employee.

Bonus: Write a query to get the current salary for each employee.

Note: Assume no duplicate combination of first and last names. (I.E. No two John Smiths)

Example:

Input:

employees table

Column	Type
id	VARCHAR
first_name	VARCHAR
last_name	VARCHAR
salary	INTEGER
department_id	INTEGER
Output:

Column	Types
first_name	VARCHAR
last_name	VARCHAR
salary	INTEGER

"""
SELECT e.first_name, e.last_name, e.salary
FROM employees AS e
INNER JOIN (
    SELECT first_name, last_name, MAX(id) AS max_id
    FROM employees
    GROUP BY 1,2
) AS m
    ON e.id = m.max_id