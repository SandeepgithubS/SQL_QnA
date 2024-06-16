CREATE TABLE travel_data (
    customer VARCHAR(10),
    start_loc VARCHAR(50),
    end_loc VARCHAR(50)
);

INSERT INTO travel_data (customer, start_loc, end_loc) VALUES
    ('c1', 'New York', 'Lima'),
    ('c1', 'London', 'New York'),
    ('c1', 'Lima', 'Sao Paulo'),
    ('c1', 'Sao Paulo', 'New Delhi'),
    ('c2', 'Mumbai', 'Hyderabad'),
    ('c2', 'Surat', 'Pune'),
    ('c2', 'Hyderabad', 'Surat'),
    ('c3', 'Kochi', 'Kurnool'),
    ('c3', 'Lucknow', 'Agra'),
    ('c3', 'Agra', 'Jaipur'),
    ('c3', 'Jaipur', 'Kochi');
    
-- find each customers start location and end location

-- ANSWER

select * from travel_data;

with cte as (
select customer, start_loc,"Start" from travel_data
union all
select customer, end_loc,"End" from travel_data),

cte2 as (
select 
     customer,
     start_loc,
     start,
     count(start_loc) over(partition by start_loc)as cnt
from cte order by customer , start_loc)

select 
      customer,
      max(case when start = "start" then start_loc end)as start,
      max(case when start = "end" then start_loc end)as end
from cte2 where cnt  = 1
group by 1;