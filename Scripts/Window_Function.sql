/* ==============================================================================
   SQL Window Functions
-------------------------------------------------------------------------------
   SQL window functions enable advanced calculations across sets of rows 
   related to the current row without resorting to complex subqueries or joins.
   This script demonstrates the fundamentals and key clauses of window functions,
   including the OVER, PARTITION, ORDER, and FRAME clauses, as well as common rules 
   and a GROUP BY use case.

   Table of Contents:
     1. SQL Window Basics
     2. SQL Window OVER Clause
     3. SQL Window PARTITION Clause
     4. SQL Window ORDER Clause
     5. SQL Window FRAME Clause
     6. SQL Window Rules
     7. SQL Window with GROUP BY
=================================================================================
*/

/* ==============================================================================
   SQL WINDOW FUNCTIONS | BASICS
===============================================================================*/

/* TASK 1: 
   Calculate the Total Sales Across All Orders 
*/
SELECT 
   SUM(sales) AS totalSales 
FROM orders;

/* TASK 2: 
   Calculate the Total Sales for Each Product 
*/
SELECT 
   productid, 
   SUM(sales) AS totalSales 
FROM orders 
GROUP BY productid;

/* ==============================================================================
   SQL WINDOW FUNCTIONS | OVER CLAUSE
===============================================================================*/

/* TASK 3: 
   Find the total sales across all orders,
   additionally providing details such as OrderID and OrderDate 
*/
SELECT 
   orderid,
   orderdate,
   sales,
   SUM(sales) OVER() AS totalSales 
FROM orders;

/* ==============================================================================
   SQL WINDOW FUNCTIONS | PARTITION CLAUSE
===============================================================================*/

/* TASK 4: 
   Find the total sales across all orders and for each product,
   additionally providing details such as OrderID and OrderDate 
*/
SELECT 
   orderid,
   orderdate,
   productid,
   sales,
   SUM(sales) OVER() AS totalSales,
   SUM(sales) OVER(PARTITION BY productid) AS salesByProduct 
FROM orders;

/* TASK 5: 
   Find the total sales across all orders, for each product,
   and for each combination of product and order status,
   additionally providing details such as OrderID and OrderDate 
*/
SELECT 
   orderid,
   orderdate,
   productid,
   orderstatus,
   sales,
   SUM(sales) OVER() AS totalSales,
   SUM(sales) OVER(PARTITION BY productid) AS salesByProduct,
   SUM(sales) OVER(PARTITION BY productid,orderstatus) AS salesByProductStatus 
FROM orders;

/* ==============================================================================
   SQL WINDOW FUNCTIONS | ORDER CLAUSE
===============================================================================*/

/* TASK 6: 
   Rank each order by Sales from highest to lowest */

 SELECT 
   orderid,
   orderstatus,
   sales,
   RANK() OVER(ORDER BY sales DESC) AS salesOrder 
FROM orders;

/* ==============================================================================
   SQL WINDOW FUNCTIONS | FRAME CLAUSE
===============================================================================*/

/* TASK 7: 
   Calculate Total Sales by Order Status for current and next two orders 
*/
SELECT 
   orderid,
   orderdate,
   orderstatus,
   sales,
   SUM(sales) OVER(
      PARTITION BY OrderStatus
      ORDER BY orderstatus 
      ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
      ) AS totalSales 
FROM orders;

/* TASK 8: 
   Calculate Total Sales by Order Status for current and previous two orders 
*/
SELECT 
   orderid,
   orderdate,
   orderstatus,
   sales,
   SUM(sales) OVER(
      PARTITION BY OrderStatus
      ORDER BY orderstatus 
      ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
      ) AS totalSales 
FROM orders;

/* TASK 9: 
   Calculate Total Sales by Order Status from previous two orders only 
*/
SELECT 
   orderid,
   orderdate,
   orderstatus,
   sales,
   SUM(sales) OVER(
      PARTITION BY OrderStatus
      ORDER BY orderstatus 
      ROWS 2 PRECEDING 
      ) AS totalSales 
FROM orders;

/* TASK 10: 
   Calculate cumulative Total Sales by Order Status up to the current order 
*/
SELECT 
   orderid,
   orderdate,
   orderstatus,
   sales,
   SUM(sales) OVER(
      PARTITION BY OrderStatus
      ORDER BY orderstatus 
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
      ) AS totalSales 
FROM orders;

/* TASK 11: 
   Calculate cumulative Total Sales by Order Status from the start to the current row 
*/
SELECT 
   orderid,
   orderdate,
   orderstatus,
   sales,
   SUM(sales) OVER(
      PARTITION BY OrderStatus
      ORDER BY orderstatus 
      ROWS UNBOUNDED PRECEDING 
      ) AS totalSales 
FROM orders;

/* ==============================================================================
   SQL WINDOW FUNCTIONS | GROUP BY
===============================================================================*/

/* TASK 12: 
   Rank customers by their total sales 
*/
SELECT 
   customerid,
   SUM(sales) AS totalSales,
   RANK() OVER(ORDER BY SUM(sales) DESC) AS rankCustomer 
FROM orders 
GROUP BY customerid;