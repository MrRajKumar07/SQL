/* ==============================================================================
   SQL Date & Time Functions
-------------------------------------------------------------------------------
   This script demonstrates various date and time functions in SQL.
   It covers functions such as GETDATE, DATETRUNC, DATENAME, DATEPART,
   YEAR, MONTH, DAY, EOMONTH, FORMAT, CONVERT, CAST, DATEADD, DATEDIFF,
   and ISDATE.
   
   Table of Contents:
    1. GETDATE() → MariaDB: NOW() or CURDATE()
    2. DATETRUNC() → MariaDB: DATE_FORMAT() or custom expressions
    3. DATENAME() → MariaDB: MONTHNAME() / DAYNAME()
    4. DATEPART() → MariaDB: EXTRACT() or YEAR()/MONTH()/DAY()
    5. EOMONTH() → MariaDB: LAST_DAY()
    6. FORMAT() → MariaDB: DATE_FORMAT()
    7. CONVERT() / CAST() → MariaDB supports similar CAST(); CONVERT(expr, type)
    8. DATEADD() → MariaDB: DATE_ADD()
    9. DATEDIFF() → MariaDB: DATEDIFF() (only days)
   10. ISDATE() → MariaDB: STR_TO_DATE() check
===============================================================================
*/

/* ==============================================================================
   GETDATE() / NOW()/ CURDATE()
===============================================================================*/

--Return Current Date with time in ISO Standard
SELECT NOW();

--Return Current date 
SELECT CURDATE();
SELECT DATE(NOW());

/* TASK 1:
   Display OrderID, CreationTime, a hard-coded date, and the current system date.
*/
SELECT orderid, 
    creationtime,
    '2025-10-12' AS HardCoded,
    curdate() AS CurrentDate 
FROM orders;

/* ==============================================================================
   DATE PART EXTRACTIONS IN SQL SERVER
   (DATETRUNC, DATENAME, DATEPART, YEAR, MONTH, DAY)
===============================================================================*/

--Return day of the Month
SELECT DAY('2025-10-11');

--Return Month of the year
SELECT MONTH('2025-10-11');

--Return Year
SELECT YEAR('2025-10-11');

/* TASK 2:
   Extract various parts of CreationTime using YEAR, MONTH, and DAY.
*/
SELECT DATE(creationtime),
    creationtime,
    DAY(creationtime) AS Day,
    MONTH(creationtime) AS Month
    YEAR(creationtime) AS Year
From orders;

/* TASK 3:
   Extract various parts of CreationTime using DATETRUNC, DATENAME, DATEPART,
   YEAR, MONTH, and DAY.
*/
SELECT
    OrderID,
    CreationTime,
    -- DATETRUNC Examples
    DATETRUNC(year, CreationTime) AS Year_dt,
    DATETRUNC(day, CreationTime) AS Day_dt,
    DATETRUNC(minute, CreationTime) AS Minute_dt,
    -- DATENAME Examples
    DATENAME(month, CreationTime) AS Month_dn,
    DATENAME(weekday, CreationTime) AS Weekday_dn,
    DATENAME(day, CreationTime) AS Day_dn,
    DATENAME(year, CreationTime) AS Year_dn,
    -- DATEPART Examples
    DATEPART(year, CreationTime) AS Year_dp,
    DATEPART(month, CreationTime) AS Month_dp,
    DATEPART(day, CreationTime) AS Day_dp,
    DATEPART(hour, CreationTime) AS Hour_dp,
    DATEPART(quarter, CreationTime) AS Quarter_dp,
    DATEPART(week, CreationTime) AS Week_dp,
    YEAR(CreationTime) AS Year,
    MONTH(CreationTime) AS Month,
    DAY(CreationTime) AS Day
From orders;

/* ==============================================================================
   DATE PART EXTRACTIONS IN MARIADB
   (DATE_FORMAT, MONTHNAME/DAYNAME, EXTRACT, YEAR, MONTH, DAY)
===============================================================================*/

--Return Year
SELECT EXTRACT(YEAR FROM '2025-10-12');

--Return Month
SELECT EXTRACT(MONTH FROM '2025-10-12');

--Return Day
SELECT EXTRACT(DAY FROM '2025-10-12');

--Return Week Day
SELECT EXTRACT(WEEK FROM '2025-10-12');

--Return Quarter of a Year
SELECT EXTRACT(QUARTER FROM '2025-10-12');

--Return Number of days Of a Year
SELECT DAYOFYEAR ('2025-10-12');

--Return Month Name 
SELECT MONTHNAME('2025-10-12');

--Return Day Name
SELECT DAYNAME('2025-10-12');

--Return Current Date till Minutes
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:00') AS Minute_dt;

/* TASK 4:
   Extract various parts of CreationTime using DATE_FORMAT, MONTHNAME/DAYNAME, EXTRACT,
   YEAR, MONTH, and DAY.
*/
SELECT
    orderid,
    creationtime,
    -- DATE_FORMAT Examples
    DATE_FORMAT(creationtime,'%Y-%m-%d %H:%i:00') AS Minute_df,
    DATE_FORMAT(creationtime,'%Y-%m-%d %H:00:00') AS Hour_df,
    DATE_FORMAT(creationtime,'%Y-%m-01 00:00:00') AS Month_df,
    DATE_FORMAT(creationtime,'%Y-01-01 00:00:00') AS Year_df,
    -- MONTHNAME / DAYNAME Examples
    MONTHNAME(creationtime) AS MM_Month,
    DAYNAME(creationtime) AS dd_Day,
    -- EXTRACT Examples
    EXTRACT(YEAR FROM creationtime) AS Ext_Year,
    EXTRACT(MONTH FROM creationtime) AS Ext_Month,
    EXTRACT(DAY FROM creationtime) AS Ext_Day,
    EXTRACT(QUARTER FROM creationtime) AS Ext_Quarter,
    EXTRACT(WEEK FROM creationtime) AS Ext_Week,
    -- Direct Functions
    YEAR(creationtime) AS Year,
    MONTH(creationtime) AS Month,
    DAY(creationtime) AS Day
FROM ORDERS;

/* ==============================================================================
   DATETRUNC()/DATE_FORMAT DATA AGGREGATION
===============================================================================*/

/* TASK 5:
   Aggregate orders by year using DATETRUNC/DATE_FORMAT(Used in MariaDB) on CreationTime.
*/
SELECT 
    DATE_FORMAT(creationtime,'%Y-01-01 00:00:00') AS Creation ,
    count(*) As OrderCount 
    FROM orders 
    GROUP BY DATE_FORMAT(creationtime,'%Y-01-01 00:00:00');

SELECT 
    DATETRUNC(year,creationtime) AS Creation ,
    count(*) As OrderCount 
    FROM orders 
    GROUP BY DATETRUNC(year,creationtime) AS Creation;

/* ==============================================================================
   EOMONTH()/LAST_DAY()
===============================================================================*/

--Return last Date
SELECT LAST_DAY('2025-10-12');

/* TASK 6:
   Display OrderID, CreationTime, and the end-of-month date for CreationTime.
*/
SELECT 
    orderid,
    creationtime,
    LAST_DAY(creationtime) AS EndDate
FROM orders;

SELECT
    OrderID,
    CreationTime,
    EOMONTH(CreationTime) AS EndOfMonth
FROM Orders;

/* ==============================================================================
   DATE PARTS | USE CASES
===============================================================================*/

/* TASK 7:
   How many orders were placed each year?
*/
SELECT 
    YEAR(orderdate) AS Year,
    COUNT(*) AS CountOrders 
    FROM orders 
    GROUP BY YEAR(orderdate);

/* TASK 8:
   How many orders were placed each month?
*/    

SELECT 
    MONTH(orderdate) AS Month,
    COUNT(*) AS CountOrders 
    FROM orders 
    GROUP BY MONTH(orderdate);

/* TASK 9:
   How many orders were placed each month (using friendly month names)?
*/

SELECT 
    MONTHNAME(orderdate) AS MM_Name,
    COUNT(*) AS OrderCount 
    FROM orders 
    GROUP BY MONTHNAME(orderdate);

/* TASK 10:
   Show all orders that were placed during the month of February.
*/

 SELECT * 
    FROM orders 
    WHERE MONTH(orderdate)=2;

/* ==============================================================================
   FORMAT()/DATE_FORMAT()
===============================================================================*/

/* TASK 11:
   Format CreationTime into various string representations Using SQL Server.
*/
SELECT
    OrderID,
    CreationTime,
    FORMAT(CreationTime, 'MM-dd-yyyy') AS USA_Format,
    FORMAT(CreationTime, 'dd-MM-yyyy') AS EURO_Format,
    FORMAT(CreationTime, 'dd') AS dd,
    FORMAT(CreationTime, 'ddd') AS ddd,
    FORMAT(CreationTime, 'dddd') AS dddd,
    FORMAT(CreationTime, 'MM') AS MM,
    FORMAT(CreationTime, 'MMM') AS MMM,
    FORMAT(CreationTime, 'MMMM') AS MMMM
FROM Sales.Orders;

/* TASK 12:
   Format CreationTime into various string representations Using MariaDB.
*/

SELECT
    orderid,
    creationtime,
    -- USA Format (MM-dd-yyyy)
    DATE_FORMAT(creationtime, '%m-%d-%Y') AS USA_Format,
    -- EURO Format (dd-MM-yyyy)
    DATE_FORMAT(creationtime, '%d-%m-%Y') AS EURO_Format,
    -- Day number (01-31)
    DATE_FORMAT(creationtime, '%d') AS dd,
    -- Abbreviated weekday (Mon, Tue, Wed...)
    DATE_FORMAT(creationtime, '%a') AS ddd,
    -- Full weekday (Monday, Tuesday...)
    DATE_FORMAT(creationtime, '%W') AS dddd,
    -- Month number (01-12)
    DATE_FORMAT(creationtime, '%m') AS MM,
    -- Abbreviated month (Jan, Feb...)
    DATE_FORMAT(creationtime, '%b') AS MMM,
    -- Full month (January, February...)
    DATE_FORMAT(creationtime, '%M') AS MMMM
FROM orders;

/* TASK 13:
   Display CreationTime using a custom format Using MariaDB:
   Example: Day Wed Jan Q1 2025 12:34:56 PM
*/
SELECT 
    orderid,
    creationtime, 
    CONCAT('Day ', DATE_FORMAT(creationtime,'%a %b'),
    ' Q',EXTRACT(QUARTER FROM creationtime),' ',
    YEAR(creationtime),' ',
    DATE_FORMAT(creationtime,'%h:%i:%s %p' )) AS CustomDate 
FROM orders;

/* TASK 14:
   Display CreationTime using a custom format Using SQL Server:
   Example: Day Wed Jan Q1 2025 12:34:56 PM
*/
SELECT
    OrderID,
    CreationTime,
    'Day ' + FORMAT(CreationTime, 'ddd MMM') +
    ' Q' + DATENAME(quarter, CreationTime) + ' ' +
    FORMAT(CreationTime, 'yyyy hh:mm:ss tt') AS CustomFormat
FROM Orders;

/* TASK 15:
   How many orders were placed each year, formatted by month and year (e.g., "Jan 25") Using MariaDB?
*/

SELECT 
    orderid,
    orderdate,
    COUNT(*) AS CountOrders,
    DATE_FORMAT(orderdate,'%b %y')AS Order_Df 
FROM orders 
GROUP BY DATE_FORMAT(orderdate,'%b %y');

/* TASK 16:
   How many orders were placed each year, formatted by month and year (e.g., "Jan 25") Using SQL Server?
*/
SELECT
    FORMAT(CreationTime, 'MMM yy') AS OrderDate,
    COUNT(*) AS TotalOrders
FROM Sales.Orders
GROUP BY FORMAT(CreationTime, 'MMM yy');

/* ==============================================================================
   CONVERT()
===============================================================================*/

/* TASK 17:
   Demonstrate conversion using CONVERT.
*/
SELECT
    CONVERT(INT, '123') AS [String to Int CONVERT],
    CONVERT(DATE, '2025-08-20') AS [String to Date CONVERT],
    CreationTime,
    CONVERT(DATE, CreationTime) AS [Datetime to Date CONVERT],
    CONVERT(VARCHAR, CreationTime, 32) AS [USA Std. Style:32],
    CONVERT(VARCHAR, CreationTime, 34) AS [EURO Std. Style:34]
FROM Sales.Orders;

/* ==============================================================================
   CAST()
===============================================================================*/

/* TASK 18:
   Convert data types using CAST in SQL Server.
*/
SELECT
    CAST('123' AS INT) AS [String to Int],
    CAST(123 AS VARCHAR) AS [Int to String],
    CAST('2025-08-20' AS DATE) AS [String to Date],
    CAST('2025-08-20' AS DATETIME2) AS [String to Datetime],
    CreationTime,
    CAST(CreationTime AS DATE) AS [Datetime to Date]
FROM Sales.Orders;

/* TASK 19:
   Convert data types using CAST in MariaDB.
*/
SELECT 
    orderid,
    orderdate, 
    CAST('123'AS SIGNED) AS StringToInt,
    CAST('2025-10-12' AS DATE) AS New_Date,
    creationtime,
    CAST(creationtime AS DATE)AS Casted_Date,
    DATE_FORMAT(creationtime, '%d-%m-%Y %h:%i:%s')AS Euro_Std_Date,
    DATE_FORMAT(creationtime,'%m-%d-%Y %h:%i:%s')AS USA_Std_Date 
FROM orders;

/* ==============================================================================
   DATEADD() / DATEDIFF() / DATE_ADD() / DATE_DIFF()  
===============================================================================*/

--Return Date +2year in MariaDB
SELECT DATE_ADD('2025-10-12', INTERVAL 2 YEAR);

--Return Date -2year in MariaDB
SELECT DATE_SUB('2025-10-12', INTERVAL 2 YEAR);

/* TASK 20:
   Perform date arithmetic on OrderDate Using SQL Server.
*/
SELECT
    OrderID,
    OrderDate,
    DATEADD(day, -10, OrderDate) AS TenDaysBefore,
    DATEADD(month, 3, OrderDate) AS ThreeMonthsLater,
    DATEADD(year, 2, OrderDate) AS TwoYearsLater
FROM Sales.Orders;

/* TASK 21:
   Perform date arithmetic on OrderDate Using MariaDB.
*/
SELECT 
    orderid,
    orderdate,
    DATE_ADD(orderdate,INTERVAL 10 MONTH) AS TenMonthLater,
    DATE_SUB(orderdate,INTERVAL 20 DAY) AS TwentyDaysBefore,
    DATE_ADD(orderdate,INTERVAL 2 YEAR) AS TwoYearLater 
FROM orders;

/* TASK 22:
   Calculate the age of employees Using SQL Server.
*/
SELECT
    EmployeeID,
    BirthDate,
    DATEDIFF(year, BirthDate, GETDATE()) AS Age
FROM Sales.Employees;

/* TASK 23:
   Calculate the age of employees Using MariaDB.
*/
SELECT 
    employeeid,
    birthdate,
    FLOOR(DATEDIFF(CURDATE(),birthdate)/365) AS age 
FROM employees;

/* TASK 24:
   Find the average shipping duration in days for each month Using SQL Server.
*/
SELECT
    MONTH(OrderDate) AS OrderMonth,
    AVG(DATEDIFF(day, OrderDate, ShipDate)) AS AvgShip
FROM Sales.Orders
GROUP BY MONTH(OrderDate);

/* TASK 24:
   Find the average shipping duration in days for each month Using MariaDB.
*/
SELECT 
    orderid,
    orderdate,
    shipdate,
    AVG(DATEDIFF(shipdate,orderdate)) AS Duration 
FROM orders 
GROUP BY MONTH(orderdate);

/* TASK 25:
   Time Gap Analysis: Find the number of days between each order and the previous order in SQL Server.
*/
SELECT
    OrderID,
    OrderDate AS CurrentOrderDate,
    LAG(OrderDate) OVER (ORDER BY OrderDate) AS PreviousOrderDate,
    DATEDIFF(day, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate) AS NrOfDays
FROM Sales.Orders;

/* TASK 25:
   Time Gap Analysis: Find the number of days between each order and the previous order in MariaDB.
*/
 SELECT 
    orderid,
    orderdate,
    LAG(orderdate) OVER (ORDER BY orderdate) AS PreviousOrderDate,
    DATEDIFF(orderdate,LAG(orderdate) OVER (ORDER BY orderdate))AS NrOfDate 
 FROM orders;

 