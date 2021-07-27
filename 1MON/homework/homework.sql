-- Question 1 - How many actors are there with the last name 'Wahlberg'?
-- Answer: 2 actors
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';


-- Question 2 - How many payments were made between $3.99 and $5.99?
-- Answer: 5607 payments
SELECT COUNT(payment)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;


-- Question 3 - What film does the store have the most of?
-- Answer: see query results
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;


-- Question 4 - How many customers have the last name 'William'?
-- Answer: none
SELECT first_name, last_name
FROM customer
WHERE last_name = 'William';


-- Question 5 - What store employee sold the most rentals?
-- Answer: staff_id '1'
SELECT staff_id, COUNT(staff_id)
FROM rental
GROUP BY staff_id
ORDER BY COUNT(staff_id) DESC;


-- Question 6 - How many different district names are there?
-- Answer: 603 (wrong, actually 378.  correction made below)
SELECT COUNT(DISTINCT district)
FROM address;


-- Question 7 - What film has the most actors in it? 
-- Answer: film_id '508'
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;


-- Question 8 - From store_id 1, how many customers have a last name ending with 'es'?
-- Answer: 13 customers
SELECT COUNT(last_name), store_id
FROM customer
WHERE last_name LIKE '%es'
GROUP BY store_id;


-- Question 9 - How many payment amounts had a number of rentals above 250 for customers
--              with ids between 380 and 430?
-- Answer: 3 amounts... 2.99, 4.99, 0.99
SELECT amount, COUNT(amount)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250;


-- Question 10 - Within the film table, how many rating categories are there?
--               And what rating has the most movies total?
-- Answer: 5 categories... PG-13 has the most
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;