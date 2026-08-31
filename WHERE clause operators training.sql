SELECT * FROM payment
WHERE amount = 9.99; 

SELECT * FROM payment
WHERE amount > 2.99;

SELECT * FROM payment
WHERE amount < 2;

SELECT * FROM payment
WHERE amount >= 2;

SELECT * FROM payment
WHERE amount <= 2; 

SELECT * FROM payment
WHERE amount != 2.99; # i am using not equal operators

SELECT * FROM payment 
WHERE amount = 2.99;

SELECT * FROM payment
WHERE amount IS NULL;

SELECT count(*) FROM payment;

SELECT * FROM payment
WHERE amount BETWEEN 2 AND 3;

SELECT count(*) FROM payment
WHERE amount BETWEEN 2 AND 3;

SELECT * FROM actor
WHERE first_name LIKE 'j%'; # Finds names start whith J

SELECT * FROM actor
WHERE first_name LIKE '%n'; # Finds names that end with N

SELECT * FROM actor
WHERE first_name LIKE '%AN%'; # Finds names that contain "AN" anywhere inside the them

SELECT * FROM actor
WHERE first_name LIKE 'H%N';

# IN checking against a list of exact values insted of writing multiple ORs
SELECT first_name 
FROM actor
Where first_name IN ('Helen', 'Joe', 'Ed'); 

SELECT distinct first_name
From actor
WHERE first_name IN ('Helen', 'Joe', 'Ed');






