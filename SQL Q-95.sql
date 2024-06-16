CREATE TABLE candidate (
    id INT PRIMARY KEY,
    positions VARCHAR(10) NOT NULL,
    salary INT NOT NULL
);

-- Insert records into candidates
INSERT INTO candidate (id, positions, salary) VALUES
(1, 'junior', 5000),
(2, 'junior', 7000),
(3, 'junior', 7000),
(4, 'senior', 10000),
(5, 'senior', 30000),
(6, 'senior', 20000);

-- in a company they have a budget of 50000, how many senior and junior they can hire

-- ANSWER

select * from candidate;
with cte as (
select *,
       sum(salary) over(partition by positions order by salary) as rolling 
from candidate),

cte2 as (
select 
     id,
     positions,
     salary
from cte where positions = "Senior" and rolling < 50000),
cte3 as (
select * from cte2
union all
(select 
     id, 
     positions,
     salary
from cte
where positions = "junior"
 and rolling < (select sum(salary) from cte2)))
 
 select positions , count(*) as cnt from cte3 group by 1;