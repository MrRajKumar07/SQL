/* ==============================================================================
   SQL Window Aggregate Functions
-------------------------------------------------------------------------------
   These functions allow you to perform aggregate calculations over a set 
   of rows without the need for complex subqueries. They enable you to compute 
   counts, sums, averages, minimums, and maximums while still retaining access 
   to individual row details.

   Table of Contents:
    1. COUNT
    2. SUM
    3. AVG
    4. MAX / MIN
    5. ROLLING SUM & AVERAGE Use Case
===============================================================================
*/

/* ============================================================
   SQL WINDOW AGGREGATION | COUNT
   ============================================================ */

/* TASK 1:
   Find the Total Number of Orders and the Total Number of Orders for Each Customer
*/
SELECT 
   orderid,
   orderdate,
   customerid,
   COUNT(*) OVER() AS total_Orders,
   COUNT(*) OVER(PARTITION BY customerid) AS OrdersByCustomers 
FROM orders;

/* TASK 2:
   - Find the Total Number of Customers
   - Find the Total Number of Scores for Customers
   - Find the Total Number of Countries
*/
SELECT 
    customerid,
    firstname,
    lastname,
    COUNT(*) OVER() AS Total_Customers,
    COUNT(1) OVER() AS total_Customers,
    COUNT(score) OVER() AS total_scores,
    COUNT(country) OVER() AS totalCountries 
FROM customers;

/* TASK 3:
   Check whether the table 'OrdersArchive' contains any duplicate rows
*/
SELECT 
    orderid,
    orderdate,
    COUNT(orderid) OVER(PARTITION BY orderid) AS CheckDuplicates
FROM orders_archive;

/* ============================================================
   SQL WINDOW AGGREGATION | SUM
   ============================================================ */

/* TASK 4:
   - Find the Total Sales Across All Orders 
   - Find the Total Sales for Each Product
*/
SELECT 
    orderid,
    orderdate,
    productid,
    sales,
    SUM(sales) OVER() AS TotalSales,
    SUM(sales) OVER(PARTITION BY productid) AS SalesByProduct 
FROM orders;

/* TASK 5:
   Find the Percentage Contribution of Each Product's Sales to the Total Sales
*/
SELECT 
    orderid,
    orderdate,
    productid,
    sales,
    SUM(sales) OVER() AS TotalSales,
    ROUND(sales/SUM(sales) OVER()* 100,2) AS Percentage 
FROM orders;

/* ============================================================
   SQL WINDOW AGGREGATION | AVG
   ============================================================ */

/* TASK 6:
   - Find the Average Sales Across All Orders 
   - Find the Average Sales for Each Product
*/
SELECT 
    orderid,
    orderdate,
    productid,
    sales,
    AVG(sales) OVER() AS AvgSales,
    AVG(sales) OVER(PARTITION BY productid) AS AvgSalesByProduct 
FROM orders;

/* TASK 7:
   Find the Average Scores of Customers
*/
SELECT 
    *,
    AVG(score) OVER() AS AvgScore,
    AVG(COALESCE(score,0)) OVER() AS AvgScoreWithoutNull 
FROM customers;

/* TASK 8:
   Find all orders where Sales exceed the average Sales across all orders
*/
SELECT 
    * 
    FROM (
        SELECT 
            orderid,
            orderdate,
            productid,
            sales,
            AVG(sales) OVER() AS AvgSales 
        FROM orders
    )AS t 
WHERE sales>AvgSales;

/* ============================================================
   SQL WINDOW AGGREGATION | MAX / MIN
   ============================================================ */

/* TASK 9:
   Find the Highest and Lowest Sales across all orders
*/
SELECT 
    orderid,
    orderdate,
    productid,
    sales,
    MAX(sales) OVER() AS HighestSales,
    MIN(sales) OVER() AS LowestSales 
FROM orders;

/* TASK 10:
   Find the Lowest Sales across all orders and by Product
*/
SELECT 
    orderid,
    orderdate,
    productid,
    sales,
    MIN(sales) OVER() AS LowestSales,
    MIN(sales) OVER(PARTITION BY productid) AS LowestSalesByProduct 
FROM orders;

/* TASK 11:
   Show the employees who have the highest salaries
*/
SELECT 
    * 
    FROM (
        SELECT 
            *,
            MAX(salary) OVER() AS HighestSalary 
        FROM employees
    ) AS t 
WHERE salary=HighestSalary;

/* TASK 12:
   Find the deviation of each Sale from the minimum and maximum Sales
*/
SELECT 
    orderid,
    orderdate,
    productid,
    sales,
    MAX(sales) OVER() AS HighestSales,
    MIN(sales) OVER() AS LowestSales,
    sales - MIN(sales) OVER() AS DeviationFromMin,
    MAX(sales) OVER() - sales AS DeviationFromMax 
FROM orders;

/* ============================================================
   Use Case | ROLLING SUM & AVERAGE
   ============================================================ */

/* TASK 13:
   Calculate the moving average of Sales for each Product over time
*/
SELECT 
    orderid,
    orderdate,
    productid,
    sales,
    AVG(sales) OVER(PARTITION BY productid) AS AvgByProduct,
    AVG(sales) OVER(PARTITION BY productid ORDER BY orderdate) AS MovingAvg 
FROM orders;

/* TASK 14:
   Calculate the moving average of Sales for each Product over time,
   including only the next order
*/
SELECT 
    orderid,
    orderdate,
    productid,
    sales,
    AVG(sales) OVER(PARTITION BY productid) AS AvgByProduct,
    AVG(sales) OVER(PARTITION BY productid ORDER BY orderdate) AS MovingAvg,
    AVG(sales) OVER(PARTITION BY productid ORDER BY orderdate ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) AS RollingAvg 
FROM orders;

