USE sakila;
# SELECT clause
SELECT * FROM customer;

# FROM clause
SELECT customer_id, first_name
FROM customer;

SELECT first_name 
FROM actor;

SELECT distinct first_name
FROM actor;

SELECT Count(distinct first_name)
FROM actor;


SELECT actor_id, first_name, last_update
FROM actor
WHERE first_name = 'helen';	

DESCRIBE payment;
SELECT payment_id, payment_date, amount
FROM payment
WHERE amount < 2.99;

