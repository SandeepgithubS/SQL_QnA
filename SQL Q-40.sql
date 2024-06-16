create table students(sname varchar(50), sid varchar(50), marks int);
insert into students values('A','X',75),('A','Y',75),('A','Z',80),('B','X',90),('B','Y',91),('B','Z',75);

 -- find the sum of top 2 students mark if 2 mark is same then take a single mark;
 
 -- answer
 
select * from students;
with cte as (
select 
     sname, 
     marks, 
     row_number() over(partition by sname order by marks desc) as rk 
from students)
select 
     sname, 
     sum(marks) 
from cte
where rk <=2 
group by sname;