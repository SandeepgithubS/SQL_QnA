create table dept (deptid int, deptname varchar(50));
insert into dept values (206,'HR'),(207,'IT'),(208,'Finance');
create table emp(empid int, empname varchar(50), salary int, deptid int);
insert into emp values (1,'Nikitha',45000,206),(2,'Ashish',42000,207),(3,'David',40000,206),(4,'Ram',50000,207),(5,'John',35000,208),(6,'Mark',50000,207),(7,'Aravind',39000,208);

-- Max salary department wise

-- ANSWER

select * from dept;
select * from emp;

select 
     empname,
     deptname,
     salary
from (
select 
   e.empname,
   e.salary,
   d. deptname,
   row_number() over(partition by d.deptname order by e.salary desc) as n
from emp as e join dept as d
on e.deptid = d. deptid) as a
where n=1;