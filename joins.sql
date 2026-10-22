SELECT film.title, film_category.category_id
FROM film
JOIN film_category ON film.film_id = film_category.film_id
LIMIT 5;

SELECT * FROM film
JOIN film_category ON film.film_id = film_category.film_id
LIMIT 5;

SELECT film.title, actor.first_name
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
LIMIT 5;