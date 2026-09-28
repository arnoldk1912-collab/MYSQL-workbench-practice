# | Symbol | Name     | Description  | Example      | Finds...               |      |              |
#   |--------|----------|--------------|--------------|------------------------|------|--------------|
#   | ^      | Caret    | Starts with  | ^AR          | Aron, Armando          |      |              |
#   | $      | Dollar   | Ends with    | com$         | name@mail.com          |      |              |
#   | .      | Dot      | Any 1 char   | J.n          | Jan, Jon, Jxn          |      |              |
#   |        |          | Pipe         | OR (Logical) | John\                  | Jane | John OR Jane |
#   | []     | Brackets | Any of these | [ABC]        | Starts with A, B, or C |      |              |
#   | [-]    | Range    | Range        | [a-z]        | Any letter a through z |      |              |
#   | \\.    | Escape   | Literal Dot  | \\.com       | The period in .com     |      |              |
    
    
# ^ (Caret symbol):
#   * Meaning: Matches the beginning of the string.
#   * Use Case: Filters results to only those where the pattern appears at the very start.
#   * Example: REGEXP '^AR' 
#      * Matches: Aron, Armando, Arthur.
#     * Does NOT match: Sarah (because 'Ar' is in the middle), or Robert (doesn't start with 'AR').
SELECT first_name, last_name
FROM customer
WHERE first_name REGEXP '^[ABC]'
LIMIT 15;

# '^AR' will check all the name start with AR from the customer table.
SELECT first_name, last_name
FROM customer
WHERE first_name REGEXP '^AR';

# 'AR$' will check all the name ends with AR from the customer table.
SELECT first_name, last_name
FROM customer
WHERE first_name REGEXP 'AR$';

# this will check first name start wit AR and email ends with .com
SELECT * FROM customer
WHERE first_name REGEXP '^AR' AND email REGEXP '\\.com$';

# In the context of REGEXP in MySQL, the dot (.) is a wildcard for any single character.

# REGEXP 'J.N' → J, then ANY one character (the dot = wildcard for exactly 1 char), then N
# No anchors (^ or $) used, so it matches "J_N" ANYWHERE in the string — start, middle, or end
# That's why JENNIFER matched too (J-E-N are just its first 3 letters)
# To force it to match ONLY a 3-letter name exactly, you'd need: '^J.N$'
SELECT first_name, last_name
FROM customer
WHERE first_name REGEXP 'J.N';

# ^J it will check first name from the table starts with j
# . any one letter 
# N$ ends with n.
# so the only result from customer table first name is (JON) 
SELECT first_name, last_name
FROM customer
WHERE first_name REGEXP '^J.N$';

SELECT * FROM customer
WHERE first_name REGEXP '^J.{4}N$';

## ^.{5}$  → exact 5-letter match
# ^        = start of string
# .{5}    = any 5 characters in a row (the {5} repeats the . wildcard 5 times, sequentially)
# $        = end of string
# Together: string must be EXACTLY 5 characters, no more, no less — no letter restriction at all
SELECT first_name, last_name
FROM customer
WHERE first_name REGEXP '^.{5}$';

#   Scenario: You want to find an actor whose name is exactly 4 letters long and starts with 'A'.
    
#    *   Using LIKE: You would have to do LIKE 'A___'. It works, but it's annoying to count underscores.
#    *   Using REGEXP: You do REGEXP '^A.{3}$'.
    
#    You are telling the computer: "Start with A, then have exactly 3 more characters, and then stop."
SELECT * FROM customer
WHERE first_name REGEXP '^A.{3}$';

# REGEXP | the pipe

# Difference between OR and REGEXP |

# OR is a SQL operator. It looks at the whole condition you are checking in your WHERE clause. 
# It is used when you want to compare different columns or separate logic.

# The | (pipe) only works inside your search string (the part inside the single quotes). 
# It is a "shortcut" for pattern matching within a single column.

SELECT COUNT(*) as Total_count, rating
FROM film
WHERE rating REGEXP 'R|PG|PG-13'
GROUP BY rating;

SELECT * FROM customer
WHERE first_name REGEXP '^[SYC]';

SELECT * FROM film
WHERE rental_duration REGEXP '[3-5]';

SELECT title 
FROM film 
WHERE title REGEXP '^[A-D]';

SELECT length
FROM film
WHERE length REGEXP '^[50-70]';

# What is REGEXP \\ ?

#    if You want to search for a dot (like in email@gmail.com).
#    But the computer sees a dot . and thinks: "Oh! A magic dot! That means I should match ANY character!" 
#    It doesn't know you just want a regular, boring, plain old period.
    
#    2. The First Signal (\)
#    To tell the computer "Treat this dot as a regular dot," you put a backslash in front of it: \.. 
#    This is called escaping. It "escapes" the dot from being magic.
    
#    3. The "Why Two?" (\\)
#    Here is where it gets annoying. You are typing this command inside a string (inside single quotes ' ').
#    *   In SQL, the backslash \ is also used for other special things (like new lines or tabs).
#    *   If you type \., SQL tries to be smart, gets confused, and often deletes the backslash before it even reaches the Regex engine.
#    *   By typing \\, you are telling SQL: "No, really, I want a literal backslash. Don't touch it. Pass it through to the Regex engine."

# Hope i understood all this wonderfull weird symbols!

SELECT * FROM customer
WHERE email regexp '\\.com';
    