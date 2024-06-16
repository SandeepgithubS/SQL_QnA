CREATE TABLE salary (
    emp_id INT,
    emp_name VARCHAR(20),
    department_id INT,
    salary INT,
    manager_id INT,
    emp_age INT
);
INSERT INTO salary (emp_id, emp_name, department_id, salary, manager_id, emp_age) VALUES
(1, 'Ankit', 100, 10000, 4, 39),
(2, 'Mohit', 100, 15000, 5, 48),
(3, 'Vikas', 100, 10000, 4, 37),
(4, 'Rohit', 100, 5000, 2, 16),
(5, 'Mudit', 200, 12000, 6, 55),
(6, 'Agam', 200, 12000, 2, 14),
(7, 'Sanjay', 200, 9000, 2, 13),
(8, 'Ashish', 200, 5000, 2, 12),
(9, 'Mukesh', 300, 6000, 6, 51),
(10, 'Rakesh', 300, 7000, 6, 50);

-- Find the department who have less avg salary than company avg salary.

-- ANSWER

select * from salary;
with cte as(
select 
     emp_id,
     emp_name,
     department_id,
     salary,
     avg(salary) over(partition by department_id order by department_id) as dept,
     avg(salary) over() as company_avg
from salary)

select department_id from cte where dept < company_avg;