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