create table brands 
(
category varchar(20),
brand_name varchar(20)
);
insert into brands values
('chocolates','5-star')
,(null,'dairy milk')
,(null,'perk')
,(null,'eclair')
,('Biscuits','britannia')
,(null,'good day')
,(null,'boost');

-- fill down

-- ANSWER

select * from brands;

with cte as (
select *,
       row_number() over() as a 
from brands),
cte2 as (
select *,
     count(category) over(order by a)  as b
from cte)

select first_value(category) over(partition  by b) as cat, brand_name from cte2;