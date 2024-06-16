create table user (
user_id         int     ,
 join_date       date    ,
 favorite_brand  varchar(50));
 create table orders (
 order_id       int     ,
 order_date     date    ,
 item_id        int     ,
 buyer_id       int     ,
 seller_id      int 
 );
 create table items
 (
 item_id        int     ,
 item_brand     varchar(50)
 );
 insert into user values (1,'2019-01-01','Lenovo'),(2,'2019-02-09','Samsung'),(3,'2019-01-19','LG'),(4,'2019-05-21','HP');

 insert into items values (1,'Samsung'),(2,'Lenovo'),(3,'LG'),(4,'HP');

 insert into orders values (1,'2019-08-01',4,1,2),(2,'2019-08-02',2,1,3),(3,'2019-08-03',3,2,3),(4,'2019-08-04',1,4,2)
 ,(5,'2019-08-04',1,3,4),(6,'2019-08-05',2,2,4);
 
 -- find the second sold product is sellers fevorite product or not
 
 -- ANSWER
 
select * from user;
select * from items;
select * from orders;

with cte as (
select
     o.order_date,
     o.item_id,
     i.item_brand,
     o.seller_id,
     u.favorite_brand as fev
from orders as o join items as i
on o.item_id = i.item_id
join user as u 
on o.seller_id = u.user_id)
-- select * from cte;
select 
     seller_id,
     (case when rn = 2 and item_brand = fev then "Yes"
     else "No" end) as status 
from 
(select *,
        row_number() over(partition by seller_id order by order_date) as rn
from cte) as a;