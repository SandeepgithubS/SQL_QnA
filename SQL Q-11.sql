CREATE TABLE viewership (
    device_type VARCHAR(255),
    viewership_count INTEGER
);
INSERT INTO viewership (device_type, viewership_count) VALUES
('laptop', 5000),
('tablet', 3000),
('phone', 7000),
('laptop', 6000),
('tablet', 4000),
('phone', 8000),
('laptop', 5500),
('tablet', 3500),
('phone', 7500);

/*Write a query that calculates the total viewership for laptops and mobile devices, 
where mobile is defined as the sum of tablet and phone viewership. Output the total 
viewership for laptops as laptop_views and the total viewership for mobile devices as mobile_views */

-- ANSWER

select * from viewership;
select sum(case when device_type= "laptop" then viewership_count end ) as laptop,
       sum(case when device_type="tablet" or device_type="Phone" then viewership_count end ) as mob
from viewership;