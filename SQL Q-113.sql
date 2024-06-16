CREATE TABLE customers2 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100)
);
CREATE TABLE orders3 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10, 2)
);
INSERT INTO customers2 (customer_id, customer_name, customer_email) VALUES
(1, 'John Doe', 'john@example.com'),
(2, 'Jane Smith', 'jane@example.com'),
(3, 'Alice Johnson', 'alice@example.com'),
(4, 'Bob Brown', 'bob@example.com');

INSERT INTO orders3 (order_id, customer_id, order_date, order_amount) VALUES
(1, 1, '2024-01-03', 50.00),
(2, 2, '2024-01-05', 75.00),
(3, 1, '2024-01-10', 25.00),
(4, 3, '2024-01-15', 60.00),
(5, 2, '2024-01-20', 50.00),
(6, 1, '2024-02-01', 100.00),
(7, 2, '2024-02-05', 25.00),
(8, 3, '2024-02-10', 90.00),
(9, 1, '2024-02-15', 50.00),
(10, 2, '2024-02-20', 75.00);

-- Find the top 2 customers who have spent the most money across all their orders. 

-- ANSWER

select * from customers2;
select * from orders3;

with cte as (
select 
     customer_id,
     sum(order_amount) as tt
from orders3
group by 1
order by 2 desc
limit 2)

select 
     a.customer_id,
     a.customer_name,
     b.tt
from customers2 as a right join cte as b
on a.customer_id = b. customer_id;