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

# IN subquery

# In a normal query, you ask the database for data in one go: "Show me everyone who lives in Dubai."
    
# A subquery is when you need to ask a question to get an answer, then use that answer to ask your main question.

# 1.  The Parentheses Rule: The query inside the parentheses (SELECT ...) always runs first. It is the "helper."
# 2.  The Helper's Job: The helper finds a single piece of information (like an ID, a name, or a number) and hands it back to the "Main Query."
# 3.  The Main Query: It takes that information and finishes the job.

SELECT AVG(length)
FROM film;

SELECT title, length
FROM film
WHERE length > (SELECT AVG(length) 
FROM film
);

SELECT title, replacement_cost
FROM film 
WHERE replacement_cost IN (
	SELECT replacement_cost
	FROM film
	WHERE title = 'ACE GOLDFINGER'
  );

# /* SUBQUERY WITH IN
   # Goal: find films that have the same rating as 'AFRICAN EGG'.

# How it runs (inside out):
#   1. Inner query runs FIRST: finds AFRICAN EGG's rating
#      (returns one value, the rating).
#   2. Outer query then uses that result: WHERE rating IN (...)
#      keeps only films whose rating matches.
#   3. LIMIT 15 just caps the output at 15 rows.

#   Why a subquery? I don't know the rating upfront, so I let SQL
#   look it up instead of hardcoding it.
#   Why IN and not =? IN also works if the subquery returns
#   multiple values; = would break in that case.

SELECT title, rating
FROM film 
WHERE rating IN (
   SELECT rating
   FROM film
   WHERE title = 'AFRICAN EGG'
)
LIMIT 15;
 

SELECT title 
FROM film 
WHERE film_id IN (
        SELECT film_id 
        FROM film_category 
        WHERE category_id = (SELECT category_id FROM category WHERE name = 'Action')
    );
    

