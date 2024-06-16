CREATE TABLE Salaries (
emp_name VARCHAR(50),
department VARCHAR(50),
salary INT,
PRIMARY KEY (emp_name, department)
);
INSERT INTO Salaries (emp_name, 
					  department, salary) VALUES
('Kathy', 'Engineering', 50000),
('Roy', 'Marketing', 30000),
('Charles', 'Engineering', 45000),
('Jack', 'Engineering', 85000),
('Benjamin', 'Marketing', 34000),
('Anthony', 'Marketing', 42000),
('Edward', 'Engineering', 102000),
('Terry', 'Engineering', 44000),
('Evelyn', 'Marketing', 53000),
('Arthur', 'Engineering', 32000);

/* Write an SQL query to calculate the difference between the highest salaries in 
   the marketing and engineering department. Output the absolute difference in salaries.*/

-- ANSWER

select * from Salaries;

select max(case when department = "marketing" then salary end)  
/ max(case when department = "engineering" then salary end) *100 as en 
from salaries;