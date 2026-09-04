# The SQL AVG() Function
# The AVG() function returns the average value of a numeric column.
# The AVG() function ignores NULL values in the column.

# Sakila database
SELECT AVG(rental_rate)
FROM film;

SELECT AVG(rental_rate)
FROM film
WHERE rental_duration = 6;

# chinook database
SHOW tables;
DESCRIBE track;
SELECT * FROM track;

SELECT AVG(unitprice) AS Average_price
FROM track
WHERE albumid = 5;

SELECT albumid, COUNT(*) AS Total_count,
MIN(unitprice) AS lowest_price,
MAX(unitprice) AS higest_price,
SUM(unitprice) AS Total_price, AVG(unitprice) AS Average_price
FROM Track
GROUP BY albumid;
