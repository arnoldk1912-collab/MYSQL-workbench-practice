# The SQL MAX() Function
# The MAX() function returns the largest value of the selected column.

# The MAX() function works with numeric, string, and date data types.

SELECT MAX(rental_rate)
FROM film;

SELECT MAX(rental_rate) AS higest_rate
FROM film;

# Use MAX() with Date Column
SELECT MAX(last_update) AS latest_update
FROM customer;

SELECT MAX(rental_rate) AS priciest, rental_duration
FROM film
GROUP BY rental_duration;

