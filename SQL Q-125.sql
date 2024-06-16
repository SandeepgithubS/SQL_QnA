CREATE TABLE emp1 (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10, 2),
    manager_id INT
);

INSERT INTO emp1 (employee_id, employee_name, department, salary, manager_id)
VALUES
    (1, 'John Doe', 'HR', 50000.00, NULL),
    (2, 'Jane Smith', 'HR', 55000.00, 1),
    (3, 'Michael Johnson', 'HR', 60000.00, 1),
    (4, 'Emily Davis', 'IT', 60000.00, NULL),
    (5, 'David Brown', 'IT', 65000.00, 4),
    (6, 'Sarah Wilson', 'Finance', 70000.00, NULL),
    (7, 'Robert Taylor', 'Finance', 75000.00, 6),
    (8, 'Jennifer Martinez', 'Finance', 80000.00, 6);
    
/*
You have a employees table with columns emp_id, emp_name,
department, salary, manager_id (manager is also emp in the table))
Identify employees who have a higher salary than their manager. 
*/

-- ANSWER

select * from emp1;

select 
     a.employee_name,
     a.salary,
     b.employee_name,
     b.salary
from emp1 as a join emp1 as b
on a.manager_id = b.employee_id
where a.salary > b.salary;