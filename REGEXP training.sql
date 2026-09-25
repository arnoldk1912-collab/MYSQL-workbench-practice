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

# 'AR$' will check all the name start with AR from the customer table.
SELECT first_name, last_name
FROM customer
WHERE first_name REGEXP 'AR$';

# this will check first name start wit AR and email ends with .com
SELECT * FROM customer
WHERE first_name REGEXP '^AR' AND email REGEXP '\\.com$';
