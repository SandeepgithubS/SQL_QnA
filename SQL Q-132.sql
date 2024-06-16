CREATE TABLE bank_transactions (
    transaction_id SERIAL PRIMARY KEY,
    bank_id INT,
    customer_id INT,
    transaction_amount DECIMAL(10, 2),
    transaction_type VARCHAR(10),
    transaction_date DATE
);

INSERT INTO bank_transactions (bank_id, customer_id, transaction_amount, transaction_type, transaction_date) VALUES
(1, 101, 500.00, 'credit', '2024-01-01'),
(1, 101, 200.00, 'debit', '2024-01-02'),
(1, 101, 300.00, 'credit', '2024-01-05'),
(1, 101, 150.00, 'debit', '2024-01-08'),
(1, 102, 1000.00, 'credit', '2024-01-01'),
(1, 102, 400.00, 'debit', '2024-01-03'),
(1, 102, 600.00, 'credit', '2024-01-05'),
(1, 102, 200.00, 'debit', '2024-01-09');

/*
Write a query to find starting and ending  trans amount for each customer
Return cx_id, their first_transaction_amt, last_transaction and these transaction_date
*/

-- ANSWER 

select * from bank_transactions;

with cte as (
select 
      *,
      row_number() over(partition by customer_id order by transaction_date) as start,
      row_number() over(partition by customer_id order by transaction_date desc) as end
from bank_transactions)

select 
    customer_id, 
    max(case when start =1 then transaction_amount end) as start_amt,
    max(case when start =1 then transaction_date end) as start_dt,
    max(case when end =1 then transaction_amount end) as end_amt,
    max(case when end =1 then transaction_date  end) as end_dt
from cte
group by 1;