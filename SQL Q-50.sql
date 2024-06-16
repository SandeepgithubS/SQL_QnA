create table salesvar_tbl (dt date, sales int);
insert into salesvar_tbl values ('2023-10-03', 10),('2023-10-04', 20),
('2023-10-05', 60),('2023-10-06', 50),('2023-10-07', 10);

-- Given us sales table, We need to Find the percentage variance of sales from previous day.

-- ANSWER

select * from salesvar_tbl;
with cte as (
select
     dt,
     sales,
     lag(sales) over(order by dt) as n
from salesvar_tbl)

select 
     dt,
     sales,
     (sales-n)/n *100 as "%"
from cte
where n is null or sales > n;