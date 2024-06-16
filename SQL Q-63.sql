CREATE TABLE users1 (
    user_id INTEGER,
    name VARCHAR(20),
    join_date DATE
);

CREATE TABLE events (
    user_id INTEGER,
    type VARCHAR(10),
    access_date DATE
);

INSERT INTO users1 (user_id, name, join_date) VALUES 
(1, 'Jon', CAST('2020-02-14' AS DATE)), 
(2, 'Jane', CAST('2020-02-14' AS DATE)), 
(3, 'Jill', CAST('2020-02-15' AS DATE)), 
(4, 'Josh', CAST('2020-02-15' AS DATE)), 
(5, 'Jean', CAST('2020-02-16' AS DATE)), 
(6, 'Justin', CAST('2020-02-17' AS DATE)), 
(7, 'Jeremy', CAST('2020-02-18' AS DATE));

INSERT INTO events (user_id, type, access_date) VALUES 
(1, 'Pay', CAST('2020-03-01' AS DATE)), 
(2, 'Music', CAST('2020-03-02' AS DATE)), 
(2, 'P', CAST('2020-03-12' AS DATE)),
(3, 'Music', CAST('2020-03-15' AS DATE)), 
(4, 'Music', CAST('2020-03-15' AS DATE)), 
(1, 'P', CAST('2020-03-16' AS DATE)), 
(3, 'P', CAST('2020-03-22' AS DATE));

/* Given the following two tables, return the fraction of users, rounded to two decimal places,
who accessed Amazon music and upgraded to prime membership within the first 30 days of signing up. */
select * from users1;
select * from events;

-- ANSWER

with cte as (
             select 
                  e.user_id, 
                  e.type, 
                  u. join_date 
			from events as e left join users1 as u 
            on e.user_id = u.user_id where type="music"),
cte2 as (
        select *
        from events 
        where type ="P"),
-- select * from cte2;
cte3 as (
         select 
               a. user_id, 
               a.join_date,
               b.access_date ,
               datediff(b.access_date,a.join_date) as diff
		from cte as a left join cte2 as b 
        on a.user_id = b.user_id)
select
     count(*), 
     count(case when diff < 30 then 1 end)as prim 
from cte3;