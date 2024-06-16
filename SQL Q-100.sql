create table prd_tbl (dt date, brand varchar(50), model varchar(50),
production_cost int);

insert into prd_tbl 
values ('2023-12-01', 'A', 'A1', 1000), 
('2023-12-01', 'A', 'A2', 1300),
('2023-12-01', 'B', 'B1', 800), 
('2023-12-02', 'A', 'A1', 1800),
('2023-12-02', 'B', 'B1', 900),
('2023-12-10', 'A', 'A1', 1400),
('2023-12-10', 'A', 'A1', 1200), 
('2023-12-10', 'C', 'C1', 2500);

-- 16 get the sum of production_cost based on dt, brand, model

-- ANSWER 

select * from prd_tbl;
select 
    *,
    sum(production_cost) over(partition by dt, brand) as a
from prd_tbl;
   