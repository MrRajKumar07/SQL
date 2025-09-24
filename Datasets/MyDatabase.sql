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

DROP DATABASE IF EXISTS MyDatabase;

-- Create a New Database MyDatabase
CREATE DATABASE MyDatabase;

USE MyDatabase;

-- ======================================================
-- Table: customers
-- ======================================================

DROP TABLE IF EXISTS customers;

-- Create a New Table Customers
CREATE TABLE customers (
    id INT NOT NULL,
    first_name VARCHAR(50),
    country VARCHAR(50),
    score INT,
    PRIMARY KEY (id)
);

-- Describe Table customers
DESC customers;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| id         | int(11)     | NO   | PRI | NULL    |       |
| first_name | varchar(50) | NO   |     | NULL    |       |
| country    | varchar(50) | YES  |     | NULL    |       |
| score      | int(11)     | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+

--Insert Data into Table Customers
INSERT INTO customers (id, first_name, country, score) VALUES
(1, 'Raj Kumar', 'India', 900),
(2, 'Jagrit Kumar', 'Germany', 760),
(3, 'Chandan Kumar', 'Canada', 670),
(4, 'Miss Unique', 'India', 970),
(5, 'Deepak Kumar', 'USA', 805),
(6, 'Prabhat Kumar', 'Germany', 630);

-- ======================================================
-- Table: orders
-- ======================================================

DROP TABLE IF EXISTS orders;

--Create Table Orders
CREATE TABLE orders (
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_date DATE,
    sales INT,
    PRIMARY KEY (order_id)
);

--Describe Table Orders
DESC orders;
+-------------+---------+------+-----+---------+-------+
| Field       | Type    | Null | Key | Default | Extra |
+-------------+---------+------+-----+---------+-------+
| order_id    | int(11) | NO   | PRI | NULL    |       |
| customer_id | int(11) | NO   |     | NULL    |       |
| order_date  | date    | YES  |     | NULL    |       |
| sales       | int(11) | YES  |     | NULL    |       |
+-------------+---------+------+-----+---------+-------+

--Insert Data into Table Orders
INSERT INTO orders (order_id, customer_id, order_date, sales) VALUES
(1001, 1, '2025-09-20', 35),
(1002, 2, '2025-04-23', 42),
(1003, 3, '2025-07-30', 16),
(1004, 5, '2025-03-04', 28),
(1005, 6, '2025-01-26', 56);
