CREATE TABLE employee (
    emp_id int,
    company varchar(10),
    salary int
);
INSERT INTO employee (emp_id, company, salary) VALUES
(1, 'A', 2341),
(2, 'A', 341),
(3, 'A', 15),
(4, 'A', 15314),
(5, 'A', 451),
(6, 'A', 513),
(7, 'B', 15),
(8, 'B', 13),
(9, 'B', 1154),
(10, 'B', 1345),
(11, 'B', 1221),
(12, 'B', 234),
(13, 'C', 2345),
(14, 'C', 2645),
(15, 'C', 2645),
(16, 'C', 2652),
(17, 'C', 65);

-- find the median salary of each company  (IMP)

-- ANSWER

select * from employee;
with cte as (
select *,
	 row_number() over(partition by company order by emp_id) as rn
from employee),
 cte1 as (
select *,
      count(rn) over(partition by company)/2 as a,
      count(1) over(partition by company)/2 +1 as b
from cte)
select * from cte1;
select 
     company,
     avg(salary)
from cte1
where rn between a and b
group by company;