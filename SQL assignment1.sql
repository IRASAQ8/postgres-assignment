-- Create the database (schema)
CREATE DATABASE IF NOT EXISTS Sales_assignment;
USE Sales_assignment;

-- Create the sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    region VARCHAR(20),
    product VARCHAR(30),
    quantity INT,
    price DECIMAL(10,2),
    sale_date DATE
);

-- Insert 20 rows of sample data
INSERT INTO sales (sale_id, customer_name, region, product, quantity, price, sale_date) VALUES
(1, 'John Doe', 'East', 'Laptop', 2, 700, '2025-09-15'),
(2, 'Jane Smith', 'West', 'Mouse', 5, 20, '2025-09-16'),
(3, 'Mark Daniel', 'East', 'Keyboard', 3, 40, '2025-09-17'),
(4, 'Anna Adams', 'South', 'Laptop', 1, 750, '2025-09-18'),
(5, 'Luke Brown', 'North', 'Headphones', 4, 60, '2025-09-18'),
(6, 'Mary Jones', 'East', 'Laptop', 1, 700, '2025-09-19'),
(7, 'Peter White', 'West', 'Keyboard', 2, 35, '2025-09-19'),
(8, 'John Doe', 'East', 'Mouse', 6, 25, '2025-09-20'),
(9, 'Jane Smith', 'West', 'Laptop', 1, 720, '2025-09-21'),
(10, 'Anna Adams', 'South', 'Mouse', 3, 22, '2025-09-22'),
(11, 'Mark Daniel', 'North', 'Laptop', 2, 690, '2025-09-23'),
(12, 'Mary Jones', 'East', 'Keyboard', 4, 38, '2025-09-24'),
(13, 'Luke Brown', 'South', 'Headphones', 3, 55, '2025-09-24'), 
(14, 'Peter White', 'West', 'Laptop', 2, 710, '2025-09-25'),
(15, 'John Doe', 'East', 'Keyboard', 5, 42, '2025-09-25'),
(16, 'Jane Smith', 'North', 'Mouse', 7, 28, '2025-09-26'),
(17, 'Anna Adams', 'South', 'Laptop', 3, 740, '2025-09-26'),
(18, 'Luke Brown', 'East', 'Mouse', 4, 26, '2025-09-27'),
(19, 'Peter White', 'West', 'Headphones', 3, 58, '2025-09-27'),
(20, 'Mary Jones', 'South', 'Keyboard', 2, 37, '2025-09-28');

-- Tasks:
--  1. Retrieve all records from the table.
select * from sales;
--  2. Select customer name, product, and total amount (quantity × price).
select customer_name, product, quantity*price as total_amount
from sales;
--  3. Filter sales where the region is 'East' and product is 'Laptop'.
select * from sales where region= "east" and product = "laptop";
--  4. Group sales by region and show the total revenue per region.
select region, sum(price*quantity) as total_revenue from sales group by region;
--  5. Order the regions by total revenue (highest first).
select region, sum(price*quantity) as total_revenue from sales group by region order by total_revenue desc;
--  6. Limit your result to the top 2 highest revenue regions.
select region, sum(price*quantity) as total_revenue from sales group by region order by total_revenue desc limit 2;