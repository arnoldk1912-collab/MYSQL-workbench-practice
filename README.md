# SQL Practice Portfolio: Sakila Database Analysis

This repository is a growing collection of queries, experiments, and small exercises written while learning the fundamentals of **MySQL** using the **Sakila sample database**.

## Sakila EER Diagram

The following diagram provides an overview of the relational structure of the Sakila database, illustrating how tables like `film`, `actor`, `customer`, and `payment` interact.

![Sakila EER Diagram](sakila%20EER%20Diagram.png)

## About

The files in this repository document hands-on practice with querying and modifying relational data. The goal is to build confidence with SQL syntax, understand how query clauses work together, and track progress over time through short, focused practice sessions.

## Topics covered so far

- `SELECT`, `FROM`, and `WHERE`
- Selecting specific columns and using `DISTINCT`
- Filtering with comparison operators: `=`, `!=`, `>`, `<`, `>=`, `<=`
- Pattern and range filtering with `LIKE` and `BETWEEN`
- Handling missing values with `IS NULL` and `IS NOT NULL`
- Logical operators: `AND`, `OR`, `NOT`
- Sorting results with `ORDER BY`, including multiple columns and `ASC`/`DESC`
- Limiting result sets with `LIMIT`
- Aggregate functions: `COUNT()`, `SUM()`, `MIN()`, `MAX()`, `AVG()`
- Column aliases with `AS`
- Grouping aggregate results with `GROUP BY`
- Subqueries, including comparisons against calculated averages
- Data modification statements: `INSERT`, `UPDATE`, `DELETE`
- Inspecting database structure with `SHOW TABLES` and `DESCRIBE`

## File Guide

| File or group | Main practice |
| --- | --- |
| `SELECT training.sql`, `SELECT, FROM and WHERE.sql`, `SQL day_1.sql` | Basic selection and filtering |
| `WHERE clause operators training.sql`, `NULL training.sql` | Comparison operators, `LIKE`, `BETWEEN`, and `NULL` checks |
| `AND training.sql`, `OR training.sql`, `NOT training.sql` | Logical operators |
| `ORDER BY.sql`, `ORDER BY task.sql`, `SELECT TOP Clause.sql` | Sorting and limiting results |
| `COUNT() Function.sql` | Counting rows and distinct values |
| `SUM() Function.sql` | Totals and expressions |
| `MIN() Function.sql`, `MAX() Function.sql`, `AVG() Function.sql` | Minimum, maximum, and average values |
| `INSERT INTO training.sql`, `Update statement training.sql`, `DELETE Statement.sql` | Data modification statements |
| `day1.sql`, `day2.sql`, `Untitled.sql` | Short daily exercises |

*Some exploratory files also reference the **Chinook** database. These are retained as part of the learning history, while Sakila remains the primary database for this repository.*

## How to run the files

1. Install MySQL Server and MySQL Workbench.
2. Download or enable the [Sakila sample database](https://dev.mysql.com/doc/index-other.html).
3. Open MySQL Workbench and connect to your local MySQL server.
4. Load the Sakila schema and data if it is not already installed.
5. Open any `.sql` file from this repository.
6. Select the `sakila` schema in the schema navigator, or run:
   ```sql
   USE sakila;
   ```
7. Execute the whole script or highlight individual statements and run them.

*Note: Most query files are read-only. `INSERT`, `UPDATE`, and `DELETE` exercises change data—run them against a practice copy of Sakila.*

## Progress tracking

- [x] Basic `SELECT`, `FROM`, and `WHERE`
- [x] Comparison operators
- [x] `LIKE`, `BETWEEN`, and `NULL` checks
- [x] `AND`, `OR`, and `NOT`
- [x] `ORDER BY` and `LIMIT`
- [x] `COUNT()`
- [x] `SUM()`
- [x] `MIN()`
- [x] `MAX()`
- [x] `AVG()`
- [x] `GROUP BY`
- [x] Subqueries
- [x] `INSERT`
- [ ] `UPDATE` exercises
- [ ] `DELETE` exercises
- [ ] `JOIN` and relationship queries
- [ ] `HAVING`
- [ ] More advanced subqueries and reporting queries
