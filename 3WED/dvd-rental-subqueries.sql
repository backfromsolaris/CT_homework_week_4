-- Subqueries Joins/Multijoins
SELECT actor.actor_id, first_name, last_name, film_actor.film_id, title
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE title = 'Academy Dinosaur';

-- Join that will produce all customer info for customers from Angola
SELECT first_name, last_name, email, country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country = 'Angola';

-- find customer information(id, first, last) where the total amount of that 
--     customer's payments is greater than $175

-- Solving via join syntax
SELECT customer.customer_id, first_name, last_name, SUM(amount)
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
HAVING SUM (amount) > 175
ORDER BY SUM(amount) DESC;

-- Subquery examples

-- First - two queries split apart
SELECT customer_id, first_name, last_name, email
FROM customer;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175;

-- Adding the 2 queries together
SELECT customer_id, first_name, last_name, email
FROM customer
WHERE customer_id > 200 AND customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);

-- Find customer info (first, last, email) for
-- customers in Angola who have spent $150 or more
SELECT first_name, last_name, email
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country = 'Angola' AND customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 93
)

-- Basic Subqery syntax example
SELECT customer_id, first_name, last_name, email
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING COUNT(amount) > 30
);

-- Using basic subquery, find all films (title, release year, rating) 
--     with a language of 'English'
SELECT title, release_year, rating
FROM film
WHERE language_id IN(
	SELECT language_id
	FROM language
	WHERE name = 'English'
);



