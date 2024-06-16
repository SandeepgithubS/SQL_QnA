CREATE TABLE customers (
    customer_id INT ,
    customer_name VARCHAR(255),
    age INT,
    gender VARCHAR(10));

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2));
INSERT INTO customers (customer_id, customer_name, age, gender)
VALUES
    (1, 'John Doe', 30, 'Male'),
    (2, 'Jane Smith', 25, 'Female'),
    (3, 'Alice Johnson', 35, 'Female'),
    (4, 'Bob Brown', 40, 'Male');
INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
    (101, 1, '2023-01-15', 150.50),
    (102, 2, '2022-02-20', 200.25),
    (103, 3, '2023-03-10', 180.75),
    (104, 4, '2023-04-05', 300.00),
    (105, 1, '2022-05-12', 175.80),
    (106, 2, '2021-06-18', 220.40),
    (107, 3, '2023-07-22', 190.30),
    (108, 4, '2023-08-30', 250.60),
	(109, 4, '2021-08-30', 250.60),
	(110, 4, '2024-01-30', 250.60),
	(111, 4, '2023-08-30', 250.60);
    
    /* Write an SQL query to find the average order amount for 
       male and female customers separately return the results with 2 DECIMAL */
       
-- ANSWER

select * from customers;
select * from orders;

with cte as 
        (select o.customer_id, c. gender, o.total_amount from orders as o join customers as c on o.customer_id = c.customer_id)
select round(avg( case when gender = "Male" then total_amount end),2) as males, round(avg(case when gender = "Female" then total_amount end),2) as female 
from cte ;

-- OR

SELECT 
	c.gender as gender_name,
	ROUND(avg(o.total_amount), 2) as avg_spent
FROM customers as c
JOIN orders as o
ON c.customer_id = o.customer_id
GROUP BY gender_name;