create table UserActivity
(
username      varchar(20) ,
activity      varchar(20),
startDate     Date   ,
endDate      Date
);

insert into UserActivity values 
('Alice','Travel','2020-02-12','2020-02-20')
,('Alice','Dancing','2020-02-21','2020-02-23')
,('Alice','Travel','2020-02-24','2020-02-28')
,('Bob','Travel','2020-02-11','2020-02-18');

 -- second highest activity if single name is there then consider that also
 
 -- ANSWER
 
select * from UserActivity;

with cte as (
select 
     username,
     activity,
     startdate,
     enddate,
     count(*) over(partition by username) as a,
     row_number() over(partition by username order by startdate) as b
from UserActivity)

select * from cte where a=1 or b=2;