/* ==============================================================================
   SQL CASE Statement
-------------------------------------------------------------------------------
   This script demonstrates various use cases of the SQL CASE statement, including
   data categorization, mapping, quick form syntax, handling nulls, and conditional 
   aggregation.
   
   Table of Contents:
     1. Categorize Data
     2. Mapping
     3. Quick Form of Case Statement
     4. Handling Nulls
     5. Conditional Aggregation
=================================================================================
*/

/* ==============================================================================
   USE CASE: CATEGORIZE DATA
===============================================================================*/

SELECT 
    orderid,
    sales, 
    CASE 
        WHEN sales>50 THEN 'HIGH' 
        WHEN sales BETWEEN 20 AND 50 THEN 'MEDIUM' 
        ELSE 'LOW' 
    END category 
FROM orders;

/* TASK 1: 
   Create a report showing total sales for each category:
	   - High: Sales over 50
	   - Medium: Sales between 20 and 50
	   - Low: Sales 20 or less
   The results are sorted from highest to lowest total sales.
*/
SELECT
    category,
    SUM(sales) AS TotalSales
FROM (
    SELECT
        orderid,
        sales,
        CASE
            WHEN Sales > 50 THEN 'High'
            WHEN Sales > 20 THEN 'Medium'
            ELSE 'Low'
        END AS category
    FROM orders
) AS t
GROUP BY category
ORDER BY TotalSales DESC;

/* ==============================================================================
   USE CASE: MAPPING
===============================================================================*/

SELECT 
    employeeid,
    firstname,
    gender,
    CASE 
        WHEN gender='M' THEN 'Male' 
        WHEN gender='F' THEN 'Female' 
        ELSE 'Not Applicable' 
    END Gender 
FROM employees;

/* TASK 2: 
   Retrieve customer details with abbreviated country codes 
*/
SELECT
    customerid,
    firstname,
    lastname,
    country,
    CASE 
        WHEN country = 'Germany' THEN 'DE'
        WHEN country = 'USA'     THEN 'US'
        ELSE 'n/a'
    END AS CountryAbbr
FROM customers;

/* ==============================================================================
   QUICK FORM SYNTAX
===============================================================================*/

/* TASK 3: 
   Retrieve customer details with abbreviated country codes using quick form 
*/
SELECT
    customerid,
    firstname,
    lastname,
    country,
    CASE 
        WHEN country = 'Germany' THEN 'DE'
        WHEN country = 'USA'     THEN 'US'
        ELSE 'n/a'
    END AS CountryAbbr,
    CASE country
        WHEN 'Germany' THEN 'DE'
        WHEN 'USA'     THEN 'US'
        ELSE 'n/a'
    END AS CountryAbbr2
FROM customers;

/* ==============================================================================
   HANDLING NULLS
===============================================================================*/

/* TASK 4: 
   Calculate the average score of customers, treating NULL as 0,
   and provide CustomerID and LastName details.
*/
SELECT
    customerid,
    lastname,
    score,
    CASE
        WHEN score IS NULL THEN 0
        ELSE score
    END AS ScoreClean,
    AVG(
        CASE
            WHEN score IS NULL THEN 0
            ELSE score
        END
    ) OVER () AS AvgCustomerClean,
    AVG(score) OVER () AS AvgCustomer
FROM customers;

/* ==============================================================================
   CONDITIONAL AGGREGATION
===============================================================================*/

/* TASK 5: 
   Count how many orders each customer made with sales greater than 30 
*/
SELECT
    customerid,
    SUM(
        CASE
            WHEN Sales > 30 THEN 1
            ELSE 0
        END
    ) AS TotalOrdersHighSales,
    COUNT(*) AS total_orders
FROM orders
GROUP BY customerid;
