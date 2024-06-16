create table phonelog(
    Callerid int, 
    Recipientid int,
    Datecalled datetime
);

insert into phonelog(Callerid, Recipientid, Datecalled)
values(1, 2, '2019-01-01 09:00:00.000'),
       (1, 3, '2019-01-01 17:00:00.000'),
       (1, 4, '2019-01-01 23:00:00.000'),
       (2, 5, '2019-07-05 09:00:00.000'),
       (2, 3, '2019-07-05 17:00:00.000'),
       (2, 3, '2019-07-05 17:20:00.000'),
       (2, 5, '2019-07-05 23:00:00.000'),
       (2, 3, '2019-08-01 09:00:00.000'),
       (2, 3, '2019-08-01 17:00:00.000'),
       (2, 5, '2019-08-01 19:30:00.000'),
       (2, 4, '2019-08-02 09:00:00.000'),
       (2, 5, '2019-08-02 10:00:00.000'),
       (2, 5, '2019-08-02 10:45:00.000'),
       (2, 4, '2019-08-02 11:00:00.000');
       
-- callerid who call the same person at the 1st and last time in every day

-- ANSWER

 select * from phonelog;
 with cte as (
 select 
     callerid,
     date(datecalled),
     min(datecalled) as ins,
     max(datecalled) as maxs
from phonelog
group by 1,2),
cte2 as (
select 
    a.callerid,
    a.ins,
    b.recipientid as a,
    a.maxs,
    c.recipientid as b
from cte as a left join phonelog as b
on a.ins = b.datecalled
left join phonelog as c
on a.maxs = c.datecalled)

select distinct callerid from cte2 where a=b;