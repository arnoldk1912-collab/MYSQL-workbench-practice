# The SQL SUM() Function
# The SUM() function is used to calculate the total sum of values within a numeric column.
# The SUM() function ignores NULL values in the column.
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

# SUM() With an Expression
# The parameter inside the SUM() function can also be an expression.
SELECT SUM(rental_rate)
FROM film;

# # Use an expression inside the SUM() function:
SELECT SUM(rental_rate / 11)
FROM film;

