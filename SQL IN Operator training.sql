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

# multi-table queries

# In the `film` table, you have a `language_id`. If you want to find all movies in the **"English"** language, 
# you can't do it with just the `film` table, because the `film` table only       │
# contains a number (`1`), not the word "English"																																																		│
#    The word "English" lives in a **different** table called `language`. 

SELECT title, language_id, rating
FROM film
WHERE language_id IN (
      SELECT language_id
      FROM language
      WHERE name = 'FRENCH'
      );

UPDATE film
SET language_id = 5
WHERE film_id = 10;

# multi-table nested subquery

#    The 5-Year-Old Logic (The "Follow the Breadcrumbs")
    
#    You want to find the movies that are Comedy.
    
#    Step 1: The Smallest Helper (The Deepest Parenthesis)
#    sql
#    SELECT category_id FROM category WHERE name = 'COMEDY'
    
#    *   What you did: You opened Folder A. You looked for the word 'COMEDY'. You found it, and you saw the number 5 next to it.
#    *   Now you have: The number 5.
    
#    Step 2: The Middle Helper
#    sql
#    SELECT film_id FROM film_category WHERE category_id IN (5)
    
#    *   What you did: You took that number 5 and walked over to Folder B (the Map). You looked through all the rows. 
#        Every time you saw the number 5 in the category_id column, you
#    wrote down the film_id next to it.
#    *   Now you have: A piece of paper with a list of numbers, like (10, 22, 50, 99...).
    
#    Step 3: The Big Boss (The Outside)
#    sql
#    SELECT title, description FROM film WHERE film_id IN (10, 22, 50, 99...)
    
#    *   What you did: You took that list of numbers (10, 22, 50, 99...) and walked over to Folder C (the Library). You went down the list: 
#      "Okay, show me the title for movie #10... show me the title for movie #22..."
#    *   Result: You get the actual movie names.
    


SELECT film_id, title, description
FROM film
WHERE film_id IN (
      SELECT film_id
      FROM film_category
      WHERE category_id IN (
            SELECT category_id
            FROM category
            WHERE name = 'COMEDY')
	);
    
SELECT title 
FROM film 
WHERE film_id IN (
        SELECT film_id 
        FROM film_category 
        WHERE category_id = (SELECT category_id FROM category WHERE name = 'Action')
    );


