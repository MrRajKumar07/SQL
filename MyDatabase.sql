/*
=============================================================
Database Creation and Table Setup Script (MySQL Version)
=============================================================
Script Purpose:
    This script creates a new MySQL database named 'MyDatabase'. 
    If the database already exists, it is dropped to ensure a clean setup. 
    The script then creates two tables: 'customers' and 'orders'
    with their respective schemas, and populates them with sample data.
*/

drop database if exists MyDatabase;

create database MyDatabase;

Database changed

drop table if exists Customers;

-- ======================================================
-- Table: customers
-- ======================================================

create table Customers(
    -> id int not null,
    -> first_name varchar(50) not null,
    -> country varchar(50),
    -> score int,
    -> primary key(id)
    -> );

-- Show tables In Selected Database
show tables;
+----------------------+
| Tables_in_mydatabase |
+----------------------+
| customers            |
+----------------------+

-- Describe Table Customers
desc customers;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| id         | int(11)     | NO   | PRI | NULL    |       |
| first_name | varchar(50) | NO   |     | NULL    |       |
| country    | varchar(50) | YES  |     | NULL    |       |
| score      | int(11)     | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+

-- Insert Single Row Values
insert into customers (id, first_name, country, score) values
    -> (1, 'Raj Kumar', 'India', 900);

-- Insert Multiple Rows Values
insert into customers (id, first_name, country, score) values
    -> (2, 'Jagrit Kumar', 'Germany', 760),
    -> (3, 'Chandan Kumar', 'Canada', 670),
    -> (4, 'Miss Unique', 'India', 970),
    -> (5, 'Deepak Kumar', 'USA', 805),
    -> (6, 'Prabhat Kumar', 'Germany', 630);

-- ======================================================
-- Table: orders
-- ======================================================

drop table if exists orders;

-- Create a new Table Orders
create table orders (
    -> order_id int not null,
    -> customer_id int not null,
    -> order_date date,
    -> sales int,
    -> primary key(order_id)
    -> );

-- Show tables In Selected Database
show tables;
+----------------------+
| Tables_in_mydatabase |
+----------------------+
| customers            |
| orders               |
+----------------------+

-- Describe table Orders
desc orders;
+-------------+---------+------+-----+---------+-------+
| Field       | Type    | Null | Key | Default | Extra |
+-------------+---------+------+-----+---------+-------+
| order_id    | int(11) | NO   | PRI | NULL    |       |
| customer_id | int(11) | NO   |     | NULL    |       |
| order_date  | date    | YES  |     | NULL    |       |
| sales       | int(11) | YES  |     | NULL    |       |
+-------------+---------+------+-----+---------+-------+

-- Insert Values In Table Orders
insert into orders (order_id, customer_id, order_date, sales) values
    -> (1001, 1, '2025-09-20', 35),
    -> (1002, 2, '2025-04-23', 42),
    -> (1003, 3, '2025-07-30', 16),
    -> (1004, 5, '2025-03-04', 28),
    -> (1005, 6, '2025-01-26', 56);
Query OK, 5 rows affected (0.010 sec)
