/* ============================================================================== 
   SQL Number Functions Guide
-------------------------------------------------------------------------------
   This document provides an overview of SQL number functions, which allow 
   performing mathematical operations and formatting numerical values.

   Table of Contents:
     1. Rounding Functions
        - ROUND()
        - CEIL() / CEILING()
        - FLOOR()
        - TRUNCATE()
     2. Absolute & Sign Functions
        - ABS()
     3. Power & Roots Functions
        - POWER() / POW()
        - SQRT()
     5. Modulus & Division Functions
        - MOD()
     6. Random Number Functions
        - RAND()
=================================================================================
*/

/* ============================================================================== 
   ABS() - Absolute Value
=============================================================================== */

-- Returns the absolute (non-negative) value of a number
SELECT ABS(-10);
SELECT ABS(20);

/* ==============================================================================
   CEIL() / CEILING() - Round Up
   ============================================================================== */

-- Rounds a number upward to the nearest integer
SELECT CEIL(9.876);
SELECT CEIL(10.1);

/* ==============================================================================
   FLOOR() - Round Down
   ============================================================================== */

-- Rounds a number downward to the nearest integer
SELECT FLOOR(9.876);
SELECT FLOOR(10.9);

/* ==============================================================================
   ROUND() - Rounding Numbers
   ============================================================================== */

-- Rounds to the nearest integer or to specified decimal places
SELECT ROUND(15.567,2);

/* ==============================================================================
   TRUNCATE() - Truncate Number
   ============================================================================== */

-- Truncates number to given decimal places (without rounding)
SELECT TRUNCATE (15.567,2);
SELECT TRUNCATE(15.567,0);

/* ==============================================================================
   POWER() / POW() - Exponentiation
   ============================================================================== */

-- Returns value of a number raised to the power of another
SELECT POW (5,3);
SELECT POWER(6,2);


/* ==============================================================================
   SQRT() - Square Root
   ============================================================================== */

-- Returns square root of a number
SELECT SQRT(125);
SELECT SQRT(49);

/* ==============================================================================
   MOD() - Modulus / Remainder
   ============================================================================== */

-- Returns the remainder of division
SELECT MOD(56,3);
SELECT 17%3;

/* ==============================================================================
   GREATEST() - Largest Value (Row-wise)
   ============================================================================== */

-- Returns the greatest value from a list of expressions
SELECT GREATEST(20,5,90,67);

/* ==============================================================================
   LEAST() - Smallest Value (Row-wise)
   ============================================================================== */

-- Returns the smallest value from a list of expressions
SELECT LEAST(20,-2,65,43);

/* ==============================================================================
   RAND() - Random Number
   ============================================================================== */

-- Returns random number between 0 and 1
SELECT RAND(5);

/* ==============================================================================
   NESTING FUNCTIONS
===============================================================================*/

-- Nesting
SELECT ROUND(SQRT(125),2) AS Nested;

