-- Create the table named 'Trips'
CREATE TABLE Trips (
    id INT,
    client_id INT,
    driver_id INT,
    city_id INT,
    status VARCHAR(50),
    request_at VARCHAR(50)
);
CREATE TABLE Users (
    users_id INT,
    banned VARCHAR(50),
    role VARCHAR(50)
);
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES
(1, 1, 10, 1, 'completed', '2013-10-01'),
(2, 2, 11, 1, 'cancelled_by_driver', '2013-10-01'),
(3, 3, 12, 6, 'completed', '2013-10-01'),
(4, 4, 13, 6, 'cancelled_by_client', '2013-10-01'),
(5, 1, 10, 1, 'completed', '2013-10-02'),
(6, 2, 11, 6, 'completed', '2013-10-02'),
(7, 3, 12, 6, 'completed', '2013-10-02'),
(8, 2, 12, 12, 'completed', '2013-10-03'),
(9, 3, 10, 12, 'completed', '2013-10-03'),
(10, 4, 13, 12, 'cancelled_by_driver', '2013-10-03');

INSERT INTO Users (users_id, banned, role) VALUES
(1, 'No', 'client'),
(2, 'Yes', 'client'),
(3, 'No', 'client'),
(4, 'No', 'client'),
(10, 'No', 'driver'),
(11, 'No', 'driver'),
(12, 'No', 'driver'),
(13, 'No', 'driver');

-- find the cancellation ratio of every day where driver or client should not banned

-- ANSWER

select * from trips;
select * from Users;

with cte as (
select
     t.client_id,
     t.driver_id, 
     t.status,
     t.request_at,
     u.banned as c_ban,
     s.banned as d_ban
from trips as t join users as u
on t.client_id = u.users_id
join users as s
on t.driver_id = s.users_id
where u.banned ="No" 
and  s.banned = "No")

select 
     request_at,
     count(1) as total_trips,
     coalesce(sum(case when status in ("cancelled_by_client","cancelled_by_driver") then 1 end),0) as cancelled,
     round(coalesce(sum(case when status in ("cancelled_by_client","cancelled_by_driver") then 1 end),0) / count(*) *100,2)as "cancel_%"
from cte
group by 1;
