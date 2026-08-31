# ORDER BY clause

# The ORDER BY keyword is used to sort the result-set in ascending or descending order.

SELECT * FROM film 
ORDER BY title; # Sorts film alphabetically by title, A to Z

SELECT * FROM payment
ORDER BY amount; # The ORDER BY keyword sorts the result-set in ascending order (ASC) by default.

# To sort the records in descending order, use the DESC keyword.
SELECT * FROM payment
ORDER BY amount DESC; 

SELECT * FROM film # Sorts film alphabetically by descending order, title
ORDER BY title DESC;

# ORDER BY Several Columns
# This sorts by first name first, and if two actors share a first name,
# it sorts those by last name next.
SELECT * FROM actor 
ORDER BY first_name, last_name;

# The following SQL statement selects all customers from the "Customers" table, and sorts it ASCENDING by the "Country" and 
# DESCENDING by the "CustomerName" column:
SELECT * FROM actor
ORDER BY first_name ASC, last_name DESC;