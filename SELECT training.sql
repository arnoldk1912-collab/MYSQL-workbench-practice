use sakila;
select * from film limit 10;

SELECT title, description, rental_rate
From film
WHERE rental_rate = 4.99;