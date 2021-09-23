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

-- Query for first_name and last_name where the first name is equal to 'Nick' using WHERE & LIKE CLAUSES
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Query for first/last where first name starts with a 'J' using the LIKE/WHERE clauses - wildcard %
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

-- Query for first/last where first name starts K and is followed by 2 more characters LIKE/WHERE - underscore
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__';

-- Query for first/last where first name starts with K, followed by 2 chars, ends with a 'th' - COMBO of underscore/wildcard
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__%th';

-- Comparing operators in SQL
-- Greater than (>) -- Less than(<)
-- Greater or Equal (>=) -- Less or Equal (<=)
-- Not Equal to (<>) -- equivalent to != in python

-- Explore data with SELECT * Query (typically do this when changing to a new table)
SELECT *
FROM payment;

-- Query for customer_id and amount where amount is greater than than 2.00
SELECT customer_id, amount
FROM payment
WHERE amount >2.00;

-- Same query as above - for amounts less than 7.99 (ASC = Ascending, DESC = Descending)
SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99
ORDER BY amount ASC;

-- Query for the same data where amount is between $2.00 and $7.99 ordered in Descending order
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2.00 AND 7.99
ORDER BY amount DESC;

-- Query for same data where amount is not equal to 0, order from lowest to highest amount
SELECT customer_id, amount
FROM payment
WHERE amount <> 0
ORDER BY amount ASC;

-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()

SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

-- Query to find the average amount for all payments above $5.99
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the count amounts paid that are greater than 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;

-- Query to find the count of unique amounts paid over 5.99
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

-- Query to show the minimum payment amount greater than 7.99 -- Alias column as 'Min_payment' in output
SELECT MIN(amount) AS Min_payment
FROM payment
WHERE amount > 7.99;

-- Query to show the maximum payment amount greater than 7.99 -- Alias column as 'Max_payment' in output
SELECT MAX(amount) AS Max_payment
FROM payment
WHERE amount > 7.99;

-- More specific comparison for amount
SELECT amount
FROM payment
WHERE amount = 7.99;

-- Exploratory Query
SELECT *
FROM payment;

-- Query for like amounts grouped together along with their total count
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY amount ASC;

-- Query for custoner_id and the total sum of all of their payment amounts
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

-- Exploratory Query
SELECT *
FROM customer;

-- Query to display customer_id's that show up more than once
-- grouping by customer email address
-- HAVING is very similar to WHERE, must be used if checking conditional with aggregator (sum, max, min, avg, count)

SELECT COUNT(customer_id), email
FROM customer
GROUP BY email
HAVING COUNT(customer_id) > 1;

-- Query to find customers with an ID over 450 that have paid more than $100 total

SELECT customer_id, SUM(amount)
FROM payment
WHERE customer_id > 450
GROUP BY customer_id
HAVING SUM(amount) > 100
ORDER BY SUM(amount) DESC;



