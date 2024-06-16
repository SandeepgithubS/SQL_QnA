create table exams (student_id int, subject varchar(20), marks int);

insert into exams values (1,'Chemistry',91),(1,'Physics',91)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80)
,(4,'Chemistry',71),(4,'Physics',54);

-- students having same mark in physics and chemistry

-- ANSWER

select * from exams;

select student_id
from(
select student_id, max(case when subject = "Chemistry" then marks end ) as che,
				   max(case when subject = "Physics" then marks end ) as phy
from exams 
group by student_id) as a
where che = phy;