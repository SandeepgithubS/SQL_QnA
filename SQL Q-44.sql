create table happiness_tbl (ranking int, country varchar(50));
insert into happiness_tbl values (1,'Finland'),(2,'Denmark'),(3,'Iceland'),
(4,'Israel'),(5,'Netherlands'),(6,'Sweden'),(7,'Norway'),(8,'Switzerland'),
(9,'Luxembourg'),(128,'Srilanka'),(126,'India');

-- bring india and srilanks to the top

-- answer

select * from happiness_tbl;

(select 
     ranking, 
     country 
from happiness_tbl
where country in ("india" , "Srilanka")
order by ranking asc)
union all
(select *
from happiness_tbl
where country not in ("india","Srilanka"));
