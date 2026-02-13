CREATE DATABASE ShopDB;
USE ShopDB;

-- Customers Table
CschooldbREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    email VARCHAR(100)
);

-- Products Tables
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers (customer_name, city, email) VALUES
('Alice Brown', 'Lagos', 'alice.brown@gmail.com'),
('Michael Smith', 'Abuja', 'michael.smith@yahoo.com'),
('Sophie Daniels', 'Lagos', 'sophie.daniels@gmail.com'),
('David Johnson', 'Port Harcourt', 'david.j@gmail.com'),
('Olivia Adams', 'Abuja', 'olivia.a@outlook.com');
('luke davis', 'Lagos', 'alice.brown@gmail.com'),
('jade best', 'Abuja', 'michael.smith@yahoo.com'),
('tunde ednut', 'Lagos', 'sophie.daniels@gmail.com'),

INSERT INTO Products (product_name, category, price) VALUES
('Laptop HP 250', 'Electronics', 350000),
('Samsung Galaxy S21', 'Phones', 420000),
('Dell Inspiron', 'Electronics', 380000),
('Apple iPhone 13', 'Phones', 650000),
('JBL Speaker', 'Accessories', 45000)
('Laptop HP 250', 'Electronics', 350000),
('itel P36', 'Phones', 420000),
('iphone XR', 'Electronics', 380000),;

INSERT INTO Orders (customer_id, product_id, order_date, quantity) VALUES
(1, 1, '2024-05-10', 1),
(1, 2, '2024-05-15', 2),
(2, 3, '2024-06-01', 1),
(3, 5, '2024-06-10', 3),
(4, 4, '2024-07-02', 1),
(5, 2, '2024-07-05', 1);

-- orders from customers name and product name
select * from customers
inner join orders
on  customers.customer_id = orders.customer_id
 inner join products
on products.product_id = orders.product_id; 


-- customers and products ordered
SELECT 
    Customers.Customer_id,
    Customers.Customer_Name,
    Orders.Order_ID, Products.Product_Name
FROM Customers
left JOIN Orders ON Customers.Customer_id = Orders.Customer_id
left JOIN Products ON Orders.Product_id = Products.Product_id; 

-- all products and which customers ordered them (including products that haven’t been ordered).
select products.product_id, products.product_name, orders.order_id, customers.customer_id, customers.customer_name
from products
left join orders
on products.product_id=orders.product_id
left join customers
on customers.customer_id=orders.customer_id;


-- the total amount spent by each customer total amount spent by each customer
SELECT 
    Customers.Customer_ID,
    Customers.Customer_Name,
    SUM(Products.Price * Orders.Quantity) AS Total_Amount
FROM orders
INNER JOIN customers
    ON Customers.Customer_ID = Orders.Customer_ID   
INNER JOIN Products 
    ON Orders.Product_ID = Products. 
    Customers.Customer_Name, products.product_name,category,
FROM Customers
INNER JOIN Orders 
    ON Customers.Customer_ID = Orders.Customer_ID
INNER JOIN Products 
    ON Orders.Product_ID = Products.Product_ID
WHERE Products.Category = 'Electronics'; 

-- All customers whose name starts with ‘A’.
select * from customers where customer_name like "A%";

-- Get all customers whose email contains ‘gmail’.
select * from customers where email like "%gmail%";

-- Retrieve all products that have ‘Phone’ in their name.
select * from products where product_name like "%phone%";

-- Show all customers whose city ends with ‘a’ (case-insensitive)
select * from customers where customer_name  like  "a%";

--  List all products whose names contain ‘Dell’ or ‘HP’.
select *  from products where product_name like "%dell%" or product_name  like "%HP%";
-- incomplete assignment



-- get customers email domaain
select customer_name,city,email, case 
when email like '%gmail.com' then 'gmail'
when email like '%yahoo.com' then 'yaahoo mail'
else 'others' END AS 'EMAIL DOMIAN'
from customers;






# WORKERS TABLE
create database workersdb;
use workersdb;
SELECT `EDUCATIONAL LEVEL`
FROM salary_data;

alter table salary_data
rename column ï»¿Age TO AGE;

alter table salary_data
rename column `Education LEVEL` TO EDUCATION_LEVEL;

alter table salary_data
rename column `Job Title` TO JOB_TITTLE;

alter table salary_data
rename column `Years of Experience` TO EXPERIENCE;

select * from salary_data;
-- DISTNCT JOB TITTLES
select distinct JOB_TITTLE 
from salary_data;
-- COUNT DISTINCT
select count(distinct JOB_TITTLE)
 from salary_data;
 
 -- DISTINCT EDUCATIONAL LEVEL
 select distinct EDUCATION_LEVEL
 FROM salary_data;
 -- COUNT EDUCATION LEVEL
 select count(DISTINCT EDUCATION_LEVEL)
 FROM salary_data;
 
 -- GET ALL PHD HOLDERS
 select *
 FROM SALARY_DATA
 WHERE EDUCATION_LEVEL = 'PHD';
 
 -- GET developers with maasters
 SELECT *
 FROM salary_data
 WHERE JOB_TITTLE LIKE "%DEVELOPER%" 
 AND EDUCATION_LEVEL LIKE "MASTER'S%";
 
 -- average salary
 select EDUCATION_LEVEL, AVG (SALARY) AS AVERAGE_SALARY
 FROM SALARY_DATA
 GROUP BY EDUCATION_LEVEL
 order by average_salary desc;
 
 -- AVERAGE age
select education_level, avg(age) as average_age
from salary_data
group by EDUCATION_LEVEL
order by average_age desc;

-- count gender by job tittle
select job_tittle, gender, count(*)
from salary_data
group by JOB_TITTLE, Gender;

-- create expperience level table
select age, gender,education_level, job_tittle,salary,EXPERIENCE, case 
when  experience  <5 then 'junior'
when experience >=5 and EXPERIENCE <15 then 'mid_level'
when  experience >=15 then 'senior'
 END AS experience_level
from salary_data;



