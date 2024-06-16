create table customer_tbl (id int, email varchar(50));
insert into customer_tbl values (1,'abc@gmail.com'),(2,'xyz@hotmail.com'),
(3,'pqr@outlook.com');

-- Return all charecters after @

-- answer

select * from customer_tbl;
select 
     id,
     substring(email,locate("@",email),length(email))
from customer_tbl;
