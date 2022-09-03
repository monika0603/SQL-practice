""" 
Over budget on a project is defined when the salaries, prorated to the day, exceed the budget of the project.

For example, if Alice and Bob both combined income make 200K and work on a project of a budget of 50K that takes half a year, then the project is over budget given 0.5 * 200K = 100K > 50K.

Write a query to forecast the budget for all projects and return a label of "overbudget" if it is over budget and "within budget" otherwise.

Note: Assume that employees only work on one project at a time.

Example:

Input:

employees table

Column	Type
id	INTEGER
first_name	VARCHAR
last_name	VARCHAR
salary	INTEGER
department_id	INTEGER
projects table

Column	Type
id	INTEGER
title	VARCHAR
state_date	DATETIME
end_date	DATETIME
budget	INTEGER
departments table

Column	Type
id	INTEGER
name	VARCHAR
employee_projects table

Column	Type
project_id	INTEGER
employee_id	INTEGER
Output:

Column	Type
title	VARCHAR
project_forecast	VARCHAR

Show solution
""" 

WITH calculated_fields AS 
(
    SELECT a.title, 
        DATEDIFF(a.end_date, a.start_date)/365 as duration,
        MAX(a.budget) as max_budget, 
        SUM(c.salary) as total_employee_salary
    FROM projects a 
    INNER JOIN employee_projects b 
    ON a.id = b.project_id
    INNER JOIN employees c
    ON b.employee_id = c.id 
    GROUP BY 1, 2
)

SELECT title, 
    CASE WHEN duration*total_employee_salary > max_budget THEN "overbudget" ELSE "within budget" END as project_forecast
FROM calculated_fields