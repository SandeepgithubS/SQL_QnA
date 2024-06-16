CREATE TABLE transactions (
    user_id INTEGER,
    spend DECIMAL(10, 2),
    transaction_date TIMESTAMP
);
INSERT INTO transactions (user_id, spend, transaction_date) VALUES
(111, 100.50, '2022-01-08 12:00:00'),
(111, 55.00, '2022-01-10 12:00:00'),
(121, 36.00, '2022-01-18 12:00:00'),
(145, 24.99, '2022-01-26 12:00:00'),
(111, 89.60, '2022-02-05 12:00:00');  

-- Write a SQL query to obtain the third transaction of every user. Output the user id, spend, and transaction date.

-- ANSWER

select * from transactions;

select 
     user_id 
from 
   (select 
         user_id, 
         spend,transaction_date, 
         rank() over(partition by user_id order by date(transaction_date))  as nd
	from transactions) as a
 where nd= 3;