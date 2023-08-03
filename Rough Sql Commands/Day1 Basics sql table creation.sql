CREATE DATABASE schoolData;
USE schoolData;
CREATE TABLE studentData (
			id int,
            stName varchar(255),
            stEmail varchar(255),
            stAge int);
            
CREATE TABLE studentDataclass2 (
			id int,
            stName varchar(255),
            stEmail varchar(255),
            stAge int,
            height int);            
            
INSERT INTO studentDataclass2 VALUES (2,"Ghufran Ahmed Barcha","gufoor.barcha2906@gmail.com",20 , 14)      
INSERT INTO studentDataclass2 VALUES (1,"Ahmed Barcha","barcha2906@gmail.com",21 ,15)
            
INSERT INTO studentData VALUES (2,"Ghufran Ahmed Barcha","gufoor.barcha2906@gmail.com",20)      
INSERT INTO studentData VALUES (1,"Ahmed Barcha","barcha2906@gmail.com",21)
INSERT INTO studentData VALUES (2,"Barcha","2906@gmail.com",22)     
SELECT * FROM studentDataclass2;
