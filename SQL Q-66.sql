CREATE TABLE billings (
    emp_name VARCHAR(10),
    bill_date DATE,
    bill_rate INT
);

CREATE TABLE HoursWorked (
    emp_name VARCHAR(20),
    work_date DATE,
    bill_hrs INT
);

-- Delete existing records from billings table
DELETE FROM billings;

-- Insert Values into billings
INSERT INTO billings (emp_name, bill_date, bill_rate) VALUES
('Sachin', CAST('1990-01-01' AS DATE), 25),
('Sehwag', CAST('1989-01-01' AS DATE), 15),
('Dhoni', CAST('1989-01-01' AS DATE), 20),
('Sachin', CAST('1991-02-05' AS DATE), 30);

-- Insert Values into HoursWorked
INSERT INTO HoursWorked (emp_name, work_date, bill_hrs) VALUES
('Sachin', CAST('1990-07-01' AS DATE), 3),
('Sachin', CAST('1990-08-01' AS DATE), 5),
('Sehwag', CAST('1990-07-01' AS DATE), 2),
('Sachin', CAST('1991-07-01' AS DATE), 4);

-- FIND HOW MUCH DOES EMPLOYEES CHARGE PER HOUR

-- ANSWER

select * from billings;
select * from HoursWorked;

with cte as (
select *,
 date_add(lead(bill_date,1, "2000-12-31") over(partition by emp_name),interval -1 day) as a 
from billings),

cte2 as (
select 
     h.emp_name,
     h.work_date,
     h.bill_hrs,
     c. bill_rate
from HoursWorked as h join cte as c 
on h.emp_name = c.emp_name
where h.work_date between c.bill_date and c.a)

select emp_name, 
       sum(bill_hrs * bill_rate) as fee
from cte2
group by emp_name;


