""" 
You have a table containing information about the projects employees have worked on and the time period in which they worked on the project. Each project can be assigned to more than one employee, and an employee can be working on more than one project at a time.

Write a query to find how many unique days each employee worked. Order your query by the employee_id.

Example:

Input:

projects table

Columns	Type
id	INTEGER
title	VARCHAR
start_date	DATETIME
end_date	DATETIME
budget	INTEGER
employee_id	INTEGER
Output:

Columns	Type
employee_id	INTEGER
days_worked	DATETIME

"""


Select employee_id, datediff(end_date,start_date) as days_worked

from(
select employee_id,
min(start_date) as start_date,
max(end_date) as end_date
from projects
group by employee_id) s
