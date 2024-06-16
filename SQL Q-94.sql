REATE TABLE employee_checkin_details (
    employeeid INT,
    entry_details VARCHAR(10),
    timestamp_details TIMESTAMP
);

-- Insert records into employee_checkin_details
INSERT INTO employee_checkin_details (employeeid, entry_details, timestamp_details) VALUES
(1000, 'login', '2023-06-16 01:00:15.34'),
(1000, 'login', '2023-06-16 02:00:15.34'),
(1000, 'login', '2023-06-16 03:00:15.34'),
(1000, 'logout', '2023-06-16 12:00:15.34'),
(1001, 'login', '2023-06-16 01:00:15.34'),
(1001, 'login', '2023-06-16 02:00:15.34'),
(1001, 'login', '2023-06-16 03:00:15.34'),
(1001, 'logout', '2023-06-16 12:00:15.34');

-- Create employee_details table
CREATE TABLE employee_details (
    employeeid INT,
    phone_number VARCHAR(20),
    isdefault BOOLEAN
);

-- Insert records into employee_details
INSERT INTO employee_details (employeeid, phone_number, isdefault) VALUES
(1001, '9999', false),
(1001, '1111', false),
(1001, '2222', true),
(1003, '3333', false);

-- find the each emoloyees total entries, total login, total logot, latest login and default mobile number(If isdefault =1)

-- ANSWER 

select * from employee_details;
select * from employee_checkin_details;

with cte as (
select 
    employeeid,
    count(*) as cnt,
    count(case when entry_details = "Login" then 1 end) as login_cnt,
    count(case when entry_details = "Logout" then 1 end) as logout_cnt,
    max(case when entry_details = "Login" then timestamp_details end ) as intime
from employee_checkin_details
group by 1),
cte2 as ( 
         select * from employee_details where isdefault=1)
     
select 
     a.employeeid,
     a.cnt,
     a.login_cnt,
     a.logout_cnt,
     a.intime,
     ifnull(b.phone_number,"No Number") as mob
from cte as a left join cte2 as b
on a.employeeid = b. employeeid;