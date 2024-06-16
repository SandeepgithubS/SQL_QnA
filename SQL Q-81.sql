create table stadium (
id int,
visit_date date,
no_of_people int
);
insert into stadium
values (1,'2017-07-01',10)
,(2,'2017-07-02',109)
,(3,'2017-07-03',150)
,(4,'2017-07-04',99)
,(5,'2017-07-05',145)
,(6,'2017-07-06',1455)
,(7,'2017-07-07',199)
,(8,'2017-07-08',188);

-- find 3 or more consucative day wree no_of_people > 100

-- ANSWER

select * from stadium;

with cte as (
select *,
       row_number() over(order by id) as n,
       id - row_number() over(order by id) as a
from stadium
where no_of_people > 100)

select 
      id,
      visit_date,
      no_of_people 
from cte 
where a in 
(select a from cte group by a having count(a)>=3);