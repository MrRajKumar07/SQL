/* ==============================================================================
   SQL Joins 
-------------------------------------------------------------------------------
   This document provides an overview of SQL joins, which allow combining data
   from multiple tables to retrieve meaningful insights.

   Table of Contents:
     1. Basic Joins
        - INNER JOIN
        - LEFT JOIN
        - RIGHT JOIN
        - FULL JOIN
     2. Advanced Joins
        - LEFT ANTI JOIN
        - RIGHT ANTI JOIN
        - ALTERNATIVE INNER JOIN
        - FULL ANTI JOIN
        - CROSS JOIN
     3. Multiple Table Joins (4 Tables)
=================================================================================
*/

/* ============================================================================== 
   BASIC JOINS 
=============================================================================== */

-- No Join
/* Retrieve all data from customers and orders as separate results */
select * from customers;
select * from orders;


-- INNER JOIN
/* Get all customers along with their orders, 
   but only for customers who have placed an order */

SELECT
    c.id,
    c.first_name,
    c.country,
    o.order_id,
    o.sales 
FROM customers AS c 
INNER JOIN orders AS o 
ON c.id=o.customer_id;

-- Alternative to INNER JOIN using LEFT JOIN
/* Get all customers along with their orders, 
   but only for customers who have placed an order */

SELECT 
    c.id,
    c.first_name,
    c.country,
    o.order_id,
    o.sales 
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NOT NULL;


-- LEFT JOIN
/* Get all customers along with their orders, 
   including those without orders */

SELECT
    c.id,
    c.first_name,
    c.country,
    o.order_id,
    o.sales 
FROM customers AS c 
LEFT JOIN orders AS o 
ON c.id=o.customer_id;

-- RIGHT JOIN
/* Get all customers along with their orders, 
   including orders without matching customers */

SELECT
    c.id,
    c.first_name,
    c.country,
    o.order_id,
    o.sales 
FROM customers AS c 
RIGHT JOIN orders AS o 
ON c.id=o.customer_id;

-- Alternative to RIGHT JOIN using LEFT JOIN
/* Get all customers along with their orders, 
   including orders without matching customers */
   
SELECT
    c.id,
    c.first_name,
    c.country,
    o.order_id,
    o.sales 
FROM  orders AS o
LEFT JOIN customers AS c 
ON c.id=o.customer_id;

-- FULL JOIN
/* Get all customers and all orders, even if there’s no match */

SELECT
    c.id,
    c.first_name,
    c.country,
    o.order_id,
    o.sales 
FROM customers AS c 
FULL JOIN orders AS o 
ON c.id=o.customer_id;

/* ============================================================================== 
   ADVANCED JOINS
=============================================================================== */

-- LEFT ANTI JOIN
/* Get all customers who haven't placed any order */

SELECT
    c.id,
    c.first_name,
    c.country,
    o.order_id,
    o.sales 
FROM customers AS c 
LEFT JOIN orders AS o 
ON c.id=o.customer_id
where o.customer_id IS NULL;

-- RIGHT ANTI JOIN
/* Get all orders without matching customers */

SELECT
    c.id,
    c.first_name,
    c.country,
    o.order_id,
    o.sales 
FROM customers AS c 
RIGHT JOIN orders AS o 
ON c.id=o.customer_id
where c.id IS NULL;

-- Alternative to RIGHT ANTI JOIN using LEFT JOIN
/* Get all orders without matching customers */

SELECT
    c.id,
    c.first_name,
    c.country,
    o.order_id,
    o.sales 
FROM orders AS o
LEFT JOIN customers AS c
ON c.id=o.customer_id
where c.id IS NULL;

-- FULL ANTI JOIN
/* Find customers without orders and orders without customers */

SELECT
    c.id,
    c.first_name,
    c.country,
    o.order_id,
    o.sales 
FROM customers AS c 
FULL JOIN orders AS o 
ON c.id=o.customer_id
where c.id IS NULL OR o.customer_id IS NULL;

-- CROSS JOIN
/* Generate all possible combinations of customers and orders */

SELECT
    c.id,
    c.first_name,
    c.country,
    o.order_id,
    o.sales 
FROM customers AS c
CROSS JOIN orders AS o;

--Count total Numbers of Possible Combinations of customers and orders 
SELECT
    count(*) 
FROM customers 
CROSS JOIN orders;
+----------+
| count(*) |
+----------+
|       30 |
+----------+
