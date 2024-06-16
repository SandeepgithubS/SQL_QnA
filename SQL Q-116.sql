CREATE TABLE Customers3 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE Purchases2 (
    purchase_id INT PRIMARY KEY,
    customer_id INT,
    product_category VARCHAR(50)
);

INSERT INTO Customers3 (customer_id, customer_name) VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Charlie'),
    (4, 'David'),
    (5, 'Emma');
INSERT INTO Purchases2 (purchase_id, customer_id, product_category) VALUES
    (101, 1, 'Electronics'),
    (102, 1, 'Books'),
    (103, 1, 'Clothing'),
    (104, 1, 'Electronics'),
    (105, 2, 'Clothing'),
    (106, 1, 'Beauty'),
    (107, 3, 'Electronics'),
    (108, 3, 'Books'),
    (109, 4, 'Books'),
    (110, 4, 'Clothing'),
    (111, 4, 'Beauty'),
    (112, 5, 'Electronics'),
    (113, 5, 'Books');
    
/* Write an SQL query to find customers who have made purchases in all product categories.
  Your query should return the customer_id and customer_name of these customers.*/
  
-- ANSWER 

select * from Customers3;
select * from Purchases2;

select 
     p.customer_id,
     c.customer_name,
     group_concat(distinct p.product_category) as cats
from Purchases2 as p join Customers3 as c
on p.customer_id = c.customer_id
group by 1
having count(distinct p.product_category ) =
(select count(distinct product_category ) from Purchases2);
