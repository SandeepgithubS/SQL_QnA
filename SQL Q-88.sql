CREATE TABLE emp1 (
    emp_id INT,
    emp_name VARCHAR(20),
    department_id INT,
    salary INT,
    manager_id INT,
    emp_age INT
);
INSERT INTO emp1 (emp_id, emp_name, department_id, salary, manager_id, emp_age) VALUES
(1, 'Ankit', 100, 10000, 4, 39),
(2, 'Mohit', 100, 15000, 5, 48),
(3, 'Vikas', 100, 12000, 4, 37),
(4, 'Rohit', 100, 14000, 2, 16),
(5, 'Mudit', 200, 20000, 6, 55),
(6, 'Agam', 200, 12000, 2, 14),
(7, 'Sanjay', 200, 9000, 2, 13),
(8, 'Ashish', 200, 5000, 2, 12),
(9, 'Mukesh', 300, 6000, 6, 51),
(10, 'Rakesh', 500, 7000, 6, 50);

-- Find the managers name, and the managers manager name

-- ANSWER

select  emp_id, emp_name, manager_id from emp1;

select 
     a.emp_id,
     a.emp_name,
     a.manager_id as manager_id,
     b.emp_name as manager_name,
     b.manager_id as sn_manager_id,
     c.emp_name as sn_manager_name
from emp1 as a
left join emp1 as b on a.manager_id = b.emp_id
left join emp1 as c on b.manager_id = c.emp_id;