
 -- 1.  Create table and Database for task completetion  --

CREATE DATABASE Day2Table;
USE Day2Table;
DROP TABLE students;
CREATE TABLE students(
       id int,
       studentName varchar(255),
       studentEmail varchar(255),
       age int);
       
-- 2. Insert few rows into students tables --    

INSERT INTO students 
VALUES (1,'Hanzala','hanzala@gmail.com','20'),
(2,'Ahmad','ahmad@gmail.com','20 '),
(3, 'ALI JAN', null, null),
(null, null, null, null);
SELECT * from students;

-- 3. Add coloum into students --
ALTER TABLE students
ADD COLUMN gender varchar(255);

ALTER TABLE students
ADD COLUMN studentstatus varchar(255) default 'Active';




-- 4. Insert only two coloum data --
INSERT INTO students(studentName ,studentEmail)
VALUES("USAMA","USAMA@gmail.com");



 -- 5. DATA for Practice      
INSERT INTO students 
VALUES 
(12, 'Abc', 'a@outlook.com', 0, null, ''),
(12, 'Abc', 'a@outlook.com', 0, null, ''),
(13, '', 'b@gmail.info', 50, 'M', 'Active'),
(13, '', 'b@gmail.info', 50, 'M', 'Active'),
(null, 'CDE', 'c@live.co', null, 'F', 'Active'),
(null, 'CDE', 'c@live.co', null, 'F', 'Active'),
(12, '   ', 'd@hohmail.com', 20, 'M', 'Active'),
(6, 'avg', 'e@yahoo.com', 10, 'F', 'Inactive'),
(6, 'avg', 'e@yahoo.com', 10, 'F', 'Inactive'),
(0, 'count', 'f@gmail.com', 5, null, null),
(null, null, 'g@gmail.com', null, null, 'InActive'),
(9, 'H', 'h@gmail.com', 20, 'F', 'Active');


-- Make Table for  Inventory

CREATE TABLE inventory (
	id int UNIQUE,
    item varchar(255),
    bill int,
    date varchar(255)
);
  --  Insert values into inventory Table
INSERT INTO inventory 
VALUES
(1, 'apple', 200, '2022:08:08'),
(2, 'soup', 250, '2023:08:08'),
(3, 'mango', 120, '2023:06:08'),
(4, 'orange', 195, '2023:02:08'),
(5, 'burger', 500, '2021:08:08');
SELECT * FROM inventory;  


-- Create a Table for Products
DROP TABLE products;
CREATE TABLE products(item varchar(255) ,price int , pStatus varchar(255),barcode varchar(255));
INSERT INTO products (item, price, pStatus,barcode)
VALUES ('PIZZA', '1500', 'Inactive',"ads"),
('BURGER', '540', 'Inactive',"adsd"),
('FRIES', '200', 'Active',Null),
('PASTA', '600', 'Inactive',"addsas"),
('CHEESE', '3000', 'Active',"adads"),
('MACRONI', '900', 'Active',"adasds"); 
SELECT * FROM products;  
-- -- -- -- Now all the Necessary tables are formed we can perform our task -----  
     
     
     
 -- Task 1    
-- Update Statements:

-- 1. Update the 'students' table to set the 'studentName' of the student with 'id' 5 to 'Sara'.

-- 2. Increase the 'price' of all items in the 'inventory' table by 10%.

UPDATE students
SET studentName = "Sara"
WHERE id = 1;
					
UPDATE inventory
SET bill = bill * 1.1;

SELECT * from students;

SELECT * from inventory;


-- Task2
-- Delete and Truncate Statements:
-- Delete all records from the 'products' table where the 'pStatus' is 'Inactive'.
-- Use the TRUNCATE statement to clear the 'inventory' table.

DELETE FROM products WHERE pStatus = "Inactive";
SELECT * FROM products;  

TRUNCATE TABLE inventory;
SELECT * FROM inventory; 


-- -- -- Task 3
-- Where and In Clauses:
-- Retrieve the names of students from the 'students' table whose ages are either 18, 19, or 20.
-- Fetch the 'pName' and 'price' of products from the 'products' table where the 'pStatus' is 'Active'.

SELECT * FROM students WHERE age in (18,19,20);

SELECT item,price FROM products WHERE pStatus = 'active';
SELECT * FROM products;  


-- -- Task 4
-- Between Clause:
-- Retrieve the names of students from the 'students' table whose ages are between 25 and 30.
-- Get the names of products from the 'inventory' table that have a 'price' between $5 and $15.

SELECT studentName FROM students WHERE age BETWEEN 25 AND 30;

SELECT item FROM products WHERE price BETWEEN 5 AND 15;


-- Task 5
-- Is Null and Not Null:
-- Find the Name of students from the 'students' table who haven't provided an email address.
-- Retrieve the 'pName' of products from the 'products' table that have a null 'barcode'.

SELECT studentName FROM students WHERE studentEmail is Null;

SELECT item FROM products WHERE barcode is Null;

-- Task 6
-- Unique and Auto_Increment:
-- Design a table named 'orders' with an auto-increment 'order_id' as a primary key.
-- Modify the 'barcode' column in the 'products' table to ensure it's unique and not nullable.

CREATE TABLE orderr (
    id int auto_increment PRIMARY KEY,
    bill int
);
INSERT INTO orderr VALUES(2,43);
SELECT * FROM orderr;

ALTER TABLE products
MODIFY barcode varchar(255) UNIQUE NOT NULL;


-- -- Task 7
-- Aggregate Functions:
-- Calculate the average 'age' of students in the 'students' table.
-- Find the sum of 'bill' values for items purchased on '2023:08:08' in the 'inventory' table

SELECT AVG(age) FROM students;

SELECT SUM(bill) FROM inventory WHERE date = '2022:08:08';
