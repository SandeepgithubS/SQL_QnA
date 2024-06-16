create table cinema_tbl (seat_id int, free int);
insert into cinema_tbl values (1,1),(2,0),(3,1),(4,0),(5,1),(6,1),(7,1),(8,0),(9,1),(10,1);

--  find 2 consucative 1

-- answer

select * from cinema_tbl;

with cte as (
select *,
       lag(free) over(order by seat_id) * free  as prev ,
       lead(free) over(order by seat_id) * free as next
from cinema_tbl)

select seat_id from cte
 where prev = 1 or next = 1;