CREATE TABLE emp_tbl (id datetime, empid int);
INSERT INTO emp_tbl VALUES ('2024-01-13 09:25:00', 10),('2024-01-13 19:35:00', 10),('2024-01-16 09:10:00', 10),
('2024-01-16 18:10:00', 10),('2024-02-11 09:07:00', 10),('2024-02-11 19:20:00', 10),('2024-02-17 08:40:00', 17),
('2024-02-17 18:04:00', 17),('2024-03-23 09:20:00', 10),('2024-03-23 18:30:00', 10);

-- 9 find the average working hour
select * from emp_tbl;

with cte as (
select 
     id,
     empid,
    case when time(id) = min(time(id)) over(partition by date(id) order by empid) 
    then 1 else 2 end as nid
from emp_tbl),
cte1 as (
select
     date(id),
     empid,
     max(case when nid = 1 then time(id) end) as start,
     max(case when nid = 2 then time(id) end) as end,
     timediff(max(case when nid = 2 then time(id) end),max(case when nid = 1 then time(id) end)) as diff
from cte
group by date(id), empid)

select empid, sum(time(diff)) from cte1 group by empid;