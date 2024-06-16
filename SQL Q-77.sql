create table event_status
(
event_time varchar(10),
status varchar(10)
);
insert into event_status 
values
('10:01','on'),('10:02','on'),('10:03','on'),('10:04','off'),('10:07','on'),('10:08','on'),('10:09','off')
,('10:11','on'),('10:12','off');

-- find the difference between event_time (IMP)

-- ANSWER

select * from event_status;
with cte as (
select 
    *,
    lag(status,1,status) over(order by event_time) as prevs
from event_status),
cte2 as (
select event_time,
       count(case when status = "on" and prevs = "off" then 1 end)
       over(order by event_time) as a
from cte )
select 
     max(event_time) as lohg_out, 
     min(event_time) as log_in,
     timediff(max(event_time) , min(event_time))  as diff
from cte2
group by a;