use sakila;
SHOW TABLES;
DESCRIBE customer;
DESCRIBE film;
SELECT title, rental_rate, rating
FROM film
WHERE rental_rate < 4.99 ;