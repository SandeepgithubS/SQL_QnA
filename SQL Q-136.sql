CREATE TABLE customer1 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);
CREATE TABLE spending_records (
    record_id INT PRIMARY KEY,
    customer_id INT,
    spending_amount DECIMAL(10, 2),
    spending_date DATE
);
INSERT INTO customer1 (customer_id, customer_name) VALUES
(1, 'John'),
(2, 'Alice'),
(3, 'Bob'),
(4, 'Charlie');
INSERT INTO spending_records (record_id, customer_id, spending_amount, spending_date) VALUES
(9, 1, 120.00, '2024-03-25'),
(10, 2, 80.00, '2024-03-25'),
(11, 3, 150.00, '2024-03-25'),
(12, 4, 70.00, '2024-03-25'),
(13, 1, 90.00, '2024-03-02'),
(14, 2, 100.00, '2024-04-02'),
(15, 3, 160.00, '2024-04-02'),
(16, 4, 30.00, '2024-03-02'),
(17, 1, 110.00, '2024-04-09'),
(18, 2, 70.00, '2024-02-09'),
(19, 3, 140.00, '2024-03-09'),
(20, 4, 60.00, '2024-04-09'),
(21, 1, 100.00, '2024-03-16'),
(22, 2, 60.00, '2024-03-16'),
(23, 3, 130.00, '2024-03-16'),
(24, 4, 50.00, '2024-04-16'),
(25, 1, 80.00, '2024-03-23'),
(26, 2, 50.00, '2024-04-23'),
(27, 3, 120.00, '2024-04-23'),
(28, 4, 40.00, '2024-04-23'),
(29, 1, 70.00, '2024-04-30'),
(30, 2, 40.00, '2024-04-30'),
(31, 3, 110.00, '2024-03-01'),
(32, 4, 30.00, '2024-03-01');

/* You are given two table of amazon spending_records and customers Write a SQL query to show all customers and their total spending show only those
customers whos total spending has reduced compare to last month ()Return customer_name, customer_id, last MONTH spend, current month spent 
-- Note consider last month as March Current Month as April */

-- ANSWER

select * from customer1;
select * from spending_records;

with cte as (
select 
    monthname(s.spending_date) as mn,
    c.customer_name as nm,
    sum(s.spending_amount) as amt,
    lead( sum(s.spending_amount),1,sum(s.spending_amount)) over(partition by c.customer_name) as a
from spending_records as s left join customer1 as c
on s.customer_id = c.customer_id
group by 1,2)

select * from cte where amt > a and mn="March";