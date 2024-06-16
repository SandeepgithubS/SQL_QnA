create table drivers(id varchar(10), start_time time, end_time time, start_loc varchar(10), end_loc varchar(10));
insert into drivers values('dri_1', '09:00', '09:30', 'a','b'),('dri_1', '09:30', '10:30', 'b','c'),('dri_1','11:00','11:30', 'd','e');
insert into drivers values('dri_1', '12:00', '12:30', 'f','g'),('dri_1', '13:30', '14:30', 'c','h');
insert into drivers values('dri_2', '12:15', '12:30', 'f','g'),('dri_2', '13:30', '14:30', 'c','h');

-- find the driver_id their no of rides and profit ( profit is 1 if the end location is the next trip start location

-- ANSWER 

select * from drivers;
with cte as (
select 
      id,
      count(*) as Total_ride
from drivers
group by id),

cte2 as (
select 
     id,
     count(*) as cnt
from (
select *,
       lag(end_loc) over(partition by id order by id) as new_start
from drivers) as a
where start_loc = new_start
group by id)

select 
    a.id,
    a.total_ride,
    ifnull(b.cnt,0) as profit
from cte as a left join cte2 as b
on a.id = b.id;