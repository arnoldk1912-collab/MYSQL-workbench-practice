# The MIN() function returns the smallest value of the selected column.

# The MIN() function works with numeric, string, and date data types.

# Return the lowest price in the Price
SELECT MIN(rental_rate)
FROM film;

SELECT MIN(total)
FROM Invoice;

# Set Column Name (Alias)
# When using MIN(), the returned column will not have a name.
# Use the AS keyword to give the column a descriptive name:

SELECT * FROM track;
SELECT MIN(unitprice) AS cheepest_price, MIN(milliseconds) AS shortest_song
FROM track;

SELECT MIN(unitprice) AS cheepest_price, trackid
FROM track
GROUP BY trackid
LIMIT 15;


SELECT MIN(rental_rate) AS lowest_rate , length
FROM film
GROUP BY length
ORDER BY length
LIMIT 25;

SELECT length, COUNT(replacement_cost) AS how_many, MIN(rental_rate) AS cheapest,
MAX(rental_rate) AS priciest
FROM film
GROUP BY length
HAVING COUNT(replacement_cost) < 20;

SELECT rental_duration, COUNT(*), MIN(rental_rate),
MAX(rental_rate)
FROM film
GROUP BY rental_duration;


