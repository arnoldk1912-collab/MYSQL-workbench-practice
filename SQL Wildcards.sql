# Using the % Wildcard
# Return all the customer that start with letter 'a':
SELECT * FROM customer
WHERE first_name LIKE 'a%'; 

# Returns the pattern ends with 'old':
SELECT first_name, last_name FROM customer
WHERE first_name LIKE '%old';

# Return all customer that contains the pattern 'ld':
SELECT * FROM customer
WHERE first_name LIKE '%ld%';

      # Using the _ Wildcard

 # The _ wildcard represents a single character.

# It can be any character or number, but each _ represents one, and only one, character.  
SHOW TABLES;
DESCRIBE city;

# Return all customers with a City starting with any character, followed by "ondon":
SELECT * FROM city
WHERE city LIKE '_ondon';

SELECT * FROM city
WHERE city LIKE 'd___a';