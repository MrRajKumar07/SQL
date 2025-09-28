/* ============================================================================== 
   SQL Filtering Data
-------------------------------------------------------------------------------
   This document provides an overview of SQL filtering techniques using WHERE 
   and various operators for precise data retrieval.

   Table of Contents:
     1. Comparison Operators
        - =, <>, >, >=, <, <=
     2. Logical Operators
        - AND, OR, NOT
     3. Range Filtering
        - BETWEEN
     4. Set Filtering
        - IN
     5. Pattern Matching
        - LIKE
=================================================================================
*/

/* ============================================================================== 
   COMPARISON OPERATORS
=============================================================================== */

--Retrive all Customers from India 
select * 
from customers 
where country='India';

--Retrive all customers with a score not equal to 0
select * 
from customers 
where score !=0;

--Retrive all Customers with score greater than 500
select * 
from customers 
where score>500;

--Retrive all Customers with score greater than or equal to 700
select * 
from customers 
where score>=700;

--Retrive all Customers with score less than 700
select * 
from customers 
where score<700;

--Retrive all Customers with score less than or equal to 800
select * 
from customers 
where score<=800;

/* ============================================================================== 
   LOGICAL OPERATORS
=============================================================================== */

-- Retrieve all customers who are from the germany and have a score greater than And equal to 800.
select * 
from customers 
where country='Germany' and score>=800;

-- Retrieve all customers who are from the germany and have a score greater than And equal to 500.
select * 
from customers 
where country='Germany' and score>=500;

-- Retrieve all customers who are from the india and have a score greater than or equal to 700.
select * 
from customers 
where country='India' or Score >=700;

-- Retrieve all customers where country not equal to India
select * 
from customers 
where not country ='India';

/* ============================================================================== 
   RANGE FILTERING - BETWEEN
=============================================================================== */

-- Retrieve all customers whose score falls in the range between 500 and 1200.
select * 
from customers 
where score between 500 and 1200;

-- Retrieve all customers whose score falls in the range between 500 and 800.
select * 
from customers 
where score between 500 and 800;

/* ============================================================================== 
   SET FILTERING - IN
=============================================================================== */

-- Retrieve all customers from either Germany or the India.
select * 
from customers 
where country in('germany','India');

--Retrive all the customers with score in 2,4,6
select * 
from customers 
where id in (2,4,6);

--Retrive all the customers with score Not in 2,4,6
select * 
from customers 
where id not in (2,4,6);

-- Retrieve all customers from nither Germany nor the India.
select * 
from customers 
where country not in('germany','India');

/* ============================================================================== 
   PATTERN MATCHING - LIKE
=============================================================================== */

--Retrive all the customers whose first name ends with 'r'
select * 
from customers 
where first_name like '%r';

--Retrive all the customers whose first name start with 'r'
select * 
from customers 
where first_name like 'r%';

-- Find all customers whose country contains 'n'.
select * 
from customers 
where country like'%n%';

-- Find all customers whose first name has 'r' in the third position.
select * 
from customers 
where country like'__r%';



