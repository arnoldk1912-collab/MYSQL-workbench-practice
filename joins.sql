
# Our Goal
#    1. Understand why we need JOINs (the "Disconnected Data" problem).
#    2. Learn the Mechanism of the JOIN (how tables talk to each other).
#    3. Master the JOIN Types (Inner, Left, Right).
#    4. Write our first Join Query by hand.


#  Step 1: The "Why" (The Disconnected Data Problem)
    
#    Imagine we manage a restaurant. To keep things clean, we don't put all our information in one giant, messy spreadsheet. We split it into two specialized "Folders" (Tables):
    
#    Folder 1: employees
#    | employee_id | name  | role   |
#    |-------------|-------|--------|
#    | 1           | Ahmed | Chef   |
#    | 2           | Sarah | Server |
#    
#    Folder 2: shifts
#    | shift_id | employee_id | shift_date |
#    |----------|-------------|------------|
#    | 101      | 1           | 2026-10-24 |
#    | 102      | 2           | 2026-10-24 |
    
# The Problem: If I ask you, "Who is working the shift on 2026-10-24?", looking at the shifts folder alone doesn't tell you the names. 
# You only see employee_id.
    
# To get the answer, you have to look at the shifts folder, grab the ID (let's say "1"), then go to the employees folder and find the person with ID "1". 
    
#    A JOIN is just telling the computer to do that "grabbing and matching" for us in one command.


# Step 2: The Logic (The "Passport" Analogy)
    
#    Think of the employee_id in the shifts folder as a passport. 
    
#    When we perform a JOIN, we are saying:
#    "SQL, look at these two tables. Whenever the passport (employee_id) in the shifts table matches the ID in the employees table, 
#    stitch those two rows together into one wide line."


 CREATE SCHEMA IF NOT EXISTS restaurant_db;
    USE restaurant_db;
    
    -- Now, create our folders (tables)
    CREATE TABLE employees (id INT, name VARCHAR(50));
    CREATE TABLE shifts (employee_id INT, shift_date DATE);
    
    -- Add our data
    INSERT INTO employees VALUES (1, 'Ahmed'), (2, 'Sarah');
    INSERT INTO shifts VALUES (1, '2026-10-24'), (2, '2026-10-24');
    
SELECT * FROM employees;

#   The Theory
#    A JOIN in SQL is like a bridge. We need three things to build it:
#    1. The Starting Table: Where we begin (employees).
#    2. The Joining Table: Where we want to fetch the extra info from (shifts).
#    3. The "Passport" (Key): How the tables talk to each other. In our case, employees.id is the same as shifts.employee_id.

SELECT employees.name, shifts.shift_date
FROM employees
JOIN shifts ON employees.id = shifts.employee_id;


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