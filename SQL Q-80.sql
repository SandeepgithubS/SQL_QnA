CREATE TABLE emp (
    emp_id int NULL,
    emp_name varchar(50) NULL,
    salary int NULL,
    manager_id int NULL,
    emp_age int NULL,
    dep_id int NULL,
    dep_name varchar(20) NULL,
    gender varchar(10) NULL
);

INSERT INTO emp (emp_id, emp_name, salary, manager_id, emp_age, dep_id, dep_name, gender) VALUES
(1, 'Ankit', 14300, 4, 39, 100, 'Analytics', 'Female'),
(2, 'Mohit', 14000, 5, 48, 200, 'IT', 'Male'),
(3, 'Vikas', 12100, 4, 37, 100, 'Analytics', 'Female'),
(4, 'Rohit', 7260, 2, 16, 100, 'Analytics', 'Female'),
(5, 'Mudit', 15000, 6, 55, 200, 'IT', 'Male'),
(6, 'Agam', 15600, 2, 14, 200, 'IT', 'Male'),
(7, 'Sanjay', 12000, 2, 13, 200, 'IT', 'Male'),
(8, 'Ashish', 7200, 2, 12, 200, 'IT', 'Male'),
(9, 'Mukesh', 7000, 6, 51, 300, 'HR', 'Male'),
(10, 'Rakesh', 8000, 6, 50, 300, 'HR', 'Male'),
(11, 'Akhil', 4000, 1, 31, 500, 'Ops', 'Male');

-- find the 3rd highest salary of each dept, if count is less then 3 the 2nd lowest salary

-- ANSWER

select * from emp;
with cte as (
select 
     emp_name,
     dep_name,
     salary,
     row_number() over(partition by dep_name order by salary desc ) as a,
     count(1) over(partition by dep_name) as b
from emp)

select * from cte where a = 3 or if(b <3, a=b,0);