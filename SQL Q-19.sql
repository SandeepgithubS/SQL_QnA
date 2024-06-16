CREATE TABLE employee_service (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    start_date DATE,
    end_date DATE,
    department VARCHAR(50)
);
INSERT INTO employee_service (employee_id, name, start_date, end_date, department) VALUES
(101, 'John', '2015-01-15', '2020-06-30', 'Technology'),
(102, 'Emma', '2016-08-01', NULL, 'Management'),
(103, 'Ava', '2017-05-30', '2019-08-01', 'Strategy'),
(104, 'Oliver', '2018-11-11', NULL, 'Technology'),
(105, 'Sophia', '2020-01-17', NULL, 'Management'),
(106, 'William', '2019-03-20', NULL, 'Strategy'),
(107, 'James', '2018-09-10', NULL, 'Technology'),
(108, 'Charlotte', '2017-12-05', NULL, 'Management'),
(109, 'Michael', '2016-06-15', '2021-02-28', 'Technology'),
(110, 'Amelia', '2019-11-25', NULL, 'Strategy'),
(111, 'Ethan', '2018-04-08', '2022-01-10', 'Management'),
(112, 'Mia', '2020-07-15', NULL, 'Technology'),
(113, 'Alexander', '2017-10-30', '2020-09-15', 'Strategy'),
(114, 'Isabella', '2016-05-22', '2021-08-20', 'Management'),
(115, 'Liam', '2019-02-12', '2023-04-05', 'Technology'),
(116, 'Ella', '2018-08-05', '2022-11-28', 'Strategy'),
(117, 'Noah', '2020-09-18', NULL, 'Management'),
(118, 'Avery', '2017-11-10', NULL, 'Technology'),
(119, 'Benjamin', '2016-04-04', NULL, 'Strategy'),
(120, 'Abigail', '2019-08-30', NULL, 'Management');

/* SQL Question 4: Average Duration of Employee's Service Given the data on IBM employees, can you find the average duration 
of service for employees across different departments?  The Duration of service is represented as end_date - start_date. 
If end_date is NULL, consider it as the current date*/

-- ANSWER

select * from employee_service;
with cte as (
select  
      name,
      department,
      start_date,
      case when end_date is null then current_date() else end_date end as end_date
from employee_service )

select 
     department, 
     round(avg(datediff(end_date,start_date)),2) as duration 
from cte 
group by department;