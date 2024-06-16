
create table tablea (empid int, empname varchar(50), salary int);
create table tableb (empid int, empname varchar(50), salary int);

insert into tablea values(1,'AA',1000),(2,'BB',300);
insert into tableb values(2,'BB',400),(3,'CC',100);

-- find the min mark from the 2 tables

-- answer

with cte as (
select * from tablea
union 
select * from tableb)

select
      empid,
      empname,
      min(salary)
from cte 
group by empid, empname;
