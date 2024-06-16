create table ors
(
order_id int,
customer_id int,
product_id int
);
insert into ors VALUES 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(2, 2, 1),
(2, 2, 2),
(2, 2, 4),
(3, 1, 5);
create table products (
id int,
name varchar(10));
insert into products VALUES 
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E');

-- recomendation product- based on product pairs purchases together

-- ANSWER

select * from ors;
select * from products;

with cte as (
             select 
                 o.order_id,
                 o.customer_id, 
                 o.product_id, 
                 p.name 
			 from ors as o join products as p
             on o.product_id = p.id),
             
cte2 as (
		 select 
              a.name as n1 , 
			b.name as n2 
		from cte as a  cross join cte as b 
        on a.order_id = b.order_id 
 where  a.product_id < b.product_id)
 
 select 
      concat(n1,n2) as name ,
	count(*) as cnt 
from cte2 
group by concat(n1,n2);