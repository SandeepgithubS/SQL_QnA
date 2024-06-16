create table empdept_tbl (eid int, dept varchar(50),scores float);
insert into empdept_tbl values (1, 'd1', 1.0),(2, 'd1', 5.28),(3, 'd1', 4.0),(4,'d2', 8.0),(5, 'd1', 2.5),(6, 'd2', 7.0),(7, 'd3', 9.0),(8, 'd4', 10.2);

-- we need to update scores column values with department wise maximum score.

-- ANSWER

select * from  empdept_tbl;
select 
    eid,
    dept,
    n
from ( select *,
      max(scores) over(partition by dept) as n
from empdept_tbl)a;