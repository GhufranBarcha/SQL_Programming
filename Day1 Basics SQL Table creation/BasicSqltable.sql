-- Task 1: Write the SQL code to create new database  with the name “YourName_RollNumber”
CREATE DATABASE ghufran_c206;

-- Task 2:
-- Write the SQL code to create new table with any name having five columns.
-- Write the SQL code to create new table with different name having five columns.
USE ghufran_c206;

CREATE TABLE ghufranData (
                 id int,
                 sName varchar(255),
                 sEmail int,
                 sheight int,
                 sWeight varchar(255)
                 );  
                 
CREATE TABLE ghufranPetData (
                 id int,
                 petName varchar(255),
                 petWeight int,
                 petheight int,
                 petBreed varchar(255)
                 );                 
                 
                 
-- NOTE: Both tables must have a single column in common.
-- Task 3:
-- Write the SQL code to insert data into the table.      

INSERT INTO ghufranData VALUE("1","Ghufran",79,5.9,"Human")           
INSERT INTO ghufranData VALUE("2","bado",80,5.7,"HUMAN")       
       
INSERT INTO ghufranPetData VALUE("1","CATTY",10,12,"CAT")    
INSERT INTO ghufranPetData VALUE("2","BULLL",20,32,"DOG")   
  
SELECT * FROM ghufranData;
SELECT * FROM ghufranPetData;


-- Task 4:
-- Write the SQL code to empty the data table.

TRUNCATE TABLE ghufranPetData;
Truncate TABLE ghufranData;

SELECT * FROM ghufranPetData;
SELECT * FROM ghufranData;


-- Task 5:
-- Write the SQL code to delete the data table.
DROP TABLE ghufranPetData; -- Will delete ghufranPetData table
DROP TABLE ghufranData;  -- Will delete ghufranData table

-- When you run below code it will give you an error that table doesn't exist.
SELECT * FROM ghufranPetData;
SELECT * FROM ghufranData;

-- Task 6:
-- Write the SQL code to delete database.
-- Repeat Task 1 Again
DROP DATABASE ghufran_c206; -- Will dekete the whole Database