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

-- ========================================================
-- Query 6: LEFT JOIN with COALESCE and SUM() Aggregation
-- Purpose: Calculate total payments per customer, ensuring customers 
-- with zero payments are included and displayed with 0.
-- Key Concept: COALESCE(..., 0) converts NULL sums into 0, and 
-- GROUP BY aggregates payments per unique customer.
-- ========================================================
SELECT 
    c.first_name AS FIRST_NAME, 
    c.last_name AS LAST_NAME,
    COALESCE(SUM(p.amount), 0) AS TOTAL_AMOUNT
FROM customer c
LEFT JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;


-- ========================================================
-- Query 7: Filtering in the ON Clause vs WHERE Clause
-- Purpose: Count rentals in 2005 per customer, ensuring customers 
-- with zero rentals in 2005 still appear with a count of 0.
-- Key Concept: Placing the date filter inside the ON clause 
-- preserves unmatched left rows (returning 0), whereas WHERE turns 
-- the LEFT JOIN into an INNER JOIN by filtering out NULLs.
-- ========================================================
SELECT 
    c.first_name AS FIRST_NAME, 
    c.last_name AS LAST_NAME,
    COUNT(r.rental_id) AS RENTALS_IN_2005
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id 
    AND YEAR(r.rental_date) = 2005
GROUP BY c.customer_id, c.first_name, c.last_name;

-- ========================================================
-- Level 1: Basic Left Join (Store Managers)
-- Purpose: List every store and its managing staff member.
-- Key Concept: Using LEFT JOIN to ensure all stores appear, 
-- joining store manager ID to staff ID.
-- ========================================================
SELECT 
    st.store_id AS STORE_ID, 
    sf.first_name AS FIRST_NAME,
    sf.last_name AS LAST_NAME
FROM store st
LEFT JOIN staff sf ON st.manager_staff_id = sf.staff_id;