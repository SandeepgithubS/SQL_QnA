create table tbl_maxval (col1 varchar(50), col2 int, col3 int);
insert into tbl_maxval values ('a',10,20),('b',50,30);

-- we need to find the largest value among all the columns.

-- answer

select * from tbl_maxval;

select 
      col1,
      greatest(col2,col3)
from tbl_maxval;
