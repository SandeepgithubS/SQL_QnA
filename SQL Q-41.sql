create table employees (id int);
insert into employees values (2),(5),(6),(6),(7),(8),(8);

--  find the highest id if id is duplicate then exclude that id;

-- answer

select * from employees;

with cte as (
select 
    id
from employees
group by id
having count(*) =1)

select 
     Max(id) 
from cte;