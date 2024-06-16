CREATE TABLE stock (
    supplier_id INT,
    product_id INT,
    stock_quantity INT,
    record_date DATE
);
INSERT INTO stock (supplier_id, product_id, stock_quantity, record_date)
VALUES
    (1, 1, 60, '2022-01-01'),
    (1, 1, 40, '2022-01-02'),
    (1, 1, 35, '2022-01-03'),
    (1, 1, 45, '2022-01-04'),
 (1, 1, 51, '2022-01-06'),
 (1, 1, 55, '2022-01-09'),
 (1, 1, 25, '2022-01-10'),
    (1, 1, 48, '2022-01-11'),
 (1, 1, 45, '2022-01-15'),
    (1, 1, 38, '2022-01-16'),
    (1, 2, 45, '2022-01-08'),
    (1, 2, 40, '2022-01-09'),
    (2, 1, 45, '2022-01-06'),
    (2, 1, 55, '2022-01-07'),
    (2, 2, 45, '2022-01-08'),
 (2, 2, 48, '2022-01-09'),
    (2, 2, 35, '2022-01-10'),
 (2, 2, 52, '2022-01-15'),
    (2, 2, 23, '2022-01-16');
    
-- find the supplier_id, product_id, and minimum date where stock is less than 50 and consugative 2 days

-- ANSWER 

select * from stock;
with cte as (
select 
     supplier_id,
     product_id,
     stock_quantity,
     record_date,
     lag(record_date,1,record_date) over(partition by  supplier_id,product_id) as rn,
     datediff(record_date,lag(record_date,1,record_date) over(partition by  supplier_id,product_id))as a
from stock 
where stock_quantity < 50),
cte2 as (
select * ,
        case when a <= 1 then 0 else 1 end as b
from cte),
cte3 as (
select *,
	  sum(b) over(partition by supplier_id, product_id order by record_date)as c
from cte2)

select 
     supplier_id,
     product_id,
     c,
     min(record_date) as dt
from cte3
group by 1,2,3
having count(1) >=2;