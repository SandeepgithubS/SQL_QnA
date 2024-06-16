CREATE TABLE booking_table (
    Booking_id VARCHAR(3) NOT NULL,
    Booking_date DATE NOT NULL,
    User_id VARCHAR(2) NOT NULL,
    Line_of_business VARCHAR(6) NOT NULL
);

INSERT INTO booking_table (Booking_id, Booking_date, User_id, Line_of_business) VALUES 
('b1', '2022-03-23', 'u1', 'Flight'),
('b2', '2022-03-27', 'u2', 'Flight'),
('b3', '2022-03-28', 'u1', 'Hotel'),
('b4', '2022-03-31', 'u4', 'Flight'),
('b5', '2022-04-02', 'u1', 'Hotel'),
('b6', '2022-04-02', 'u2', 'Flight'),
('b7', '2022-04-06', 'u5', 'Flight'),
('b8', '2022-04-06', 'u6', 'Hotel'),
('b9', '2022-04-06', 'u2', 'Flight'),
('b10', '2022-04-10', 'u1', 'Flight'),
('b11', '2022-04-12', 'u4', 'Flight'),
('b12', '2022-04-16', 'u1', 'Flight'),
('b13', '2022-04-19', 'u2', 'Flight'),
('b14', '2022-04-20', 'u5', 'Hotel'),
('b15', '2022-04-22', 'u6', 'Flight'),
('b16', '2022-04-26', 'u4', 'Hotel'),
('b17', '2022-04-28', 'u2', 'Hotel'),
('b18', '2022-04-30', 'u1', 'Hotel'),
('b19', '2022-05-04', 'u4', 'Hotel'),
('b20', '2022-05-06', 'u1', 'Flight');

CREATE TABLE user_table (
    User_id VARCHAR(3) NOT NULL,
    Segment VARCHAR(2) NOT NULL
);

INSERT INTO user_table (User_id, Segment) VALUES 
('u1', 's1'),
('u2', 's1'),
('u3', 's1'),
('u4', 's2'),
('u5', 's2'),
('u6', 's3'),
('u7', 's3'),
('u8', 's3'),
('u9', 's3'),
('u10', 's3');

-- ANSWER

select * from booking_table;
select * from user_table;
-- how many users in each segment and in each segment how many boo flights on april
with cte as (
select 
      segment,
      count(*) as cnt
from user_table
group by 1),
cte2 as (
select
	u.segment,
    count(distinct case when b.Line_of_business ="Flight" and month(b.Booking_date)=4  then b.user_id end) as ct
from booking_table as b join user_table as u
on b. user_id = u.user_id
group by 1)

select
     a.segment,
     a.cnt,
     b.ct
from cte as a join cte2 as b
on a.segment = b. segment;

-- 39(b) find the user whose first booking is a hotel booking
select * from booking_table;
with cte as (
select
     user_id,
     booking_date,
     Line_of_business,
     rank() over(partition by user_id order by booking_date) as a
from booking_table)

select * from cte where  Line_of_business="Hotel" and a=1;

-- 39(c) calculate date difference between min date and max date of each user
select * from booking_table;

select 
     user_id, 
     min(booking_date) as fst,
     max(booking_date) as lst,
     datediff(max(booking_date),min(booking_date)) as diff
from booking_table
group by 1;

-- 39(d) calculate total number od flight and hotel booking per user in 2022
select * from booking_table;

select 
     user_id,
     count(case when Line_of_business = "Flight" then 1 end) as flight,
      count(case when Line_of_business = "Hotel" then 1 end) as hotel
from booking_table
where year(Booking_date)= 2022
group by 1;