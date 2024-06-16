CREATE TABLE hotel_bookings (
    booking_id SERIAL PRIMARY KEY,
    booking_date DATE,
    hotel_name VARCHAR(100),
    total_guests INT,
    total_nights INT,
    total_price DECIMAL(10, 2)
);
INSERT INTO hotel_bookings (booking_date, hotel_name, total_guests, total_nights, total_price) VALUES
    ('2023-01-05', 'Hotel A', 2, 3, 300.00),
    ('2023-02-10', 'Hotel B', 3, 5, 600.00),
    ('2023-03-15', 'Hotel A', 4, 2, 400.00),
    ('2023-04-20', 'Hotel B', 2, 4, 500.00),
    ('2023-05-25', 'Hotel A', 3, 3, 450.00),
    ('2023-06-30', 'Hotel B', 5, 2, 350.00),
    ('2023-07-05', 'Hotel A', 2, 5, 550.00),
    ('2023-08-10', 'Hotel B', 3, 3, 450.00),
    ('2023-09-15', 'Hotel A', 4, 4, 500.00),
    ('2023-10-20', 'Hotel B', 2, 3, 300.00),
    ('2023-11-25', 'Hotel A', 3, 2, 350.00),
    ('2023-12-30', 'Hotel B', 5, 4, 600.00),
    ('2022-01-05', 'Hotel A', 2, 3, 300.00),
    ('2022-02-10', 'Hotel B', 3, 5, 600.00),
    ('2022-03-15', 'Hotel A', 4, 2, 400.00),
    ('2022-04-20', 'Hotel B', 2, 4, 500.00),
    ('2022-05-25', 'Hotel A', 3, 3, 450.00),
    ('2022-06-30', 'Hotel B', 5, 2, 350.00),
    ('2022-07-05', 'Hotel A', 2, 5, 550.00),
    ('2022-08-10', 'Hotel B', 3, 3, 450.00),
    ('2022-09-15', 'Hotel A', 4, 4, 500.00),
    ('2022-10-20', 'Hotel B', 2, 3, 300.00),
    ('2022-11-25', 'Hotel A', 3, 2, 350.00),
    ('2022-12-30', 'Hotel B', 5, 4, 600.00);
    
/* Write a SQL query to find out each hotal best performing months based on revenue */

-- ANSWER

select * from hotel_bookings;

with cte as (
select 
     hotel_name,
     monthname(booking_date) as months,
     sum(total_price) as total,
     row_number() over(partition by hotel_name order by sum(total_price) desc) as rn
from hotel_bookings
group by 1,2
order by 1)

select 
    hotel_name,
    months,
    total 
from cte 
where rn = 1;