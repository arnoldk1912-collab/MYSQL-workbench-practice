SELECT * FROM film
WHERE rating = 'r'
AND title LIKE '%y';

SELECT * FROM film
WHERE rating = 'pg-13'
AND rental_rate > 3.99;

SELECT * FROM film
WHERE rating IN ('pg-13', 'r', 'g')
AND rental_duration BETWEEN 6 AND 7 AND title LIKE '%E'
ORDER BY rating;
