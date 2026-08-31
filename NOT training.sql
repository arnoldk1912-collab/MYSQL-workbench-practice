# The NOT operator is used in the WHERE clause to return all records that DO NOT match the specified criteria. 
# It reverses the result of a condition from true to false and vice-versa.
SELECT rating
FROM film
WHERE NOT rating = 'R'; # it Will skip R from rating but print every other rating

# The following SQL selects all title that do NOT start with the letter "A":
SELECT * FROM film
WHERE title NOT LIKE 'A%';

# select film with rental duration not between 5 and 7
SELECT * FROM film
WHERE rental_duration NOT BETWEEN 5 AND 7;

SELECT distinct rating
FROM film
WHERE rating LIKE '_';
