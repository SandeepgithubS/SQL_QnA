create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);

insert into customer_orders values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000);

-- day wise count of new customers and old customers

-- ANSWER

select * from customer_orders;

with cte as (
select 
     customer_id, 
     order_date ,
     order_amount,
     row_number() over(partition by customer_id order by order_date) as rn 
from customer_orders)

select 
     order_date, 
     count(case when rn = 1 then customer_id end) as new,
     count(case when rn > 1 then customer_id end ) as old,
     sum(case when rn = 1 then order_amount end) as new_total,
     ifnull(sum(case when rn > 1 then order_amount end),0) as old_total
from cte 
group by order_date;