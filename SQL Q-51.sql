create table tbl_cnt (col1 int, col2 varchar(50));
insert into tbl_cnt values (1, 'a,b,c'),(2, 'a,b');

-- we need to find the length of each record in the table.

-- ANSWER

select * from tbl_cnt;

select 
   col1, 
   length(replace(col2,",","")) as len
from tbl_cnt;
