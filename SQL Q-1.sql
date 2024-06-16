create database ab;
use ab;
create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

-- 1 find the teams , no of match played, no of wins and loose
SELECT * FROM ab.icc_world_cup;

-----------------------------------------
-- ANSWER
-----------------------------------------

with cte as (
select 
     team_1 as team ,
     case when team_1 = winner then 1 else 0 end as win
from icc_world_cup
union all
select 
      team_2,
      case when team_2 = winner then 1 else 0 end as win
from icc_world_cup)

select 
     team,
     count(1) as total_match,
     sum(win) as win,
     count(1) - sum(win) as loose
from cte 
group by team;
