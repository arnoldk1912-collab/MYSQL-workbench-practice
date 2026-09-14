# The LIKE operator is used in a WHERE clause to search for a specified pattern within a column's text data.
# A percent sign % - represents zero, one, or multiple characters

# Select all customers first name that starts with the letter "a":
SELECT * FROM customer
WHERE first_name LIKE 'a%';

# Select all customers first name that ends with the letter "a":
SELECT * FROM customer
WHERE first_name LIKE '%a';

# Return all from customer that contains the character sequence 'on' it even can be a number:
SELECT * FROM customer
WHERE last_name LIKE '%on%';

SELECT * FROM customer
WHERE customer_id LIKE '%512%';

# The _ Wildcard
# The _ wildcard represents one single character.

# It can be any character or number, but each _ represents one, and only one, character.
SELECT * FROM customer
WHERE first_name LIKE 'Ar__l_';

# To return records that starts with a specific letter or phrase, add the % at the end of the letter or phrase.
SELECT * FROM customer
WHERE first_name LIKE 'ma%'
LIMIT 5;

# We can also combine any number of conditions using AND or OR operators.
SELECT * FROM customer
WHERE first_name LIKE 'E%' AND last_name LIKE '%A';

SELECT * FROM customer
WHERE first_name LIKE 'A_A_' OR last_name LIKE 'E_A';

# You can also combine "starts with" and "ends with":
# Return all customers that starts with "F" and ends with "K":
SELECT * FROM customer
WHERE first_name LIKE 'F%K';

SELECT rating, COUNT(*) AS How_many
FROM film 
WHERE title LIKE 'A%'
GROUP BY rating;