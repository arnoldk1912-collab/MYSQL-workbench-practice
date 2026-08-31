# Select the first 3 records of the Customers table:
SELECT * FROM film
LIMIT 3;

SELECT * FROM film
WHERE rating = 'NC-17' AND rental_rate = 2.99
LIMIT 5;

SELECT * FROM film
WHERE rental_duration > 6
ORDER BY film_id DESC 
LIMIT 15;

SELECT COUNT(*) FROM film;

