create table st
(
student_id int,
student_name varchar(20)
);
insert into st values
(1,'Daniel'),(2,'Jade'),(3,'Stella'),(4,'Jonathan'),(5,'Will');

create table xam
(
exam_id int,
student_id int,
score int);

insert into xam values
(10,1,70),(10,2,80),(10,3,90),(20,1,80),(30,1,70),(30,3,80),(30,4,90),(40,1,60)
,(40,2,70),(40,4,80);

-- student who have never score highest or lowest score

-- ANSWER

select * from xam;
select * from st;
with cte as (
select *,
       max(score) over(partition by exam_id) as maxs,
       min(score) over(partition by exam_id) as mins
from xam),
cte2 as (
select
      student_id,
      max(case when score = maxs or score = mins then 1 else 0 end) as a 
from cte 
group by 1)

select 
      a.student_id, 
      s.student_name
from cte2 as a join st as s
on a.student_id = s.student_id
 where a=0;