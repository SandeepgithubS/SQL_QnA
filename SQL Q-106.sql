CREATE TABLE customers (
    customer_id INT,
    name VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE orders1 (
    order_id INT ,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2)
);
INSERT INTO customers (customer_id, name, email) VALUES
(1, 'John Doe', 'john@example.com'),
(2, 'Jane Smith', 'jane@example.com'),
(3, 'Alice Johnson', 'alice@example.com'),
(4, 'Sam B', 'sb@example.com'),
(5, 'John Smith', 'j@example.com')	;
INSERT INTO orders1 (order_id, customer_id, order_date, amount) VALUES
(1, 1, '2024-03-05', 50.00),
(2, 2, '2024-03-10', 75.00),
(5, 4, '2024-04-02', 45.00),
(5, 2, '2024-04-02', 45.00)	,
(3, 4, '2024-04-15', 100.00),
(4, 1, '2024-04-01', 60.00),
(5, 5, '2024-04-02', 45.00);

/*
Given tables customers (columns: customer_id, name, email) and orders (columns: order_id, 
customer_id, order_date, amount), 
Write an SQL query to find customers who haven't made any purchases in the last month, 
assuming today's date is April 2, 2024. 
*/

-- ANSWER

select * from orders1;
select * from customers;

select 
     * 
from customers
where customer_id not in(
                      select customer_id from (
                                              select 
                                                  customer_id,
                                                   min(order_date) as lastm,
                                                   max(order_date) as ccm,
                                                   datediff(max(order_date),min(order_date)) as a
											  from orders1
                                              group by 1)as b
                                              where a<>0 or a> 30);