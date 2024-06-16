CREATE TABLE covid(
    city VARCHAR(50),
    days DATE,
    cases INT
);
INSERT INTO covid (city, days, cases) VALUES
('DELHI', '2022-01-01', 100),
('DELHI', '2022-01-02', 200),
('DELHI', '2022-01-03', 300),
('MUMBAI', '2022-01-01', 100),
('MUMBAI', '2022-01-02', 100),
('MUMBAI', '2022-01-03', 300),
('CHENNAI', '2022-01-01', 100),
('CHENNAI', '2022-01-02', 200),
('CHENNAI', '2022-01-03', 150),
('BANGALORE', '2022-01-01', 100),
('BANGALORE', '2022-01-02', 300),
('BANGALORE', '2022-01-03', 200),
('BANGALORE', '2022-01-04', 400);

-- find the cities where covid case increase day by day

-- ANSWER

select * from covid;
with cte as (
select 
    city,
    days,
    cases,
    lag(cases,1,cases) over(partition by city order by days) as c1
from covid),
cte2 as (
        select *, 
              case when cases is null or cases >= c1 then 1 else 0 end as new 
		from cte)
select 
     city 
from cte2 
group by city 
having count(*) = sum(new);