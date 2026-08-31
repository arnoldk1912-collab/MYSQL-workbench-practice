use sakila;
SELECT title, length, rental_rate
FROM film
WHERE length > 120 AND rental_rate = 0.99;