-- Hello World of SQL Querying, SELECT ALL records from a given table
SELECT *
FROM actor;

-- Query for first_name and last_name in the actor table
SELECT first_name, last_name
FROM actor;

-- Query for first_name and last_name where the first name is equal to 'Nick' using WHERE CLAUSE
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';