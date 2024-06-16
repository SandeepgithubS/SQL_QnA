CREATE TABLE employees1 (
    emp_id INT,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);
INSERT INTO employees1(emp_id, name, department, salary) VALUES
(1, 'John Doe', 'Finance', 60000.00),
(2, 'Jane Smith', 'Finance', 65000.00), 
(2, 'Jane Smith', 'Finance', 65000.00),   -- Duplicate
(9, 'Lisa Anderson', 'Sales', 63000.00),
(9, 'Lisa Anderson', 'Sales', 63000.00),  -- Duplicate
(9, 'Lisa Anderson', 'Sales', 63000.00),  -- Duplicate
(10, 'Kevin Martinez', 'Sales', 61000.00);

/* Delete the duplicate record */

-- ANSWER

select * from employees1;
alter table employees1 add column id int auto_increment primary key after emp_id;

delete a1 from employees1 as a1 join employees1 as a2
on a1.id > a2.id and a1.emp_id = a2.emp_id;