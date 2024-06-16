CREATE TABLE students (
    studentid int NULL,
    studentname nvarchar(255) NULL,
    subject nvarchar(255) NULL,
    marks int NULL,
    testid int NULL,
    testdate date NULL
);
INSERT INTO students (studentid, studentname, subject, marks, testid, testdate) VALUES
(2, 'Max Ruin', 'Subject1', 63, 1, '2022-01-02'),
(3, 'Arnold', 'Subject1', 95, 1, '2022-01-02'),
(4, 'Krish Star', 'Subject1', 61, 1, '2022-01-02'),
(5, 'John Mike', 'Subject1', 91, 1, '2022-01-02'),
(4, 'Krish Star', 'Subject2', 71, 1, '2022-01-02'),
(3, 'Arnold', 'Subject2', 32, 1, '2022-01-02'),
(5, 'John Mike', 'Subject2', 61, 2, '2022-11-02'),
(1, 'John Deo', 'Subject2', 60, 1, '2022-01-02'),
(2, 'Max Ruin', 'Subject2', 84, 1, '2022-01-02'),
(2, 'Max Ruin', 'Subject3', 29, 3, '2022-01-03'),
(5, 'John Mike', 'Subject3', 98, 2, '2022-11-02');

-- 22 (a) write an sql query to find the list of students who scored mor than the average marks of each subject
select * from students;
with cte as (
select 
    studentname,
    subject,
    marks,
    avg(marks) over(partition by subject order by subject) as n
from students)
select 
     studentname
from cte 
where marks > n;

-- 22 (b) find the % of students who scored more than 90% in any subject among all students
select * from students;

select
     round(sum( case when marks >= 90 then 1 else 0 end) / count( subject) *100,2) as "%"
from students;

-- 22 (c) Find the 2nd highet and 2nd lowest mark of each subject
select * from students;
with cte as (
select 
     subject,
     marks,
     row_number() over(partition by subject order by marks) as p1,
     row_number() over(partition by subject order by marks desc) as p2
from students)

select 
     subject,
     max(case when p1=2 then marks end) as "2nd Lowest",
     max(case when p2=2 then marks end) as "2nd Highest"
from cte
group by subject;

-- 22 (d) find for each student their marks increased or decreased
select * from students;
with cte as (
select 
    studentname,
    subject,
    marks,
    lag(marks,1,marks) over(partition by studentname order by subject) as n
from students)

select *,
       case when marks > n then "Increased"
			when marks < n then "Decreasecd"
	   else "same"
       end as remark
from cte;