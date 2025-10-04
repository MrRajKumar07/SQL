/* ============================================================================== 
   SQL String Functions
-------------------------------------------------------------------------------
   This document provides an overview of SQL string functions, which allow 
   manipulation, transformation, and extraction of text data efficiently.

   Table of Contents:
     1. Manipulations
        - CONCAT
        - LOWER
        - UPPER
	    - TRIM
	    - REPLACE
     2. Calculation
        - LEN
     3. Substring Extraction
        - LEFT
        - RIGHT
        - SUBSTRING
=================================================================================
*/

/* ============================================================================== 
   CONCAT() - String Concatenation
=============================================================================== */

--Concatenate the two string value in one column
SELECT concat('Raj','Kumar');

--Concatenate the two string value in one column Add Aliases
SELECT concat('Raj',' ','Kumar') AS name;

-- Concatenate first name and country into one column
SELECT concat(first_name,' ',country)
FROM customers;

-- Concatenate first name and country into one column Add Aliases
SELECT concat(first_name,'-',country)AS name_Country 
FROM customers;

/* ============================================================================== 
   LOWER() & UPPER() - Case Transformation
=============================================================================== */

--Convert String to upper case
SELECT upper('raj kumar') AS Name;

--Convert country to upper case
SELECT upper(country) 
FROM customers;

--Convert string to lower case
SELECT lower('RAJ KUMAR') AS Name;

-- Convert country to lower case
SELECT lower(country) 
FROM customers;

/* ============================================================================== 
   TRIM() - Remove White Spaces
=============================================================================== */

--Removing the leading and trailing spaces
SELECT trim(' Raj Kumar ') AS trimName;

--Removing the leading and trailing spaces from country
SELECT trim(country) 
FROM customers;

--Count the Number of Characters after trim the Country
SELECT LENGTH(trim(country)) 
FROM customers;

/* ============================================================================== 
   REPLACE() - Replace or Remove old value with new one
=============================================================================== */

--Replace System with Management
SELECT replace('Database System', 'System','Management') as Updated;

--Replace any specific County with new Country
SELECT replace (country,'USA','United State')AS updatedCountry 
FROM customers;

/* ============================================================================== 
   REPEAT() - Repeat any string n times
=============================================================================== */

--Repeat SQL 3 times
SELECT REPEAT('SQL',3);

--Repeat Country 3 Times
SELECT REPEAT(country,3) 
FROM customers;

/* ============================================================================== 
   REVERSE() - Reverse a String
=============================================================================== */

--Reverse String mariaDB
SELECT REVERSE('mariaDB');

--Reverse all first_Name of customers
SELECT REVERSE(first_name) 
FROM customers;

/* ============================================================================== 
   LEN() - String Length & Trimming
=============================================================================== */

--Count the length of a String
SELECT LENGTH('MariaDB ');

--Count the length of first_name of all customers
SELECT LENGTH(FIRST_NAME) 
FROM CUSTOMERS;

/* ============================================================================== 
   ASCII() - Return ASCII Code of first Character
=============================================================================== */

--Return ASCII Code of R
SELECT ASCII('R');

-- Return ASCII code of First characters of every country
SELECT ASCII(COUNTRY) 
FROM CUSTOMERS;

/* ============================================================================== 
   CHAR() - Return Character of given ASCII Value
=============================================================================== */

--Return Char at ASCII Value 70
SELECT CHAR(70);

/* ============================================================================== 
   LEFT() & RIGHT() - Substring Extraction
=============================================================================== */

--Retrive the First 4 characters of string
SELECT LEFT('MARIADB',4);

--Retrive first 3 Characters of first name from customers
SELECT LEFT(first_name,3) 
FROM customers;

--Retrive last 2 characters of given string
SELECT RIGHT ('MariaDB',2);

--Retrive last 5 characters of first name from customers
SELECT RIGHT (first_name,5) 
FROM customers;

/* ============================================================================== 
   SUBSTRING() - Extracting Substrings
=============================================================================== */

--Retrive 5 characters from 3 char of a string 
SELECT SUBSTRING('DataBase Management',3,5);

-- Retrieve a list of customers' first names after removing the first 3 character
SELECT SUBSTRING(first_name,4,LENGTH(first_name)) 
FROM customers;
