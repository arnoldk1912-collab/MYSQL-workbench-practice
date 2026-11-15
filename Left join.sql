-- ========================================================
-- LESSON: The Core Rule of a LEFT JOIN
-- A LEFT JOIN returns all records from the left table, 
-- and the matched records from the right table. 
-- If there is no match, SQL returns NULL.
-- ========================================================

-- Query 1: Basic Left Join between Film and Inventory
SELECT f.film_id, f.title, i.inventory_id
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id;


-- ========================================================
-- Query 2: Left Join with Aliased Columns for Readability
-- ========================================================
SELECT 
    f.film_id AS Film_ID, 
    f.title AS Title,
    i.inventory_id AS Inventory_ID
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id;


-- ========================================================
-- Query 3: Filtering for Missing Data (Unstocked Films)
-- Purpose: Find films that exist in the catalog (film table)
-- but have NO physical copies in store inventory (inventory table).
-- Key Concept: LEFT JOIN + WHERE right_table.id IS NULL 
-- isolates unmatched records.
-- ========================================================
SELECT 
    f.film_id AS Film_ID, 
    f.title AS Title,
    i.inventory_id AS Inventory_ID
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
WHERE i.inventory_id IS NULL;


-- ========================================================
-- Query 4: LEFT JOIN with Aggregations (COUNT + GROUP BY)
-- Purpose: Count how many films belong to EVERY category.
-- Key Concept: COUNT(fc.film_id) counts non-NULL values, 
-- returning 0 for categories with no films.
-- ========================================================
SELECT 
    c.name AS Category_Name, 
    COUNT(fc.film_id) AS Total_Films
FROM category c
LEFT JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.category_id, c.name;


-- ========================================================
-- Query 5: Multi-Table LEFT JOIN (3 Tables)
-- Purpose: Join Film -> Inventory -> Rental.
-- Key Concept: Chain multiple LEFT JOINs to inspect relationships 
-- across catalog items, physical stock, and customer rentals.
-- ========================================================
SELECT 
    f.title AS Title, 
    i.inventory_id AS Inventory_ID, 
    r.rental_date AS Rental_Date
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_date IS NULL;
