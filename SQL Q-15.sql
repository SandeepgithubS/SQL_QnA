CREATE TABLE Trans (
    id INT ,
    country VARCHAR(255),
    state VARCHAR(255),
    amount INT,
    trans_date DATE);

INSERT INTO Trans (id, country, state, amount, trans_date) VALUES
(121, 'US', 'approved', 1000, '2018-12-18'),
(122, 'US', 'declined', 2000, '2018-12-19'),
(123, 'US', 'approved', 2000, '2019-01-01'),
(124, 'DE', 'approved', 2000, '2019-01-07');

/* Write an SQL query to find for each month and country, 
the number of transactions and their total amount, 
the number of approved transactions and their total amount */

-- ANSWER

 select * from trans;
 select 
       date_format(trans_date,"%Y-%m") as mm, 
       country, 
       sum(amount) as total,
	   count(*) as cnt_trn,
	   sum( case when state = "approved" then 1 else 0 end) as cnt,
       sum( case when state = "approved" then amount end ) as apvamt 
from trans
group by date_format(trans_date,"%Y-%m"), country;