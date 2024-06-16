create table players_location
(
name varchar(20),
city varchar(20)
);
delete from players_location;
insert into players_location
values ('Sachin','Mumbai'),('Virat','Delhi') , ('Rahul','Bangalore'),('Rohit','Mumbai'),('Mayank','Bangalore');

-- split the players according to their city (IMP)

-- ANSWER

select * from players_location;

select a,
     max(case when city = "Delhi" then name end) as Delhi,
     max(case when city = "Mumbai" then name end) as Mumbai,
     max(case when city = "Bangalore" then name end) as Bangalore
from 
(select *,
      row_number() over(partition by city order by city) as a
from players_location) as b
group by a;