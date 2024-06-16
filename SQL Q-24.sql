CREATE TABLE tiktok (
					views INT);
INSERT INTO tiktok (views) 
VALUES 
	(100), (800), (350), 
	(150), (600), 
	(700), (750), (950);
    
/* Find the median within a series of numbers in SQL */

-- ANSWER

select * from tiktok;
with cte as (
select * , row_number() over(order by views) as a,
           row_number() over(order by views desc) as b
from tiktok)
-- select * from cte;
select avg( views) from cte where a= b+1 or a= b-1 ;