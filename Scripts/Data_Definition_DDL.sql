/* ==============================================================================
   SQL Data Definition Language (DDL)
-------------------------------------------------------------------------------
   This guide covers the essential DDL commands used for defining and managing
   database structures, including creating, modifying, and deleting tables.

   Table of Contents:
     1. CREATE - Creating Tables
     2. ALTER - Modifying Table Structure
     3. DROP - Removing Tables
     4. TRUNCATE - Removing only data
     5. RENAME - Change the name of table
=================================================================================
*/

/* ============================================================================== 
   CREATE
=============================================================================== */
create database employeedb;

--use create database
use employeedb;

--create table employee with column: id,name,salary,department
create table employee(
    -> emp_id int not null,
    -> empName varchar(50) not null,
    -> salary double(10,2),
    -> department varchar(100),
    -> primary key (emp_id)
    -> );

--Showing total tables in employeedb database
show tables;

--describe the table employee
DESC employee;

/* ============================================================================== 
   ALTER
=============================================================================== */

--Add new column called age to employee table 
ALTER table employee add column age int not null;

--Modify column Employee name 
ALTER table employee modify empName varchar(100);

--Change the column name 
ALTER TABLE employee CHANGE salary empSalary DECIMAL(10,2);

--Drop the column department from employee
ALTER table employee drop column department;


/* ============================================================================== 
   TRUNCATE
=============================================================================== */

--Deleting all the data present in employee table
TRUNCATE table employee;


/* ============================================================================== 
   RENAME
=============================================================================== */

--Rename the table employee to staff
rename table employee to staff;

--Rename the table satff to employee
rename table staff to employee;


/* ============================================================================== 
   ALTER
=============================================================================== */

--Deleting table employee from employeedb
drop table employee;

show tables;
Empty set (0.001 sec)

--deleting the employeedb Database
drop database employeedb;
