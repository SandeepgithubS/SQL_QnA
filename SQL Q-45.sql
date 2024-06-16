create table studnts_tbl (sname varchar(50), marks int);
insert into studnts_tbl values ('A', 75),('B', 30),('C', 55),('A', 60),('D', 91),
('B', 19),('G', 36),('S', 65),('K', 49),("L" , 81);
insert into studnts_tbl values ("M",99);

--  rank student ( > 80 Excellent, 60-80 very good, 35-60 good, <35 poor)

-- answer

select * from studnts_tbl;

select 
     sname,
     marks,
     case when marks >= 80 then "Excellent"
          when marks between 60 and 79 then "Very Good"
          when marks between 35 and 59 then "Good"
          when marks < 35 then "Poor"
	 end as gread
from studnts_tbl;