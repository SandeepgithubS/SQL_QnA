create table business (
business_date date,
city_id int
);
insert into business
values(cast('2020-01-02' as date),3),(cast('2020-07-01' as date),7),(cast('2021-01-01' as date),3),(cast('2021-02-03' as date),19)
,(cast('2022-12-01' as date),3),(cast('2022-12-15' as date),3),(cast('2022-02-28' as date),12);

-- how many new cities are added year wise

-- ANSWER

select * from business;

with cte as (
 select *,
	row_number() over(partition by city_id) as a 
from business)

select 
    year(business_date) as yr, 
    count(1) as cnt
from cte where a=1
group by 1;