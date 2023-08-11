-- Complete all the Tasks Below -- 

CREATE DATABASE day3Assign2;
USE day3Assign2;

/*Task 1: 
1.1 Create a table named 'Authors' with columns: author_id (PRIMARY KEY), author_name.
1.2 Create a table named 'Books' with columns: book_id (PRIMARY KEY), book_title, author_id (FOREIGN KEY).
1.3 Write a query to show all book titles along with their corresponding author names.*/


-- 1.1
DROP TABLE Employees;
CREATE TABLE Authors(author_id int,
                     author_name char(255),
                      PRIMARY KEY (author_id));
                      
INSERT INTO Authors
 VALUES(1 ,"DEVINCHI" )  ,
 (2 , "GILBERt"),
  (3 , "polo"),
   (4 , "manfg");
 
                      
-- 1.2     
CREATE TABLE Books(   book_id int,
                      author_id int,
                      book_title varchar(255),
                      PRIMARY KEY (book_id),
                      FOREIGN KEY(author_id) REFERENCES Authors(author_id)
                      );             
                      
INSERT INTO Books
 VALUES(1 ,1 ,"ALChemist")  ,
 (2 , 2 ,"SHADES of love"),
  (3 , 3,"mulang warrier"),
   (4 , 4,"manf the legend");  
   
   
-- 1.3   
SELECT b.Book_title,A.author_name FROM Books as b ,Authors as A WHERE A.author_id = b.author_id;
SELECT * FROM Books;     














/*Task 2:
2.1 Write an SQL query to retrieve the names of customers who made orders, along with the order IDs, from the 'Customers' and 'Orders' tables using INNER JOIN.      */

CREATE TABLE Customers(customer_id int,
                      customer_name varchar(255),
                      PRIMARY KEY (customer_id)
                      );  
INSERT INTO Customers 
VALUES(1,"Ahmed"),
(2,"Hanzala"),  
(3,"Ghufran"),  
(4,"Mashaa");                      
                      
CREATE TABLE Orders(   order_id int,
                       order_quantity int,
                      customer_id int,
                      PRIMARY KEY (order_id),
                      FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
                      );  
INSERT INTO orders 
VALUES(10,3,1),
(11,4,2),  
(12,4,1),  
(13,5,2);                      

SELECT c.customer_name,o.order_id FROM Customers as c 
INNER JOIN  Orders as o  ON c.customer_id = o.customer_id;       









/* Task 3:
3.1 Retrieve the list of all departments along with the names of employees in each department. Include departments without employees using a LEFT JOIN between the 'Departments' and 'Employees' tables.
*/

CREATE TABLE Departments(   department_id int,
                       department_name varchar(255),
                      department_work varchar(255),
                      PRIMARY KEY (department_id)
                      ); 
-- Insert data into the Departments table
INSERT INTO Departments (department_id, department_name, department_work)
VALUES
    (1, 'Human Resources', 'Employee recruitment and management'),
    (2, 'Finance', 'Financial planning and management'),
    (3, 'Marketing', 'Product promotion and customer outreach'),
    (4, 'Engineering', 'Product development and innovation');                      
                      
CREATE TABLE Employees(   employee_id int,
                       employee_name varchar(255),
                      employee_position varchar(255),
                      employee_salary int,
                      department_id int,
                      manager_id int,
                      PRIMARY KEY (employee_id),
                      FOREIGN KEY(department_id) REFERENCES Departments(department_id)
                      ); 
                      drop table Employees;
INSERT INTO Employees (employee_id, employee_name, employee_position, employee_salary, department_id, manager_id)
VALUES
    (5, 'David Wilson', 'HR Coordinator', 45000, 1, 1),
    (6, 'Jessica Lee', 'Financial Planner', 75000, 2, 1),
    (7, 'Andrew Clark', 'Marketing Manager', 60000, 3, 3),
    (8, 'Christopher Harris', 'Software Engineer', 75000, 4, 4),
    (9, 'Elizabeth Turner', 'Marketing Coordinator', 48000, 3, 3),
    (10, 'Matthew Johnson', 'Software Engineer', 82000, 4, 2);          
    
SELECT 
D.department_name, D.department_work,  E.employee_name 
FROM 
Departments as D
LEFT JOIN Employees as E
ON D.department_id = E.department_id; 
    
    
    
    
    
    
    
    
    
/*Task 4: 
4.1 Write an SQL query to display all managers and their employees' names, even if some managers have no employees. Use a RIGHT JOIN between the 'Managers' and 'Employees' tables.
  */
  
 CREATE TABLE Managers(manager_id int Primary Key,
                       manager_name varchar(255),
                       manager_work varchar(255));
-- Insert data into the Managers table
INSERT INTO Managers (manager_id, manager_name, manager_work)
VALUES
    (1, 'Alice Smith', 'HR Manager'),
    (2, 'Bob Johnson', 'Finance Manager'),
    (3, 'Carol Brown', 'Marketing Manager'),
    (4, 'David Davis', 'Engineering Manager');

SELECT 
M.manager_name,E.employee_name
FROM 
Managers as M
RIGHT JOIN
 Employees as E
ON 
 M.manager_id = E.manager_id;
     





						
 /* Task 5: 
5.1 Generate a list of all possible combinations of product names and supplier names from the 'Products' and 'Suppliers' tables using a CROSS JOIN.
   */   
   
   CREATE TABLE Products(product_id int Primary Key,
                       product_name varchar(255),
                       product_quantity varchar(255),
                       product_price int);

INSERT INTO Products(product_id, product_name, product_quantity, product_price)
VALUES
    (1, 'Smartphone', '100', 500),         
    (2, 'Laptop', '50', 1000),             
    (3, 'Headphones', '200', 50),          
    (4, 'Tablet', '75', 300),                 
    (5, 'Smart Watch', '120', 200);  
    
    
CREATE TABLE Supplier(supplier_id int Primary Key,
                       supplier_name varchar(255),
                       supplier_contact varchar(255),
                       product_id int,
                       FOREIGN KEY(product_id) REFERENCES Products(product_id));
                       
INSERT INTO Supplier (supplier_id, supplier_name, supplier_contact, product_id)
VALUES
    (6,'Supplier A', 'John Doe', 1),
    (7,'Supplier B', 'Jane Smith', 2),
    (8,'Supplier C', 'Mike Johnson', 3),
    (9, 'Supplier D', 'Sara Brown', 2),
    (10,'Supplier E', 'Chris Davis', 5);                     
                       
SELECT 
P.product_name,S.supplier_Name,S.supplier_contact
FROM 
Products as P
CROSS JOIN
Supplier as S 
ON 
P.product_id = S.product_id;








/*Task#6
6.1 Retrieve customer names, their order IDs, and payment amounts (if available) from the 'Customers', 'Orders', and 'Payments' tables. Include all customers and their orders, as well as payments if they exist.
*/

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_amount INT,
    payment_status varchar(255) default "Active"
);

-- Insert data into the Payments table (only for some orders)
INSERT INTO Payments (payment_id, order_id, payment_amount)
VALUES
    (203,1, 500),
    (204, 3, 600);
    
    
SELECT
C.customer_name ,O.order_id,P.payment_amount
FROM
 Customers AS C
JOIN
    Orders AS O ON C.customer_id = O.customer_id
JOIN
    Payments AS P ON O.order_id = P.order_id;
    
    
    
    
    
    
    
    
    
  /*Task 7:
7.1 Write a query to list student names, course names, enrollment dates, and grades (if available) from the 'Students', 'Courses', 'Enrollments', and 'Grades' tables.
*/

CREATE TABLE Students (
  student_id INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE Courses (
  course_id INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE Enrollments (
  enrollment_id INT PRIMARY KEY,
  student_id INT,
  course_id INT,
  enrollment_date DATE,
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Grades (
  enrollment_id INT, 
  grade INT,
  FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id)
);


INSERT INTO Students (student_id, name)
VALUES
  (1, 'John Doe'),
  (2, 'Jane Smith'),
  (3, 'Bob Johnson');

INSERT INTO Courses (course_id, name) 
VALUES
  (10, 'Math 101'),
  (20, 'English 201'),
  (30, 'Chemistry 301');
  
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
  (1, 1, 10, '2020-01-01'),
  (2, 1, 20, '2020-01-01'),
  (3, 2, 10, '2020-01-01'),
  (4, 3, 30, '2020-01-01');
  
INSERT INTO Grades (enrollment_id, grade)
VALUES
  (1, 90),
  (2, 80),
  (4, 75);
  
SELECT
  s.name AS student_name,
  c.name AS course_name,
  e.enrollment_date,
  g.grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN Grades g ON e.enrollment_id = g.enrollment_id;










/*
Task 8:
8.1 Fetch customer names, their order IDs, and corresponding product names from the 'Customers', 'Orders', and 'OrderDetails' tables. Use primary key relationships to join the tables.
*/

CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT
);

INSERT INTO OrderDetails (order_detail_id, order_id, product_id)
VALUES
    (301, 101, 1),
    (302, 101, 2),
    (303, 102, 3),
    (304, 103, 1),
    (305, 104, 4);

SELECT
    C.customer_name,
    O.order_id,
    P.product_name
FROM
    Customers AS C
JOIN
    Orders AS O ON C.customer_id = O.customer_id
JOIN
    OrderDetails AS OD ON O.order_id = OD.order_id
JOIN
    Products AS P ON OD.product_id = P.product_id;
    
    
    
 
 
 
 
 
 
 
 /* Task 9: 
9.1 Retrieve a list of employees and the projects they are working on, including employees without projects. Handle NULL values appropriately in your query.
*/

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255)
);

INSERT INTO Projects (project_id, project_name)
VALUES
    (5, 'Project A'),
    (6,'Project B'),
    (7, 'Project C');

SELECT
    E.employee_id,
    E.employee_name,
    COALESCE(P.project_name, 'No Project') AS project_name
FROM
    Employees AS E
LEFT JOIN
    Projects AS P ON E.employee_id = P.project_id;
    
  
  
  
  
  
  
  
  
 /* Task 10:
10.1 Write a query to get customer names, order IDs, product names, and payment status (if available) from the 'Customers', 'Orders', 'Products', and 'Payments' tables. Ensure that all customer data is included.
*/

SELECT
    C.customer_name,
    O.order_id,
    P.product_name,
    COALESCE(PA.payment_status, 'Not Paid') AS payment_status
FROM
    Customers AS C
JOIN
    Orders AS O ON C.customer_id = O.customer_id
JOIN
    OrderDetails AS OD ON O.order_id = OD.order_id
JOIN
    Products AS P ON OD.product_id = P.product_id
LEFT JOIN
    Payments AS PA ON O.order_id = PA.order_id;
   
   
   /*
Task 11:
Perform SQL Intermediate Certification on HackerRank.*/
-- Check my profile