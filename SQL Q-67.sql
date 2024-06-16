CREATE table activity
(
user_id varchar(20),
event_name varchar(20),
event_date date,
country varchar(20)
);
delete from activity;
insert into activity values (1,'app-installed','2022-01-01','India')
,(1,'app-purchase','2022-01-02','India')
,(2,'app-installed','2022-01-01','USA')
,(3,'app-installed','2022-01-01','USA')
,(3,'app-purchase','2022-01-03','USA')
,(4,'app-installed','2022-01-03','India')
,(4,'app-purchase','2022-01-03','India')
,(5,'app-installed','2022-01-03','SL')
,(5,'app-purchase','2022-01-03','SL')
,(6,'app-installed','2022-01-04','Pakistan')
,(6,'app-purchase','2022-01-04','Pakistan');

-- ANSWER

-- 14-1 total activity per day
select * from activity;
select 
     event_date, 
     count(1) as cnt
from activity 
group by event_date;

-- 14-2 total weekly activity
select
     week(event_date) as weeks
     , count(*) as cnt
from activity
group by week(event_date) ;

-- 14-3 same day install and purchase 
select * from activity;
with cte as (
select 
     user_id, country,
     max(case when event_name = "app-installed" then event_date end) as installed,
     max(case when event_name = "app-purchase" then event_date end) as purchase
from activity 
group by user_id, country)
select * from cte where installed = purchase;

-- 14-4 % of paid user in each country
select * from activity ;

with cte as (
              select *, 
                    case when country in ("india","USA") then country else "others" end as code 
			  from activity)

select 
     code, 
     count(*) as cnt, 
     sum(case when event_name = "app-purchase" then 1 else 0 end)as p ,
     sum(case when event_name = "app-purchase" then 1 else 0 end) / count(*) *100 as "%"
from cte 
group by code;

-- 14-5 find who install and purchase in rhe very next date
select * from activity;
with cte as (
select 
     user_id,
     event_date,
     lag(event_date) over(partition by user_id) as nextd
from activity)
-- select * from cte;
select 
     event_date,
     count(case when day(event_date)= 1+ day(nextd) then 1 end) as q
from cte
group by event_date;
