SELECT title, rental_rate, rating
FROM film 
WHERE rating IN ('R', 'pg', 'pg-13');

SELECT title, rental_rate, rating
FROM film 
WHERE rating NOT IN ('R', 'pg', 'pg-13');


SELECT title, rating
FROM film
WHERE rating IN(
  SELECT rating
  FROM film
  WHERE length = 60
  );
  
SELECT * FROM film
WHERE length < 50;

SELECT * FROM film
WHERE title IN ('ACE GOLDFINGER', 'ALIEN CENTER', 'HAWK CHILL');

SELECT * FROM film
WHERE title IN (SELECT title
FROM film
where length < 50);

SELECT * FROM film
WHERE rating IN ('pg-13', 'R');

SELECT * FROM film
WHERE length IN (
SELECT length
FROM film
WHERE title = 'ACE GOLDFINGER'
);
