create table section_data
(
section varchar(5),
number integer
);
insert into section_data
values ('A',5),('A',7),('A',10) ,('B',7),('B',9),('B',10) ,('C',9),('C',7),('C',9) ,('D',10),('D',3),('D',8);

/* 
Problem statement : we have a table which stores data of multiple sections. every section has 3 numbers
we have to find top 4 numbers from any 2 sections(2 numbers each) whose addition should be maximum
so in this case we will choose section b where we have 19(10+9) then we need to choose either C or D
because both has sum of 18 but in D we have 10 which is big from 9 so we will give priority to D */

-- ANSWER

select * from section_data;
with cte as (
select * 
from section_data
 where section in (
select 
     section 
from section_data 
group by 1 
having count(distinct number) >2))

select section, sum(number) as t from(
select *,
       rank() over(partition by section order by number desc) as a
from cte)as q
where a <=2
group by 1
order by sum(number) desc
limit 2;