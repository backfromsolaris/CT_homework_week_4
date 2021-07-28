-- Question 1: List all customers who live in Texas (use JOINs):
-- Answer: 5 customers, see query...
SELECT first_name, last_name, district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';


-- Question 2: Get all payments above $6.99 with the customer's full name:
-- Answer: 1406 payments, see query...
SELECT first_name, last_name, amount
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
ORDER BY amount ASC;


-- Question 3: Show all customers' names who have made payments over $175
--     (use subqueries)
-- Answer: 6 customers: Rhonda, Clara, Eleanor, Marion, Tommy, Karl
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);

-- checking work on question #3
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175;


-- Question 4: List all customers that live in Nepal (use the city table)
-- Answer: 1 customer, Kevin Schuler
SELECT first_name, last_name
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';


-- Question 5: Which staff member had the most transactions?
-- Answer: Jon Stephens, with 7304 total transactions
SELECT staff.first_name, staff.last_name, COUNT(payment.payment_id)
FROM staff
JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.first_name, staff.last_name
ORDER BY COUNT(payment.payment_id) DESC;


-- Question 6: How many movies of each rating are there?
-- Answer: see query...
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;


-- Question 7: Show all customers who have made a single payment above $6.99
--     (use subqueries)
-- Answer: 539 customers, see query...
SELECT first_name, last_name
FROM customer
WHERE customer_id in(
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
);


-- Question 8: How many free rentals did our stores give away?
-- Answer: 24 free rentals
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
HAVING amount = 0;