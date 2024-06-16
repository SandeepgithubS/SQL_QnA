CREATE TABLE products1 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    quantity_sold INT
);

-- Inserting sample data for products
INSERT INTO products1 (product_id, product_name, price, quantity_sold) VALUES
    (1, 'iPhone', 899.00, 600),
    (2, 'iMac', 1299.00, 150),
    (3, 'MacBook Pro', 1499.00, 500),
    (4, 'AirPods', 499.00, 800),
    (5, 'Accessories', 199.00, 300);
    
/*
Calculate the percentage contribution of each product 
to total revenue? Round the result into 2 decimal
*/

-- ANSWER

select * from products1;

select 
    product_name,
    quantity_sold * price as revenue,
    round(quantity_sold * price /
    sum(quantity_sold * price ) over(),2) as "%_contribution"
from products1;