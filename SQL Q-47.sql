create table brands (category varchar(50), brand_name varchar(50));
insert into brands values ('chocolates', '5-star'),(NULL, 'dairy milk'),(NULL, 'perk'),(NULL, 'eclair'),('Biscuits', 'Britania'),(NULL, 'good day'),(NULL, 'boost');

-- fill down

-- answer

 select * from brands;
 
Select  
     first_value(category) over(partition by n) as category, 
     brand_name
from 
(Select *, ntile(2) over() as n from brands)as a  ;