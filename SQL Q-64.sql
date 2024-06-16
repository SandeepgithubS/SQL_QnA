create table transactions(
order_id int,
cust_id int,
order_date date,
amount int
);
insert into transactions values 
(1,1,'2020-01-15',150)
,(2,1,'2020-02-10',150)
,(3,2,'2020-01-16',150)
,(4,2,'2020-02-25',150)
,(5,3,'2020-01-10',150)
,(6,3,'2020-02-20',150)
,(7,4,'2020-01-20',150)
,(8,5,'2020-02-20',150);

/*  Customer retention refers to the ability of a company or product to retain its customers over some specified period. 
High customer retention means customers of the product or business tend to return to, 
continue to buy or in some other way not defect to another product or business, or to non-use entirely. */ 

-- ANSWER 

select * from transactions;

with cte as (
select monthname(order_date) as mn,
       cust_id,
       row_number() over(partition by cust_id) as rk
from transactions)

select 
     mn, 
     count(case when rk =2 then 1 end) as customer_retention,
      count(case when rk =1 then 1 end) as customer_churn
from cte 
group by mn;