CREATE TABLE city_distance (
    distance INT,
    source VARCHAR(512),
    destination VARCHAR(512)
);

INSERT INTO city_distance (distance, source, destination) VALUES 
(100, 'New Delhi', 'Panipat'),
(200, 'Ambala', 'New Delhi'),
(150, 'Bangalore', 'Mysore'),
(150, 'Mysore', 'Bangalore'),
(250, 'Mumbai', 'Pune'),
(250, 'Pune', 'Mumbai'),
(2500, 'Chennai', 'Bhopal'),
(2500, 'Bhopal', 'Chennai'),
(60, 'Tirupati', 'Tirumala'),
(80, 'Tirumala', 'Tirupati');

 -- filter out the duplicate 
 
 -- ANSWER 
 
select * from city_distance;
with cte as (
select 
    distance,
    case when source < destination then source else destination end as a,
    case when source > destination then source else destination end as b
from city_distance)

select * from (
select *,
       row_number() over(partition by distance,a,b) as rn 
from cte)as a
where rn= 1;