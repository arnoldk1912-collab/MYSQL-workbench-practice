SELECT SUM(rental_rate)
FROM film;

SELECT SUM(amount) AS Payment_collected
FROM payment;

SELECT COUNT(*), SUM(length) AS Total_hours
FROM film
WHERE rating = 'R';

SELECT COUNT(*) AS Total_count,
SUM(length) AS Total_length,
min(length) AS Lowest, MAX(length) AS Higest, rating
FROM film
GROUP BY rating;