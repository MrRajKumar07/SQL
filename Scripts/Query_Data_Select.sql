/* ==============================================================================
   SQL SELECT Query
-------------------------------------------------------------------------------
   This guide covers various SELECT query techniques used for retrieving, 
   filtering, sorting, and aggregating data efficiently.

   Table of Contents:
     1. SELECT ALL COLUMNS
     2. SELECT SPECIFIC COLUMNS
     3. WHERE CLAUSE
     4. ORDER BY
     5. GROUP BY(Aggregate Functions)
     6. HAVING
     7. DISTINCT
     8. TOP
     9. Combining Queries
	10. Aliases(As)
    11. In
    12. Between
    13. Like
    14. Is Null/Is Not Null 
=================================================================================
*/

/* ==============================================================================
   SELECT 
=============================================================================== */

-- Retrive All Customers Data
select * 
 from
 customers;

--Retrive All Orders Data
select *
 from 
 orders;

-- Retrive Few Columns(first_name,score) from Customers
select 
first_name , 
score 
from customers;

-- Retrive Order_id , sales from orders
select 
order_id , 
sales 
from orders;


/* ==============================================================================
   WHERE (Comparision and logical operatores)
=============================================================================== */

--Retrive all Data From customers with id=6
select * 
from customers 
where id=6;

--Retrive name from customer with score <800
select first_name 
from customers 
where score <800;

--Retrive name from customer with score>900
select first_name 
from customers 
where score >900;

--Retrive Customer_id from orders with sales!=50
select customer_id 
from orders 
where sales != 50;

--Retrive Customer_id from orders with sales<=40
select customer_id 
from orders 
where sales <=40;

--Retrive all from customer with Specific Country and Score
select * 
from customers 
where country='India' and score=900;

--Retrive all from customer with Specific Country and Score
select * 
from customers 
where country='India' or score=900;

--Retrive all from customer with Score !=900
select * 
from customers 
where  not score=900;

--Retrive all from orders with sales!=16
select * 
from orders 
where not sales=16;


/* ==============================================================================
   ORDER BY
=============================================================================== */

--retrive with id in Descending Order
select * 
from customers 
order by id desc;

-- Retrive with name in Descending Order
select * 
from customers 
order by first_name desc;

-- Retrive with name in ascending Order
select * 
from customers 
order by first_name asc;

-- Retrive with score in ascending Order
select * 
from customers 
order by score asc;

--Retrive with sales in ascending order
select * 
from orders 
order by sales asc;

--Retrive with customer_id in desc
select * 
from orders 
order by Customer_id desc;

--Retrive with order date in asc
select * 
from orders 
order by order_date asc;

--Retrive with country in asc and score in desc
select * 
from customers 
order by country asc,score desc;


/* ==============================================================================
   GROUP BY
=============================================================================== */

-- Find the total score for each country
select 
country ,
sum(score) 
from customers 
group by country;

-- Find the Average score for each country
select 
country, 
avg(score) 
from customers 
group by country;

-- Find the count total customers for each country
select 
country, 
count(id) 
from customers 
group by country;

-- Find the count total customers for each country(Using Aliases)
select 
country, 
count(*) as total_user 
from customers 
group by country;


/* ==============================================================================
   HAVING
=============================================================================== */

/* Find the average score for each country
   and return only those countries with an average score greater than 700 */
select 
country , 
avg(score) 
from customers 
group by country 
having avg(score)>700;

/* Find the average score for each country
   considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 400 */
select 
country , 
Sum(score) 
from customers 
where score!=0 
group by country 
having sum(score)>400;

/* find the total no of customer from each country 
and return only those country with count is equal and greater than 2 */
select 
country, 
count(*) as total_user 
from customers 
group by country 
having count(*) >=2;


/* ==============================================================================
   DISTINCT
=============================================================================== */

-- Return Unique list of all countries
select distinct country 
from customers;


/* ==============================================================================
   TOP/LIMIT
=============================================================================== */

-- Retrieve only 3 Country
select distinct country 
from customers 
limit 3;

-- Get the Two Most Recent Orders
select distinct * 
from orders 
order by order_date desc 
limit 2;

-- Retrieve the Lowest 2 Customers based on the score
select distinct customer_id, order_date 
from orders 
order by order_date desc 
limit 2;


/* ==============================================================================
   BETWEEN
=============================================================================== */

--Retrive all Data From customer score between 800-1200
select * 
from customers 
where score 
between 800 and 1200;

/* ==============================================================================
  IN
=============================================================================== */

--Retrive all data from customer country in germany and india
select * 
from customers 
where country 
in ('India','Germany');

/* ==============================================================================
   LIKE
=============================================================================== */

--Retrive name start with R
select first_name 
from customers 
where first_name 
like 'R%';

--Retrive all data with second char of country is n
select * 
from customers 
where country 
like '_n%';

--Retrive all data with third char of country is r
select * 
from customers 
where country 
like '__r%';

/* ==============================================================================
   IS NULL/IS NOT NULL
=============================================================================== */

select * 
from customers 
where score is null;

select * 
from customers 
where score is not null;

/* ==============================================================================
   All Together
=============================================================================== */

select 
country , 
sum(score) 
from customers 
group by country 
having sum(score)>600 
limit 2;

select 
country , 
sum(score) as Total_Score 
from customers 
group by country 
having sum(score)>600 
order by score asc 
limit 2;

select 
country , 
sum(score) as Total_Score 
from customers 
group by country 
having sum(score)>600 
order by Total_Score asc l
imit 2;

select 
country , 
sum(score) as Total_Score 
from customers 
group by country 
having sum(score)>600 
order by Total_Score desc 
limit 2;

/* Calculate the average score for each country
considering only customers with a score not equal to 0
and return only those countries with an average score greater than 430
and sort the results by the highest average score first. */

select distinct country, 
avg(score) as Avg_score 
from customers 
where score!=0 
group by country 
having avg(score)>430 
order by Avg_score desc;



