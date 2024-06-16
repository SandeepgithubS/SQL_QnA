create table tasks (
date_value date,
state varchar(10)
);
insert into tasks  values ('2019-01-01','success'),('2019-01-02','success'),('2019-01-03','success'),('2019-01-04','fail')
,('2019-01-05','fail'),('2019-01-06','success');

-- find status start date and end date, if status have a single date then that date is the start and end date

-- ANSWER

select * from tasks;

with cte as (
select *,
	 day(date_value) as a,
     row_number() over(partition by state order by date_value) as b,
     day(date_value) - row_number() over(partition by state order by date_value) as c
from tasks)
-- select * from cte;
select 
     max( date_value ) as start_da,
     min(date_value) as end_dt,
     state
from cte
group by state, c;