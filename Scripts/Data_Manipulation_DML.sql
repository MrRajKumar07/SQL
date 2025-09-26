/* ==============================================================================
   SQL Data Manipulation Language (DML)
-------------------------------------------------------------------------------
   This guide covers the essential DML commands used for inserting, updating, 
   and deleting data in database tables.

   Table of Contents:
     1. INSERT - Adding Data to Tables
     2. UPDATE - Modifying Existing Data
     3. DELETE - Removing Data from Tables
=================================================================================
*/

use mydatabase;

--Create a new table
create table employee(
    -> empId int not null,
    -> empName varchar(50) not null,
    -> salary int not null,
    -> department varchar(50)
    -> );

/* ============================================================================== 
   INSERT
=============================================================================== */

--Insert multiple data into Employee tbale
insert into employee(empId,empName,salary,department) values
    -> (101,'Raj Kumar', 50000,'Developer'),
    -> (102,'Jagrit Kumar', 45000,'Tester'),
    -> (102,'Deepak Kumar', 76000,'Marketing'),
    -> (104,'Miss Unique', 120000,'Application');

--Retrive all the data from th table employee
select * from employee;

--Insert single data into table employee
insert into employee(empId,empName,salary,department) values
    -> (105,'Chandan Kumar',55000,'Bank');

/* #2 Method: INSERT DATA USING SELECT - Moving Data From One Table to Another */
-- Copy data from the 'employee' table into 'staff'

INSERT INTO staff (id, name, country, score)
    -> SELECT empId, empName, 'unknown', 0
    -> FROM employee
    -> WHERE empId = 104;    

/* ============================================================================== 
   UPDATE
=============================================================================== */

-- Change the empId of employee with empName is Deepak kumar
update employee set empId=103 where empName='Deepak Kumar';

--Change the salary of employee with empId is 101
update employee set salary=130000 where empId=101;

--Change the department of employee with empId is 105
update employee set department='Bank Staff' where empId=105;

/* ============================================================================== 
   DELETE
=============================================================================== */

-- Delete employee with an ID 105
delete from employee where empId=105;

