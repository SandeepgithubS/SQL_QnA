create table bms (seat_no int ,is_empty varchar(10));
insert into bms values
(1,'N')
,(2,'Y')
,(3,'N')
,(4,'Y')
,(5,'Y')
,(6,'Y')
,(7,'N')
,(8,'Y')
,(9,'Y')
,(10,'Y')
,(11,'Y')
,(12,'N')
,(13,'Y')
,(14,'Y');

-- find 3 or more consucative Y

-- ANSWER

select * from bms;

with cte as (
select *,
       (case when is_empty ="Y" then 1 else 0 end)as rk
from bms),

cte2 as (
select seat_no, rk,
       lag(rk) over(order by seat_no) * rk as p1,
       lag(rk,2) over(order by seat_no) * rk as p2,
       lead(rk) over(order by seat_no) * rk as n1,
       lead(rk,2) over(order by seat_no) * rk as n2
from cte)
select 
     seat_no 
from cte2
where rk=1 and n1=1 and n2 =1
or    rk=1 and p1=1 and n1 =1
or    rk=1 and p1=1 and p2=1
order by seat_no;

-- or
select * from bms;
with cte as(
select *,
      row_number() over(order by seat_no) as rk,
      seat_No -  row_number() over(order by seat_no) as r
from bms 
where is_empty = "Y"),

cte2 as (select r from cte group by r having count(r)>=3)

select * from cte where r in (select r from cte2);