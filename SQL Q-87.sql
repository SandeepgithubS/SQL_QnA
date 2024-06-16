create table candidates (
emp_id int,
experience varchar(20),
salary int
);
delete from candidates;
insert into candidates values
(1,'Junior',10000),(2,'Junior',15000),(3,'Junior',40000),(4,'Senior',16000),(5,'Senior',20000),(6,'Senior',50000);

/* company has a budget of 70000, they have to hire senior first then in the remaining 
   budget they will hire junior, so find how many junior and senior they can hire */
   
   -- ANSWER
   
 select * from candidates;
 with cte as (
 select *,
        sum(salary) over(partition by experience order by emp_id) as a
from candidates),
cte2 as (
select 
	    emp_id,
       salary 
from cte 
where experience= "Senior" and a < 70000),
cte3 as (
select 
     emp_id,
     salary
from cte
where experience = "Junior" and a < (select sum(salary) from cte2))

select * from cte3
union all
select * from cte2