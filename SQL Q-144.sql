CREATE TABLE Os (
    Order_id INT PRIMARY KEY,
    Customer_id INT,
    Order_Date DATE,
    Amount DECIMAL(10, 2)
);
CREATE TABLE Cs (
    Customer_id INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Join_Date DATE
);
INSERT INTO Os (Order_id, Customer_id, Order_Date, Amount)
VALUES
    (1, 1, '2024-05-01', 100),
    (2, 2, '2024-05-02', 150),
    (3, 3, '2023-12-15', 200),
    (4, 1, '2024-05-03', 120),
    (5, 2, '2024-01-20', 180),
    (6, 4, '2024-03-10', 90);
INSERT INTO Cs (Customer_id, Customer_Name, Join_Date)
VALUES
    (1, 'Alice', '2024-01-15'),
    (2, 'Bob', '2024-02-20'),
    (3, 'Charlie', '2023-12-01'),
    (4, 'David', '2024-03-01');
    
/* Write an SQL query to calculate the total order amount for each customer who joined 
in the current year. The output should contain Customer_Name and the total amount. */

-- ANSWER

select * from os;
select * from cs;

select  
      cs.Customer_Name,
      sum(amount) as total
from cs join os
on cs.Customer_id=os.Customer_id
 where year(join_date) = (select max(year(join_date)) from cs)
 group by 1;
