CREATE TABLE job_positions (
    id INT,
    title VARCHAR(100),
    groupss VARCHAR(10),
    levels VARCHAR(10),     
    payscale INT, 
    totalpost INT
);
CREATE TABLE job_employees (
    id INT, 
    name VARCHAR(100),     
    position_id INT 
);

INSERT INTO job_positions (id, title, groupss, levels, payscale, totalpost) VALUES
(1, 'General manager', 'A', 'l-15', 10000, 1), 
(2, 'Manager', 'B', 'l-14', 9000, 5), 
(3, 'Asst. Manager', 'C', 'l-13', 8000, 10);

INSERT INTO job_employees (id, name, position_id) VALUES
(1, 'John Smith', 1), 
(2, 'Jane Doe', 2),
(3, 'Michael Brown', 2),
(4, 'Emily Johnson', 2), 
(5, 'William Lee', 3), 
(6, 'Jessica Clark', 3), 
(7, 'Christopher Harris', 3),
(8, 'Olivia Wilson', 3),
(9, 'Daniel Martinez', 3),
(10, 'Sophia Miller', 3);

-- FIND THE ID AND WORING ENPLOYEES NAME WITH OPENING POSITION MENSION THE OPENING POSITION AS VECATE
select * from job_positions;
 select * from job_employees;
 
 with cte as (
select id from job_employees),
cte2 as (
select a.id,
       a.title,
       a.groupss,
       a.levels,
       a.payscale,
       row_number() over(order by a.id) as rn
from job_positions as a  join cte on a.totalpost >= cte.id
order by a.id)

select 
    a.title,
    a.groupss,
    a.levels,
    a.payscale,
   ifnull( b. name,"Vecate") as name
from cte2 as a left join job_employees as b
on a.id = b.position_id
and a.rn = b.id;
