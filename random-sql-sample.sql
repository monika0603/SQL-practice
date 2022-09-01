""" 
Let’s say we have a table with an id and name fields. The table holds over 100 million rows and we 
want to sample a random row in the table without throttling the database.

Write a query to randomly sample a row from this table.

Example:

Input:

big_table table

Columns	Type
id	INTEGER
name	VARCHAR

"""

SELECT CEIL(RAND() * (SELECT ID FROM big_table))