create table sales(month varchar(50), ytd_sales int, monthnum int);
insert into sales values('jan',15,1),('feb',22,2),('mar',35,3),('apr',45,4),('may',60,5);

-- find the sale difference in MOM

-- answer

select * from sales;

select
    month,
    ytd_sales,
    diff
from (select
     month,
     ytd_sales,
     lag(ytd_sales,1,0) over(order by month(month)) as pre_sale,
     ytd_sales - lag(ytd_sales,1,0) over(order by month(month)) as diff
from sales) as a;
