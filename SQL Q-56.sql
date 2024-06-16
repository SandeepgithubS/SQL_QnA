create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR');

-- find the name, most visited floor, total visit

-- ANSWER

select * from entries;

with cte as (
select 
      name, 
      count(*) as cnt_visit,
      group_concat(distinct resources) as comb
from entries
group by name),

cte2 as (
select
     name,
     floor
from entries
group by name, floor
having count(1) =2)

select 
    a.name,
    a.cnt_visit,
    b.floor,
    a.comb
from cte as a join cte2 as b
on a.name = b.name;