/* ==============================================================================
   SQL NULL Functions
-------------------------------------------------------------------------------
   This script highlights essential SQL functions for managing NULL values.
   It demonstrates how to handle NULLs in data aggregation, mathematical operations,
   sorting, and comparisons. These techniques help maintain data integrity 
   and ensure accurate query results.

   Table of Contents:
     1. Handle NULL - Data Aggregation
     2. Handle NULL - Mathematical Operators
     3. Handle NULL - Sorting Data
     4. NULLIF - Division by Zero
     5. IS NULL - IS NOT NULL
     6. LEFT ANTI JOIN
     7. NULLs vs Empty String vs Blank Spaces
===============================================================================
*/
--Return all the data from table customers
SELECT * 
FROM customers;

--Return all the data from customers where score is null
SELECT * 
FROM customers 
WHERE score IS NULL;

--Return all the data from customers where score is not null
SELECT * 
FROM customers 
WHERE score IS NOT NULL;

--Set 0 where score is null 
SELECT 
    id,
    IFNULL(score,0) AS emp_Score 
FROM customers;

--Return 0 where score is null(it works on list of expr.)
SELECT 
    id,
    first_name,
    COALESCE(score,0) AS new_Score 
FROM customers;

--Return null if both expr. is equal ,else return expr1
SELECT 
    id,
    first_name,
    NULLIF(score,0) AS emp_Score 
FROM customers;

/* ==============================================================================
   HANDLE NULL - DATA AGGREGATION
===============================================================================*/

/* TASK 1: 
   Find the average scores of the customers.
   Uses COALESCE to replace NULL Score with 0.
*/
SELECT 
    id,
    first_name,
    COALESCE(score,0) AS new_Score, 
    AVG(score) OVER() AS AvgScore,
    AVG(COALESCE(score,0)) OVER() AS Avg_Score 
FROM customers;

/* ==============================================================================
   HANDLE NULL - MATHEMATICAL OPERATORS
===============================================================================*/

/* TASK 2: 
   Display the full name of customers in a single field by merging their
   first and last names, and add 10 bonus points to each customer's score.
*/
SELECT 
    customerid,
    firstname,
    lastname,
    CONCAT(firstname ,' ' , COALESCE(lastname,'')) AS fullName,
    score,
    CONCAT(COALESCE(score,0)+10) AS New_Score 
FROM customers;

/* ==============================================================================
   HANDLE NULL - SORTING DATA
===============================================================================*/

/* TASK 3: 
   Sort the customers from lowest to highest scores,
   with NULL values appearing last.
*/
SELECT * 
FROM customers 
ORDER BY CASE WHEN score IS NULL THEN 1 ELSE 0 END;

/* ==============================================================================
   NULLIF - DIVISION BY ZERO
===============================================================================*/

/* TASK 4: 
   Find the sales price for each order by dividing sales by quantity.
   Uses NULLIF to avoid division by zero.
*/
SELECT 
    orderid,
    sales,
    quantity,
    (sales/NULLIF(quantity,0)) AS Price 
FROM orders;

/* ==============================================================================
   IS NULL - IS NOT NULL
===============================================================================*/

/* TASK 5: 
   Identify the customers who have no scores 
*/
SELECT * 
FROM customers 
WHERE score IS NULL;

/* TASK 6: 
   Identify the customers who have scores 
*/
SELECT * 
FROM customers 
WHERE score IS NOT NULL;

/* ==============================================================================
   LEFT ANTI JOIN
===============================================================================*/

/* TASK 7: 
   List all details for customers who have not placed any orders 
*/
SELECT 
    C.customerid,
    c.firstname,
    c.country,
    o.orderid 
FROM customers AS c 
LEFT JOIN orders AS o 
ON C.customerid = o.customerid 
WHERE o.customerid IS NULL;

/* ==============================================================================
   NULLs vs EMPTY STRING vs BLANK SPACES
===============================================================================*/

/* TASK 8: 
   Demonstrate differences between NULL, empty strings, and blank spaces 
*/
WITH Orders AS (
    SELECT 1 AS Id, 'A' AS Category UNION
    SELECT 2, NULL UNION
    SELECT 3, '' UNION
    SELECT 4, '  '
    )
    SELECT 
    *,
    LENGTH(Category) AS len_Category,
    TRIM(Category) AS Policy1,
    LENGTH(TRIM(Category)) AS Trim_Len_Cat,
    NULLIF(TRIM(Category),'') AS Policy2, 
    COALESCE(NULLIF(TRIM(Category),''),'Unkonwn') AS Policy3 
FROM ORDERS;
