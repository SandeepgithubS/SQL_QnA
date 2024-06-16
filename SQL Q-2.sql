CREATE TABLE Customers (
    Customer_id INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Registration_Date DATE);
CREATE TABLE Transaction (
    Transaction_id INT PRIMARY KEY,
    Customer_id INT,
    Transaction_Date DATE,
    Amount DECIMAL(10, 2));
INSERT INTO Customers (Customer_id, Customer_Name, Registration_Date)
VALUES
    (1, 'John Doe', '2023-01-15'),
    (2, 'Jane Smith', '2023-02-20'),
    (3, 'Michael Johnson', '2023-03-10');
INSERT INTO Transaction (Transaction_id, Customer_id, Transaction_Date, Amount)
VALUES
    (201, 1, '2024-01-20', 50.00),
    (202, 1, '2024-02-05', 75.50),
    (203, 2, '2023-02-22', 100.00),
    (204, 3, '2022-03-15', 200.00),
    (205, 2, '2024-03-20', 120.75),
	(301, 1, '2024-01-20', 50.00),
    (302, 1, '2024-02-05', 75.50),
    (403, 2, '2023-02-22', 100.00),
    (304, 3, '2022-03-15', 200.00),
    (505, 2, '2024-03-20', 120.75);
    
-- Write an SQL query to calculate the total transaction amount for each customer for the current year. The output should contain Customer_Name and the total amount.
-- ANSWER

select * from Customers;
select * from transaction;

select c.customer_name, sum(t.amount), year(t.transaction_date) as yer from transaction as t 
join customers as c 
on t.customer_id = c.customer_id  
where year(t.transaction_date) = 2024
group by c.customer_name, year(t.transaction_date);
