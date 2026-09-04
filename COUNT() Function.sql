# The behavior of COUNT() depends on the argument used within the parentheses:

# COUNT(*) - Counts the total number of rows in a table (including NULL values).
# COUNT(columnname) - Counts all non-null values in the column.
# COUNT(DISTINCT columnname) - Counts only the unique, non-null values in the column.

# The following SQL uses COUNT(*), and counts the total number of rows in the "Products" table (will include NULL values):
SELECT COUNT(*)
FROM customer;

# The COUNT(column_name) counts all non-null values in the specified column.
SELECT COUNT(film_id)
FROM film_actor;

# You can ignore duplicates by using the DISTINCT keyword.
# The COUNT(DISTINCT column_name) counts only the unique, non-null values in the column.
# If DISTINCT is specified, rows with the same value for the specified column will be counted as one.

SELECT COUNT(DISTINCT first_name)
FROM customer;

SELECT COUNT(rating)
FROM film
WHERE rental_rate > 2.99;

SELECT COUNT(*) AS Number_of_records
FROM Film;

SELECT length, COUNT(*) AS Number_of_records,
MIN(rental_rate) AS Lowest, MAX(rental_rate) AS Higest
FROM film
WHERE rental_duration < 7
GROUP BY length
ORDER BY length
LIMIT 30;

